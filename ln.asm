
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	83 ec 10             	sub    $0x10,%esp
   a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	if (argc != 3) {
   d:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
  11:	74 19                	je     2c <main+0x2c>
		printf(2, "Usage: ln old new\n");
  13:	c7 44 24 04 a6 07 00 	movl   $0x7a6,0x4(%esp)
  1a:	00 
  1b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  22:	e8 19 04 00 00       	call   440 <printf>
		exit();
  27:	e8 cc 02 00 00       	call   2f8 <exit>
	}
	if (link(argv[1], argv[2]) < 0) printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  2c:	8b 43 08             	mov    0x8(%ebx),%eax
  2f:	89 44 24 04          	mov    %eax,0x4(%esp)
  33:	8b 43 04             	mov    0x4(%ebx),%eax
  36:	89 04 24             	mov    %eax,(%esp)
  39:	e8 1a 03 00 00       	call   358 <link>
  3e:	85 c0                	test   %eax,%eax
  40:	78 05                	js     47 <main+0x47>
	exit();
  42:	e8 b1 02 00 00       	call   2f8 <exit>
{
	if (argc != 3) {
		printf(2, "Usage: ln old new\n");
		exit();
	}
	if (link(argv[1], argv[2]) < 0) printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  47:	8b 43 08             	mov    0x8(%ebx),%eax
  4a:	89 44 24 0c          	mov    %eax,0xc(%esp)
  4e:	8b 43 04             	mov    0x4(%ebx),%eax
  51:	c7 44 24 04 b9 07 00 	movl   $0x7b9,0x4(%esp)
  58:	00 
  59:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  60:	89 44 24 08          	mov    %eax,0x8(%esp)
  64:	e8 d7 03 00 00       	call   440 <printf>
  69:	eb d7                	jmp    42 <main+0x42>
  6b:	66 90                	xchg   %ax,%ax
  6d:	66 90                	xchg   %ax,%ax
  6f:	90                   	nop

00000070 <strcpy>:
#include "pstat.h"//include


char *
strcpy(char *s, char *t)
{
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
  73:	8b 45 08             	mov    0x8(%ebp),%eax
  76:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  79:	53                   	push   %ebx
	char *os;

	os = s;
	while ((*s++ = *t++) != 0)
  7a:	89 c2                	mov    %eax,%edx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	83 c1 01             	add    $0x1,%ecx
  83:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  87:	83 c2 01             	add    $0x1,%edx
  8a:	84 db                	test   %bl,%bl
  8c:	88 5a ff             	mov    %bl,-0x1(%edx)
  8f:	75 ef                	jne    80 <strcpy+0x10>
		;
	return os;
}
  91:	5b                   	pop    %ebx
  92:	5d                   	pop    %ebp
  93:	c3                   	ret    
  94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	8b 55 08             	mov    0x8(%ebp),%edx
  a6:	53                   	push   %ebx
  a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
	while (*p && *p == *q) p++, q++;
  aa:	0f b6 02             	movzbl (%edx),%eax
  ad:	84 c0                	test   %al,%al
  af:	74 2d                	je     de <strcmp+0x3e>
  b1:	0f b6 19             	movzbl (%ecx),%ebx
  b4:	38 d8                	cmp    %bl,%al
  b6:	74 0e                	je     c6 <strcmp+0x26>
  b8:	eb 2b                	jmp    e5 <strcmp+0x45>
  ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  c0:	38 c8                	cmp    %cl,%al
  c2:	75 15                	jne    d9 <strcmp+0x39>
  c4:	89 d9                	mov    %ebx,%ecx
  c6:	83 c2 01             	add    $0x1,%edx
  c9:	0f b6 02             	movzbl (%edx),%eax
  cc:	8d 59 01             	lea    0x1(%ecx),%ebx
  cf:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
  d3:	84 c0                	test   %al,%al
  d5:	75 e9                	jne    c0 <strcmp+0x20>
  d7:	31 c0                	xor    %eax,%eax
	return (uchar)*p - (uchar)*q;
  d9:	29 c8                	sub    %ecx,%eax
}
  db:	5b                   	pop    %ebx
  dc:	5d                   	pop    %ebp
  dd:	c3                   	ret    
  de:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q) p++, q++;
  e1:	31 c0                	xor    %eax,%eax
  e3:	eb f4                	jmp    d9 <strcmp+0x39>
  e5:	0f b6 cb             	movzbl %bl,%ecx
  e8:	eb ef                	jmp    d9 <strcmp+0x39>
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000f0 <strlen>:
	return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int n;

	for (n = 0; s[n]; n++)
  f6:	80 39 00             	cmpb   $0x0,(%ecx)
  f9:	74 12                	je     10d <strlen+0x1d>
  fb:	31 d2                	xor    %edx,%edx
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	83 c2 01             	add    $0x1,%edx
 103:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 107:	89 d0                	mov    %edx,%eax
 109:	75 f5                	jne    100 <strlen+0x10>
		;
	return n;
}
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    
uint
strlen(char *s)
{
	int n;

	for (n = 0; s[n]; n++)
 10d:	31 c0                	xor    %eax,%eax
		;
	return n;
}
 10f:	5d                   	pop    %ebp
 110:	c3                   	ret    
 111:	eb 0d                	jmp    120 <memset>
 113:	90                   	nop
 114:	90                   	nop
 115:	90                   	nop
 116:	90                   	nop
 117:	90                   	nop
 118:	90                   	nop
 119:	90                   	nop
 11a:	90                   	nop
 11b:	90                   	nop
 11c:	90                   	nop
 11d:	90                   	nop
 11e:	90                   	nop
 11f:	90                   	nop

00000120 <memset>:

void *
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 55 08             	mov    0x8(%ebp),%edx
 126:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
	asm volatile("cld; rep stosb" : "=D"(addr), "=c"(cnt) : "0"(addr), "1"(cnt), "a"(data) : "memory", "cc");
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld    
 130:	f3 aa                	rep stos %al,%es:(%edi)
	stosb(dst, c, n);
	return dst;
}
 132:	89 d0                	mov    %edx,%eax
 134:	5f                   	pop    %edi
 135:	5d                   	pop    %ebp
 136:	c3                   	ret    
 137:	89 f6                	mov    %esi,%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <strchr>:

char *
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	53                   	push   %ebx
 147:	8b 55 0c             	mov    0xc(%ebp),%edx
	for (; *s; s++)
 14a:	0f b6 18             	movzbl (%eax),%ebx
 14d:	84 db                	test   %bl,%bl
 14f:	74 1d                	je     16e <strchr+0x2e>
		if (*s == c) return (char *)s;
 151:	38 d3                	cmp    %dl,%bl
 153:	89 d1                	mov    %edx,%ecx
 155:	75 0d                	jne    164 <strchr+0x24>
 157:	eb 17                	jmp    170 <strchr+0x30>
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 160:	38 ca                	cmp    %cl,%dl
 162:	74 0c                	je     170 <strchr+0x30>
}

char *
strchr(const char *s, char c)
{
	for (; *s; s++)
 164:	83 c0 01             	add    $0x1,%eax
 167:	0f b6 10             	movzbl (%eax),%edx
 16a:	84 d2                	test   %dl,%dl
 16c:	75 f2                	jne    160 <strchr+0x20>
		if (*s == c) return (char *)s;
	return 0;
 16e:	31 c0                	xor    %eax,%eax
}
 170:	5b                   	pop    %ebx
 171:	5d                   	pop    %ebp
 172:	c3                   	ret    
 173:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000180 <gets>:

char *
gets(char *buf, int max)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	56                   	push   %esi
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 185:	31 f6                	xor    %esi,%esi
	return 0;
}

char *
gets(char *buf, int max)
{
 187:	53                   	push   %ebx
 188:	83 ec 2c             	sub    $0x2c,%esp
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
		cc = read(0, &c, 1);
 18b:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 18e:	eb 31                	jmp    1c1 <gets+0x41>
		cc = read(0, &c, 1);
 190:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 197:	00 
 198:	89 7c 24 04          	mov    %edi,0x4(%esp)
 19c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1a3:	e8 68 01 00 00       	call   310 <read>
		if (cc < 1) break;
 1a8:	85 c0                	test   %eax,%eax
 1aa:	7e 1d                	jle    1c9 <gets+0x49>
		buf[i++] = c;
 1ac:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 1b0:	89 de                	mov    %ebx,%esi
		cc = read(0, &c, 1);
		if (cc < 1) break;
		buf[i++] = c;
 1b2:	8b 55 08             	mov    0x8(%ebp),%edx
		if (c == '\n' || c == '\r') break;
 1b5:	3c 0d                	cmp    $0xd,%al
	char c;

	for (i = 0; i + 1 < max;) {
		cc = read(0, &c, 1);
		if (cc < 1) break;
		buf[i++] = c;
 1b7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
		if (c == '\n' || c == '\r') break;
 1bb:	74 0c                	je     1c9 <gets+0x49>
 1bd:	3c 0a                	cmp    $0xa,%al
 1bf:	74 08                	je     1c9 <gets+0x49>
gets(char *buf, int max)
{
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 1c1:	8d 5e 01             	lea    0x1(%esi),%ebx
 1c4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1c7:	7c c7                	jl     190 <gets+0x10>
		cc = read(0, &c, 1);
		if (cc < 1) break;
		buf[i++] = c;
		if (c == '\n' || c == '\r') break;
	}
	buf[i] = '\0';
 1c9:	8b 45 08             	mov    0x8(%ebp),%eax
 1cc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
	return buf;
}
 1d0:	83 c4 2c             	add    $0x2c,%esp
 1d3:	5b                   	pop    %ebx
 1d4:	5e                   	pop    %esi
 1d5:	5f                   	pop    %edi
 1d6:	5d                   	pop    %ebp
 1d7:	c3                   	ret    
 1d8:	90                   	nop
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001e0 <stat>:

int
stat(char *n, struct stat *st)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	56                   	push   %esi
 1e4:	53                   	push   %ebx
 1e5:	83 ec 10             	sub    $0x10,%esp
	int fd;
	int r;

	fd = open(n, O_RDONLY);
 1e8:	8b 45 08             	mov    0x8(%ebp),%eax
 1eb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1f2:	00 
 1f3:	89 04 24             	mov    %eax,(%esp)
 1f6:	e8 3d 01 00 00       	call   338 <open>
	if (fd < 0) return -1;
 1fb:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
	int fd;
	int r;

	fd = open(n, O_RDONLY);
 1fd:	89 c3                	mov    %eax,%ebx
	if (fd < 0) return -1;
 1ff:	78 27                	js     228 <stat+0x48>
	r = fstat(fd, st);
 201:	8b 45 0c             	mov    0xc(%ebp),%eax
 204:	89 1c 24             	mov    %ebx,(%esp)
 207:	89 44 24 04          	mov    %eax,0x4(%esp)
 20b:	e8 40 01 00 00       	call   350 <fstat>
	close(fd);
 210:	89 1c 24             	mov    %ebx,(%esp)
	int fd;
	int r;

	fd = open(n, O_RDONLY);
	if (fd < 0) return -1;
	r = fstat(fd, st);
 213:	89 c6                	mov    %eax,%esi
	close(fd);
 215:	e8 06 01 00 00       	call   320 <close>
	return r;
 21a:	89 f0                	mov    %esi,%eax
}
 21c:	83 c4 10             	add    $0x10,%esp
 21f:	5b                   	pop    %ebx
 220:	5e                   	pop    %esi
 221:	5d                   	pop    %ebp
 222:	c3                   	ret    
 223:	90                   	nop
 224:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
	int fd;
	int r;

	fd = open(n, O_RDONLY);
	if (fd < 0) return -1;
 228:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 22d:	eb ed                	jmp    21c <stat+0x3c>
 22f:	90                   	nop

00000230 <atoi>:
	return r;
}

int
atoi(const char *s)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 4d 08             	mov    0x8(%ebp),%ecx
 236:	53                   	push   %ebx
	int n;

	n = 0;
	while ('0' <= *s && *s <= '9') n= n * 10 + *s++ - '0';
 237:	0f be 11             	movsbl (%ecx),%edx
 23a:	8d 42 d0             	lea    -0x30(%edx),%eax
 23d:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
	int n;

	n = 0;
 23f:	b8 00 00 00 00       	mov    $0x0,%eax
	while ('0' <= *s && *s <= '9') n= n * 10 + *s++ - '0';
 244:	77 17                	ja     25d <atoi+0x2d>
 246:	66 90                	xchg   %ax,%ax
 248:	83 c1 01             	add    $0x1,%ecx
 24b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 24e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 252:	0f be 11             	movsbl (%ecx),%edx
 255:	8d 5a d0             	lea    -0x30(%edx),%ebx
 258:	80 fb 09             	cmp    $0x9,%bl
 25b:	76 eb                	jbe    248 <atoi+0x18>
	return n;
}
 25d:	5b                   	pop    %ebx
 25e:	5d                   	pop    %ebp
 25f:	c3                   	ret    

00000260 <memmove>:

void *
memmove(void *vdst, void *vsrc, int n)
{
 260:	55                   	push   %ebp
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0) *dst++= *src++;
 261:	31 d2                	xor    %edx,%edx
	return n;
}

void *
memmove(void *vdst, void *vsrc, int n)
{
 263:	89 e5                	mov    %esp,%ebp
 265:	56                   	push   %esi
 266:	8b 45 08             	mov    0x8(%ebp),%eax
 269:	53                   	push   %ebx
 26a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 26d:	8b 75 0c             	mov    0xc(%ebp),%esi
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0) *dst++= *src++;
 270:	85 db                	test   %ebx,%ebx
 272:	7e 12                	jle    286 <memmove+0x26>
 274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 278:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 27c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 27f:	83 c2 01             	add    $0x1,%edx
 282:	39 da                	cmp    %ebx,%edx
 284:	75 f2                	jne    278 <memmove+0x18>
	return vdst;
}
 286:	5b                   	pop    %ebx
 287:	5e                   	pop    %esi
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    
 28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000290 <ps>:

//edit
void ps(void){
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	56                   	push   %esi
 294:	53                   	push   %ebx
	int which = 1;
 295:	bb 01 00 00 00       	mov    $0x1,%ebx
	while (n-- > 0) *dst++= *src++;
	return vdst;
}

//edit
void ps(void){
 29a:	83 ec 40             	sub    $0x40,%esp
 29d:	8d 75 dc             	lea    -0x24(%ebp),%esi
 2a0:	eb 37                	jmp    2d9 <ps+0x49>
 2a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	int which = 1;
	struct pstat pnode;
	while(1){
	if(procstat (which, &pnode))break;

	printf(1, "%d, %d, %c, %s\n",pnode.pid, pnode.ppid, pnode.state, pnode.name);
 2a8:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
	which++;
 2ac:	83 c3 01             	add    $0x1,%ebx
	int which = 1;
	struct pstat pnode;
	while(1){
	if(procstat (which, &pnode))break;

	printf(1, "%d, %d, %c, %s\n",pnode.pid, pnode.ppid, pnode.state, pnode.name);
 2af:	89 74 24 14          	mov    %esi,0x14(%esp)
 2b3:	c7 44 24 04 cd 07 00 	movl   $0x7cd,0x4(%esp)
 2ba:	00 
 2bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2c2:	89 44 24 10          	mov    %eax,0x10(%esp)
 2c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2c9:	89 44 24 0c          	mov    %eax,0xc(%esp)
 2cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2d0:	89 44 24 08          	mov    %eax,0x8(%esp)
 2d4:	e8 67 01 00 00       	call   440 <printf>
//edit
void ps(void){
	int which = 1;
	struct pstat pnode;
	while(1){
	if(procstat (which, &pnode))break;
 2d9:	89 74 24 04          	mov    %esi,0x4(%esp)
 2dd:	89 1c 24             	mov    %ebx,(%esp)
 2e0:	e8 b3 00 00 00       	call   398 <procstat>
 2e5:	85 c0                	test   %eax,%eax
 2e7:	74 bf                	je     2a8 <ps+0x18>

	printf(1, "%d, %d, %c, %s\n",pnode.pid, pnode.ppid, pnode.state, pnode.name);
	which++;
	}
}
 2e9:	83 c4 40             	add    $0x40,%esp
 2ec:	5b                   	pop    %ebx
 2ed:	5e                   	pop    %esi
 2ee:	5d                   	pop    %ebp
 2ef:	c3                   	ret    

000002f0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2f0:	b8 01 00 00 00       	mov    $0x1,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <exit>:
SYSCALL(exit)
 2f8:	b8 02 00 00 00       	mov    $0x2,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <wait>:
SYSCALL(wait)
 300:	b8 03 00 00 00       	mov    $0x3,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <pipe>:
SYSCALL(pipe)
 308:	b8 04 00 00 00       	mov    $0x4,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <read>:
SYSCALL(read)
 310:	b8 05 00 00 00       	mov    $0x5,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <write>:
SYSCALL(write)
 318:	b8 10 00 00 00       	mov    $0x10,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <close>:
SYSCALL(close)
 320:	b8 15 00 00 00       	mov    $0x15,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <kill>:
SYSCALL(kill)
 328:	b8 06 00 00 00       	mov    $0x6,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <exec>:
SYSCALL(exec)
 330:	b8 07 00 00 00       	mov    $0x7,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <open>:
SYSCALL(open)
 338:	b8 0f 00 00 00       	mov    $0xf,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <mknod>:
SYSCALL(mknod)
 340:	b8 11 00 00 00       	mov    $0x11,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <unlink>:
SYSCALL(unlink)
 348:	b8 12 00 00 00       	mov    $0x12,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <fstat>:
SYSCALL(fstat)
 350:	b8 08 00 00 00       	mov    $0x8,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <link>:
SYSCALL(link)
 358:	b8 13 00 00 00       	mov    $0x13,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <mkdir>:
SYSCALL(mkdir)
 360:	b8 14 00 00 00       	mov    $0x14,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <chdir>:
SYSCALL(chdir)
 368:	b8 09 00 00 00       	mov    $0x9,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <dup>:
SYSCALL(dup)
 370:	b8 0a 00 00 00       	mov    $0xa,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <getpid>:
SYSCALL(getpid)
 378:	b8 0b 00 00 00       	mov    $0xb,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <sbrk>:
SYSCALL(sbrk)
 380:	b8 0c 00 00 00       	mov    $0xc,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <sleep>:
SYSCALL(sleep)
 388:	b8 0d 00 00 00       	mov    $0xd,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <uptime>:
SYSCALL(uptime)
 390:	b8 0e 00 00 00       	mov    $0xe,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <procstat>:
SYSCALL(procstat)
 398:	b8 16 00 00 00       	mov    $0x16,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	56                   	push   %esi
 3a5:	89 c6                	mov    %eax,%esi
 3a7:	53                   	push   %ebx
 3a8:	83 ec 4c             	sub    $0x4c,%esp
	char        buf[16];
	int         i, neg;
	uint        x;

	neg = 0;
	if (sgn && xx < 0) {
 3ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3ae:	85 db                	test   %ebx,%ebx
 3b0:	74 09                	je     3bb <printint+0x1b>
 3b2:	89 d0                	mov    %edx,%eax
 3b4:	c1 e8 1f             	shr    $0x1f,%eax
 3b7:	84 c0                	test   %al,%al
 3b9:	75 75                	jne    430 <printint+0x90>
		neg = 1;
		x   = -xx;
	} else {
		x = xx;
 3bb:	89 d0                	mov    %edx,%eax
	static char digits[] = "0123456789ABCDEF";
	char        buf[16];
	int         i, neg;
	uint        x;

	neg = 0;
 3bd:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 3c4:	89 75 c0             	mov    %esi,-0x40(%ebp)
		x   = -xx;
	} else {
		x = xx;
	}

	i = 0;
 3c7:	31 ff                	xor    %edi,%edi
 3c9:	89 ce                	mov    %ecx,%esi
 3cb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3ce:	eb 02                	jmp    3d2 <printint+0x32>
	do {
		buf[i++] = digits[x % base];
 3d0:	89 cf                	mov    %ecx,%edi
 3d2:	31 d2                	xor    %edx,%edx
 3d4:	f7 f6                	div    %esi
 3d6:	8d 4f 01             	lea    0x1(%edi),%ecx
 3d9:	0f b6 92 e4 07 00 00 	movzbl 0x7e4(%edx),%edx
	} while ((x /= base) != 0);
 3e0:	85 c0                	test   %eax,%eax
		x = xx;
	}

	i = 0;
	do {
		buf[i++] = digits[x % base];
 3e2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
	} while ((x /= base) != 0);
 3e5:	75 e9                	jne    3d0 <printint+0x30>
	if (neg) buf[i++] = '-';
 3e7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
		x = xx;
	}

	i = 0;
	do {
		buf[i++] = digits[x % base];
 3ea:	89 c8                	mov    %ecx,%eax
 3ec:	8b 75 c0             	mov    -0x40(%ebp),%esi
	} while ((x /= base) != 0);
	if (neg) buf[i++] = '-';
 3ef:	85 d2                	test   %edx,%edx
 3f1:	74 08                	je     3fb <printint+0x5b>
 3f3:	8d 4f 02             	lea    0x2(%edi),%ecx
 3f6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

	while (--i >= 0) putc(fd, buf[i]);
 3fb:	8d 79 ff             	lea    -0x1(%ecx),%edi
 3fe:	66 90                	xchg   %ax,%ax
 400:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 405:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 408:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 40f:	00 
 410:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 414:	89 34 24             	mov    %esi,(%esp)
 417:	88 45 d7             	mov    %al,-0x29(%ebp)
 41a:	e8 f9 fe ff ff       	call   318 <write>
	do {
		buf[i++] = digits[x % base];
	} while ((x /= base) != 0);
	if (neg) buf[i++] = '-';

	while (--i >= 0) putc(fd, buf[i]);
 41f:	83 ff ff             	cmp    $0xffffffff,%edi
 422:	75 dc                	jne    400 <printint+0x60>
}
 424:	83 c4 4c             	add    $0x4c,%esp
 427:	5b                   	pop    %ebx
 428:	5e                   	pop    %esi
 429:	5f                   	pop    %edi
 42a:	5d                   	pop    %ebp
 42b:	c3                   	ret    
 42c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	uint        x;

	neg = 0;
	if (sgn && xx < 0) {
		neg = 1;
		x   = -xx;
 430:	89 d0                	mov    %edx,%eax
 432:	f7 d8                	neg    %eax
	int         i, neg;
	uint        x;

	neg = 0;
	if (sgn && xx < 0) {
		neg = 1;
 434:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 43b:	eb 87                	jmp    3c4 <printint+0x24>
 43d:	8d 76 00             	lea    0x0(%esi),%esi

00000440 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
	char *s;
	int   c, i, state;
	uint *ap;

	state = 0;
 444:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 446:	56                   	push   %esi
 447:	53                   	push   %ebx
 448:	83 ec 3c             	sub    $0x3c,%esp
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 44b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	char *s;
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
 44e:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 451:	8b 75 08             	mov    0x8(%ebp),%esi
	char *s;
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
 454:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	for (i = 0; fmt[i]; i++) {
 457:	0f b6 13             	movzbl (%ebx),%edx
 45a:	83 c3 01             	add    $0x1,%ebx
 45d:	84 d2                	test   %dl,%dl
 45f:	75 39                	jne    49a <printf+0x5a>
 461:	e9 c2 00 00 00       	jmp    528 <printf+0xe8>
 466:	66 90                	xchg   %ax,%ax
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
 468:	83 fa 25             	cmp    $0x25,%edx
 46b:	0f 84 bf 00 00 00    	je     530 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 471:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 474:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 47b:	00 
 47c:	89 44 24 04          	mov    %eax,0x4(%esp)
 480:	89 34 24             	mov    %esi,(%esp)
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
				state = '%';
			} else {
				putc(fd, c);
 483:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 486:	e8 8d fe ff ff       	call   318 <write>
 48b:	83 c3 01             	add    $0x1,%ebx
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 48e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 492:	84 d2                	test   %dl,%dl
 494:	0f 84 8e 00 00 00    	je     528 <printf+0xe8>
		c = fmt[i] & 0xff;
		if (state == 0) {
 49a:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
		c = fmt[i] & 0xff;
 49c:	0f be c2             	movsbl %dl,%eax
		if (state == 0) {
 49f:	74 c7                	je     468 <printf+0x28>
			if (c == '%') {
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if (state == '%') {
 4a1:	83 ff 25             	cmp    $0x25,%edi
 4a4:	75 e5                	jne    48b <printf+0x4b>
			if (c == 'd') {
 4a6:	83 fa 64             	cmp    $0x64,%edx
 4a9:	0f 84 31 01 00 00    	je     5e0 <printf+0x1a0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
 4af:	25 f7 00 00 00       	and    $0xf7,%eax
 4b4:	83 f8 70             	cmp    $0x70,%eax
 4b7:	0f 84 83 00 00 00    	je     540 <printf+0x100>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if (c == 's') {
 4bd:	83 fa 73             	cmp    $0x73,%edx
 4c0:	0f 84 a2 00 00 00    	je     568 <printf+0x128>
				if (s == 0) s = "(null)";
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
 4c6:	83 fa 63             	cmp    $0x63,%edx
 4c9:	0f 84 35 01 00 00    	je     604 <printf+0x1c4>
				putc(fd, *ap);
				ap++;
			} else if (c == '%') {
 4cf:	83 fa 25             	cmp    $0x25,%edx
 4d2:	0f 84 e0 00 00 00    	je     5b8 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 4d8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4db:	83 c3 01             	add    $0x1,%ebx
 4de:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4e5:	00 
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 4e6:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 4e8:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ec:	89 34 24             	mov    %esi,(%esp)
 4ef:	89 55 d0             	mov    %edx,-0x30(%ebp)
 4f2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 4f6:	e8 1d fe ff ff       	call   318 <write>
			} else if (c == '%') {
				putc(fd, c);
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
 4fb:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 4fe:	8d 45 e7             	lea    -0x19(%ebp),%eax
 501:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 508:	00 
 509:	89 44 24 04          	mov    %eax,0x4(%esp)
 50d:	89 34 24             	mov    %esi,(%esp)
			} else if (c == '%') {
				putc(fd, c);
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
 510:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 513:	e8 00 fe ff ff       	call   318 <write>
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 518:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 51c:	84 d2                	test   %dl,%dl
 51e:	0f 85 76 ff ff ff    	jne    49a <printf+0x5a>
 524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				putc(fd, c);
			}
			state = 0;
		}
	}
}
 528:	83 c4 3c             	add    $0x3c,%esp
 52b:	5b                   	pop    %ebx
 52c:	5e                   	pop    %esi
 52d:	5f                   	pop    %edi
 52e:	5d                   	pop    %ebp
 52f:	c3                   	ret    
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
				state = '%';
 530:	bf 25 00 00 00       	mov    $0x25,%edi
 535:	e9 51 ff ff ff       	jmp    48b <printf+0x4b>
 53a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
				printint(fd, *ap, 16, 0);
 540:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 543:	b9 10 00 00 00       	mov    $0x10,%ecx
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 548:	31 ff                	xor    %edi,%edi
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
				printint(fd, *ap, 16, 0);
 54a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 551:	8b 10                	mov    (%eax),%edx
 553:	89 f0                	mov    %esi,%eax
 555:	e8 46 fe ff ff       	call   3a0 <printint>
				ap++;
 55a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 55e:	e9 28 ff ff ff       	jmp    48b <printf+0x4b>
 563:	90                   	nop
 564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			} else if (c == 's') {
				s = (char *)*ap;
 568:	8b 45 d4             	mov    -0x2c(%ebp),%eax
				ap++;
 56b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
				ap++;
			} else if (c == 'x' || c == 'p') {
				printint(fd, *ap, 16, 0);
				ap++;
			} else if (c == 's') {
				s = (char *)*ap;
 56f:	8b 38                	mov    (%eax),%edi
				ap++;
				if (s == 0) s = "(null)";
 571:	b8 dd 07 00 00       	mov    $0x7dd,%eax
 576:	85 ff                	test   %edi,%edi
 578:	0f 44 f8             	cmove  %eax,%edi
				while (*s != 0) {
 57b:	0f b6 07             	movzbl (%edi),%eax
 57e:	84 c0                	test   %al,%al
 580:	74 2a                	je     5ac <printf+0x16c>
 582:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 588:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 58b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
				s = (char *)*ap;
				ap++;
				if (s == 0) s = "(null)";
				while (*s != 0) {
					putc(fd, *s);
					s++;
 58e:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 591:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 598:	00 
 599:	89 44 24 04          	mov    %eax,0x4(%esp)
 59d:	89 34 24             	mov    %esi,(%esp)
 5a0:	e8 73 fd ff ff       	call   318 <write>
				ap++;
			} else if (c == 's') {
				s = (char *)*ap;
				ap++;
				if (s == 0) s = "(null)";
				while (*s != 0) {
 5a5:	0f b6 07             	movzbl (%edi),%eax
 5a8:	84 c0                	test   %al,%al
 5aa:	75 dc                	jne    588 <printf+0x148>
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 5ac:	31 ff                	xor    %edi,%edi
 5ae:	e9 d8 fe ff ff       	jmp    48b <printf+0x4b>
 5b3:	90                   	nop
 5b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5b8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 5bb:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5bd:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5c4:	00 
 5c5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c9:	89 34 24             	mov    %esi,(%esp)
 5cc:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 5d0:	e8 43 fd ff ff       	call   318 <write>
 5d5:	e9 b1 fe ff ff       	jmp    48b <printf+0x4b>
 5da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
 5e0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 5e8:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
 5eb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5f2:	8b 10                	mov    (%eax),%edx
 5f4:	89 f0                	mov    %esi,%eax
 5f6:	e8 a5 fd ff ff       	call   3a0 <printint>
				ap++;
 5fb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5ff:	e9 87 fe ff ff       	jmp    48b <printf+0x4b>
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
 604:	8b 45 d4             	mov    -0x2c(%ebp),%eax
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 607:	31 ff                	xor    %edi,%edi
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
 609:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 60b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 612:	00 
 613:	89 34 24             	mov    %esi,(%esp)
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
 616:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 619:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 61c:	89 44 24 04          	mov    %eax,0x4(%esp)
 620:	e8 f3 fc ff ff       	call   318 <write>
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
				ap++;
 625:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 629:	e9 5d fe ff ff       	jmp    48b <printf+0x4b>
 62e:	66 90                	xchg   %ax,%ax

00000630 <free>:
static Header  base;
static Header *freep;

void
free(void *ap)
{
 630:	55                   	push   %ebp
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 631:	a1 84 0a 00 00       	mov    0xa84,%eax
static Header  base;
static Header *freep;

void
free(void *ap)
{
 636:	89 e5                	mov    %esp,%ebp
 638:	57                   	push   %edi
 639:	56                   	push   %esi
 63a:	53                   	push   %ebx
 63b:	8b 5d 08             	mov    0x8(%ebp),%ebx
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 63e:	8b 08                	mov    (%eax),%ecx
void
free(void *ap)
{
	Header *bp, *p;

	bp = (Header *)ap - 1;
 640:	8d 53 f8             	lea    -0x8(%ebx),%edx
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 643:	39 d0                	cmp    %edx,%eax
 645:	72 11                	jb     658 <free+0x28>
 647:	90                   	nop
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 648:	39 c8                	cmp    %ecx,%eax
 64a:	72 04                	jb     650 <free+0x20>
 64c:	39 ca                	cmp    %ecx,%edx
 64e:	72 10                	jb     660 <free+0x30>
 650:	89 c8                	mov    %ecx,%eax
free(void *ap)
{
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 652:	39 d0                	cmp    %edx,%eax
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 654:	8b 08                	mov    (%eax),%ecx
free(void *ap)
{
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 656:	73 f0                	jae    648 <free+0x18>
 658:	39 ca                	cmp    %ecx,%edx
 65a:	72 04                	jb     660 <free+0x30>
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 65c:	39 c8                	cmp    %ecx,%eax
 65e:	72 f0                	jb     650 <free+0x20>
	if (bp + bp->s.size == p->s.ptr) {
 660:	8b 73 fc             	mov    -0x4(%ebx),%esi
 663:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 666:	39 cf                	cmp    %ecx,%edi
 668:	74 1e                	je     688 <free+0x58>
		bp->s.size += p->s.ptr->s.size;
		bp->s.ptr = p->s.ptr->s.ptr;
	} else
		bp->s.ptr = p->s.ptr;
 66a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
	if (p + p->s.size == bp) {
 66d:	8b 48 04             	mov    0x4(%eax),%ecx
 670:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 673:	39 f2                	cmp    %esi,%edx
 675:	74 28                	je     69f <free+0x6f>
		p->s.size += bp->s.size;
		p->s.ptr = bp->s.ptr;
	} else
		p->s.ptr = bp;
 677:	89 10                	mov    %edx,(%eax)
	freep = p;
 679:	a3 84 0a 00 00       	mov    %eax,0xa84
}
 67e:	5b                   	pop    %ebx
 67f:	5e                   	pop    %esi
 680:	5f                   	pop    %edi
 681:	5d                   	pop    %ebp
 682:	c3                   	ret    
 683:	90                   	nop
 684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
	if (bp + bp->s.size == p->s.ptr) {
		bp->s.size += p->s.ptr->s.size;
 688:	03 71 04             	add    0x4(%ecx),%esi
 68b:	89 73 fc             	mov    %esi,-0x4(%ebx)
		bp->s.ptr = p->s.ptr->s.ptr;
 68e:	8b 08                	mov    (%eax),%ecx
 690:	8b 09                	mov    (%ecx),%ecx
 692:	89 4b f8             	mov    %ecx,-0x8(%ebx)
	} else
		bp->s.ptr = p->s.ptr;
	if (p + p->s.size == bp) {
 695:	8b 48 04             	mov    0x4(%eax),%ecx
 698:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 69b:	39 f2                	cmp    %esi,%edx
 69d:	75 d8                	jne    677 <free+0x47>
		p->s.size += bp->s.size;
 69f:	03 4b fc             	add    -0x4(%ebx),%ecx
		p->s.ptr = bp->s.ptr;
	} else
		p->s.ptr = bp;
	freep = p;
 6a2:	a3 84 0a 00 00       	mov    %eax,0xa84
		bp->s.size += p->s.ptr->s.size;
		bp->s.ptr = p->s.ptr->s.ptr;
	} else
		bp->s.ptr = p->s.ptr;
	if (p + p->s.size == bp) {
		p->s.size += bp->s.size;
 6a7:	89 48 04             	mov    %ecx,0x4(%eax)
		p->s.ptr = bp->s.ptr;
 6aa:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6ad:	89 10                	mov    %edx,(%eax)
	} else
		p->s.ptr = bp;
	freep = p;
}
 6af:	5b                   	pop    %ebx
 6b0:	5e                   	pop    %esi
 6b1:	5f                   	pop    %edi
 6b2:	5d                   	pop    %ebp
 6b3:	c3                   	ret    
 6b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000006c0 <malloc>:
	return freep;
}

void *
malloc(uint nbytes)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	57                   	push   %edi
 6c4:	56                   	push   %esi
 6c5:	53                   	push   %ebx
 6c6:	83 ec 1c             	sub    $0x1c,%esp
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 6c9:	8b 45 08             	mov    0x8(%ebp),%eax
	if ((prevp = freep) == 0) {
 6cc:	8b 1d 84 0a 00 00    	mov    0xa84,%ebx
malloc(uint nbytes)
{
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 6d2:	8d 48 07             	lea    0x7(%eax),%ecx
 6d5:	c1 e9 03             	shr    $0x3,%ecx
	if ((prevp = freep) == 0) {
 6d8:	85 db                	test   %ebx,%ebx
malloc(uint nbytes)
{
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 6da:	8d 71 01             	lea    0x1(%ecx),%esi
	if ((prevp = freep) == 0) {
 6dd:	0f 84 9b 00 00 00    	je     77e <malloc+0xbe>
 6e3:	8b 13                	mov    (%ebx),%edx
 6e5:	8b 7a 04             	mov    0x4(%edx),%edi
		base.s.ptr = freep = prevp = &base;
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
		if (p->s.size >= nunits) {
 6e8:	39 fe                	cmp    %edi,%esi
 6ea:	76 64                	jbe    750 <malloc+0x90>
 6ec:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
morecore(uint nu)
{
	char *  p;
	Header *hp;

	if (nu < 4096) nu = 4096;
 6f3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 6f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6fb:	eb 0e                	jmp    70b <malloc+0x4b>
 6fd:	8d 76 00             	lea    0x0(%esi),%esi
	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
 700:	8b 02                	mov    (%edx),%eax
		if (p->s.size >= nunits) {
 702:	8b 78 04             	mov    0x4(%eax),%edi
 705:	39 fe                	cmp    %edi,%esi
 707:	76 4f                	jbe    758 <malloc+0x98>
 709:	89 c2                	mov    %eax,%edx
				p->s.size = nunits;
			}
			freep = prevp;
			return (void *)(p + 1);
		}
		if (p == freep)
 70b:	3b 15 84 0a 00 00    	cmp    0xa84,%edx
 711:	75 ed                	jne    700 <malloc+0x40>
morecore(uint nu)
{
	char *  p;
	Header *hp;

	if (nu < 4096) nu = 4096;
 713:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 716:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 71c:	bf 00 10 00 00       	mov    $0x1000,%edi
 721:	0f 43 fe             	cmovae %esi,%edi
 724:	0f 42 c3             	cmovb  %ebx,%eax
	p = sbrk(nu * sizeof(Header));
 727:	89 04 24             	mov    %eax,(%esp)
 72a:	e8 51 fc ff ff       	call   380 <sbrk>
	if (p == (char *)-1) return 0;
 72f:	83 f8 ff             	cmp    $0xffffffff,%eax
 732:	74 18                	je     74c <malloc+0x8c>
	hp         = (Header *)p;
	hp->s.size = nu;
 734:	89 78 04             	mov    %edi,0x4(%eax)
	free((void *)(hp + 1));
 737:	83 c0 08             	add    $0x8,%eax
 73a:	89 04 24             	mov    %eax,(%esp)
 73d:	e8 ee fe ff ff       	call   630 <free>
	return freep;
 742:	8b 15 84 0a 00 00    	mov    0xa84,%edx
			}
			freep = prevp;
			return (void *)(p + 1);
		}
		if (p == freep)
			if ((p = morecore(nunits)) == 0) return 0;
 748:	85 d2                	test   %edx,%edx
 74a:	75 b4                	jne    700 <malloc+0x40>
 74c:	31 c0                	xor    %eax,%eax
 74e:	eb 20                	jmp    770 <malloc+0xb0>
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
		if (p->s.size >= nunits) {
 750:	89 d0                	mov    %edx,%eax
 752:	89 da                	mov    %ebx,%edx
 754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			if (p->s.size == nunits)
 758:	39 fe                	cmp    %edi,%esi
 75a:	74 1c                	je     778 <malloc+0xb8>
				prevp->s.ptr = p->s.ptr;
			else {
				p->s.size -= nunits;
 75c:	29 f7                	sub    %esi,%edi
 75e:	89 78 04             	mov    %edi,0x4(%eax)
				p += p->s.size;
 761:	8d 04 f8             	lea    (%eax,%edi,8),%eax
				p->s.size = nunits;
 764:	89 70 04             	mov    %esi,0x4(%eax)
			}
			freep = prevp;
 767:	89 15 84 0a 00 00    	mov    %edx,0xa84
			return (void *)(p + 1);
 76d:	83 c0 08             	add    $0x8,%eax
		}
		if (p == freep)
			if ((p = morecore(nunits)) == 0) return 0;
	}
}
 770:	83 c4 1c             	add    $0x1c,%esp
 773:	5b                   	pop    %ebx
 774:	5e                   	pop    %esi
 775:	5f                   	pop    %edi
 776:	5d                   	pop    %ebp
 777:	c3                   	ret    
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
		if (p->s.size >= nunits) {
			if (p->s.size == nunits)
				prevp->s.ptr = p->s.ptr;
 778:	8b 08                	mov    (%eax),%ecx
 77a:	89 0a                	mov    %ecx,(%edx)
 77c:	eb e9                	jmp    767 <malloc+0xa7>
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
 77e:	c7 05 84 0a 00 00 88 	movl   $0xa88,0xa84
 785:	0a 00 00 
		base.s.size                = 0;
 788:	ba 88 0a 00 00       	mov    $0xa88,%edx
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
 78d:	c7 05 88 0a 00 00 88 	movl   $0xa88,0xa88
 794:	0a 00 00 
		base.s.size                = 0;
 797:	c7 05 8c 0a 00 00 00 	movl   $0x0,0xa8c
 79e:	00 00 00 
 7a1:	e9 46 ff ff ff       	jmp    6ec <malloc+0x2c>
