import sys
import string

def translate(s, key):
    def _get_trans_map(k):
        a1 = [c for i, c in enumerate(key) if i%2==0]
        a2 = [c for i, c in enumerate(key) if i%2==1]
        return ''.join(a1+a2), ''.join(a2+a1)

    src, dst = _get_trans_map(key)
    m = string.maketrans(src, dst)
    return string.translate(s, m)

if __name__ == '__main__':
    szyfr = sys.argv[1] if len(sys.argv)>1 else 'gaderypoluki'
    while True:
        line = sys.stdin.readline()
        if not line:
            break
        sys.stdout.write(translate(line, szyfr))
        sys.stdout.flush()

