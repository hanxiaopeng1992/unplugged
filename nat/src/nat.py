# Find the longest sub-string without repeated chars

# solution 1: map of char to its last occurrence position.

def longestnub(str):
    pos = {}
    maxlen = 0
    start_max = 0
    start_cur = 0
    for i in range(len(str)):
        if str[i] in pos:
            j = pos[str[i]]
            start_cur = max(start_cur, j + 1)
        if i - start_cur + 1 > maxlen:
            start_max = start_cur
        maxlen = max(maxlen, i - start_cur + 1)
        pos[str[i]] = i
    return str[start_max : start_max + maxlen]

# solution 2: map char to prime

def longestnub_nt(str):
    pass

print("abcdefg ==> ", longestnub("abcdefg"))
print("aaaaaaa ==> ", longestnub("aaaaaaa"))
print("abcabcbb ==> ", longestnub("abcabcbb"))
