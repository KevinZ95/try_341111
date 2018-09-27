
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
	close(fd);
}

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
	int i;

	if (argc < 2) {
   6:	bb 01 00 00 00       	mov    $0x1,%ebx
	close(fd);
}

int
main(int argc, char *argv[])
{
   b:	83 e4 f0             	and    $0xfffffff0,%esp
   e:	83 ec 10             	sub    $0x10,%esp
  11:	8b 75 08             	mov    0x8(%ebp),%esi
  14:	8b 7d 0c             	mov    0xc(%ebp),%edi
	int i;

	if (argc < 2) {
  17:	83 fe 01             	cmp    $0x1,%esi
  1a:	7e 1b                	jle    37 <main+0x37>
  1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		ls(".");
		exit();
	}
	for (i = 1; i < argc; i++) ls(argv[i]);
  20:	8b 04 9f             	mov    (%edi,%ebx,4),%eax
  23:	83 c3 01             	add    $0x1,%ebx
  26:	89 04 24             	mov    %eax,(%esp)
  29:	e8 c2 00 00 00       	call   f0 <ls>
  2e:	39 f3                	cmp    %esi,%ebx
  30:	75 ee                	jne    20 <main+0x20>
	exit();
  32:	e8 d1 05 00 00       	call   608 <exit>
main(int argc, char *argv[])
{
	int i;

	if (argc < 2) {
		ls(".");
  37:	c7 04 24 fe 0a 00 00 	movl   $0xafe,(%esp)
  3e:	e8 ad 00 00 00       	call   f0 <ls>
		exit();
  43:	e8 c0 05 00 00       	call   608 <exit>
  48:	66 90                	xchg   %ax,%ax
  4a:	66 90                	xchg   %ax,%ax
  4c:	66 90                	xchg   %ax,%ax
  4e:	66 90                	xchg   %ax,%ax

00000050 <fmtname>:
#include "user.h"
#include "fs.h"

char *
fmtname(char *path)
{
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	56                   	push   %esi
  54:	53                   	push   %ebx
  55:	83 ec 10             	sub    $0x10,%esp
  58:	8b 5d 08             	mov    0x8(%ebp),%ebx
	static char buf[DIRSIZ + 1];
	char *      p;

	// Find first character after last slash.
	for (p = path + strlen(path); p >= path && *p != '/'; p--)
  5b:	89 1c 24             	mov    %ebx,(%esp)
  5e:	e8 9d 03 00 00       	call   400 <strlen>
  63:	01 d8                	add    %ebx,%eax
  65:	73 10                	jae    77 <fmtname+0x27>
  67:	eb 13                	jmp    7c <fmtname+0x2c>
  69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  70:	83 e8 01             	sub    $0x1,%eax
  73:	39 c3                	cmp    %eax,%ebx
  75:	77 05                	ja     7c <fmtname+0x2c>
  77:	80 38 2f             	cmpb   $0x2f,(%eax)
  7a:	75 f4                	jne    70 <fmtname+0x20>
		;
	p++;
  7c:	8d 58 01             	lea    0x1(%eax),%ebx

	// Return blank-padded name.
	if (strlen(p) >= DIRSIZ) return p;
  7f:	89 1c 24             	mov    %ebx,(%esp)
  82:	e8 79 03 00 00       	call   400 <strlen>
  87:	83 f8 0d             	cmp    $0xd,%eax
  8a:	77 53                	ja     df <fmtname+0x8f>
	memmove(buf, p, strlen(p));
  8c:	89 1c 24             	mov    %ebx,(%esp)
  8f:	e8 6c 03 00 00       	call   400 <strlen>
  94:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  98:	c7 04 24 20 0e 00 00 	movl   $0xe20,(%esp)
  9f:	89 44 24 08          	mov    %eax,0x8(%esp)
  a3:	e8 c8 04 00 00       	call   570 <memmove>
	memset(buf + strlen(p), ' ', DIRSIZ - strlen(p));
  a8:	89 1c 24             	mov    %ebx,(%esp)
  ab:	e8 50 03 00 00       	call   400 <strlen>
  b0:	89 1c 24             	mov    %ebx,(%esp)
	return buf;
  b3:	bb 20 0e 00 00       	mov    $0xe20,%ebx
	p++;

	// Return blank-padded name.
	if (strlen(p) >= DIRSIZ) return p;
	memmove(buf, p, strlen(p));
	memset(buf + strlen(p), ' ', DIRSIZ - strlen(p));
  b8:	89 c6                	mov    %eax,%esi
  ba:	e8 41 03 00 00       	call   400 <strlen>
  bf:	ba 0e 00 00 00       	mov    $0xe,%edx
  c4:	29 f2                	sub    %esi,%edx
  c6:	89 54 24 08          	mov    %edx,0x8(%esp)
  ca:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  d1:	00 
  d2:	05 20 0e 00 00       	add    $0xe20,%eax
  d7:	89 04 24             	mov    %eax,(%esp)
  da:	e8 51 03 00 00       	call   430 <memset>
	return buf;
}
  df:	83 c4 10             	add    $0x10,%esp
  e2:	89 d8                	mov    %ebx,%eax
  e4:	5b                   	pop    %ebx
  e5:	5e                   	pop    %esi
  e6:	5d                   	pop    %ebp
  e7:	c3                   	ret    
  e8:	90                   	nop
  e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000f0 <ls>:

void
ls(char *path)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	57                   	push   %edi
  f4:	56                   	push   %esi
  f5:	53                   	push   %ebx
  f6:	81 ec 6c 02 00 00    	sub    $0x26c,%esp
  fc:	8b 7d 08             	mov    0x8(%ebp),%edi
	char          buf[512], *p;
	int           fd;
	struct dirent de;
	struct stat   st;

	if ((fd = open(path, 0)) < 0) {
  ff:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 106:	00 
 107:	89 3c 24             	mov    %edi,(%esp)
 10a:	e8 39 05 00 00       	call   648 <open>
 10f:	85 c0                	test   %eax,%eax
 111:	89 c3                	mov    %eax,%ebx
 113:	0f 88 c7 01 00 00    	js     2e0 <ls+0x1f0>
		printf(2, "ls: cannot open %s\n", path);
		return;
	}

	if (fstat(fd, &st) < 0) {
 119:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 11f:	89 74 24 04          	mov    %esi,0x4(%esp)
 123:	89 04 24             	mov    %eax,(%esp)
 126:	e8 35 05 00 00       	call   660 <fstat>
 12b:	85 c0                	test   %eax,%eax
 12d:	0f 88 f5 01 00 00    	js     328 <ls+0x238>
		printf(2, "ls: cannot stat %s\n", path);
		close(fd);
		return;
	}

	switch (st.type) {
 133:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 13a:	66 83 f8 01          	cmp    $0x1,%ax
 13e:	74 68                	je     1a8 <ls+0xb8>
 140:	66 83 f8 02          	cmp    $0x2,%ax
 144:	75 48                	jne    18e <ls+0x9e>
	case T_FILE:
		printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 146:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 14c:	89 3c 24             	mov    %edi,(%esp)
 14f:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 155:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 15b:	e8 f0 fe ff ff       	call   50 <fmtname>
 160:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 166:	89 74 24 10          	mov    %esi,0x10(%esp)
 16a:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 171:	00 
 172:	c7 44 24 04 de 0a 00 	movl   $0xade,0x4(%esp)
 179:	00 
 17a:	89 54 24 14          	mov    %edx,0x14(%esp)
 17e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 185:	89 44 24 08          	mov    %eax,0x8(%esp)
 189:	e8 c2 05 00 00       	call   750 <printf>
			}
			printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
		}
		break;
	}
	close(fd);
 18e:	89 1c 24             	mov    %ebx,(%esp)
 191:	e8 9a 04 00 00       	call   630 <close>
}
 196:	81 c4 6c 02 00 00    	add    $0x26c,%esp
 19c:	5b                   	pop    %ebx
 19d:	5e                   	pop    %esi
 19e:	5f                   	pop    %edi
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret    
 1a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	case T_FILE:
		printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
		break;

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
 1a8:	89 3c 24             	mov    %edi,(%esp)
 1ab:	e8 50 02 00 00       	call   400 <strlen>
 1b0:	83 c0 10             	add    $0x10,%eax
 1b3:	3d 00 02 00 00       	cmp    $0x200,%eax
 1b8:	0f 87 4a 01 00 00    	ja     308 <ls+0x218>
			printf(1, "ls: path too long\n");
			break;
		}
		strcpy(buf, path);
 1be:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 1c4:	89 7c 24 04          	mov    %edi,0x4(%esp)
 1c8:	8d bd c4 fd ff ff    	lea    -0x23c(%ebp),%edi
 1ce:	89 04 24             	mov    %eax,(%esp)
 1d1:	e8 aa 01 00 00       	call   380 <strcpy>
		p    = buf + strlen(buf);
 1d6:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 1dc:	89 04 24             	mov    %eax,(%esp)
 1df:	e8 1c 02 00 00       	call   400 <strlen>
 1e4:	8d 8d e8 fd ff ff    	lea    -0x218(%ebp),%ecx
 1ea:	01 c8                	add    %ecx,%eax
		*p++ = '/';
 1ec:	8d 48 01             	lea    0x1(%eax),%ecx
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
			printf(1, "ls: path too long\n");
			break;
		}
		strcpy(buf, path);
		p    = buf + strlen(buf);
 1ef:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
		*p++ = '/';
 1f5:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 1fb:	c6 00 2f             	movb   $0x2f,(%eax)
 1fe:	66 90                	xchg   %ax,%ax
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
 200:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 207:	00 
 208:	89 7c 24 04          	mov    %edi,0x4(%esp)
 20c:	89 1c 24             	mov    %ebx,(%esp)
 20f:	e8 0c 04 00 00       	call   620 <read>
 214:	83 f8 10             	cmp    $0x10,%eax
 217:	0f 85 71 ff ff ff    	jne    18e <ls+0x9e>
			if (de.inum == 0) continue;
 21d:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 224:	00 
 225:	74 d9                	je     200 <ls+0x110>
			memmove(p, de.name, DIRSIZ);
 227:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 22d:	89 44 24 04          	mov    %eax,0x4(%esp)
 231:	8b 85 a4 fd ff ff    	mov    -0x25c(%ebp),%eax
 237:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
 23e:	00 
 23f:	89 04 24             	mov    %eax,(%esp)
 242:	e8 29 03 00 00       	call   570 <memmove>
			p[DIRSIZ] = 0;
 247:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 24d:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
			if (stat(buf, &st) < 0) {
 251:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 257:	89 74 24 04          	mov    %esi,0x4(%esp)
 25b:	89 04 24             	mov    %eax,(%esp)
 25e:	e8 8d 02 00 00       	call   4f0 <stat>
 263:	85 c0                	test   %eax,%eax
 265:	0f 88 e5 00 00 00    	js     350 <ls+0x260>
				printf(1, "ls: cannot stat %s\n", buf);
				continue;
			}
			printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 26b:	0f bf 95 d4 fd ff ff 	movswl -0x22c(%ebp),%edx
 272:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 278:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
 27e:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 284:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
 28a:	89 14 24             	mov    %edx,(%esp)
 28d:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 293:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 299:	e8 b2 fd ff ff       	call   50 <fmtname>
 29e:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 2a4:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 2aa:	c7 44 24 04 de 0a 00 	movl   $0xade,0x4(%esp)
 2b1:	00 
 2b2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2b9:	89 4c 24 14          	mov    %ecx,0x14(%esp)
 2bd:	8b 8d b4 fd ff ff    	mov    -0x24c(%ebp),%ecx
 2c3:	89 54 24 0c          	mov    %edx,0xc(%esp)
 2c7:	89 44 24 08          	mov    %eax,0x8(%esp)
 2cb:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 2cf:	e8 7c 04 00 00       	call   750 <printf>
 2d4:	e9 27 ff ff ff       	jmp    200 <ls+0x110>
 2d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	int           fd;
	struct dirent de;
	struct stat   st;

	if ((fd = open(path, 0)) < 0) {
		printf(2, "ls: cannot open %s\n", path);
 2e0:	89 7c 24 08          	mov    %edi,0x8(%esp)
 2e4:	c7 44 24 04 b6 0a 00 	movl   $0xab6,0x4(%esp)
 2eb:	00 
 2ec:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 2f3:	e8 58 04 00 00       	call   750 <printf>
			printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
		}
		break;
	}
	close(fd);
}
 2f8:	81 c4 6c 02 00 00    	add    $0x26c,%esp
 2fe:	5b                   	pop    %ebx
 2ff:	5e                   	pop    %esi
 300:	5f                   	pop    %edi
 301:	5d                   	pop    %ebp
 302:	c3                   	ret    
 303:	90                   	nop
 304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
		break;

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
			printf(1, "ls: path too long\n");
 308:	c7 44 24 04 eb 0a 00 	movl   $0xaeb,0x4(%esp)
 30f:	00 
 310:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 317:	e8 34 04 00 00       	call   750 <printf>
			break;
 31c:	e9 6d fe ff ff       	jmp    18e <ls+0x9e>
 321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		printf(2, "ls: cannot open %s\n", path);
		return;
	}

	if (fstat(fd, &st) < 0) {
		printf(2, "ls: cannot stat %s\n", path);
 328:	89 7c 24 08          	mov    %edi,0x8(%esp)
 32c:	c7 44 24 04 ca 0a 00 	movl   $0xaca,0x4(%esp)
 333:	00 
 334:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 33b:	e8 10 04 00 00       	call   750 <printf>
		close(fd);
 340:	89 1c 24             	mov    %ebx,(%esp)
 343:	e8 e8 02 00 00       	call   630 <close>
		return;
 348:	e9 49 fe ff ff       	jmp    196 <ls+0xa6>
 34d:	8d 76 00             	lea    0x0(%esi),%esi
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
			if (de.inum == 0) continue;
			memmove(p, de.name, DIRSIZ);
			p[DIRSIZ] = 0;
			if (stat(buf, &st) < 0) {
				printf(1, "ls: cannot stat %s\n", buf);
 350:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 356:	89 44 24 08          	mov    %eax,0x8(%esp)
 35a:	c7 44 24 04 ca 0a 00 	movl   $0xaca,0x4(%esp)
 361:	00 
 362:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 369:	e8 e2 03 00 00       	call   750 <printf>
				continue;
 36e:	e9 8d fe ff ff       	jmp    200 <ls+0x110>
 373:	66 90                	xchg   %ax,%ax
 375:	66 90                	xchg   %ax,%ax
 377:	66 90                	xchg   %ax,%ax
 379:	66 90                	xchg   %ax,%ax
 37b:	66 90                	xchg   %ax,%ax
 37d:	66 90                	xchg   %ax,%ax
 37f:	90                   	nop

00000380 <strcpy>:
#include "pstat.h"//include


char *
strcpy(char *s, char *t)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	8b 45 08             	mov    0x8(%ebp),%eax
 386:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 389:	53                   	push   %ebx
	char *os;

	os = s;
	while ((*s++ = *t++) != 0)
 38a:	89 c2                	mov    %eax,%edx
 38c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 390:	83 c1 01             	add    $0x1,%ecx
 393:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 397:	83 c2 01             	add    $0x1,%edx
 39a:	84 db                	test   %bl,%bl
 39c:	88 5a ff             	mov    %bl,-0x1(%edx)
 39f:	75 ef                	jne    390 <strcpy+0x10>
		;
	return os;
}
 3a1:	5b                   	pop    %ebx
 3a2:	5d                   	pop    %ebp
 3a3:	c3                   	ret    
 3a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000003b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	8b 55 08             	mov    0x8(%ebp),%edx
 3b6:	53                   	push   %ebx
 3b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
	while (*p && *p == *q) p++, q++;
 3ba:	0f b6 02             	movzbl (%edx),%eax
 3bd:	84 c0                	test   %al,%al
 3bf:	74 2d                	je     3ee <strcmp+0x3e>
 3c1:	0f b6 19             	movzbl (%ecx),%ebx
 3c4:	38 d8                	cmp    %bl,%al
 3c6:	74 0e                	je     3d6 <strcmp+0x26>
 3c8:	eb 2b                	jmp    3f5 <strcmp+0x45>
 3ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3d0:	38 c8                	cmp    %cl,%al
 3d2:	75 15                	jne    3e9 <strcmp+0x39>
 3d4:	89 d9                	mov    %ebx,%ecx
 3d6:	83 c2 01             	add    $0x1,%edx
 3d9:	0f b6 02             	movzbl (%edx),%eax
 3dc:	8d 59 01             	lea    0x1(%ecx),%ebx
 3df:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 3e3:	84 c0                	test   %al,%al
 3e5:	75 e9                	jne    3d0 <strcmp+0x20>
 3e7:	31 c0                	xor    %eax,%eax
	return (uchar)*p - (uchar)*q;
 3e9:	29 c8                	sub    %ecx,%eax
}
 3eb:	5b                   	pop    %ebx
 3ec:	5d                   	pop    %ebp
 3ed:	c3                   	ret    
 3ee:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q) p++, q++;
 3f1:	31 c0                	xor    %eax,%eax
 3f3:	eb f4                	jmp    3e9 <strcmp+0x39>
 3f5:	0f b6 cb             	movzbl %bl,%ecx
 3f8:	eb ef                	jmp    3e9 <strcmp+0x39>
 3fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000400 <strlen>:
	return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int n;

	for (n = 0; s[n]; n++)
 406:	80 39 00             	cmpb   $0x0,(%ecx)
 409:	74 12                	je     41d <strlen+0x1d>
 40b:	31 d2                	xor    %edx,%edx
 40d:	8d 76 00             	lea    0x0(%esi),%esi
 410:	83 c2 01             	add    $0x1,%edx
 413:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 417:	89 d0                	mov    %edx,%eax
 419:	75 f5                	jne    410 <strlen+0x10>
		;
	return n;
}
 41b:	5d                   	pop    %ebp
 41c:	c3                   	ret    
uint
strlen(char *s)
{
	int n;

	for (n = 0; s[n]; n++)
 41d:	31 c0                	xor    %eax,%eax
		;
	return n;
}
 41f:	5d                   	pop    %ebp
 420:	c3                   	ret    
 421:	eb 0d                	jmp    430 <memset>
 423:	90                   	nop
 424:	90                   	nop
 425:	90                   	nop
 426:	90                   	nop
 427:	90                   	nop
 428:	90                   	nop
 429:	90                   	nop
 42a:	90                   	nop
 42b:	90                   	nop
 42c:	90                   	nop
 42d:	90                   	nop
 42e:	90                   	nop
 42f:	90                   	nop

00000430 <memset>:

void *
memset(void *dst, int c, uint n)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	8b 55 08             	mov    0x8(%ebp),%edx
 436:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
	asm volatile("cld; rep stosb" : "=D"(addr), "=c"(cnt) : "0"(addr), "1"(cnt), "a"(data) : "memory", "cc");
 437:	8b 4d 10             	mov    0x10(%ebp),%ecx
 43a:	8b 45 0c             	mov    0xc(%ebp),%eax
 43d:	89 d7                	mov    %edx,%edi
 43f:	fc                   	cld    
 440:	f3 aa                	rep stos %al,%es:(%edi)
	stosb(dst, c, n);
	return dst;
}
 442:	89 d0                	mov    %edx,%eax
 444:	5f                   	pop    %edi
 445:	5d                   	pop    %ebp
 446:	c3                   	ret    
 447:	89 f6                	mov    %esi,%esi
 449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000450 <strchr>:

char *
strchr(const char *s, char c)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	8b 45 08             	mov    0x8(%ebp),%eax
 456:	53                   	push   %ebx
 457:	8b 55 0c             	mov    0xc(%ebp),%edx
	for (; *s; s++)
 45a:	0f b6 18             	movzbl (%eax),%ebx
 45d:	84 db                	test   %bl,%bl
 45f:	74 1d                	je     47e <strchr+0x2e>
		if (*s == c) return (char *)s;
 461:	38 d3                	cmp    %dl,%bl
 463:	89 d1                	mov    %edx,%ecx
 465:	75 0d                	jne    474 <strchr+0x24>
 467:	eb 17                	jmp    480 <strchr+0x30>
 469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 470:	38 ca                	cmp    %cl,%dl
 472:	74 0c                	je     480 <strchr+0x30>
}

char *
strchr(const char *s, char c)
{
	for (; *s; s++)
 474:	83 c0 01             	add    $0x1,%eax
 477:	0f b6 10             	movzbl (%eax),%edx
 47a:	84 d2                	test   %dl,%dl
 47c:	75 f2                	jne    470 <strchr+0x20>
		if (*s == c) return (char *)s;
	return 0;
 47e:	31 c0                	xor    %eax,%eax
}
 480:	5b                   	pop    %ebx
 481:	5d                   	pop    %ebp
 482:	c3                   	ret    
 483:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000490 <gets>:

char *
gets(char *buf, int max)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	56                   	push   %esi
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 495:	31 f6                	xor    %esi,%esi
	return 0;
}

char *
gets(char *buf, int max)
{
 497:	53                   	push   %ebx
 498:	83 ec 2c             	sub    $0x2c,%esp
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
		cc = read(0, &c, 1);
 49b:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 49e:	eb 31                	jmp    4d1 <gets+0x41>
		cc = read(0, &c, 1);
 4a0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4a7:	00 
 4a8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 4ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 4b3:	e8 68 01 00 00       	call   620 <read>
		if (cc < 1) break;
 4b8:	85 c0                	test   %eax,%eax
 4ba:	7e 1d                	jle    4d9 <gets+0x49>
		buf[i++] = c;
 4bc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 4c0:	89 de                	mov    %ebx,%esi
		cc = read(0, &c, 1);
		if (cc < 1) break;
		buf[i++] = c;
 4c2:	8b 55 08             	mov    0x8(%ebp),%edx
		if (c == '\n' || c == '\r') break;
 4c5:	3c 0d                	cmp    $0xd,%al
	char c;

	for (i = 0; i + 1 < max;) {
		cc = read(0, &c, 1);
		if (cc < 1) break;
		buf[i++] = c;
 4c7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
		if (c == '\n' || c == '\r') break;
 4cb:	74 0c                	je     4d9 <gets+0x49>
 4cd:	3c 0a                	cmp    $0xa,%al
 4cf:	74 08                	je     4d9 <gets+0x49>
gets(char *buf, int max)
{
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 4d1:	8d 5e 01             	lea    0x1(%esi),%ebx
 4d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4d7:	7c c7                	jl     4a0 <gets+0x10>
		cc = read(0, &c, 1);
		if (cc < 1) break;
		buf[i++] = c;
		if (c == '\n' || c == '\r') break;
	}
	buf[i] = '\0';
 4d9:	8b 45 08             	mov    0x8(%ebp),%eax
 4dc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
	return buf;
}
 4e0:	83 c4 2c             	add    $0x2c,%esp
 4e3:	5b                   	pop    %ebx
 4e4:	5e                   	pop    %esi
 4e5:	5f                   	pop    %edi
 4e6:	5d                   	pop    %ebp
 4e7:	c3                   	ret    
 4e8:	90                   	nop
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004f0 <stat>:

int
stat(char *n, struct stat *st)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	56                   	push   %esi
 4f4:	53                   	push   %ebx
 4f5:	83 ec 10             	sub    $0x10,%esp
	int fd;
	int r;

	fd = open(n, O_RDONLY);
 4f8:	8b 45 08             	mov    0x8(%ebp),%eax
 4fb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 502:	00 
 503:	89 04 24             	mov    %eax,(%esp)
 506:	e8 3d 01 00 00       	call   648 <open>
	if (fd < 0) return -1;
 50b:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
	int fd;
	int r;

	fd = open(n, O_RDONLY);
 50d:	89 c3                	mov    %eax,%ebx
	if (fd < 0) return -1;
 50f:	78 27                	js     538 <stat+0x48>
	r = fstat(fd, st);
 511:	8b 45 0c             	mov    0xc(%ebp),%eax
 514:	89 1c 24             	mov    %ebx,(%esp)
 517:	89 44 24 04          	mov    %eax,0x4(%esp)
 51b:	e8 40 01 00 00       	call   660 <fstat>
	close(fd);
 520:	89 1c 24             	mov    %ebx,(%esp)
	int fd;
	int r;

	fd = open(n, O_RDONLY);
	if (fd < 0) return -1;
	r = fstat(fd, st);
 523:	89 c6                	mov    %eax,%esi
	close(fd);
 525:	e8 06 01 00 00       	call   630 <close>
	return r;
 52a:	89 f0                	mov    %esi,%eax
}
 52c:	83 c4 10             	add    $0x10,%esp
 52f:	5b                   	pop    %ebx
 530:	5e                   	pop    %esi
 531:	5d                   	pop    %ebp
 532:	c3                   	ret    
 533:	90                   	nop
 534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
	int fd;
	int r;

	fd = open(n, O_RDONLY);
	if (fd < 0) return -1;
 538:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 53d:	eb ed                	jmp    52c <stat+0x3c>
 53f:	90                   	nop

00000540 <atoi>:
	return r;
}

int
atoi(const char *s)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	8b 4d 08             	mov    0x8(%ebp),%ecx
 546:	53                   	push   %ebx
	int n;

	n = 0;
	while ('0' <= *s && *s <= '9') n= n * 10 + *s++ - '0';
 547:	0f be 11             	movsbl (%ecx),%edx
 54a:	8d 42 d0             	lea    -0x30(%edx),%eax
 54d:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
	int n;

	n = 0;
 54f:	b8 00 00 00 00       	mov    $0x0,%eax
	while ('0' <= *s && *s <= '9') n= n * 10 + *s++ - '0';
 554:	77 17                	ja     56d <atoi+0x2d>
 556:	66 90                	xchg   %ax,%ax
 558:	83 c1 01             	add    $0x1,%ecx
 55b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 55e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 562:	0f be 11             	movsbl (%ecx),%edx
 565:	8d 5a d0             	lea    -0x30(%edx),%ebx
 568:	80 fb 09             	cmp    $0x9,%bl
 56b:	76 eb                	jbe    558 <atoi+0x18>
	return n;
}
 56d:	5b                   	pop    %ebx
 56e:	5d                   	pop    %ebp
 56f:	c3                   	ret    

00000570 <memmove>:

void *
memmove(void *vdst, void *vsrc, int n)
{
 570:	55                   	push   %ebp
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0) *dst++= *src++;
 571:	31 d2                	xor    %edx,%edx
	return n;
}

void *
memmove(void *vdst, void *vsrc, int n)
{
 573:	89 e5                	mov    %esp,%ebp
 575:	56                   	push   %esi
 576:	8b 45 08             	mov    0x8(%ebp),%eax
 579:	53                   	push   %ebx
 57a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 57d:	8b 75 0c             	mov    0xc(%ebp),%esi
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0) *dst++= *src++;
 580:	85 db                	test   %ebx,%ebx
 582:	7e 12                	jle    596 <memmove+0x26>
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 588:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 58c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 58f:	83 c2 01             	add    $0x1,%edx
 592:	39 da                	cmp    %ebx,%edx
 594:	75 f2                	jne    588 <memmove+0x18>
	return vdst;
}
 596:	5b                   	pop    %ebx
 597:	5e                   	pop    %esi
 598:	5d                   	pop    %ebp
 599:	c3                   	ret    
 59a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000005a0 <ps>:

//edit
void ps(void){
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	56                   	push   %esi
 5a4:	53                   	push   %ebx
	int which = 1;
 5a5:	bb 01 00 00 00       	mov    $0x1,%ebx
	while (n-- > 0) *dst++= *src++;
	return vdst;
}

//edit
void ps(void){
 5aa:	83 ec 40             	sub    $0x40,%esp
 5ad:	8d 75 dc             	lea    -0x24(%ebp),%esi
 5b0:	eb 37                	jmp    5e9 <ps+0x49>
 5b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	int which = 1;
	struct pstat pnode;
	while(1){
	if(procstat (which, &pnode))break;

	printf(1, "%d, %d, %c, %s\n",pnode.pid, pnode.ppid, pnode.state, pnode.name);
 5b8:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
	which++;
 5bc:	83 c3 01             	add    $0x1,%ebx
	int which = 1;
	struct pstat pnode;
	while(1){
	if(procstat (which, &pnode))break;

	printf(1, "%d, %d, %c, %s\n",pnode.pid, pnode.ppid, pnode.state, pnode.name);
 5bf:	89 74 24 14          	mov    %esi,0x14(%esp)
 5c3:	c7 44 24 04 00 0b 00 	movl   $0xb00,0x4(%esp)
 5ca:	00 
 5cb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5d2:	89 44 24 10          	mov    %eax,0x10(%esp)
 5d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5d9:	89 44 24 0c          	mov    %eax,0xc(%esp)
 5dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5e0:	89 44 24 08          	mov    %eax,0x8(%esp)
 5e4:	e8 67 01 00 00       	call   750 <printf>
//edit
void ps(void){
	int which = 1;
	struct pstat pnode;
	while(1){
	if(procstat (which, &pnode))break;
 5e9:	89 74 24 04          	mov    %esi,0x4(%esp)
 5ed:	89 1c 24             	mov    %ebx,(%esp)
 5f0:	e8 b3 00 00 00       	call   6a8 <procstat>
 5f5:	85 c0                	test   %eax,%eax
 5f7:	74 bf                	je     5b8 <ps+0x18>

	printf(1, "%d, %d, %c, %s\n",pnode.pid, pnode.ppid, pnode.state, pnode.name);
	which++;
	}
}
 5f9:	83 c4 40             	add    $0x40,%esp
 5fc:	5b                   	pop    %ebx
 5fd:	5e                   	pop    %esi
 5fe:	5d                   	pop    %ebp
 5ff:	c3                   	ret    

00000600 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 600:	b8 01 00 00 00       	mov    $0x1,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <exit>:
SYSCALL(exit)
 608:	b8 02 00 00 00       	mov    $0x2,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <wait>:
SYSCALL(wait)
 610:	b8 03 00 00 00       	mov    $0x3,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <pipe>:
SYSCALL(pipe)
 618:	b8 04 00 00 00       	mov    $0x4,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <read>:
SYSCALL(read)
 620:	b8 05 00 00 00       	mov    $0x5,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <write>:
SYSCALL(write)
 628:	b8 10 00 00 00       	mov    $0x10,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <close>:
SYSCALL(close)
 630:	b8 15 00 00 00       	mov    $0x15,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <kill>:
SYSCALL(kill)
 638:	b8 06 00 00 00       	mov    $0x6,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <exec>:
SYSCALL(exec)
 640:	b8 07 00 00 00       	mov    $0x7,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <open>:
SYSCALL(open)
 648:	b8 0f 00 00 00       	mov    $0xf,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <mknod>:
SYSCALL(mknod)
 650:	b8 11 00 00 00       	mov    $0x11,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <unlink>:
SYSCALL(unlink)
 658:	b8 12 00 00 00       	mov    $0x12,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <fstat>:
SYSCALL(fstat)
 660:	b8 08 00 00 00       	mov    $0x8,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <link>:
SYSCALL(link)
 668:	b8 13 00 00 00       	mov    $0x13,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <mkdir>:
SYSCALL(mkdir)
 670:	b8 14 00 00 00       	mov    $0x14,%eax
 675:	cd 40                	int    $0x40
 677:	c3                   	ret    

00000678 <chdir>:
SYSCALL(chdir)
 678:	b8 09 00 00 00       	mov    $0x9,%eax
 67d:	cd 40                	int    $0x40
 67f:	c3                   	ret    

00000680 <dup>:
SYSCALL(dup)
 680:	b8 0a 00 00 00       	mov    $0xa,%eax
 685:	cd 40                	int    $0x40
 687:	c3                   	ret    

00000688 <getpid>:
SYSCALL(getpid)
 688:	b8 0b 00 00 00       	mov    $0xb,%eax
 68d:	cd 40                	int    $0x40
 68f:	c3                   	ret    

00000690 <sbrk>:
SYSCALL(sbrk)
 690:	b8 0c 00 00 00       	mov    $0xc,%eax
 695:	cd 40                	int    $0x40
 697:	c3                   	ret    

00000698 <sleep>:
SYSCALL(sleep)
 698:	b8 0d 00 00 00       	mov    $0xd,%eax
 69d:	cd 40                	int    $0x40
 69f:	c3                   	ret    

000006a0 <uptime>:
SYSCALL(uptime)
 6a0:	b8 0e 00 00 00       	mov    $0xe,%eax
 6a5:	cd 40                	int    $0x40
 6a7:	c3                   	ret    

000006a8 <procstat>:
SYSCALL(procstat)
 6a8:	b8 16 00 00 00       	mov    $0x16,%eax
 6ad:	cd 40                	int    $0x40
 6af:	c3                   	ret    

000006b0 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	56                   	push   %esi
 6b5:	89 c6                	mov    %eax,%esi
 6b7:	53                   	push   %ebx
 6b8:	83 ec 4c             	sub    $0x4c,%esp
	char        buf[16];
	int         i, neg;
	uint        x;

	neg = 0;
	if (sgn && xx < 0) {
 6bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6be:	85 db                	test   %ebx,%ebx
 6c0:	74 09                	je     6cb <printint+0x1b>
 6c2:	89 d0                	mov    %edx,%eax
 6c4:	c1 e8 1f             	shr    $0x1f,%eax
 6c7:	84 c0                	test   %al,%al
 6c9:	75 75                	jne    740 <printint+0x90>
		neg = 1;
		x   = -xx;
	} else {
		x = xx;
 6cb:	89 d0                	mov    %edx,%eax
	static char digits[] = "0123456789ABCDEF";
	char        buf[16];
	int         i, neg;
	uint        x;

	neg = 0;
 6cd:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 6d4:	89 75 c0             	mov    %esi,-0x40(%ebp)
		x   = -xx;
	} else {
		x = xx;
	}

	i = 0;
 6d7:	31 ff                	xor    %edi,%edi
 6d9:	89 ce                	mov    %ecx,%esi
 6db:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 6de:	eb 02                	jmp    6e2 <printint+0x32>
	do {
		buf[i++] = digits[x % base];
 6e0:	89 cf                	mov    %ecx,%edi
 6e2:	31 d2                	xor    %edx,%edx
 6e4:	f7 f6                	div    %esi
 6e6:	8d 4f 01             	lea    0x1(%edi),%ecx
 6e9:	0f b6 92 17 0b 00 00 	movzbl 0xb17(%edx),%edx
	} while ((x /= base) != 0);
 6f0:	85 c0                	test   %eax,%eax
		x = xx;
	}

	i = 0;
	do {
		buf[i++] = digits[x % base];
 6f2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
	} while ((x /= base) != 0);
 6f5:	75 e9                	jne    6e0 <printint+0x30>
	if (neg) buf[i++] = '-';
 6f7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
		x = xx;
	}

	i = 0;
	do {
		buf[i++] = digits[x % base];
 6fa:	89 c8                	mov    %ecx,%eax
 6fc:	8b 75 c0             	mov    -0x40(%ebp),%esi
	} while ((x /= base) != 0);
	if (neg) buf[i++] = '-';
 6ff:	85 d2                	test   %edx,%edx
 701:	74 08                	je     70b <printint+0x5b>
 703:	8d 4f 02             	lea    0x2(%edi),%ecx
 706:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

	while (--i >= 0) putc(fd, buf[i]);
 70b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 70e:	66 90                	xchg   %ax,%ax
 710:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 715:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 718:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 71f:	00 
 720:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 724:	89 34 24             	mov    %esi,(%esp)
 727:	88 45 d7             	mov    %al,-0x29(%ebp)
 72a:	e8 f9 fe ff ff       	call   628 <write>
	do {
		buf[i++] = digits[x % base];
	} while ((x /= base) != 0);
	if (neg) buf[i++] = '-';

	while (--i >= 0) putc(fd, buf[i]);
 72f:	83 ff ff             	cmp    $0xffffffff,%edi
 732:	75 dc                	jne    710 <printint+0x60>
}
 734:	83 c4 4c             	add    $0x4c,%esp
 737:	5b                   	pop    %ebx
 738:	5e                   	pop    %esi
 739:	5f                   	pop    %edi
 73a:	5d                   	pop    %ebp
 73b:	c3                   	ret    
 73c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	uint        x;

	neg = 0;
	if (sgn && xx < 0) {
		neg = 1;
		x   = -xx;
 740:	89 d0                	mov    %edx,%eax
 742:	f7 d8                	neg    %eax
	int         i, neg;
	uint        x;

	neg = 0;
	if (sgn && xx < 0) {
		neg = 1;
 744:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 74b:	eb 87                	jmp    6d4 <printint+0x24>
 74d:	8d 76 00             	lea    0x0(%esi),%esi

00000750 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	57                   	push   %edi
	char *s;
	int   c, i, state;
	uint *ap;

	state = 0;
 754:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 756:	56                   	push   %esi
 757:	53                   	push   %ebx
 758:	83 ec 3c             	sub    $0x3c,%esp
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 75b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	char *s;
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
 75e:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 761:	8b 75 08             	mov    0x8(%ebp),%esi
	char *s;
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
 764:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	for (i = 0; fmt[i]; i++) {
 767:	0f b6 13             	movzbl (%ebx),%edx
 76a:	83 c3 01             	add    $0x1,%ebx
 76d:	84 d2                	test   %dl,%dl
 76f:	75 39                	jne    7aa <printf+0x5a>
 771:	e9 c2 00 00 00       	jmp    838 <printf+0xe8>
 776:	66 90                	xchg   %ax,%ax
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
 778:	83 fa 25             	cmp    $0x25,%edx
 77b:	0f 84 bf 00 00 00    	je     840 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 781:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 784:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 78b:	00 
 78c:	89 44 24 04          	mov    %eax,0x4(%esp)
 790:	89 34 24             	mov    %esi,(%esp)
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
				state = '%';
			} else {
				putc(fd, c);
 793:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 796:	e8 8d fe ff ff       	call   628 <write>
 79b:	83 c3 01             	add    $0x1,%ebx
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 79e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 7a2:	84 d2                	test   %dl,%dl
 7a4:	0f 84 8e 00 00 00    	je     838 <printf+0xe8>
		c = fmt[i] & 0xff;
		if (state == 0) {
 7aa:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
		c = fmt[i] & 0xff;
 7ac:	0f be c2             	movsbl %dl,%eax
		if (state == 0) {
 7af:	74 c7                	je     778 <printf+0x28>
			if (c == '%') {
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if (state == '%') {
 7b1:	83 ff 25             	cmp    $0x25,%edi
 7b4:	75 e5                	jne    79b <printf+0x4b>
			if (c == 'd') {
 7b6:	83 fa 64             	cmp    $0x64,%edx
 7b9:	0f 84 31 01 00 00    	je     8f0 <printf+0x1a0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
 7bf:	25 f7 00 00 00       	and    $0xf7,%eax
 7c4:	83 f8 70             	cmp    $0x70,%eax
 7c7:	0f 84 83 00 00 00    	je     850 <printf+0x100>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if (c == 's') {
 7cd:	83 fa 73             	cmp    $0x73,%edx
 7d0:	0f 84 a2 00 00 00    	je     878 <printf+0x128>
				if (s == 0) s = "(null)";
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
 7d6:	83 fa 63             	cmp    $0x63,%edx
 7d9:	0f 84 35 01 00 00    	je     914 <printf+0x1c4>
				putc(fd, *ap);
				ap++;
			} else if (c == '%') {
 7df:	83 fa 25             	cmp    $0x25,%edx
 7e2:	0f 84 e0 00 00 00    	je     8c8 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 7e8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 7eb:	83 c3 01             	add    $0x1,%ebx
 7ee:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7f5:	00 
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 7f6:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 7f8:	89 44 24 04          	mov    %eax,0x4(%esp)
 7fc:	89 34 24             	mov    %esi,(%esp)
 7ff:	89 55 d0             	mov    %edx,-0x30(%ebp)
 802:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 806:	e8 1d fe ff ff       	call   628 <write>
			} else if (c == '%') {
				putc(fd, c);
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
 80b:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 80e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 811:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 818:	00 
 819:	89 44 24 04          	mov    %eax,0x4(%esp)
 81d:	89 34 24             	mov    %esi,(%esp)
			} else if (c == '%') {
				putc(fd, c);
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
 820:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 823:	e8 00 fe ff ff       	call   628 <write>
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 828:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 82c:	84 d2                	test   %dl,%dl
 82e:	0f 85 76 ff ff ff    	jne    7aa <printf+0x5a>
 834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				putc(fd, c);
			}
			state = 0;
		}
	}
}
 838:	83 c4 3c             	add    $0x3c,%esp
 83b:	5b                   	pop    %ebx
 83c:	5e                   	pop    %esi
 83d:	5f                   	pop    %edi
 83e:	5d                   	pop    %ebp
 83f:	c3                   	ret    
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
				state = '%';
 840:	bf 25 00 00 00       	mov    $0x25,%edi
 845:	e9 51 ff ff ff       	jmp    79b <printf+0x4b>
 84a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
				printint(fd, *ap, 16, 0);
 850:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 853:	b9 10 00 00 00       	mov    $0x10,%ecx
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 858:	31 ff                	xor    %edi,%edi
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
				printint(fd, *ap, 16, 0);
 85a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 861:	8b 10                	mov    (%eax),%edx
 863:	89 f0                	mov    %esi,%eax
 865:	e8 46 fe ff ff       	call   6b0 <printint>
				ap++;
 86a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 86e:	e9 28 ff ff ff       	jmp    79b <printf+0x4b>
 873:	90                   	nop
 874:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			} else if (c == 's') {
				s = (char *)*ap;
 878:	8b 45 d4             	mov    -0x2c(%ebp),%eax
				ap++;
 87b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
				ap++;
			} else if (c == 'x' || c == 'p') {
				printint(fd, *ap, 16, 0);
				ap++;
			} else if (c == 's') {
				s = (char *)*ap;
 87f:	8b 38                	mov    (%eax),%edi
				ap++;
				if (s == 0) s = "(null)";
 881:	b8 10 0b 00 00       	mov    $0xb10,%eax
 886:	85 ff                	test   %edi,%edi
 888:	0f 44 f8             	cmove  %eax,%edi
				while (*s != 0) {
 88b:	0f b6 07             	movzbl (%edi),%eax
 88e:	84 c0                	test   %al,%al
 890:	74 2a                	je     8bc <printf+0x16c>
 892:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 898:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 89b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
				s = (char *)*ap;
				ap++;
				if (s == 0) s = "(null)";
				while (*s != 0) {
					putc(fd, *s);
					s++;
 89e:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 8a1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8a8:	00 
 8a9:	89 44 24 04          	mov    %eax,0x4(%esp)
 8ad:	89 34 24             	mov    %esi,(%esp)
 8b0:	e8 73 fd ff ff       	call   628 <write>
				ap++;
			} else if (c == 's') {
				s = (char *)*ap;
				ap++;
				if (s == 0) s = "(null)";
				while (*s != 0) {
 8b5:	0f b6 07             	movzbl (%edi),%eax
 8b8:	84 c0                	test   %al,%al
 8ba:	75 dc                	jne    898 <printf+0x148>
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 8bc:	31 ff                	xor    %edi,%edi
 8be:	e9 d8 fe ff ff       	jmp    79b <printf+0x4b>
 8c3:	90                   	nop
 8c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 8c8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 8cb:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 8cd:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8d4:	00 
 8d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 8d9:	89 34 24             	mov    %esi,(%esp)
 8dc:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 8e0:	e8 43 fd ff ff       	call   628 <write>
 8e5:	e9 b1 fe ff ff       	jmp    79b <printf+0x4b>
 8ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
 8f0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 8f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 8f8:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
 8fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 902:	8b 10                	mov    (%eax),%edx
 904:	89 f0                	mov    %esi,%eax
 906:	e8 a5 fd ff ff       	call   6b0 <printint>
				ap++;
 90b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 90f:	e9 87 fe ff ff       	jmp    79b <printf+0x4b>
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
 914:	8b 45 d4             	mov    -0x2c(%ebp),%eax
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 917:	31 ff                	xor    %edi,%edi
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
 919:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 91b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 922:	00 
 923:	89 34 24             	mov    %esi,(%esp)
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
 926:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 929:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 92c:	89 44 24 04          	mov    %eax,0x4(%esp)
 930:	e8 f3 fc ff ff       	call   628 <write>
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
				ap++;
 935:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 939:	e9 5d fe ff ff       	jmp    79b <printf+0x4b>
 93e:	66 90                	xchg   %ax,%ax

00000940 <free>:
static Header  base;
static Header *freep;

void
free(void *ap)
{
 940:	55                   	push   %ebp
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 941:	a1 30 0e 00 00       	mov    0xe30,%eax
static Header  base;
static Header *freep;

void
free(void *ap)
{
 946:	89 e5                	mov    %esp,%ebp
 948:	57                   	push   %edi
 949:	56                   	push   %esi
 94a:	53                   	push   %ebx
 94b:	8b 5d 08             	mov    0x8(%ebp),%ebx
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 94e:	8b 08                	mov    (%eax),%ecx
void
free(void *ap)
{
	Header *bp, *p;

	bp = (Header *)ap - 1;
 950:	8d 53 f8             	lea    -0x8(%ebx),%edx
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 953:	39 d0                	cmp    %edx,%eax
 955:	72 11                	jb     968 <free+0x28>
 957:	90                   	nop
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 958:	39 c8                	cmp    %ecx,%eax
 95a:	72 04                	jb     960 <free+0x20>
 95c:	39 ca                	cmp    %ecx,%edx
 95e:	72 10                	jb     970 <free+0x30>
 960:	89 c8                	mov    %ecx,%eax
free(void *ap)
{
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 962:	39 d0                	cmp    %edx,%eax
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 964:	8b 08                	mov    (%eax),%ecx
free(void *ap)
{
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 966:	73 f0                	jae    958 <free+0x18>
 968:	39 ca                	cmp    %ecx,%edx
 96a:	72 04                	jb     970 <free+0x30>
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 96c:	39 c8                	cmp    %ecx,%eax
 96e:	72 f0                	jb     960 <free+0x20>
	if (bp + bp->s.size == p->s.ptr) {
 970:	8b 73 fc             	mov    -0x4(%ebx),%esi
 973:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 976:	39 cf                	cmp    %ecx,%edi
 978:	74 1e                	je     998 <free+0x58>
		bp->s.size += p->s.ptr->s.size;
		bp->s.ptr = p->s.ptr->s.ptr;
	} else
		bp->s.ptr = p->s.ptr;
 97a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
	if (p + p->s.size == bp) {
 97d:	8b 48 04             	mov    0x4(%eax),%ecx
 980:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 983:	39 f2                	cmp    %esi,%edx
 985:	74 28                	je     9af <free+0x6f>
		p->s.size += bp->s.size;
		p->s.ptr = bp->s.ptr;
	} else
		p->s.ptr = bp;
 987:	89 10                	mov    %edx,(%eax)
	freep = p;
 989:	a3 30 0e 00 00       	mov    %eax,0xe30
}
 98e:	5b                   	pop    %ebx
 98f:	5e                   	pop    %esi
 990:	5f                   	pop    %edi
 991:	5d                   	pop    %ebp
 992:	c3                   	ret    
 993:	90                   	nop
 994:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
	if (bp + bp->s.size == p->s.ptr) {
		bp->s.size += p->s.ptr->s.size;
 998:	03 71 04             	add    0x4(%ecx),%esi
 99b:	89 73 fc             	mov    %esi,-0x4(%ebx)
		bp->s.ptr = p->s.ptr->s.ptr;
 99e:	8b 08                	mov    (%eax),%ecx
 9a0:	8b 09                	mov    (%ecx),%ecx
 9a2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
	} else
		bp->s.ptr = p->s.ptr;
	if (p + p->s.size == bp) {
 9a5:	8b 48 04             	mov    0x4(%eax),%ecx
 9a8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 9ab:	39 f2                	cmp    %esi,%edx
 9ad:	75 d8                	jne    987 <free+0x47>
		p->s.size += bp->s.size;
 9af:	03 4b fc             	add    -0x4(%ebx),%ecx
		p->s.ptr = bp->s.ptr;
	} else
		p->s.ptr = bp;
	freep = p;
 9b2:	a3 30 0e 00 00       	mov    %eax,0xe30
		bp->s.size += p->s.ptr->s.size;
		bp->s.ptr = p->s.ptr->s.ptr;
	} else
		bp->s.ptr = p->s.ptr;
	if (p + p->s.size == bp) {
		p->s.size += bp->s.size;
 9b7:	89 48 04             	mov    %ecx,0x4(%eax)
		p->s.ptr = bp->s.ptr;
 9ba:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9bd:	89 10                	mov    %edx,(%eax)
	} else
		p->s.ptr = bp;
	freep = p;
}
 9bf:	5b                   	pop    %ebx
 9c0:	5e                   	pop    %esi
 9c1:	5f                   	pop    %edi
 9c2:	5d                   	pop    %ebp
 9c3:	c3                   	ret    
 9c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 9ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000009d0 <malloc>:
	return freep;
}

void *
malloc(uint nbytes)
{
 9d0:	55                   	push   %ebp
 9d1:	89 e5                	mov    %esp,%ebp
 9d3:	57                   	push   %edi
 9d4:	56                   	push   %esi
 9d5:	53                   	push   %ebx
 9d6:	83 ec 1c             	sub    $0x1c,%esp
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 9d9:	8b 45 08             	mov    0x8(%ebp),%eax
	if ((prevp = freep) == 0) {
 9dc:	8b 1d 30 0e 00 00    	mov    0xe30,%ebx
malloc(uint nbytes)
{
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 9e2:	8d 48 07             	lea    0x7(%eax),%ecx
 9e5:	c1 e9 03             	shr    $0x3,%ecx
	if ((prevp = freep) == 0) {
 9e8:	85 db                	test   %ebx,%ebx
malloc(uint nbytes)
{
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 9ea:	8d 71 01             	lea    0x1(%ecx),%esi
	if ((prevp = freep) == 0) {
 9ed:	0f 84 9b 00 00 00    	je     a8e <malloc+0xbe>
 9f3:	8b 13                	mov    (%ebx),%edx
 9f5:	8b 7a 04             	mov    0x4(%edx),%edi
		base.s.ptr = freep = prevp = &base;
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
		if (p->s.size >= nunits) {
 9f8:	39 fe                	cmp    %edi,%esi
 9fa:	76 64                	jbe    a60 <malloc+0x90>
 9fc:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
morecore(uint nu)
{
	char *  p;
	Header *hp;

	if (nu < 4096) nu = 4096;
 a03:	bb 00 80 00 00       	mov    $0x8000,%ebx
 a08:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 a0b:	eb 0e                	jmp    a1b <malloc+0x4b>
 a0d:	8d 76 00             	lea    0x0(%esi),%esi
	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
 a10:	8b 02                	mov    (%edx),%eax
		if (p->s.size >= nunits) {
 a12:	8b 78 04             	mov    0x4(%eax),%edi
 a15:	39 fe                	cmp    %edi,%esi
 a17:	76 4f                	jbe    a68 <malloc+0x98>
 a19:	89 c2                	mov    %eax,%edx
				p->s.size = nunits;
			}
			freep = prevp;
			return (void *)(p + 1);
		}
		if (p == freep)
 a1b:	3b 15 30 0e 00 00    	cmp    0xe30,%edx
 a21:	75 ed                	jne    a10 <malloc+0x40>
morecore(uint nu)
{
	char *  p;
	Header *hp;

	if (nu < 4096) nu = 4096;
 a23:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 a26:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 a2c:	bf 00 10 00 00       	mov    $0x1000,%edi
 a31:	0f 43 fe             	cmovae %esi,%edi
 a34:	0f 42 c3             	cmovb  %ebx,%eax
	p = sbrk(nu * sizeof(Header));
 a37:	89 04 24             	mov    %eax,(%esp)
 a3a:	e8 51 fc ff ff       	call   690 <sbrk>
	if (p == (char *)-1) return 0;
 a3f:	83 f8 ff             	cmp    $0xffffffff,%eax
 a42:	74 18                	je     a5c <malloc+0x8c>
	hp         = (Header *)p;
	hp->s.size = nu;
 a44:	89 78 04             	mov    %edi,0x4(%eax)
	free((void *)(hp + 1));
 a47:	83 c0 08             	add    $0x8,%eax
 a4a:	89 04 24             	mov    %eax,(%esp)
 a4d:	e8 ee fe ff ff       	call   940 <free>
	return freep;
 a52:	8b 15 30 0e 00 00    	mov    0xe30,%edx
			}
			freep = prevp;
			return (void *)(p + 1);
		}
		if (p == freep)
			if ((p = morecore(nunits)) == 0) return 0;
 a58:	85 d2                	test   %edx,%edx
 a5a:	75 b4                	jne    a10 <malloc+0x40>
 a5c:	31 c0                	xor    %eax,%eax
 a5e:	eb 20                	jmp    a80 <malloc+0xb0>
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
		if (p->s.size >= nunits) {
 a60:	89 d0                	mov    %edx,%eax
 a62:	89 da                	mov    %ebx,%edx
 a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			if (p->s.size == nunits)
 a68:	39 fe                	cmp    %edi,%esi
 a6a:	74 1c                	je     a88 <malloc+0xb8>
				prevp->s.ptr = p->s.ptr;
			else {
				p->s.size -= nunits;
 a6c:	29 f7                	sub    %esi,%edi
 a6e:	89 78 04             	mov    %edi,0x4(%eax)
				p += p->s.size;
 a71:	8d 04 f8             	lea    (%eax,%edi,8),%eax
				p->s.size = nunits;
 a74:	89 70 04             	mov    %esi,0x4(%eax)
			}
			freep = prevp;
 a77:	89 15 30 0e 00 00    	mov    %edx,0xe30
			return (void *)(p + 1);
 a7d:	83 c0 08             	add    $0x8,%eax
		}
		if (p == freep)
			if ((p = morecore(nunits)) == 0) return 0;
	}
}
 a80:	83 c4 1c             	add    $0x1c,%esp
 a83:	5b                   	pop    %ebx
 a84:	5e                   	pop    %esi
 a85:	5f                   	pop    %edi
 a86:	5d                   	pop    %ebp
 a87:	c3                   	ret    
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
		if (p->s.size >= nunits) {
			if (p->s.size == nunits)
				prevp->s.ptr = p->s.ptr;
 a88:	8b 08                	mov    (%eax),%ecx
 a8a:	89 0a                	mov    %ecx,(%edx)
 a8c:	eb e9                	jmp    a77 <malloc+0xa7>
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
 a8e:	c7 05 30 0e 00 00 34 	movl   $0xe34,0xe30
 a95:	0e 00 00 
		base.s.size                = 0;
 a98:	ba 34 0e 00 00       	mov    $0xe34,%edx
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
 a9d:	c7 05 34 0e 00 00 34 	movl   $0xe34,0xe34
 aa4:	0e 00 00 
		base.s.size                = 0;
 aa7:	c7 05 38 0e 00 00 00 	movl   $0x0,0xe38
 aae:	00 00 00 
 ab1:	e9 46 ff ff ff       	jmp    9fc <malloc+0x2c>
