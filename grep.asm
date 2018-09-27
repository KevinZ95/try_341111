
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
	}
}

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 e4 f0             	and    $0xfffffff0,%esp
   9:	83 ec 10             	sub    $0x10,%esp
   c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	int   fd, i;
	char *pattern;

	if (argc <= 1) {
   f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  13:	0f 8e 8b 00 00 00    	jle    a4 <main+0xa4>
		printf(2, "usage: grep pattern [file ...]\n");
		exit();
	}
	pattern = argv[1];
  19:	8b 43 04             	mov    0x4(%ebx),%eax
  1c:	83 c3 08             	add    $0x8,%ebx

	if (argc <= 2) {
  1f:	be 02 00 00 00       	mov    $0x2,%esi
  24:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)

	if (argc <= 1) {
		printf(2, "usage: grep pattern [file ...]\n");
		exit();
	}
	pattern = argv[1];
  28:	89 44 24 0c          	mov    %eax,0xc(%esp)

	if (argc <= 2) {
  2c:	74 61                	je     8f <main+0x8f>
  2e:	66 90                	xchg   %ax,%ax
		grep(pattern, 0);
		exit();
	}

	for (i = 2; i < argc; i++) {
		if ((fd = open(argv[i], 0)) < 0) {
  30:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  37:	00 
  38:	8b 03                	mov    (%ebx),%eax
  3a:	89 04 24             	mov    %eax,(%esp)
  3d:	e8 96 05 00 00       	call   5d8 <open>
  42:	85 c0                	test   %eax,%eax
  44:	89 c7                	mov    %eax,%edi
  46:	78 28                	js     70 <main+0x70>
			printf(1, "grep: cannot open %s\n", argv[i]);
			exit();
		}
		grep(pattern, fd);
  48:	89 44 24 04          	mov    %eax,0x4(%esp)
  4c:	8b 44 24 0c          	mov    0xc(%esp),%eax
	if (argc <= 2) {
		grep(pattern, 0);
		exit();
	}

	for (i = 2; i < argc; i++) {
  50:	83 c6 01             	add    $0x1,%esi
  53:	83 c3 04             	add    $0x4,%ebx
		if ((fd = open(argv[i], 0)) < 0) {
			printf(1, "grep: cannot open %s\n", argv[i]);
			exit();
		}
		grep(pattern, fd);
  56:	89 04 24             	mov    %eax,(%esp)
  59:	e8 a2 01 00 00       	call   200 <grep>
		close(fd);
  5e:	89 3c 24             	mov    %edi,(%esp)
  61:	e8 5a 05 00 00       	call   5c0 <close>
	if (argc <= 2) {
		grep(pattern, 0);
		exit();
	}

	for (i = 2; i < argc; i++) {
  66:	39 75 08             	cmp    %esi,0x8(%ebp)
  69:	7f c5                	jg     30 <main+0x30>
			exit();
		}
		grep(pattern, fd);
		close(fd);
	}
	exit();
  6b:	e8 28 05 00 00       	call   598 <exit>
		exit();
	}

	for (i = 2; i < argc; i++) {
		if ((fd = open(argv[i], 0)) < 0) {
			printf(1, "grep: cannot open %s\n", argv[i]);
  70:	8b 03                	mov    (%ebx),%eax
  72:	c7 44 24 04 68 0a 00 	movl   $0xa68,0x4(%esp)
  79:	00 
  7a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  81:	89 44 24 08          	mov    %eax,0x8(%esp)
  85:	e8 56 06 00 00       	call   6e0 <printf>
			exit();
  8a:	e8 09 05 00 00       	call   598 <exit>
		exit();
	}
	pattern = argv[1];

	if (argc <= 2) {
		grep(pattern, 0);
  8f:	89 04 24             	mov    %eax,(%esp)
  92:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  99:	00 
  9a:	e8 61 01 00 00       	call   200 <grep>
		exit();
  9f:	e8 f4 04 00 00       	call   598 <exit>
{
	int   fd, i;
	char *pattern;

	if (argc <= 1) {
		printf(2, "usage: grep pattern [file ...]\n");
  a4:	c7 44 24 04 48 0a 00 	movl   $0xa48,0x4(%esp)
  ab:	00 
  ac:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  b3:	e8 28 06 00 00       	call   6e0 <printf>
		exit();
  b8:	e8 db 04 00 00       	call   598 <exit>
  bd:	66 90                	xchg   %ax,%ax
  bf:	90                   	nop

000000c0 <matchstar>:
}

// matchstar: search for c*re at beginning of text
int
matchstar(int c, char *re, char *text)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	57                   	push   %edi
  c4:	56                   	push   %esi
  c5:	53                   	push   %ebx
  c6:	83 ec 1c             	sub    $0x1c,%esp
  c9:	8b 75 08             	mov    0x8(%ebp),%esi
  cc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cf:	8b 5d 10             	mov    0x10(%ebp),%ebx
  d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	do { // a * matches zero or more instances
		if (matchhere(re, text)) return 1;
  d8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  dc:	89 3c 24             	mov    %edi,(%esp)
  df:	e8 3c 00 00 00       	call   120 <matchhere>
  e4:	85 c0                	test   %eax,%eax
  e6:	75 20                	jne    108 <matchstar+0x48>
	} while (*text != '\0' && (*text++ == c || c == '.'));
  e8:	0f be 13             	movsbl (%ebx),%edx
  eb:	84 d2                	test   %dl,%dl
  ed:	74 0c                	je     fb <matchstar+0x3b>
  ef:	83 c3 01             	add    $0x1,%ebx
  f2:	39 f2                	cmp    %esi,%edx
  f4:	74 e2                	je     d8 <matchstar+0x18>
  f6:	83 fe 2e             	cmp    $0x2e,%esi
  f9:	74 dd                	je     d8 <matchstar+0x18>
	return 0;
}
  fb:	83 c4 1c             	add    $0x1c,%esp
  fe:	5b                   	pop    %ebx
  ff:	5e                   	pop    %esi
 100:	5f                   	pop    %edi
 101:	5d                   	pop    %ebp
 102:	c3                   	ret    
 103:	90                   	nop
 104:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 108:	83 c4 1c             	add    $0x1c,%esp
// matchstar: search for c*re at beginning of text
int
matchstar(int c, char *re, char *text)
{
	do { // a * matches zero or more instances
		if (matchhere(re, text)) return 1;
 10b:	b8 01 00 00 00       	mov    $0x1,%eax
	} while (*text != '\0' && (*text++ == c || c == '.'));
	return 0;
}
 110:	5b                   	pop    %ebx
 111:	5e                   	pop    %esi
 112:	5f                   	pop    %edi
 113:	5d                   	pop    %ebp
 114:	c3                   	ret    
 115:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000120 <matchhere>:
}

// matchhere: search for re at beginning of text
int
matchhere(char *re, char *text)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	83 ec 14             	sub    $0x14,%esp
 127:	8b 55 08             	mov    0x8(%ebp),%edx
 12a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
	if (re[0] == '\0') return 1;
 12d:	0f be 02             	movsbl (%edx),%eax
 130:	84 c0                	test   %al,%al
 132:	75 20                	jne    154 <matchhere+0x34>
 134:	eb 42                	jmp    178 <matchhere+0x58>
 136:	66 90                	xchg   %ax,%ax
	if (re[1] == '*') return matchstar(re[0], re + 2, text);
	if (re[0] == '$' && re[1] == '\0') return *text == '\0';
	if (*text != '\0' && (re[0] == '.' || re[0] == *text)) return matchhere(re + 1, text + 1);
 138:	0f b6 19             	movzbl (%ecx),%ebx
 13b:	84 db                	test   %bl,%bl
 13d:	74 31                	je     170 <matchhere+0x50>
 13f:	3c 2e                	cmp    $0x2e,%al
 141:	74 04                	je     147 <matchhere+0x27>
 143:	38 d8                	cmp    %bl,%al
 145:	75 29                	jne    170 <matchhere+0x50>
 147:	83 c2 01             	add    $0x1,%edx

// matchhere: search for re at beginning of text
int
matchhere(char *re, char *text)
{
	if (re[0] == '\0') return 1;
 14a:	0f be 02             	movsbl (%edx),%eax
	if (re[1] == '*') return matchstar(re[0], re + 2, text);
	if (re[0] == '$' && re[1] == '\0') return *text == '\0';
	if (*text != '\0' && (re[0] == '.' || re[0] == *text)) return matchhere(re + 1, text + 1);
 14d:	83 c1 01             	add    $0x1,%ecx

// matchhere: search for re at beginning of text
int
matchhere(char *re, char *text)
{
	if (re[0] == '\0') return 1;
 150:	84 c0                	test   %al,%al
 152:	74 24                	je     178 <matchhere+0x58>
	if (re[1] == '*') return matchstar(re[0], re + 2, text);
 154:	0f b6 5a 01          	movzbl 0x1(%edx),%ebx
 158:	80 fb 2a             	cmp    $0x2a,%bl
 15b:	74 2b                	je     188 <matchhere+0x68>
	if (re[0] == '$' && re[1] == '\0') return *text == '\0';
 15d:	3c 24                	cmp    $0x24,%al
 15f:	75 d7                	jne    138 <matchhere+0x18>
 161:	84 db                	test   %bl,%bl
 163:	74 3c                	je     1a1 <matchhere+0x81>
	if (*text != '\0' && (re[0] == '.' || re[0] == *text)) return matchhere(re + 1, text + 1);
 165:	0f b6 19             	movzbl (%ecx),%ebx
 168:	84 db                	test   %bl,%bl
 16a:	75 d7                	jne    143 <matchhere+0x23>
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	return 0;
 170:	31 c0                	xor    %eax,%eax
}
 172:	83 c4 14             	add    $0x14,%esp
 175:	5b                   	pop    %ebx
 176:	5d                   	pop    %ebp
 177:	c3                   	ret    
 178:	83 c4 14             	add    $0x14,%esp

// matchhere: search for re at beginning of text
int
matchhere(char *re, char *text)
{
	if (re[0] == '\0') return 1;
 17b:	b8 01 00 00 00       	mov    $0x1,%eax
	if (re[1] == '*') return matchstar(re[0], re + 2, text);
	if (re[0] == '$' && re[1] == '\0') return *text == '\0';
	if (*text != '\0' && (re[0] == '.' || re[0] == *text)) return matchhere(re + 1, text + 1);
	return 0;
}
 180:	5b                   	pop    %ebx
 181:	5d                   	pop    %ebp
 182:	c3                   	ret    
 183:	90                   	nop
 184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
// matchhere: search for re at beginning of text
int
matchhere(char *re, char *text)
{
	if (re[0] == '\0') return 1;
	if (re[1] == '*') return matchstar(re[0], re + 2, text);
 188:	83 c2 02             	add    $0x2,%edx
 18b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 18f:	89 54 24 04          	mov    %edx,0x4(%esp)
 193:	89 04 24             	mov    %eax,(%esp)
 196:	e8 25 ff ff ff       	call   c0 <matchstar>
	if (re[0] == '$' && re[1] == '\0') return *text == '\0';
	if (*text != '\0' && (re[0] == '.' || re[0] == *text)) return matchhere(re + 1, text + 1);
	return 0;
}
 19b:	83 c4 14             	add    $0x14,%esp
 19e:	5b                   	pop    %ebx
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret    
int
matchhere(char *re, char *text)
{
	if (re[0] == '\0') return 1;
	if (re[1] == '*') return matchstar(re[0], re + 2, text);
	if (re[0] == '$' && re[1] == '\0') return *text == '\0';
 1a1:	31 c0                	xor    %eax,%eax
 1a3:	80 39 00             	cmpb   $0x0,(%ecx)
 1a6:	0f 94 c0             	sete   %al
 1a9:	eb c7                	jmp    172 <matchhere+0x52>
 1ab:	90                   	nop
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001b0 <match>:
int matchhere(char *, char *);
int matchstar(int, char *, char *);

int
match(char *re, char *text)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	56                   	push   %esi
 1b4:	53                   	push   %ebx
 1b5:	83 ec 10             	sub    $0x10,%esp
 1b8:	8b 75 08             	mov    0x8(%ebp),%esi
 1bb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	if (re[0] == '^') return matchhere(re + 1, text);
 1be:	80 3e 5e             	cmpb   $0x5e,(%esi)
 1c1:	75 0e                	jne    1d1 <match+0x21>
 1c3:	eb 28                	jmp    1ed <match+0x3d>
 1c5:	8d 76 00             	lea    0x0(%esi),%esi
	do { // must look at empty string
		if (matchhere(re, text)) return 1;
	} while (*text++ != '\0');
 1c8:	83 c3 01             	add    $0x1,%ebx
 1cb:	80 7b ff 00          	cmpb   $0x0,-0x1(%ebx)
 1cf:	74 15                	je     1e6 <match+0x36>
int
match(char *re, char *text)
{
	if (re[0] == '^') return matchhere(re + 1, text);
	do { // must look at empty string
		if (matchhere(re, text)) return 1;
 1d1:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 1d5:	89 34 24             	mov    %esi,(%esp)
 1d8:	e8 43 ff ff ff       	call   120 <matchhere>
 1dd:	85 c0                	test   %eax,%eax
 1df:	74 e7                	je     1c8 <match+0x18>
 1e1:	b8 01 00 00 00       	mov    $0x1,%eax
	} while (*text++ != '\0');
	return 0;
}
 1e6:	83 c4 10             	add    $0x10,%esp
 1e9:	5b                   	pop    %ebx
 1ea:	5e                   	pop    %esi
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    
int matchstar(int, char *, char *);

int
match(char *re, char *text)
{
	if (re[0] == '^') return matchhere(re + 1, text);
 1ed:	83 c6 01             	add    $0x1,%esi
 1f0:	89 75 08             	mov    %esi,0x8(%ebp)
	do { // must look at empty string
		if (matchhere(re, text)) return 1;
	} while (*text++ != '\0');
	return 0;
}
 1f3:	83 c4 10             	add    $0x10,%esp
 1f6:	5b                   	pop    %ebx
 1f7:	5e                   	pop    %esi
 1f8:	5d                   	pop    %ebp
int matchstar(int, char *, char *);

int
match(char *re, char *text)
{
	if (re[0] == '^') return matchhere(re + 1, text);
 1f9:	e9 22 ff ff ff       	jmp    120 <matchhere>
 1fe:	66 90                	xchg   %ax,%ax

00000200 <grep>:
char buf[1024];
int  match(char *, char *);

void
grep(char *pattern, int fd)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	56                   	push   %esi
 205:	53                   	push   %ebx
 206:	83 ec 1c             	sub    $0x1c,%esp
 209:	8b 75 08             	mov    0x8(%ebp),%esi
	int   n, m;
	char *p, *q;

	m = 0;
 20c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 213:	90                   	nop
 214:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	while ((n = read(fd, buf + m, sizeof(buf) - m - 1)) > 0) {
 218:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 21b:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 220:	29 d0                	sub    %edx,%eax
 222:	89 44 24 08          	mov    %eax,0x8(%esp)
 226:	89 d0                	mov    %edx,%eax
 228:	05 40 0e 00 00       	add    $0xe40,%eax
 22d:	89 44 24 04          	mov    %eax,0x4(%esp)
 231:	8b 45 0c             	mov    0xc(%ebp),%eax
 234:	89 04 24             	mov    %eax,(%esp)
 237:	e8 74 03 00 00       	call   5b0 <read>
 23c:	85 c0                	test   %eax,%eax
 23e:	0f 8e b8 00 00 00    	jle    2fc <grep+0xfc>
		m += n;
 244:	01 45 e4             	add    %eax,-0x1c(%ebp)
		buf[m] = '\0';
		p      = buf;
 247:	bb 40 0e 00 00       	mov    $0xe40,%ebx
	char *p, *q;

	m = 0;
	while ((n = read(fd, buf + m, sizeof(buf) - m - 1)) > 0) {
		m += n;
		buf[m] = '\0';
 24c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 24f:	c6 80 40 0e 00 00 00 	movb   $0x0,0xe40(%eax)
 256:	66 90                	xchg   %ax,%ax
		p      = buf;
		while ((q = strchr(p, '\n')) != 0) {
 258:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
 25f:	00 
 260:	89 1c 24             	mov    %ebx,(%esp)
 263:	e8 78 01 00 00       	call   3e0 <strchr>
 268:	85 c0                	test   %eax,%eax
 26a:	89 c7                	mov    %eax,%edi
 26c:	74 42                	je     2b0 <grep+0xb0>
			*q = 0;
 26e:	c6 07 00             	movb   $0x0,(%edi)
			if (match(pattern, p)) {
 271:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 275:	89 34 24             	mov    %esi,(%esp)
 278:	e8 33 ff ff ff       	call   1b0 <match>
 27d:	85 c0                	test   %eax,%eax
 27f:	75 07                	jne    288 <grep+0x88>
 281:	8d 5f 01             	lea    0x1(%edi),%ebx
 284:	eb d2                	jmp    258 <grep+0x58>
 286:	66 90                	xchg   %ax,%ax
				*q = '\n';
 288:	c6 07 0a             	movb   $0xa,(%edi)
				write(1, p, q + 1 - p);
 28b:	83 c7 01             	add    $0x1,%edi
 28e:	89 f8                	mov    %edi,%eax
 290:	29 d8                	sub    %ebx,%eax
 292:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 296:	89 fb                	mov    %edi,%ebx
 298:	89 44 24 08          	mov    %eax,0x8(%esp)
 29c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2a3:	e8 10 03 00 00       	call   5b8 <write>
 2a8:	eb ae                	jmp    258 <grep+0x58>
 2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
			}
			p = q + 1;
		}
		if (p == buf) m = 0;
 2b0:	81 fb 40 0e 00 00    	cmp    $0xe40,%ebx
 2b6:	74 38                	je     2f0 <grep+0xf0>
		if (m > 0) {
 2b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2bb:	85 c0                	test   %eax,%eax
 2bd:	0f 8e 55 ff ff ff    	jle    218 <grep+0x18>
			m -= p - buf;
 2c3:	b8 40 0e 00 00       	mov    $0xe40,%eax
 2c8:	29 d8                	sub    %ebx,%eax
 2ca:	01 45 e4             	add    %eax,-0x1c(%ebp)
			memmove(buf, p, m);
 2cd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2d0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 2d4:	c7 04 24 40 0e 00 00 	movl   $0xe40,(%esp)
 2db:	89 44 24 08          	mov    %eax,0x8(%esp)
 2df:	e8 1c 02 00 00       	call   500 <memmove>
 2e4:	e9 2f ff ff ff       	jmp    218 <grep+0x18>
 2e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				*q = '\n';
				write(1, p, q + 1 - p);
			}
			p = q + 1;
		}
		if (p == buf) m = 0;
 2f0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 2f7:	e9 1c ff ff ff       	jmp    218 <grep+0x18>
		if (m > 0) {
			m -= p - buf;
			memmove(buf, p, m);
		}
	}
}
 2fc:	83 c4 1c             	add    $0x1c,%esp
 2ff:	5b                   	pop    %ebx
 300:	5e                   	pop    %esi
 301:	5f                   	pop    %edi
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    
 304:	66 90                	xchg   %ax,%ax
 306:	66 90                	xchg   %ax,%ax
 308:	66 90                	xchg   %ax,%ax
 30a:	66 90                	xchg   %ax,%ax
 30c:	66 90                	xchg   %ax,%ax
 30e:	66 90                	xchg   %ax,%ax

00000310 <strcpy>:
#include "pstat.h"//include


char *
strcpy(char *s, char *t)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	8b 45 08             	mov    0x8(%ebp),%eax
 316:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 319:	53                   	push   %ebx
	char *os;

	os = s;
	while ((*s++ = *t++) != 0)
 31a:	89 c2                	mov    %eax,%edx
 31c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 320:	83 c1 01             	add    $0x1,%ecx
 323:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 327:	83 c2 01             	add    $0x1,%edx
 32a:	84 db                	test   %bl,%bl
 32c:	88 5a ff             	mov    %bl,-0x1(%edx)
 32f:	75 ef                	jne    320 <strcpy+0x10>
		;
	return os;
}
 331:	5b                   	pop    %ebx
 332:	5d                   	pop    %ebp
 333:	c3                   	ret    
 334:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 33a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000340 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	8b 55 08             	mov    0x8(%ebp),%edx
 346:	53                   	push   %ebx
 347:	8b 4d 0c             	mov    0xc(%ebp),%ecx
	while (*p && *p == *q) p++, q++;
 34a:	0f b6 02             	movzbl (%edx),%eax
 34d:	84 c0                	test   %al,%al
 34f:	74 2d                	je     37e <strcmp+0x3e>
 351:	0f b6 19             	movzbl (%ecx),%ebx
 354:	38 d8                	cmp    %bl,%al
 356:	74 0e                	je     366 <strcmp+0x26>
 358:	eb 2b                	jmp    385 <strcmp+0x45>
 35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 360:	38 c8                	cmp    %cl,%al
 362:	75 15                	jne    379 <strcmp+0x39>
 364:	89 d9                	mov    %ebx,%ecx
 366:	83 c2 01             	add    $0x1,%edx
 369:	0f b6 02             	movzbl (%edx),%eax
 36c:	8d 59 01             	lea    0x1(%ecx),%ebx
 36f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 373:	84 c0                	test   %al,%al
 375:	75 e9                	jne    360 <strcmp+0x20>
 377:	31 c0                	xor    %eax,%eax
	return (uchar)*p - (uchar)*q;
 379:	29 c8                	sub    %ecx,%eax
}
 37b:	5b                   	pop    %ebx
 37c:	5d                   	pop    %ebp
 37d:	c3                   	ret    
 37e:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q) p++, q++;
 381:	31 c0                	xor    %eax,%eax
 383:	eb f4                	jmp    379 <strcmp+0x39>
 385:	0f b6 cb             	movzbl %bl,%ecx
 388:	eb ef                	jmp    379 <strcmp+0x39>
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000390 <strlen>:
	return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int n;

	for (n = 0; s[n]; n++)
 396:	80 39 00             	cmpb   $0x0,(%ecx)
 399:	74 12                	je     3ad <strlen+0x1d>
 39b:	31 d2                	xor    %edx,%edx
 39d:	8d 76 00             	lea    0x0(%esi),%esi
 3a0:	83 c2 01             	add    $0x1,%edx
 3a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 3a7:	89 d0                	mov    %edx,%eax
 3a9:	75 f5                	jne    3a0 <strlen+0x10>
		;
	return n;
}
 3ab:	5d                   	pop    %ebp
 3ac:	c3                   	ret    
uint
strlen(char *s)
{
	int n;

	for (n = 0; s[n]; n++)
 3ad:	31 c0                	xor    %eax,%eax
		;
	return n;
}
 3af:	5d                   	pop    %ebp
 3b0:	c3                   	ret    
 3b1:	eb 0d                	jmp    3c0 <memset>
 3b3:	90                   	nop
 3b4:	90                   	nop
 3b5:	90                   	nop
 3b6:	90                   	nop
 3b7:	90                   	nop
 3b8:	90                   	nop
 3b9:	90                   	nop
 3ba:	90                   	nop
 3bb:	90                   	nop
 3bc:	90                   	nop
 3bd:	90                   	nop
 3be:	90                   	nop
 3bf:	90                   	nop

000003c0 <memset>:

void *
memset(void *dst, int c, uint n)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	8b 55 08             	mov    0x8(%ebp),%edx
 3c6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
	asm volatile("cld; rep stosb" : "=D"(addr), "=c"(cnt) : "0"(addr), "1"(cnt), "a"(data) : "memory", "cc");
 3c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 3cd:	89 d7                	mov    %edx,%edi
 3cf:	fc                   	cld    
 3d0:	f3 aa                	rep stos %al,%es:(%edi)
	stosb(dst, c, n);
	return dst;
}
 3d2:	89 d0                	mov    %edx,%eax
 3d4:	5f                   	pop    %edi
 3d5:	5d                   	pop    %ebp
 3d6:	c3                   	ret    
 3d7:	89 f6                	mov    %esi,%esi
 3d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003e0 <strchr>:

char *
strchr(const char *s, char c)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
 3e6:	53                   	push   %ebx
 3e7:	8b 55 0c             	mov    0xc(%ebp),%edx
	for (; *s; s++)
 3ea:	0f b6 18             	movzbl (%eax),%ebx
 3ed:	84 db                	test   %bl,%bl
 3ef:	74 1d                	je     40e <strchr+0x2e>
		if (*s == c) return (char *)s;
 3f1:	38 d3                	cmp    %dl,%bl
 3f3:	89 d1                	mov    %edx,%ecx
 3f5:	75 0d                	jne    404 <strchr+0x24>
 3f7:	eb 17                	jmp    410 <strchr+0x30>
 3f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 400:	38 ca                	cmp    %cl,%dl
 402:	74 0c                	je     410 <strchr+0x30>
}

char *
strchr(const char *s, char c)
{
	for (; *s; s++)
 404:	83 c0 01             	add    $0x1,%eax
 407:	0f b6 10             	movzbl (%eax),%edx
 40a:	84 d2                	test   %dl,%dl
 40c:	75 f2                	jne    400 <strchr+0x20>
		if (*s == c) return (char *)s;
	return 0;
 40e:	31 c0                	xor    %eax,%eax
}
 410:	5b                   	pop    %ebx
 411:	5d                   	pop    %ebp
 412:	c3                   	ret    
 413:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000420 <gets>:

char *
gets(char *buf, int max)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 425:	31 f6                	xor    %esi,%esi
	return 0;
}

char *
gets(char *buf, int max)
{
 427:	53                   	push   %ebx
 428:	83 ec 2c             	sub    $0x2c,%esp
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
		cc = read(0, &c, 1);
 42b:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 42e:	eb 31                	jmp    461 <gets+0x41>
		cc = read(0, &c, 1);
 430:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 437:	00 
 438:	89 7c 24 04          	mov    %edi,0x4(%esp)
 43c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 443:	e8 68 01 00 00       	call   5b0 <read>
		if (cc < 1) break;
 448:	85 c0                	test   %eax,%eax
 44a:	7e 1d                	jle    469 <gets+0x49>
		buf[i++] = c;
 44c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 450:	89 de                	mov    %ebx,%esi
		cc = read(0, &c, 1);
		if (cc < 1) break;
		buf[i++] = c;
 452:	8b 55 08             	mov    0x8(%ebp),%edx
		if (c == '\n' || c == '\r') break;
 455:	3c 0d                	cmp    $0xd,%al
	char c;

	for (i = 0; i + 1 < max;) {
		cc = read(0, &c, 1);
		if (cc < 1) break;
		buf[i++] = c;
 457:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
		if (c == '\n' || c == '\r') break;
 45b:	74 0c                	je     469 <gets+0x49>
 45d:	3c 0a                	cmp    $0xa,%al
 45f:	74 08                	je     469 <gets+0x49>
gets(char *buf, int max)
{
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 461:	8d 5e 01             	lea    0x1(%esi),%ebx
 464:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 467:	7c c7                	jl     430 <gets+0x10>
		cc = read(0, &c, 1);
		if (cc < 1) break;
		buf[i++] = c;
		if (c == '\n' || c == '\r') break;
	}
	buf[i] = '\0';
 469:	8b 45 08             	mov    0x8(%ebp),%eax
 46c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
	return buf;
}
 470:	83 c4 2c             	add    $0x2c,%esp
 473:	5b                   	pop    %ebx
 474:	5e                   	pop    %esi
 475:	5f                   	pop    %edi
 476:	5d                   	pop    %ebp
 477:	c3                   	ret    
 478:	90                   	nop
 479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000480 <stat>:

int
stat(char *n, struct stat *st)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	56                   	push   %esi
 484:	53                   	push   %ebx
 485:	83 ec 10             	sub    $0x10,%esp
	int fd;
	int r;

	fd = open(n, O_RDONLY);
 488:	8b 45 08             	mov    0x8(%ebp),%eax
 48b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 492:	00 
 493:	89 04 24             	mov    %eax,(%esp)
 496:	e8 3d 01 00 00       	call   5d8 <open>
	if (fd < 0) return -1;
 49b:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
	int fd;
	int r;

	fd = open(n, O_RDONLY);
 49d:	89 c3                	mov    %eax,%ebx
	if (fd < 0) return -1;
 49f:	78 27                	js     4c8 <stat+0x48>
	r = fstat(fd, st);
 4a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a4:	89 1c 24             	mov    %ebx,(%esp)
 4a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ab:	e8 40 01 00 00       	call   5f0 <fstat>
	close(fd);
 4b0:	89 1c 24             	mov    %ebx,(%esp)
	int fd;
	int r;

	fd = open(n, O_RDONLY);
	if (fd < 0) return -1;
	r = fstat(fd, st);
 4b3:	89 c6                	mov    %eax,%esi
	close(fd);
 4b5:	e8 06 01 00 00       	call   5c0 <close>
	return r;
 4ba:	89 f0                	mov    %esi,%eax
}
 4bc:	83 c4 10             	add    $0x10,%esp
 4bf:	5b                   	pop    %ebx
 4c0:	5e                   	pop    %esi
 4c1:	5d                   	pop    %ebp
 4c2:	c3                   	ret    
 4c3:	90                   	nop
 4c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
	int fd;
	int r;

	fd = open(n, O_RDONLY);
	if (fd < 0) return -1;
 4c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4cd:	eb ed                	jmp    4bc <stat+0x3c>
 4cf:	90                   	nop

000004d0 <atoi>:
	return r;
}

int
atoi(const char *s)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4d6:	53                   	push   %ebx
	int n;

	n = 0;
	while ('0' <= *s && *s <= '9') n= n * 10 + *s++ - '0';
 4d7:	0f be 11             	movsbl (%ecx),%edx
 4da:	8d 42 d0             	lea    -0x30(%edx),%eax
 4dd:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
	int n;

	n = 0;
 4df:	b8 00 00 00 00       	mov    $0x0,%eax
	while ('0' <= *s && *s <= '9') n= n * 10 + *s++ - '0';
 4e4:	77 17                	ja     4fd <atoi+0x2d>
 4e6:	66 90                	xchg   %ax,%ax
 4e8:	83 c1 01             	add    $0x1,%ecx
 4eb:	8d 04 80             	lea    (%eax,%eax,4),%eax
 4ee:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 4f2:	0f be 11             	movsbl (%ecx),%edx
 4f5:	8d 5a d0             	lea    -0x30(%edx),%ebx
 4f8:	80 fb 09             	cmp    $0x9,%bl
 4fb:	76 eb                	jbe    4e8 <atoi+0x18>
	return n;
}
 4fd:	5b                   	pop    %ebx
 4fe:	5d                   	pop    %ebp
 4ff:	c3                   	ret    

00000500 <memmove>:

void *
memmove(void *vdst, void *vsrc, int n)
{
 500:	55                   	push   %ebp
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0) *dst++= *src++;
 501:	31 d2                	xor    %edx,%edx
	return n;
}

void *
memmove(void *vdst, void *vsrc, int n)
{
 503:	89 e5                	mov    %esp,%ebp
 505:	56                   	push   %esi
 506:	8b 45 08             	mov    0x8(%ebp),%eax
 509:	53                   	push   %ebx
 50a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 50d:	8b 75 0c             	mov    0xc(%ebp),%esi
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0) *dst++= *src++;
 510:	85 db                	test   %ebx,%ebx
 512:	7e 12                	jle    526 <memmove+0x26>
 514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 518:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 51c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 51f:	83 c2 01             	add    $0x1,%edx
 522:	39 da                	cmp    %ebx,%edx
 524:	75 f2                	jne    518 <memmove+0x18>
	return vdst;
}
 526:	5b                   	pop    %ebx
 527:	5e                   	pop    %esi
 528:	5d                   	pop    %ebp
 529:	c3                   	ret    
 52a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000530 <ps>:

//edit
void ps(void){
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	56                   	push   %esi
 534:	53                   	push   %ebx
	int which = 1;
 535:	bb 01 00 00 00       	mov    $0x1,%ebx
	while (n-- > 0) *dst++= *src++;
	return vdst;
}

//edit
void ps(void){
 53a:	83 ec 40             	sub    $0x40,%esp
 53d:	8d 75 dc             	lea    -0x24(%ebp),%esi
 540:	eb 37                	jmp    579 <ps+0x49>
 542:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	int which = 1;
	struct pstat pnode;
	while(1){
	if(procstat (which, &pnode))break;

	printf(1, "%d, %d, %c, %s\n",pnode.pid, pnode.ppid, pnode.state, pnode.name);
 548:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
	which++;
 54c:	83 c3 01             	add    $0x1,%ebx
	int which = 1;
	struct pstat pnode;
	while(1){
	if(procstat (which, &pnode))break;

	printf(1, "%d, %d, %c, %s\n",pnode.pid, pnode.ppid, pnode.state, pnode.name);
 54f:	89 74 24 14          	mov    %esi,0x14(%esp)
 553:	c7 44 24 04 7e 0a 00 	movl   $0xa7e,0x4(%esp)
 55a:	00 
 55b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 562:	89 44 24 10          	mov    %eax,0x10(%esp)
 566:	8b 45 f4             	mov    -0xc(%ebp),%eax
 569:	89 44 24 0c          	mov    %eax,0xc(%esp)
 56d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 570:	89 44 24 08          	mov    %eax,0x8(%esp)
 574:	e8 67 01 00 00       	call   6e0 <printf>
//edit
void ps(void){
	int which = 1;
	struct pstat pnode;
	while(1){
	if(procstat (which, &pnode))break;
 579:	89 74 24 04          	mov    %esi,0x4(%esp)
 57d:	89 1c 24             	mov    %ebx,(%esp)
 580:	e8 b3 00 00 00       	call   638 <procstat>
 585:	85 c0                	test   %eax,%eax
 587:	74 bf                	je     548 <ps+0x18>

	printf(1, "%d, %d, %c, %s\n",pnode.pid, pnode.ppid, pnode.state, pnode.name);
	which++;
	}
}
 589:	83 c4 40             	add    $0x40,%esp
 58c:	5b                   	pop    %ebx
 58d:	5e                   	pop    %esi
 58e:	5d                   	pop    %ebp
 58f:	c3                   	ret    

00000590 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 590:	b8 01 00 00 00       	mov    $0x1,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <exit>:
SYSCALL(exit)
 598:	b8 02 00 00 00       	mov    $0x2,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <wait>:
SYSCALL(wait)
 5a0:	b8 03 00 00 00       	mov    $0x3,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <pipe>:
SYSCALL(pipe)
 5a8:	b8 04 00 00 00       	mov    $0x4,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <read>:
SYSCALL(read)
 5b0:	b8 05 00 00 00       	mov    $0x5,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <write>:
SYSCALL(write)
 5b8:	b8 10 00 00 00       	mov    $0x10,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <close>:
SYSCALL(close)
 5c0:	b8 15 00 00 00       	mov    $0x15,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <kill>:
SYSCALL(kill)
 5c8:	b8 06 00 00 00       	mov    $0x6,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <exec>:
SYSCALL(exec)
 5d0:	b8 07 00 00 00       	mov    $0x7,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <open>:
SYSCALL(open)
 5d8:	b8 0f 00 00 00       	mov    $0xf,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <mknod>:
SYSCALL(mknod)
 5e0:	b8 11 00 00 00       	mov    $0x11,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <unlink>:
SYSCALL(unlink)
 5e8:	b8 12 00 00 00       	mov    $0x12,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <fstat>:
SYSCALL(fstat)
 5f0:	b8 08 00 00 00       	mov    $0x8,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <link>:
SYSCALL(link)
 5f8:	b8 13 00 00 00       	mov    $0x13,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <mkdir>:
SYSCALL(mkdir)
 600:	b8 14 00 00 00       	mov    $0x14,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <chdir>:
SYSCALL(chdir)
 608:	b8 09 00 00 00       	mov    $0x9,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <dup>:
SYSCALL(dup)
 610:	b8 0a 00 00 00       	mov    $0xa,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <getpid>:
SYSCALL(getpid)
 618:	b8 0b 00 00 00       	mov    $0xb,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <sbrk>:
SYSCALL(sbrk)
 620:	b8 0c 00 00 00       	mov    $0xc,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <sleep>:
SYSCALL(sleep)
 628:	b8 0d 00 00 00       	mov    $0xd,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <uptime>:
SYSCALL(uptime)
 630:	b8 0e 00 00 00       	mov    $0xe,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <procstat>:
SYSCALL(procstat)
 638:	b8 16 00 00 00       	mov    $0x16,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
 645:	89 c6                	mov    %eax,%esi
 647:	53                   	push   %ebx
 648:	83 ec 4c             	sub    $0x4c,%esp
	char        buf[16];
	int         i, neg;
	uint        x;

	neg = 0;
	if (sgn && xx < 0) {
 64b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 64e:	85 db                	test   %ebx,%ebx
 650:	74 09                	je     65b <printint+0x1b>
 652:	89 d0                	mov    %edx,%eax
 654:	c1 e8 1f             	shr    $0x1f,%eax
 657:	84 c0                	test   %al,%al
 659:	75 75                	jne    6d0 <printint+0x90>
		neg = 1;
		x   = -xx;
	} else {
		x = xx;
 65b:	89 d0                	mov    %edx,%eax
	static char digits[] = "0123456789ABCDEF";
	char        buf[16];
	int         i, neg;
	uint        x;

	neg = 0;
 65d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 664:	89 75 c0             	mov    %esi,-0x40(%ebp)
		x   = -xx;
	} else {
		x = xx;
	}

	i = 0;
 667:	31 ff                	xor    %edi,%edi
 669:	89 ce                	mov    %ecx,%esi
 66b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 66e:	eb 02                	jmp    672 <printint+0x32>
	do {
		buf[i++] = digits[x % base];
 670:	89 cf                	mov    %ecx,%edi
 672:	31 d2                	xor    %edx,%edx
 674:	f7 f6                	div    %esi
 676:	8d 4f 01             	lea    0x1(%edi),%ecx
 679:	0f b6 92 95 0a 00 00 	movzbl 0xa95(%edx),%edx
	} while ((x /= base) != 0);
 680:	85 c0                	test   %eax,%eax
		x = xx;
	}

	i = 0;
	do {
		buf[i++] = digits[x % base];
 682:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
	} while ((x /= base) != 0);
 685:	75 e9                	jne    670 <printint+0x30>
	if (neg) buf[i++] = '-';
 687:	8b 55 c4             	mov    -0x3c(%ebp),%edx
		x = xx;
	}

	i = 0;
	do {
		buf[i++] = digits[x % base];
 68a:	89 c8                	mov    %ecx,%eax
 68c:	8b 75 c0             	mov    -0x40(%ebp),%esi
	} while ((x /= base) != 0);
	if (neg) buf[i++] = '-';
 68f:	85 d2                	test   %edx,%edx
 691:	74 08                	je     69b <printint+0x5b>
 693:	8d 4f 02             	lea    0x2(%edi),%ecx
 696:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

	while (--i >= 0) putc(fd, buf[i]);
 69b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 69e:	66 90                	xchg   %ax,%ax
 6a0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 6a5:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6a8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6af:	00 
 6b0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 6b4:	89 34 24             	mov    %esi,(%esp)
 6b7:	88 45 d7             	mov    %al,-0x29(%ebp)
 6ba:	e8 f9 fe ff ff       	call   5b8 <write>
	do {
		buf[i++] = digits[x % base];
	} while ((x /= base) != 0);
	if (neg) buf[i++] = '-';

	while (--i >= 0) putc(fd, buf[i]);
 6bf:	83 ff ff             	cmp    $0xffffffff,%edi
 6c2:	75 dc                	jne    6a0 <printint+0x60>
}
 6c4:	83 c4 4c             	add    $0x4c,%esp
 6c7:	5b                   	pop    %ebx
 6c8:	5e                   	pop    %esi
 6c9:	5f                   	pop    %edi
 6ca:	5d                   	pop    %ebp
 6cb:	c3                   	ret    
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	uint        x;

	neg = 0;
	if (sgn && xx < 0) {
		neg = 1;
		x   = -xx;
 6d0:	89 d0                	mov    %edx,%eax
 6d2:	f7 d8                	neg    %eax
	int         i, neg;
	uint        x;

	neg = 0;
	if (sgn && xx < 0) {
		neg = 1;
 6d4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 6db:	eb 87                	jmp    664 <printint+0x24>
 6dd:	8d 76 00             	lea    0x0(%esi),%esi

000006e0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
	char *s;
	int   c, i, state;
	uint *ap;

	state = 0;
 6e4:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 6e6:	56                   	push   %esi
 6e7:	53                   	push   %ebx
 6e8:	83 ec 3c             	sub    $0x3c,%esp
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 6eb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	char *s;
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
 6ee:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 6f1:	8b 75 08             	mov    0x8(%ebp),%esi
	char *s;
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
 6f4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	for (i = 0; fmt[i]; i++) {
 6f7:	0f b6 13             	movzbl (%ebx),%edx
 6fa:	83 c3 01             	add    $0x1,%ebx
 6fd:	84 d2                	test   %dl,%dl
 6ff:	75 39                	jne    73a <printf+0x5a>
 701:	e9 c2 00 00 00       	jmp    7c8 <printf+0xe8>
 706:	66 90                	xchg   %ax,%ax
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
 708:	83 fa 25             	cmp    $0x25,%edx
 70b:	0f 84 bf 00 00 00    	je     7d0 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 711:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 714:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 71b:	00 
 71c:	89 44 24 04          	mov    %eax,0x4(%esp)
 720:	89 34 24             	mov    %esi,(%esp)
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
				state = '%';
			} else {
				putc(fd, c);
 723:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 726:	e8 8d fe ff ff       	call   5b8 <write>
 72b:	83 c3 01             	add    $0x1,%ebx
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 72e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 732:	84 d2                	test   %dl,%dl
 734:	0f 84 8e 00 00 00    	je     7c8 <printf+0xe8>
		c = fmt[i] & 0xff;
		if (state == 0) {
 73a:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
		c = fmt[i] & 0xff;
 73c:	0f be c2             	movsbl %dl,%eax
		if (state == 0) {
 73f:	74 c7                	je     708 <printf+0x28>
			if (c == '%') {
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if (state == '%') {
 741:	83 ff 25             	cmp    $0x25,%edi
 744:	75 e5                	jne    72b <printf+0x4b>
			if (c == 'd') {
 746:	83 fa 64             	cmp    $0x64,%edx
 749:	0f 84 31 01 00 00    	je     880 <printf+0x1a0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
 74f:	25 f7 00 00 00       	and    $0xf7,%eax
 754:	83 f8 70             	cmp    $0x70,%eax
 757:	0f 84 83 00 00 00    	je     7e0 <printf+0x100>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if (c == 's') {
 75d:	83 fa 73             	cmp    $0x73,%edx
 760:	0f 84 a2 00 00 00    	je     808 <printf+0x128>
				if (s == 0) s = "(null)";
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
 766:	83 fa 63             	cmp    $0x63,%edx
 769:	0f 84 35 01 00 00    	je     8a4 <printf+0x1c4>
				putc(fd, *ap);
				ap++;
			} else if (c == '%') {
 76f:	83 fa 25             	cmp    $0x25,%edx
 772:	0f 84 e0 00 00 00    	je     858 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 778:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 77b:	83 c3 01             	add    $0x1,%ebx
 77e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 785:	00 
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 786:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 788:	89 44 24 04          	mov    %eax,0x4(%esp)
 78c:	89 34 24             	mov    %esi,(%esp)
 78f:	89 55 d0             	mov    %edx,-0x30(%ebp)
 792:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 796:	e8 1d fe ff ff       	call   5b8 <write>
			} else if (c == '%') {
				putc(fd, c);
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
 79b:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 79e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 7a1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7a8:	00 
 7a9:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ad:	89 34 24             	mov    %esi,(%esp)
			} else if (c == '%') {
				putc(fd, c);
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
 7b0:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 7b3:	e8 00 fe ff ff       	call   5b8 <write>
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 7b8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 7bc:	84 d2                	test   %dl,%dl
 7be:	0f 85 76 ff ff ff    	jne    73a <printf+0x5a>
 7c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				putc(fd, c);
			}
			state = 0;
		}
	}
}
 7c8:	83 c4 3c             	add    $0x3c,%esp
 7cb:	5b                   	pop    %ebx
 7cc:	5e                   	pop    %esi
 7cd:	5f                   	pop    %edi
 7ce:	5d                   	pop    %ebp
 7cf:	c3                   	ret    
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
				state = '%';
 7d0:	bf 25 00 00 00       	mov    $0x25,%edi
 7d5:	e9 51 ff ff ff       	jmp    72b <printf+0x4b>
 7da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
				printint(fd, *ap, 16, 0);
 7e0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 7e3:	b9 10 00 00 00       	mov    $0x10,%ecx
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 7e8:	31 ff                	xor    %edi,%edi
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
				printint(fd, *ap, 16, 0);
 7ea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 7f1:	8b 10                	mov    (%eax),%edx
 7f3:	89 f0                	mov    %esi,%eax
 7f5:	e8 46 fe ff ff       	call   640 <printint>
				ap++;
 7fa:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 7fe:	e9 28 ff ff ff       	jmp    72b <printf+0x4b>
 803:	90                   	nop
 804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			} else if (c == 's') {
				s = (char *)*ap;
 808:	8b 45 d4             	mov    -0x2c(%ebp),%eax
				ap++;
 80b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
				ap++;
			} else if (c == 'x' || c == 'p') {
				printint(fd, *ap, 16, 0);
				ap++;
			} else if (c == 's') {
				s = (char *)*ap;
 80f:	8b 38                	mov    (%eax),%edi
				ap++;
				if (s == 0) s = "(null)";
 811:	b8 8e 0a 00 00       	mov    $0xa8e,%eax
 816:	85 ff                	test   %edi,%edi
 818:	0f 44 f8             	cmove  %eax,%edi
				while (*s != 0) {
 81b:	0f b6 07             	movzbl (%edi),%eax
 81e:	84 c0                	test   %al,%al
 820:	74 2a                	je     84c <printf+0x16c>
 822:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 828:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 82b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
				s = (char *)*ap;
				ap++;
				if (s == 0) s = "(null)";
				while (*s != 0) {
					putc(fd, *s);
					s++;
 82e:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 831:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 838:	00 
 839:	89 44 24 04          	mov    %eax,0x4(%esp)
 83d:	89 34 24             	mov    %esi,(%esp)
 840:	e8 73 fd ff ff       	call   5b8 <write>
				ap++;
			} else if (c == 's') {
				s = (char *)*ap;
				ap++;
				if (s == 0) s = "(null)";
				while (*s != 0) {
 845:	0f b6 07             	movzbl (%edi),%eax
 848:	84 c0                	test   %al,%al
 84a:	75 dc                	jne    828 <printf+0x148>
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 84c:	31 ff                	xor    %edi,%edi
 84e:	e9 d8 fe ff ff       	jmp    72b <printf+0x4b>
 853:	90                   	nop
 854:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 858:	8d 45 e5             	lea    -0x1b(%ebp),%eax
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 85b:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 85d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 864:	00 
 865:	89 44 24 04          	mov    %eax,0x4(%esp)
 869:	89 34 24             	mov    %esi,(%esp)
 86c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 870:	e8 43 fd ff ff       	call   5b8 <write>
 875:	e9 b1 fe ff ff       	jmp    72b <printf+0x4b>
 87a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
 880:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 883:	b9 0a 00 00 00       	mov    $0xa,%ecx
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 888:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
 88b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 892:	8b 10                	mov    (%eax),%edx
 894:	89 f0                	mov    %esi,%eax
 896:	e8 a5 fd ff ff       	call   640 <printint>
				ap++;
 89b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 89f:	e9 87 fe ff ff       	jmp    72b <printf+0x4b>
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
 8a4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 8a7:	31 ff                	xor    %edi,%edi
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
 8a9:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 8ab:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8b2:	00 
 8b3:	89 34 24             	mov    %esi,(%esp)
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
 8b6:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 8b9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 8bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 8c0:	e8 f3 fc ff ff       	call   5b8 <write>
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
				ap++;
 8c5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 8c9:	e9 5d fe ff ff       	jmp    72b <printf+0x4b>
 8ce:	66 90                	xchg   %ax,%ax

000008d0 <free>:
static Header  base;
static Header *freep;

void
free(void *ap)
{
 8d0:	55                   	push   %ebp
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d1:	a1 20 0e 00 00       	mov    0xe20,%eax
static Header  base;
static Header *freep;

void
free(void *ap)
{
 8d6:	89 e5                	mov    %esp,%ebp
 8d8:	57                   	push   %edi
 8d9:	56                   	push   %esi
 8da:	53                   	push   %ebx
 8db:	8b 5d 08             	mov    0x8(%ebp),%ebx
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 8de:	8b 08                	mov    (%eax),%ecx
void
free(void *ap)
{
	Header *bp, *p;

	bp = (Header *)ap - 1;
 8e0:	8d 53 f8             	lea    -0x8(%ebx),%edx
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8e3:	39 d0                	cmp    %edx,%eax
 8e5:	72 11                	jb     8f8 <free+0x28>
 8e7:	90                   	nop
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 8e8:	39 c8                	cmp    %ecx,%eax
 8ea:	72 04                	jb     8f0 <free+0x20>
 8ec:	39 ca                	cmp    %ecx,%edx
 8ee:	72 10                	jb     900 <free+0x30>
 8f0:	89 c8                	mov    %ecx,%eax
free(void *ap)
{
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8f2:	39 d0                	cmp    %edx,%eax
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 8f4:	8b 08                	mov    (%eax),%ecx
free(void *ap)
{
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8f6:	73 f0                	jae    8e8 <free+0x18>
 8f8:	39 ca                	cmp    %ecx,%edx
 8fa:	72 04                	jb     900 <free+0x30>
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 8fc:	39 c8                	cmp    %ecx,%eax
 8fe:	72 f0                	jb     8f0 <free+0x20>
	if (bp + bp->s.size == p->s.ptr) {
 900:	8b 73 fc             	mov    -0x4(%ebx),%esi
 903:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 906:	39 cf                	cmp    %ecx,%edi
 908:	74 1e                	je     928 <free+0x58>
		bp->s.size += p->s.ptr->s.size;
		bp->s.ptr = p->s.ptr->s.ptr;
	} else
		bp->s.ptr = p->s.ptr;
 90a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
	if (p + p->s.size == bp) {
 90d:	8b 48 04             	mov    0x4(%eax),%ecx
 910:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 913:	39 f2                	cmp    %esi,%edx
 915:	74 28                	je     93f <free+0x6f>
		p->s.size += bp->s.size;
		p->s.ptr = bp->s.ptr;
	} else
		p->s.ptr = bp;
 917:	89 10                	mov    %edx,(%eax)
	freep = p;
 919:	a3 20 0e 00 00       	mov    %eax,0xe20
}
 91e:	5b                   	pop    %ebx
 91f:	5e                   	pop    %esi
 920:	5f                   	pop    %edi
 921:	5d                   	pop    %ebp
 922:	c3                   	ret    
 923:	90                   	nop
 924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
	if (bp + bp->s.size == p->s.ptr) {
		bp->s.size += p->s.ptr->s.size;
 928:	03 71 04             	add    0x4(%ecx),%esi
 92b:	89 73 fc             	mov    %esi,-0x4(%ebx)
		bp->s.ptr = p->s.ptr->s.ptr;
 92e:	8b 08                	mov    (%eax),%ecx
 930:	8b 09                	mov    (%ecx),%ecx
 932:	89 4b f8             	mov    %ecx,-0x8(%ebx)
	} else
		bp->s.ptr = p->s.ptr;
	if (p + p->s.size == bp) {
 935:	8b 48 04             	mov    0x4(%eax),%ecx
 938:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 93b:	39 f2                	cmp    %esi,%edx
 93d:	75 d8                	jne    917 <free+0x47>
		p->s.size += bp->s.size;
 93f:	03 4b fc             	add    -0x4(%ebx),%ecx
		p->s.ptr = bp->s.ptr;
	} else
		p->s.ptr = bp;
	freep = p;
 942:	a3 20 0e 00 00       	mov    %eax,0xe20
		bp->s.size += p->s.ptr->s.size;
		bp->s.ptr = p->s.ptr->s.ptr;
	} else
		bp->s.ptr = p->s.ptr;
	if (p + p->s.size == bp) {
		p->s.size += bp->s.size;
 947:	89 48 04             	mov    %ecx,0x4(%eax)
		p->s.ptr = bp->s.ptr;
 94a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 94d:	89 10                	mov    %edx,(%eax)
	} else
		p->s.ptr = bp;
	freep = p;
}
 94f:	5b                   	pop    %ebx
 950:	5e                   	pop    %esi
 951:	5f                   	pop    %edi
 952:	5d                   	pop    %ebp
 953:	c3                   	ret    
 954:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 95a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000960 <malloc>:
	return freep;
}

void *
malloc(uint nbytes)
{
 960:	55                   	push   %ebp
 961:	89 e5                	mov    %esp,%ebp
 963:	57                   	push   %edi
 964:	56                   	push   %esi
 965:	53                   	push   %ebx
 966:	83 ec 1c             	sub    $0x1c,%esp
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 969:	8b 45 08             	mov    0x8(%ebp),%eax
	if ((prevp = freep) == 0) {
 96c:	8b 1d 20 0e 00 00    	mov    0xe20,%ebx
malloc(uint nbytes)
{
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 972:	8d 48 07             	lea    0x7(%eax),%ecx
 975:	c1 e9 03             	shr    $0x3,%ecx
	if ((prevp = freep) == 0) {
 978:	85 db                	test   %ebx,%ebx
malloc(uint nbytes)
{
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 97a:	8d 71 01             	lea    0x1(%ecx),%esi
	if ((prevp = freep) == 0) {
 97d:	0f 84 9b 00 00 00    	je     a1e <malloc+0xbe>
 983:	8b 13                	mov    (%ebx),%edx
 985:	8b 7a 04             	mov    0x4(%edx),%edi
		base.s.ptr = freep = prevp = &base;
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
		if (p->s.size >= nunits) {
 988:	39 fe                	cmp    %edi,%esi
 98a:	76 64                	jbe    9f0 <malloc+0x90>
 98c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
morecore(uint nu)
{
	char *  p;
	Header *hp;

	if (nu < 4096) nu = 4096;
 993:	bb 00 80 00 00       	mov    $0x8000,%ebx
 998:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 99b:	eb 0e                	jmp    9ab <malloc+0x4b>
 99d:	8d 76 00             	lea    0x0(%esi),%esi
	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
 9a0:	8b 02                	mov    (%edx),%eax
		if (p->s.size >= nunits) {
 9a2:	8b 78 04             	mov    0x4(%eax),%edi
 9a5:	39 fe                	cmp    %edi,%esi
 9a7:	76 4f                	jbe    9f8 <malloc+0x98>
 9a9:	89 c2                	mov    %eax,%edx
				p->s.size = nunits;
			}
			freep = prevp;
			return (void *)(p + 1);
		}
		if (p == freep)
 9ab:	3b 15 20 0e 00 00    	cmp    0xe20,%edx
 9b1:	75 ed                	jne    9a0 <malloc+0x40>
morecore(uint nu)
{
	char *  p;
	Header *hp;

	if (nu < 4096) nu = 4096;
 9b3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9b6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 9bc:	bf 00 10 00 00       	mov    $0x1000,%edi
 9c1:	0f 43 fe             	cmovae %esi,%edi
 9c4:	0f 42 c3             	cmovb  %ebx,%eax
	p = sbrk(nu * sizeof(Header));
 9c7:	89 04 24             	mov    %eax,(%esp)
 9ca:	e8 51 fc ff ff       	call   620 <sbrk>
	if (p == (char *)-1) return 0;
 9cf:	83 f8 ff             	cmp    $0xffffffff,%eax
 9d2:	74 18                	je     9ec <malloc+0x8c>
	hp         = (Header *)p;
	hp->s.size = nu;
 9d4:	89 78 04             	mov    %edi,0x4(%eax)
	free((void *)(hp + 1));
 9d7:	83 c0 08             	add    $0x8,%eax
 9da:	89 04 24             	mov    %eax,(%esp)
 9dd:	e8 ee fe ff ff       	call   8d0 <free>
	return freep;
 9e2:	8b 15 20 0e 00 00    	mov    0xe20,%edx
			}
			freep = prevp;
			return (void *)(p + 1);
		}
		if (p == freep)
			if ((p = morecore(nunits)) == 0) return 0;
 9e8:	85 d2                	test   %edx,%edx
 9ea:	75 b4                	jne    9a0 <malloc+0x40>
 9ec:	31 c0                	xor    %eax,%eax
 9ee:	eb 20                	jmp    a10 <malloc+0xb0>
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
		if (p->s.size >= nunits) {
 9f0:	89 d0                	mov    %edx,%eax
 9f2:	89 da                	mov    %ebx,%edx
 9f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			if (p->s.size == nunits)
 9f8:	39 fe                	cmp    %edi,%esi
 9fa:	74 1c                	je     a18 <malloc+0xb8>
				prevp->s.ptr = p->s.ptr;
			else {
				p->s.size -= nunits;
 9fc:	29 f7                	sub    %esi,%edi
 9fe:	89 78 04             	mov    %edi,0x4(%eax)
				p += p->s.size;
 a01:	8d 04 f8             	lea    (%eax,%edi,8),%eax
				p->s.size = nunits;
 a04:	89 70 04             	mov    %esi,0x4(%eax)
			}
			freep = prevp;
 a07:	89 15 20 0e 00 00    	mov    %edx,0xe20
			return (void *)(p + 1);
 a0d:	83 c0 08             	add    $0x8,%eax
		}
		if (p == freep)
			if ((p = morecore(nunits)) == 0) return 0;
	}
}
 a10:	83 c4 1c             	add    $0x1c,%esp
 a13:	5b                   	pop    %ebx
 a14:	5e                   	pop    %esi
 a15:	5f                   	pop    %edi
 a16:	5d                   	pop    %ebp
 a17:	c3                   	ret    
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
		if (p->s.size >= nunits) {
			if (p->s.size == nunits)
				prevp->s.ptr = p->s.ptr;
 a18:	8b 08                	mov    (%eax),%ecx
 a1a:	89 0a                	mov    %ecx,(%edx)
 a1c:	eb e9                	jmp    a07 <malloc+0xa7>
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
 a1e:	c7 05 20 0e 00 00 24 	movl   $0xe24,0xe20
 a25:	0e 00 00 
		base.s.size                = 0;
 a28:	ba 24 0e 00 00       	mov    $0xe24,%edx
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
 a2d:	c7 05 24 0e 00 00 24 	movl   $0xe24,0xe24
 a34:	0e 00 00 
		base.s.size                = 0;
 a37:	c7 05 28 0e 00 00 00 	movl   $0x0,0xe28
 a3e:	00 00 00 
 a41:	e9 46 ff ff ff       	jmp    98c <malloc+0x2c>
