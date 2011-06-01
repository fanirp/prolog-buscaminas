from tempfile import mktemp
import shutil
import csv
import os
import subprocess
from collections import defaultdict
from time import time, sleep
from datetime import datetime
import re
from optparse import OptionParser
import sys


def main():
    usage= 'usage: %prog [options] <solucion.pl> <results_fname>'
    parser= OptionParser(usage=usage)
    parser.add_option('-t', dest='timeout', help='timeout para una corrida (en segundos)', default=30, type='int')
    parser.add_option('-a', dest='algorithms', 
                            help='algoritmos para probar (rA, rB o rC), por default prueba todos', 
                            action='append')
    parser.add_option('-p', dest='problems', 
                            help='problemas para probar. Por default, t1, t2, t3, t4, 0...14.', 
                            action='append')
    parser.add_option('--boards-dir', dest='boards_dir', 
                                      help='directorio donde guarda los boards')
    parser.add_option('--times-fname', dest='times_fname', 
                                       help='archivo para guardar los tiempos')

    options, args= parser.parse_args(sys.argv[1:])

    if options.times_fname is None: parser.error("--times-fname es requerido")
    if options.boards_dir is None: parser.error("--boards-dir es requerido")

    if os.path.exists(options.times_fname): parser.error('archivo %s ya existe' % options.times_fname)
    if os.path.exists(options.boards_dir): parser.error('directorio %s ya existe' % options.boards_dir)
    
    default_problems= 't1 t2 t3 t4'.split()
    default_problems.extend(map(str, range(0, 15)))

    prolog_fname= args[0]
    algorithms= options.algorithms or 'rA rB rC'.split()
    problems= options.problems or default_problems

    times= defaultdict(dict)
    boards= defaultdict(dict)
    for problem in problems:
        print "Running problem %s..." % problem
        for algorithm in algorithms:
            print "\tAlgorithm: %s" % algorithm
            res= run_problem(prolog_fname, algorithm, problem, options.timeout)
            if res is None:
                print "\t\tTimeout!"
                times[algorithm][problem]= None
            else:
                bs, durations= res
                print "\t\tTook only %.02f secs" % sum(durations)

                times[algorithm][problem]= sum(durations)
                boards[algorithm][problem]= bs

            print "\t\tSaving data..."
            store_times(times, options.times_fname)
            store_boards(boards, options.boards_dir)

def store_boards(boards, dir):
    if not os.path.exists(dir): os.makedirs(dir)
    for algorithm, problems in boards.iteritems():
        for problem, problem_boards in problems.iteritems():
            for i, board in enumerate(problem_boards):
                fname= os.path.join(dir, '%s_%s_%.2d' % (algorithm, problem, i+1))
                with open(fname, 'w') as f:
                    f.write(board)

def store_times(times, fname):
    tmpfname= mktemp()

    all_problems= set()
    for algorithm, problems in times.iteritems():
        all_problems.update(problems)
    all_problems= sorted(all_problems)

    with open(tmpfname, 'w') as f:
        writer= csv.writer(f)
        writer.writerow(['Algorithm']+all_problems)
        for algorithm, problems in times.iteritems():
            row= [algorithm]
            for problem in all_problems:
                row.append(problems.get(problem) or '-')
        
            writer.writerow(row)
    shutil.move(tmpfname, fname) 
    
def run_problem(prolog_fname, algorithm, problem, timeout):
    args= '/usr/bin/prolog -f %(prolog_fname)s -t setof(T,%(algorithm)s(%(problem)s,T),L).' % locals()
    args= args.split()

    t0= time()
    p= subprocess.Popen(args, stdout=subprocess.PIPE, stderr=-1)
    while time() - t0 < timeout:
        sleep(1)
        if p.poll() is not None: break
    else:
        p.terminate()
        return None
    stdout= p.stdout.read()
    pattern= re.compile('date\((?P<date>.*?)\)')

    boards= []
    durations= []
    actual_board= []
    dates= []
    for line in stdout.split('\n'):
        m= pattern.match(line)
        if m is not None:
            dates.append(parse_date(m.groupdict()['date']))
            if len(actual_board) > 0:
                durations.append((dates[-1] - dates[-2]).total_seconds())
                boards.append('\n'.join(actual_board))
                actual_board= []
        else:
            actual_board.append(line)

    return boards, durations
    

def parse_date(str):
    str= str.split(',')[:6]
    a,b= str[-1].split('.')
    str[-1]= a
    str.append((b + '000000')[:6])
    str= map(int, str)
    return datetime(*str)


if __name__ == '__main__':
    main()
