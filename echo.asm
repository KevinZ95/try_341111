
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

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
   c:	8b 75 08             	mov    0x8(%ebp),%esi
   f:	8b 7d 0c             	mov    0xc(%ebp),%edi
	int i;

	for (i = 1; i < argc; i++) printf(1, "%s%s", argv[i], i + 1 < argc ? " " : "\n");
  12:	83 fe 01             	cmp    $0x1,%esi
  15:	7e 58                	jle    6f <main+0x6f>
  17:	bb 01 00 00 00       	mov    $0x1,%ebx
  1c:	eb 26                	jmp    44 <main+0x44>
  1e:	66 90                	xchg   %ax,%ax
  20:	c7 44 24 0c b6 07 00 	movl   $0x7b6,0xc(%esp)
  27:	00 
  28:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
  2c:	c7 44 24 04 b8 07 00 	movl   $0x7b8,0x4(%esp)
  33:	00 
  34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3b:	89 44 24 08          	mov    %eax,0x8(%esp)
  3f:	e8 0c 04 00 00       	call   450 <printf>
  44:	83 c3 01             	add    $0x1,%ebx
  47:	39 f3                	cmp    %esi,%ebx
  49:	75 d5                	jne    20 <main+0x20>
  4b:	c7 44 24 0c cb 07 00 	movl   $0x7cb,0xc(%esp)
  52:	00 
  53:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
  57:	c7 44 24 04 b8 07 00 	movl   $0x7b8,0x4(%esp)
  5e:	00 
  5f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  66:	89 44 24 08          	mov    %eax,0x8(%esp)
  6a:	e8 e1 03 00 00       	call   450 <printf>
	exit();
  6f:	e8 94 02 00 00       	call   308 <exit>
  74:	66 90                	xchg   %ax,%ax
  76:	66 90                	xchg   %ax,%ax
  78:	66 90                	xchg   %ax,%ax
  7a:	66 90                	xchg   %ax,%ax
  7c:	66 90                	xchg   %ax,%ax
  7e:	66 90                	xchg   %ax,%ax

00000080 <strcpy>:
#include "pstat.h"//include


char *
strcpy(char *s, char *t)
{
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	8b 45 08             	mov    0x8(%ebp),%eax
  86:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  89:	53                   	push   %ebx
	char *os;

	os = s;
	while ((*s++ = *t++) != 0)
  8a:	89 c2                	mov    %eax,%edx
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  90:	83 c1 01             	add    $0x1,%ecx
  93:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  97:	83 c2 01             	add    $0x1,%edx
  9a:	84 db                	test   %bl,%bl
  9c:	88 5a ff             	mov    %bl,-0x1(%edx)
  9f:	75 ef                	jne    90 <strcpy+0x10>
		;
	return os;
}
  a1:	5b                   	pop    %ebx
  a2:	5d                   	pop    %ebp
  a3:	c3                   	ret    
  a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	8b 55 08             	mov    0x8(%ebp),%edx
  b6:	53                   	push   %ebx
  b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
	while (*p && *p == *q) p++, q++;
  ba:	0f b6 02             	movzbl (%edx),%eax
  bd:	84 c0                	test   %al,%al
  bf:	74 2d                	je     ee <strcmp+0x3e>
  c1:	0f b6 19             	movzbl (%ecx),%ebx
  c4:	38 d8                	cmp    %bl,%al
  c6:	74 0e                	je     d6 <strcmp+0x26>
  c8:	eb 2b                	jmp    f5 <strcmp+0x45>
  ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  d0:	38 c8                	cmp    %cl,%al
  d2:	75 15                	jne    e9 <strcmp+0x39>
  d4:	89 d9                	mov    %ebx,%ecx
  d6:	83 c2 01             	add    $0x1,%edx
  d9:	0f b6 02             	movzbl (%edx),%eax
  dc:	8d 59 01             	lea    0x1(%ecx),%ebx
  df:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
  e3:	84 c0                	test   %al,%al
  e5:	75 e9                	jne    d0 <strcmp+0x20>
  e7:	31 c0                	xor    %eax,%eax
	return (uchar)*p - (uchar)*q;
  e9:	29 c8                	sub    %ecx,%eax
}
  eb:	5b                   	pop    %ebx
  ec:	5d                   	pop    %ebp
  ed:	c3                   	ret    
  ee:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q) p++, q++;
  f1:	31 c0                	xor    %eax,%eax
  f3:	eb f4                	jmp    e9 <strcmp+0x39>
  f5:	0f b6 cb             	movzbl %bl,%ecx
  f8:	eb ef                	jmp    e9 <strcmp+0x39>
  fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000100 <strlen>:
	return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int n;

	for (n = 0; s[n]; n++)
 106:	80 39 00             	cmpb   $0x0,(%ecx)
 109:	74 12                	je     11d <strlen+0x1d>
 10b:	31 d2                	xor    %edx,%edx
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	83 c2 01             	add    $0x1,%edx
 113:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 117:	89 d0                	mov    %edx,%eax
 119:	75 f5                	jne    110 <strlen+0x10>
		;
	return n;
}
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    
uint
strlen(char *s)
{
	int n;

	for (n = 0; s[n]; n++)
 11d:	31 c0                	xor    %eax,%eax
		;
	return n;
}
 11f:	5d                   	pop    %ebp
 120:	c3                   	ret    
 121:	eb 0d                	jmp    130 <memset>
 123:	90                   	nop
 124:	90                   	nop
 125:	90                   	nop
 126:	90                   	nop
 127:	90                   	nop
 128:	90                   	nop
 129:	90                   	nop
 12a:	90                   	nop
 12b:	90                   	nop
 12c:	90                   	nop
 12d:	90                   	nop
 12e:	90                   	nop
 12f:	90                   	nop

00000130 <memset>:

void *
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 55 08             	mov    0x8(%ebp),%edx
 136:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
	asm volatile("cld; rep stosb" : "=D"(addr), "=c"(cnt) : "0"(addr), "1"(cnt), "a"(data) : "memory", "cc");
 137:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13a:	8b 45 0c             	mov    0xc(%ebp),%eax
 13d:	89 d7                	mov    %edx,%edi
 13f:	fc                   	cld    
 140:	f3 aa                	rep stos %al,%es:(%edi)
	stosb(dst, c, n);
	return dst;
}
 142:	89 d0                	mov    %edx,%eax
 144:	5f                   	pop    %edi
 145:	5d                   	pop    %ebp
 146:	c3                   	ret    
 147:	89 f6                	mov    %esi,%esi
 149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000150 <strchr>:

char *
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 45 08             	mov    0x8(%ebp),%eax
 156:	53                   	push   %ebx
 157:	8b 55 0c             	mov    0xc(%ebp),%edx
	for (; *s; s++)
 15a:	0f b6 18             	movzbl (%eax),%ebx
 15d:	84 db                	test   %bl,%bl
 15f:	74 1d                	je     17e <strchr+0x2e>
		if (*s == c) return (char *)s;
 161:	38 d3                	cmp    %dl,%bl
 163:	89 d1                	mov    %edx,%ecx
 165:	75 0d                	jne    174 <strchr+0x24>
 167:	eb 17                	jmp    180 <strchr+0x30>
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 170:	38 ca                	cmp    %cl,%dl
 172:	74 0c                	je     180 <strchr+0x30>
}

char *
strchr(const char *s, char c)
{
	for (; *s; s++)
 174:	83 c0 01             	add    $0x1,%eax
 177:	0f b6 10             	movzbl (%eax),%edx
 17a:	84 d2                	test   %dl,%dl
 17c:	75 f2                	jne    170 <strchr+0x20>
		if (*s == c) return (char *)s;
	return 0;
 17e:	31 c0                	xor    %eax,%eax
}
 180:	5b                   	pop    %ebx
 181:	5d                   	pop    %ebp
 182:	c3                   	ret    
 183:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <gets>:

char *
gets(char *buf, int max)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 195:	31 f6                	xor    %esi,%esi
	return 0;
}

char *
gets(char *buf, int max)
{
 197:	53                   	push   %ebx
 198:	83 ec 2c             	sub    $0x2c,%esp
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
		cc = read(0, &c, 1);
 19b:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 19e:	eb 31                	jmp    1d1 <gets+0x41>
		cc = read(0, &c, 1);
 1a0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1a7:	00 
 1a8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 1ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1b3:	e8 68 01 00 00       	call   320 <read>
		if (cc < 1) break;
 1b8:	85 c0                	test   %eax,%eax
 1ba:	7e 1d                	jle    1d9 <gets+0x49>
		buf[i++] = c;
 1bc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 1c0:	89 de                	mov    %ebx,%esi
		cc = read(0, &c, 1);
		if (cc < 1) break;
		buf[i++] = c;
 1c2:	8b 55 08             	mov    0x8(%ebp),%edx
		if (c == '\n' || c == '\r') break;
 1c5:	3c 0d                	cmp    $0xd,%al
	char c;

	for (i = 0; i + 1 < max;) {
		cc = read(0, &c, 1);
		if (cc < 1) break;
		buf[i++] = c;
 1c7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
		if (c == '\n' || c == '\r') break;
 1cb:	74 0c                	je     1d9 <gets+0x49>
 1cd:	3c 0a                	cmp    $0xa,%al
 1cf:	74 08                	je     1d9 <gets+0x49>
gets(char *buf, int max)
{
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 1d1:	8d 5e 01             	lea    0x1(%esi),%ebx
 1d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1d7:	7c c7                	jl     1a0 <gets+0x10>
		cc = read(0, &c, 1);
		if (cc < 1) break;
		buf[i++] = c;
		if (c == '\n' || c == '\r') break;
	}
	buf[i] = '\0';
 1d9:	8b 45 08             	mov    0x8(%ebp),%eax
 1dc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
	return buf;
}
 1e0:	83 c4 2c             	add    $0x2c,%esp
 1e3:	5b                   	pop    %ebx
 1e4:	5e                   	pop    %esi
 1e5:	5f                   	pop    %edi
 1e6:	5d                   	pop    %ebp
 1e7:	c3                   	ret    
 1e8:	90                   	nop
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001f0 <stat>:

int
stat(char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
 1f5:	83 ec 10             	sub    $0x10,%esp
	int fd;
	int r;

	fd = open(n, O_RDONLY);
 1f8:	8b 45 08             	mov    0x8(%ebp),%eax
 1fb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 202:	00 
 203:	89 04 24             	mov    %eax,(%esp)
 206:	e8 3d 01 00 00       	call   348 <open>
	if (fd < 0) return -1;
 20b:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
	int fd;
	int r;

	fd = open(n, O_RDONLY);
 20d:	89 c3                	mov    %eax,%ebx
	if (fd < 0) return -1;
 20f:	78 27                	js     238 <stat+0x48>
	r = fstat(fd, st);
 211:	8b 45 0c             	mov    0xc(%ebp),%eax
 214:	89 1c 24             	mov    %ebx,(%esp)
 217:	89 44 24 04          	mov    %eax,0x4(%esp)
 21b:	e8 40 01 00 00       	call   360 <fstat>
	close(fd);
 220:	89 1c 24             	mov    %ebx,(%esp)
	int fd;
	int r;

	fd = open(n, O_RDONLY);
	if (fd < 0) return -1;
	r = fstat(fd, st);
 223:	89 c6                	mov    %eax,%esi
	close(fd);
 225:	e8 06 01 00 00       	call   330 <close>
	return r;
 22a:	89 f0                	mov    %esi,%eax
}
 22c:	83 c4 10             	add    $0x10,%esp
 22f:	5b                   	pop    %ebx
 230:	5e                   	pop    %esi
 231:	5d                   	pop    %ebp
 232:	c3                   	ret    
 233:	90                   	nop
 234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
	int fd;
	int r;

	fd = open(n, O_RDONLY);
	if (fd < 0) return -1;
 238:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 23d:	eb ed                	jmp    22c <stat+0x3c>
 23f:	90                   	nop

00000240 <atoi>:
	return r;
}

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 4d 08             	mov    0x8(%ebp),%ecx
 246:	53                   	push   %ebx
	int n;

	n = 0;
	while ('0' <= *s && *s <= '9') n= n * 10 + *s++ - '0';
 247:	0f be 11             	movsbl (%ecx),%edx
 24a:	8d 42 d0             	lea    -0x30(%edx),%eax
 24d:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
	int n;

	n = 0;
 24f:	b8 00 00 00 00       	mov    $0x0,%eax
	while ('0' <= *s && *s <= '9') n= n * 10 + *s++ - '0';
 254:	77 17                	ja     26d <atoi+0x2d>
 256:	66 90                	xchg   %ax,%ax
 258:	83 c1 01             	add    $0x1,%ecx
 25b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 25e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 262:	0f be 11             	movsbl (%ecx),%edx
 265:	8d 5a d0             	lea    -0x30(%edx),%ebx
 268:	80 fb 09             	cmp    $0x9,%bl
 26b:	76 eb                	jbe    258 <atoi+0x18>
	return n;
}
 26d:	5b                   	pop    %ebx
 26e:	5d                   	pop    %ebp
 26f:	c3                   	ret    

00000270 <memmove>:

void *
memmove(void *vdst, void *vsrc, int n)
{
 270:	55                   	push   %ebp
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0) *dst++= *src++;
 271:	31 d2                	xor    %edx,%edx
	return n;
}

void *
memmove(void *vdst, void *vsrc, int n)
{
 273:	89 e5                	mov    %esp,%ebp
 275:	56                   	push   %esi
 276:	8b 45 08             	mov    0x8(%ebp),%eax
 279:	53                   	push   %ebx
 27a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 27d:	8b 75 0c             	mov    0xc(%ebp),%esi
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0) *dst++= *src++;
 280:	85 db                	test   %ebx,%ebx
 282:	7e 12                	jle    296 <memmove+0x26>
 284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 288:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 28c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 28f:	83 c2 01             	add    $0x1,%edx
 292:	39 da                	cmp    %ebx,%edx
 294:	75 f2                	jne    288 <memmove+0x18>
	return vdst;
}
 296:	5b                   	pop    %ebx
 297:	5e                   	pop    %esi
 298:	5d                   	pop    %ebp
 299:	c3                   	ret    
 29a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002a0 <ps>:

//edit
void ps(void){
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	53                   	push   %ebx
	int which = 1;
 2a5:	bb 01 00 00 00       	mov    $0x1,%ebx
	while (n-- > 0) *dst++= *src++;
	return vdst;
}

//edit
void ps(void){
 2aa:	83 ec 40             	sub    $0x40,%esp
 2ad:	8d 75 dc             	lea    -0x24(%ebp),%esi
 2b0:	eb 37                	jmp    2e9 <ps+0x49>
 2b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	int which = 1;
	struct pstat pnode;
	while(1){
	if(procstat (which, &pnode))break;

	printf(1, "%d, %d, %c, %s\n",pnode.pid, pnode.ppid, pnode.state, pnode.name);
 2b8:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
	which++;
 2bc:	83 c3 01             	add    $0x1,%ebx
	int which = 1;
	struct pstat pnode;
	while(1){
	if(procstat (which, &pnode))break;

	printf(1, "%d, %d, %c, %s\n",pnode.pid, pnode.ppid, pnode.state, pnode.name);
 2bf:	89 74 24 14          	mov    %esi,0x14(%esp)
 2c3:	c7 44 24 04 bd 07 00 	movl   $0x7bd,0x4(%esp)
 2ca:	00 
 2cb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2d2:	89 44 24 10          	mov    %eax,0x10(%esp)
 2d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d9:	89 44 24 0c          	mov    %eax,0xc(%esp)
 2dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2e0:	89 44 24 08          	mov    %eax,0x8(%esp)
 2e4:	e8 67 01 00 00       	call   450 <printf>
//edit
void ps(void){
	int which = 1;
	struct pstat pnode;
	while(1){
	if(procstat (which, &pnode))break;
 2e9:	89 74 24 04          	mov    %esi,0x4(%esp)
 2ed:	89 1c 24             	mov    %ebx,(%esp)
 2f0:	e8 b3 00 00 00       	call   3a8 <procstat>
 2f5:	85 c0                	test   %eax,%eax
 2f7:	74 bf                	je     2b8 <ps+0x18>

	printf(1, "%d, %d, %c, %s\n",pnode.pid, pnode.ppid, pnode.state, pnode.name);
	which++;
	}
}
 2f9:	83 c4 40             	add    $0x40,%esp
 2fc:	5b                   	pop    %ebx
 2fd:	5e                   	pop    %esi
 2fe:	5d                   	pop    %ebp
 2ff:	c3                   	ret    

00000300 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 300:	b8 01 00 00 00       	mov    $0x1,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <exit>:
SYSCALL(exit)
 308:	b8 02 00 00 00       	mov    $0x2,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <wait>:
SYSCALL(wait)
 310:	b8 03 00 00 00       	mov    $0x3,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <pipe>:
SYSCALL(pipe)
 318:	b8 04 00 00 00       	mov    $0x4,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <read>:
SYSCALL(read)
 320:	b8 05 00 00 00       	mov    $0x5,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <write>:
SYSCALL(write)
 328:	b8 10 00 00 00       	mov    $0x10,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <close>:
SYSCALL(close)
 330:	b8 15 00 00 00       	mov    $0x15,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <kill>:
SYSCALL(kill)
 338:	b8 06 00 00 00       	mov    $0x6,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <exec>:
SYSCALL(exec)
 340:	b8 07 00 00 00       	mov    $0x7,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <open>:
SYSCALL(open)
 348:	b8 0f 00 00 00       	mov    $0xf,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <mknod>:
SYSCALL(mknod)
 350:	b8 11 00 00 00       	mov    $0x11,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <unlink>:
SYSCALL(unlink)
 358:	b8 12 00 00 00       	mov    $0x12,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <fstat>:
SYSCALL(fstat)
 360:	b8 08 00 00 00       	mov    $0x8,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <link>:
SYSCALL(link)
 368:	b8 13 00 00 00       	mov    $0x13,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <mkdir>:
SYSCALL(mkdir)
 370:	b8 14 00 00 00       	mov    $0x14,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <chdir>:
SYSCALL(chdir)
 378:	b8 09 00 00 00       	mov    $0x9,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <dup>:
SYSCALL(dup)
 380:	b8 0a 00 00 00       	mov    $0xa,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <getpid>:
SYSCALL(getpid)
 388:	b8 0b 00 00 00       	mov    $0xb,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <sbrk>:
SYSCALL(sbrk)
 390:	b8 0c 00 00 00       	mov    $0xc,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <sleep>:
SYSCALL(sleep)
 398:	b8 0d 00 00 00       	mov    $0xd,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <uptime>:
SYSCALL(uptime)
 3a0:	b8 0e 00 00 00       	mov    $0xe,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <procstat>:
SYSCALL(procstat)
 3a8:	b8 16 00 00 00       	mov    $0x16,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	56                   	push   %esi
 3b5:	89 c6                	mov    %eax,%esi
 3b7:	53                   	push   %ebx
 3b8:	83 ec 4c             	sub    $0x4c,%esp
	char        buf[16];
	int         i, neg;
	uint        x;

	neg = 0;
	if (sgn && xx < 0) {
 3bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3be:	85 db                	test   %ebx,%ebx
 3c0:	74 09                	je     3cb <printint+0x1b>
 3c2:	89 d0                	mov    %edx,%eax
 3c4:	c1 e8 1f             	shr    $0x1f,%eax
 3c7:	84 c0                	test   %al,%al
 3c9:	75 75                	jne    440 <printint+0x90>
		neg = 1;
		x   = -xx;
	} else {
		x = xx;
 3cb:	89 d0                	mov    %edx,%eax
	static char digits[] = "0123456789ABCDEF";
	char        buf[16];
	int         i, neg;
	uint        x;

	neg = 0;
 3cd:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 3d4:	89 75 c0             	mov    %esi,-0x40(%ebp)
		x   = -xx;
	} else {
		x = xx;
	}

	i = 0;
 3d7:	31 ff                	xor    %edi,%edi
 3d9:	89 ce                	mov    %ecx,%esi
 3db:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3de:	eb 02                	jmp    3e2 <printint+0x32>
	do {
		buf[i++] = digits[x % base];
 3e0:	89 cf                	mov    %ecx,%edi
 3e2:	31 d2                	xor    %edx,%edx
 3e4:	f7 f6                	div    %esi
 3e6:	8d 4f 01             	lea    0x1(%edi),%ecx
 3e9:	0f b6 92 d4 07 00 00 	movzbl 0x7d4(%edx),%edx
	} while ((x /= base) != 0);
 3f0:	85 c0                	test   %eax,%eax
		x = xx;
	}

	i = 0;
	do {
		buf[i++] = digits[x % base];
 3f2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
	} while ((x /= base) != 0);
 3f5:	75 e9                	jne    3e0 <printint+0x30>
	if (neg) buf[i++] = '-';
 3f7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
		x = xx;
	}

	i = 0;
	do {
		buf[i++] = digits[x % base];
 3fa:	89 c8                	mov    %ecx,%eax
 3fc:	8b 75 c0             	mov    -0x40(%ebp),%esi
	} while ((x /= base) != 0);
	if (neg) buf[i++] = '-';
 3ff:	85 d2                	test   %edx,%edx
 401:	74 08                	je     40b <printint+0x5b>
 403:	8d 4f 02             	lea    0x2(%edi),%ecx
 406:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

	while (--i >= 0) putc(fd, buf[i]);
 40b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 40e:	66 90                	xchg   %ax,%ax
 410:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 415:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 418:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 41f:	00 
 420:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 424:	89 34 24             	mov    %esi,(%esp)
 427:	88 45 d7             	mov    %al,-0x29(%ebp)
 42a:	e8 f9 fe ff ff       	call   328 <write>
	do {
		buf[i++] = digits[x % base];
	} while ((x /= base) != 0);
	if (neg) buf[i++] = '-';

	while (--i >= 0) putc(fd, buf[i]);
 42f:	83 ff ff             	cmp    $0xffffffff,%edi
 432:	75 dc                	jne    410 <printint+0x60>
}
 434:	83 c4 4c             	add    $0x4c,%esp
 437:	5b                   	pop    %ebx
 438:	5e                   	pop    %esi
 439:	5f                   	pop    %edi
 43a:	5d                   	pop    %ebp
 43b:	c3                   	ret    
 43c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	uint        x;

	neg = 0;
	if (sgn && xx < 0) {
		neg = 1;
		x   = -xx;
 440:	89 d0                	mov    %edx,%eax
 442:	f7 d8                	neg    %eax
	int         i, neg;
	uint        x;

	neg = 0;
	if (sgn && xx < 0) {
		neg = 1;
 444:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 44b:	eb 87                	jmp    3d4 <printint+0x24>
 44d:	8d 76 00             	lea    0x0(%esi),%esi

00000450 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
	char *s;
	int   c, i, state;
	uint *ap;

	state = 0;
 454:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 456:	56                   	push   %esi
 457:	53                   	push   %ebx
 458:	83 ec 3c             	sub    $0x3c,%esp
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 45b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	char *s;
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
 45e:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 461:	8b 75 08             	mov    0x8(%ebp),%esi
	char *s;
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
 464:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	for (i = 0; fmt[i]; i++) {
 467:	0f b6 13             	movzbl (%ebx),%edx
 46a:	83 c3 01             	add    $0x1,%ebx
 46d:	84 d2                	test   %dl,%dl
 46f:	75 39                	jne    4aa <printf+0x5a>
 471:	e9 c2 00 00 00       	jmp    538 <printf+0xe8>
 476:	66 90                	xchg   %ax,%ax
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
 478:	83 fa 25             	cmp    $0x25,%edx
 47b:	0f 84 bf 00 00 00    	je     540 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 481:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 484:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 48b:	00 
 48c:	89 44 24 04          	mov    %eax,0x4(%esp)
 490:	89 34 24             	mov    %esi,(%esp)
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
				state = '%';
			} else {
				putc(fd, c);
 493:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 496:	e8 8d fe ff ff       	call   328 <write>
 49b:	83 c3 01             	add    $0x1,%ebx
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 49e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 4a2:	84 d2                	test   %dl,%dl
 4a4:	0f 84 8e 00 00 00    	je     538 <printf+0xe8>
		c = fmt[i] & 0xff;
		if (state == 0) {
 4aa:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
		c = fmt[i] & 0xff;
 4ac:	0f be c2             	movsbl %dl,%eax
		if (state == 0) {
 4af:	74 c7                	je     478 <printf+0x28>
			if (c == '%') {
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if (state == '%') {
 4b1:	83 ff 25             	cmp    $0x25,%edi
 4b4:	75 e5                	jne    49b <printf+0x4b>
			if (c == 'd') {
 4b6:	83 fa 64             	cmp    $0x64,%edx
 4b9:	0f 84 31 01 00 00    	je     5f0 <printf+0x1a0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
 4bf:	25 f7 00 00 00       	and    $0xf7,%eax
 4c4:	83 f8 70             	cmp    $0x70,%eax
 4c7:	0f 84 83 00 00 00    	je     550 <printf+0x100>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if (c == 's') {
 4cd:	83 fa 73             	cmp    $0x73,%edx
 4d0:	0f 84 a2 00 00 00    	je     578 <printf+0x128>
				if (s == 0) s = "(null)";
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
 4d6:	83 fa 63             	cmp    $0x63,%edx
 4d9:	0f 84 35 01 00 00    	je     614 <printf+0x1c4>
				putc(fd, *ap);
				ap++;
			} else if (c == '%') {
 4df:	83 fa 25             	cmp    $0x25,%edx
 4e2:	0f 84 e0 00 00 00    	je     5c8 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 4e8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4eb:	83 c3 01             	add    $0x1,%ebx
 4ee:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4f5:	00 
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 4f6:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 4f8:	89 44 24 04          	mov    %eax,0x4(%esp)
 4fc:	89 34 24             	mov    %esi,(%esp)
 4ff:	89 55 d0             	mov    %edx,-0x30(%ebp)
 502:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 506:	e8 1d fe ff ff       	call   328 <write>
			} else if (c == '%') {
				putc(fd, c);
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
 50b:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 50e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 511:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 518:	00 
 519:	89 44 24 04          	mov    %eax,0x4(%esp)
 51d:	89 34 24             	mov    %esi,(%esp)
			} else if (c == '%') {
				putc(fd, c);
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
 520:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 523:	e8 00 fe ff ff       	call   328 <write>
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 528:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 52c:	84 d2                	test   %dl,%dl
 52e:	0f 85 76 ff ff ff    	jne    4aa <printf+0x5a>
 534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				putc(fd, c);
			}
			state = 0;
		}
	}
}
 538:	83 c4 3c             	add    $0x3c,%esp
 53b:	5b                   	pop    %ebx
 53c:	5e                   	pop    %esi
 53d:	5f                   	pop    %edi
 53e:	5d                   	pop    %ebp
 53f:	c3                   	ret    
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
				state = '%';
 540:	bf 25 00 00 00       	mov    $0x25,%edi
 545:	e9 51 ff ff ff       	jmp    49b <printf+0x4b>
 54a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
				printint(fd, *ap, 16, 0);
 550:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 553:	b9 10 00 00 00       	mov    $0x10,%ecx
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 558:	31 ff                	xor    %edi,%edi
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
				printint(fd, *ap, 16, 0);
 55a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 561:	8b 10                	mov    (%eax),%edx
 563:	89 f0                	mov    %esi,%eax
 565:	e8 46 fe ff ff       	call   3b0 <printint>
				ap++;
 56a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 56e:	e9 28 ff ff ff       	jmp    49b <printf+0x4b>
 573:	90                   	nop
 574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			} else if (c == 's') {
				s = (char *)*ap;
 578:	8b 45 d4             	mov    -0x2c(%ebp),%eax
				ap++;
 57b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
				ap++;
			} else if (c == 'x' || c == 'p') {
				printint(fd, *ap, 16, 0);
				ap++;
			} else if (c == 's') {
				s = (char *)*ap;
 57f:	8b 38                	mov    (%eax),%edi
				ap++;
				if (s == 0) s = "(null)";
 581:	b8 cd 07 00 00       	mov    $0x7cd,%eax
 586:	85 ff                	test   %edi,%edi
 588:	0f 44 f8             	cmove  %eax,%edi
				while (*s != 0) {
 58b:	0f b6 07             	movzbl (%edi),%eax
 58e:	84 c0                	test   %al,%al
 590:	74 2a                	je     5bc <printf+0x16c>
 592:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 598:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 59b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
				s = (char *)*ap;
				ap++;
				if (s == 0) s = "(null)";
				while (*s != 0) {
					putc(fd, *s);
					s++;
 59e:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5a1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5a8:	00 
 5a9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ad:	89 34 24             	mov    %esi,(%esp)
 5b0:	e8 73 fd ff ff       	call   328 <write>
				ap++;
			} else if (c == 's') {
				s = (char *)*ap;
				ap++;
				if (s == 0) s = "(null)";
				while (*s != 0) {
 5b5:	0f b6 07             	movzbl (%edi),%eax
 5b8:	84 c0                	test   %al,%al
 5ba:	75 dc                	jne    598 <printf+0x148>
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 5bc:	31 ff                	xor    %edi,%edi
 5be:	e9 d8 fe ff ff       	jmp    49b <printf+0x4b>
 5c3:	90                   	nop
 5c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5c8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 5cb:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5cd:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5d4:	00 
 5d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d9:	89 34 24             	mov    %esi,(%esp)
 5dc:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 5e0:	e8 43 fd ff ff       	call   328 <write>
 5e5:	e9 b1 fe ff ff       	jmp    49b <printf+0x4b>
 5ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
 5f0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 5f8:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
 5fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 602:	8b 10                	mov    (%eax),%edx
 604:	89 f0                	mov    %esi,%eax
 606:	e8 a5 fd ff ff       	call   3b0 <printint>
				ap++;
 60b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 60f:	e9 87 fe ff ff       	jmp    49b <printf+0x4b>
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
 614:	8b 45 d4             	mov    -0x2c(%ebp),%eax
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 617:	31 ff                	xor    %edi,%edi
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
 619:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 61b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 622:	00 
 623:	89 34 24             	mov    %esi,(%esp)
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
 626:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 629:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 62c:	89 44 24 04          	mov    %eax,0x4(%esp)
 630:	e8 f3 fc ff ff       	call   328 <write>
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
				ap++;
 635:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 639:	e9 5d fe ff ff       	jmp    49b <printf+0x4b>
 63e:	66 90                	xchg   %ax,%ax

00000640 <free>:
static Header  base;
static Header *freep;

void
free(void *ap)
{
 640:	55                   	push   %ebp
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 641:	a1 78 0a 00 00       	mov    0xa78,%eax
static Header  base;
static Header *freep;

void
free(void *ap)
{
 646:	89 e5                	mov    %esp,%ebp
 648:	57                   	push   %edi
 649:	56                   	push   %esi
 64a:	53                   	push   %ebx
 64b:	8b 5d 08             	mov    0x8(%ebp),%ebx
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 64e:	8b 08                	mov    (%eax),%ecx
void
free(void *ap)
{
	Header *bp, *p;

	bp = (Header *)ap - 1;
 650:	8d 53 f8             	lea    -0x8(%ebx),%edx
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 653:	39 d0                	cmp    %edx,%eax
 655:	72 11                	jb     668 <free+0x28>
 657:	90                   	nop
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 658:	39 c8                	cmp    %ecx,%eax
 65a:	72 04                	jb     660 <free+0x20>
 65c:	39 ca                	cmp    %ecx,%edx
 65e:	72 10                	jb     670 <free+0x30>
 660:	89 c8                	mov    %ecx,%eax
free(void *ap)
{
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 662:	39 d0                	cmp    %edx,%eax
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 664:	8b 08                	mov    (%eax),%ecx
free(void *ap)
{
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 666:	73 f0                	jae    658 <free+0x18>
 668:	39 ca                	cmp    %ecx,%edx
 66a:	72 04                	jb     670 <free+0x30>
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 66c:	39 c8                	cmp    %ecx,%eax
 66e:	72 f0                	jb     660 <free+0x20>
	if (bp + bp->s.size == p->s.ptr) {
 670:	8b 73 fc             	mov    -0x4(%ebx),%esi
 673:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 676:	39 cf                	cmp    %ecx,%edi
 678:	74 1e                	je     698 <free+0x58>
		bp->s.size += p->s.ptr->s.size;
		bp->s.ptr = p->s.ptr->s.ptr;
	} else
		bp->s.ptr = p->s.ptr;
 67a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
	if (p + p->s.size == bp) {
 67d:	8b 48 04             	mov    0x4(%eax),%ecx
 680:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 683:	39 f2                	cmp    %esi,%edx
 685:	74 28                	je     6af <free+0x6f>
		p->s.size += bp->s.size;
		p->s.ptr = bp->s.ptr;
	} else
		p->s.ptr = bp;
 687:	89 10                	mov    %edx,(%eax)
	freep = p;
 689:	a3 78 0a 00 00       	mov    %eax,0xa78
}
 68e:	5b                   	pop    %ebx
 68f:	5e                   	pop    %esi
 690:	5f                   	pop    %edi
 691:	5d                   	pop    %ebp
 692:	c3                   	ret    
 693:	90                   	nop
 694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
	if (bp + bp->s.size == p->s.ptr) {
		bp->s.size += p->s.ptr->s.size;
 698:	03 71 04             	add    0x4(%ecx),%esi
 69b:	89 73 fc             	mov    %esi,-0x4(%ebx)
		bp->s.ptr = p->s.ptr->s.ptr;
 69e:	8b 08                	mov    (%eax),%ecx
 6a0:	8b 09                	mov    (%ecx),%ecx
 6a2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
	} else
		bp->s.ptr = p->s.ptr;
	if (p + p->s.size == bp) {
 6a5:	8b 48 04             	mov    0x4(%eax),%ecx
 6a8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 6ab:	39 f2                	cmp    %esi,%edx
 6ad:	75 d8                	jne    687 <free+0x47>
		p->s.size += bp->s.size;
 6af:	03 4b fc             	add    -0x4(%ebx),%ecx
		p->s.ptr = bp->s.ptr;
	} else
		p->s.ptr = bp;
	freep = p;
 6b2:	a3 78 0a 00 00       	mov    %eax,0xa78
		bp->s.size += p->s.ptr->s.size;
		bp->s.ptr = p->s.ptr->s.ptr;
	} else
		bp->s.ptr = p->s.ptr;
	if (p + p->s.size == bp) {
		p->s.size += bp->s.size;
 6b7:	89 48 04             	mov    %ecx,0x4(%eax)
		p->s.ptr = bp->s.ptr;
 6ba:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6bd:	89 10                	mov    %edx,(%eax)
	} else
		p->s.ptr = bp;
	freep = p;
}
 6bf:	5b                   	pop    %ebx
 6c0:	5e                   	pop    %esi
 6c1:	5f                   	pop    %edi
 6c2:	5d                   	pop    %ebp
 6c3:	c3                   	ret    
 6c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000006d0 <malloc>:
	return freep;
}

void *
malloc(uint nbytes)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	53                   	push   %ebx
 6d6:	83 ec 1c             	sub    $0x1c,%esp
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 6d9:	8b 45 08             	mov    0x8(%ebp),%eax
	if ((prevp = freep) == 0) {
 6dc:	8b 1d 78 0a 00 00    	mov    0xa78,%ebx
malloc(uint nbytes)
{
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 6e2:	8d 48 07             	lea    0x7(%eax),%ecx
 6e5:	c1 e9 03             	shr    $0x3,%ecx
	if ((prevp = freep) == 0) {
 6e8:	85 db                	test   %ebx,%ebx
malloc(uint nbytes)
{
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 6ea:	8d 71 01             	lea    0x1(%ecx),%esi
	if ((prevp = freep) == 0) {
 6ed:	0f 84 9b 00 00 00    	je     78e <malloc+0xbe>
 6f3:	8b 13                	mov    (%ebx),%edx
 6f5:	8b 7a 04             	mov    0x4(%edx),%edi
		base.s.ptr = freep = prevp = &base;
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
		if (p->s.size >= nunits) {
 6f8:	39 fe                	cmp    %edi,%esi
 6fa:	76 64                	jbe    760 <malloc+0x90>
 6fc:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
morecore(uint nu)
{
	char *  p;
	Header *hp;

	if (nu < 4096) nu = 4096;
 703:	bb 00 80 00 00       	mov    $0x8000,%ebx
 708:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 70b:	eb 0e                	jmp    71b <malloc+0x4b>
 70d:	8d 76 00             	lea    0x0(%esi),%esi
	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
 710:	8b 02                	mov    (%edx),%eax
		if (p->s.size >= nunits) {
 712:	8b 78 04             	mov    0x4(%eax),%edi
 715:	39 fe                	cmp    %edi,%esi
 717:	76 4f                	jbe    768 <malloc+0x98>
 719:	89 c2                	mov    %eax,%edx
				p->s.size = nunits;
			}
			freep = prevp;
			return (void *)(p + 1);
		}
		if (p == freep)
 71b:	3b 15 78 0a 00 00    	cmp    0xa78,%edx
 721:	75 ed                	jne    710 <malloc+0x40>
morecore(uint nu)
{
	char *  p;
	Header *hp;

	if (nu < 4096) nu = 4096;
 723:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 726:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 72c:	bf 00 10 00 00       	mov    $0x1000,%edi
 731:	0f 43 fe             	cmovae %esi,%edi
 734:	0f 42 c3             	cmovb  %ebx,%eax
	p = sbrk(nu * sizeof(Header));
 737:	89 04 24             	mov    %eax,(%esp)
 73a:	e8 51 fc ff ff       	call   390 <sbrk>
	if (p == (char *)-1) return 0;
 73f:	83 f8 ff             	cmp    $0xffffffff,%eax
 742:	74 18                	je     75c <malloc+0x8c>
	hp         = (Header *)p;
	hp->s.size = nu;
 744:	89 78 04             	mov    %edi,0x4(%eax)
	free((void *)(hp + 1));
 747:	83 c0 08             	add    $0x8,%eax
 74a:	89 04 24             	mov    %eax,(%esp)
 74d:	e8 ee fe ff ff       	call   640 <free>
	return freep;
 752:	8b 15 78 0a 00 00    	mov    0xa78,%edx
			}
			freep = prevp;
			return (void *)(p + 1);
		}
		if (p == freep)
			if ((p = morecore(nunits)) == 0) return 0;
 758:	85 d2                	test   %edx,%edx
 75a:	75 b4                	jne    710 <malloc+0x40>
 75c:	31 c0                	xor    %eax,%eax
 75e:	eb 20                	jmp    780 <malloc+0xb0>
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
		if (p->s.size >= nunits) {
 760:	89 d0                	mov    %edx,%eax
 762:	89 da                	mov    %ebx,%edx
 764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			if (p->s.size == nunits)
 768:	39 fe                	cmp    %edi,%esi
 76a:	74 1c                	je     788 <malloc+0xb8>
				prevp->s.ptr = p->s.ptr;
			else {
				p->s.size -= nunits;
 76c:	29 f7                	sub    %esi,%edi
 76e:	89 78 04             	mov    %edi,0x4(%eax)
				p += p->s.size;
 771:	8d 04 f8             	lea    (%eax,%edi,8),%eax
				p->s.size = nunits;
 774:	89 70 04             	mov    %esi,0x4(%eax)
			}
			freep = prevp;
 777:	89 15 78 0a 00 00    	mov    %edx,0xa78
			return (void *)(p + 1);
 77d:	83 c0 08             	add    $0x8,%eax
		}
		if (p == freep)
			if ((p = morecore(nunits)) == 0) return 0;
	}
}
 780:	83 c4 1c             	add    $0x1c,%esp
 783:	5b                   	pop    %ebx
 784:	5e                   	pop    %esi
 785:	5f                   	pop    %edi
 786:	5d                   	pop    %ebp
 787:	c3                   	ret    
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
		if (p->s.size >= nunits) {
			if (p->s.size == nunits)
				prevp->s.ptr = p->s.ptr;
 788:	8b 08                	mov    (%eax),%ecx
 78a:	89 0a                	mov    %ecx,(%edx)
 78c:	eb e9                	jmp    777 <malloc+0xa7>
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
 78e:	c7 05 78 0a 00 00 7c 	movl   $0xa7c,0xa78
 795:	0a 00 00 
		base.s.size                = 0;
 798:	ba 7c 0a 00 00       	mov    $0xa7c,%edx
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
 79d:	c7 05 7c 0a 00 00 7c 	movl   $0xa7c,0xa7c
 7a4:	0a 00 00 
		base.s.size                = 0;
 7a7:	c7 05 80 0a 00 00 00 	movl   $0x0,0xa80
 7ae:	00 00 00 
 7b1:	e9 46 ff ff ff       	jmp    6fc <malloc+0x2c>
