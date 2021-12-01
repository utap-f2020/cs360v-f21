
vmm/guest/obj/user/primes:     file format elf64-x86-64


Disassembly of section .text:

0000000000800020 <_start>:
// starts us running when we are initially loaded into a new environment.
.text
.globl _start
_start:
	// See if we were started with arguments on the stack
	movabs $USTACKTOP, %rax
  800020:	48 b8 00 e0 7f ef 00 	movabs $0xef7fe000,%rax
  800027:	00 00 00 
	cmpq %rax,%rsp
  80002a:	48 39 c4             	cmp    %rax,%rsp
	jne args_exist
  80002d:	75 04                	jne    800033 <args_exist>

	// If not, push dummy argc/argv arguments.
	// This happens when we are loaded by the kernel,
	// because the kernel does not know about passing arguments.
	pushq $0
  80002f:	6a 00                	pushq  $0x0
	pushq $0
  800031:	6a 00                	pushq  $0x0

0000000000800033 <args_exist>:

args_exist:
	movq 8(%rsp), %rsi
  800033:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
	movq (%rsp), %rdi
  800038:	48 8b 3c 24          	mov    (%rsp),%rdi
	call libmain
  80003c:	e8 8d 01 00 00       	callq  8001ce <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <primeproc>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 10          	sub    $0x10,%rsp
  80004b:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80004f:	ba 00 00 00 00       	mov    $0x0,%edx
  800054:	be 00 00 00 00       	mov    $0x0,%esi
  800059:	48 89 c7             	mov    %rax,%rdi
  80005c:	48 b8 86 23 80 00 00 	movabs $0x802386,%rax
  800063:	00 00 00 
  800066:	ff d0                	callq  *%rax
  800068:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80006b:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800072:	00 00 00 
  800075:	48 8b 00             	mov    (%rax),%rax
  800078:	8b 80 dc 00 00 00    	mov    0xdc(%rax),%eax
  80007e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800081:	89 c6                	mov    %eax,%esi
  800083:	48 bf 60 49 80 00 00 	movabs $0x804960,%rdi
  80008a:	00 00 00 
  80008d:	b8 00 00 00 00       	mov    $0x0,%eax
  800092:	48 b9 ad 04 80 00 00 	movabs $0x8004ad,%rcx
  800099:	00 00 00 
  80009c:	ff d1                	callq  *%rcx
  80009e:	48 b8 11 21 80 00 00 	movabs $0x802111,%rax
  8000a5:	00 00 00 
  8000a8:	ff d0                	callq  *%rax
  8000aa:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8000ad:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8000b1:	79 30                	jns    8000e3 <primeproc+0xa0>
  8000b3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000b6:	89 c1                	mov    %eax,%ecx
  8000b8:	48 ba 6c 49 80 00 00 	movabs $0x80496c,%rdx
  8000bf:	00 00 00 
  8000c2:	be 1b 00 00 00       	mov    $0x1b,%esi
  8000c7:	48 bf 75 49 80 00 00 	movabs $0x804975,%rdi
  8000ce:	00 00 00 
  8000d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8000d6:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  8000dd:	00 00 00 
  8000e0:	41 ff d0             	callq  *%r8
  8000e3:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8000e7:	75 05                	jne    8000ee <primeproc+0xab>
  8000e9:	e9 5d ff ff ff       	jmpq   80004b <primeproc+0x8>
  8000ee:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8000f2:	ba 00 00 00 00       	mov    $0x0,%edx
  8000f7:	be 00 00 00 00       	mov    $0x0,%esi
  8000fc:	48 89 c7             	mov    %rax,%rdi
  8000ff:	48 b8 86 23 80 00 00 	movabs $0x802386,%rax
  800106:	00 00 00 
  800109:	ff d0                	callq  *%rax
  80010b:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80010e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800111:	99                   	cltd   
  800112:	f7 7d fc             	idivl  -0x4(%rbp)
  800115:	89 d0                	mov    %edx,%eax
  800117:	85 c0                	test   %eax,%eax
  800119:	74 20                	je     80013b <primeproc+0xf8>
  80011b:	8b 75 f4             	mov    -0xc(%rbp),%esi
  80011e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800121:	b9 00 00 00 00       	mov    $0x0,%ecx
  800126:	ba 00 00 00 00       	mov    $0x0,%edx
  80012b:	89 c7                	mov    %eax,%edi
  80012d:	48 b8 47 24 80 00 00 	movabs $0x802447,%rax
  800134:	00 00 00 
  800137:	ff d0                	callq  *%rax
  800139:	eb b3                	jmp    8000ee <primeproc+0xab>
  80013b:	eb b1                	jmp    8000ee <primeproc+0xab>

000000000080013d <umain>:
  80013d:	55                   	push   %rbp
  80013e:	48 89 e5             	mov    %rsp,%rbp
  800141:	48 83 ec 20          	sub    $0x20,%rsp
  800145:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800148:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80014c:	48 b8 11 21 80 00 00 	movabs $0x802111,%rax
  800153:	00 00 00 
  800156:	ff d0                	callq  *%rax
  800158:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80015b:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80015f:	79 30                	jns    800191 <umain+0x54>
  800161:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800164:	89 c1                	mov    %eax,%ecx
  800166:	48 ba 6c 49 80 00 00 	movabs $0x80496c,%rdx
  80016d:	00 00 00 
  800170:	be 2e 00 00 00       	mov    $0x2e,%esi
  800175:	48 bf 75 49 80 00 00 	movabs $0x804975,%rdi
  80017c:	00 00 00 
  80017f:	b8 00 00 00 00       	mov    $0x0,%eax
  800184:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  80018b:	00 00 00 
  80018e:	41 ff d0             	callq  *%r8
  800191:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800195:	75 0c                	jne    8001a3 <umain+0x66>
  800197:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  80019e:	00 00 00 
  8001a1:	ff d0                	callq  *%rax
  8001a3:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%rbp)
  8001aa:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8001ad:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8001b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  8001b5:	ba 00 00 00 00       	mov    $0x0,%edx
  8001ba:	89 c7                	mov    %eax,%edi
  8001bc:	48 b8 47 24 80 00 00 	movabs $0x802447,%rax
  8001c3:	00 00 00 
  8001c6:	ff d0                	callq  *%rax
  8001c8:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8001cc:	eb dc                	jmp    8001aa <umain+0x6d>

00000000008001ce <libmain>:
  8001ce:	55                   	push   %rbp
  8001cf:	48 89 e5             	mov    %rsp,%rbp
  8001d2:	48 83 ec 10          	sub    $0x10,%rsp
  8001d6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8001d9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8001dd:	48 b8 15 19 80 00 00 	movabs $0x801915,%rax
  8001e4:	00 00 00 
  8001e7:	ff d0                	callq  *%rax
  8001e9:	25 ff 03 00 00       	and    $0x3ff,%eax
  8001ee:	48 98                	cltq   
  8001f0:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8001f7:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8001fe:	00 00 00 
  800201:	48 01 c2             	add    %rax,%rdx
  800204:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80020b:	00 00 00 
  80020e:	48 89 10             	mov    %rdx,(%rax)
  800211:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800215:	7e 14                	jle    80022b <libmain+0x5d>
  800217:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80021b:	48 8b 10             	mov    (%rax),%rdx
  80021e:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800225:	00 00 00 
  800228:	48 89 10             	mov    %rdx,(%rax)
  80022b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80022f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800232:	48 89 d6             	mov    %rdx,%rsi
  800235:	89 c7                	mov    %eax,%edi
  800237:	48 b8 3d 01 80 00 00 	movabs $0x80013d,%rax
  80023e:	00 00 00 
  800241:	ff d0                	callq  *%rax
  800243:	48 b8 51 02 80 00 00 	movabs $0x800251,%rax
  80024a:	00 00 00 
  80024d:	ff d0                	callq  *%rax
  80024f:	c9                   	leaveq 
  800250:	c3                   	retq   

0000000000800251 <exit>:
  800251:	55                   	push   %rbp
  800252:	48 89 e5             	mov    %rsp,%rbp
  800255:	48 b8 2b 2a 80 00 00 	movabs $0x802a2b,%rax
  80025c:	00 00 00 
  80025f:	ff d0                	callq  *%rax
  800261:	bf 00 00 00 00       	mov    $0x0,%edi
  800266:	48 b8 d1 18 80 00 00 	movabs $0x8018d1,%rax
  80026d:	00 00 00 
  800270:	ff d0                	callq  *%rax
  800272:	5d                   	pop    %rbp
  800273:	c3                   	retq   

0000000000800274 <_panic>:
  800274:	55                   	push   %rbp
  800275:	48 89 e5             	mov    %rsp,%rbp
  800278:	53                   	push   %rbx
  800279:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  800280:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800287:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  80028d:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800294:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  80029b:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  8002a2:	84 c0                	test   %al,%al
  8002a4:	74 23                	je     8002c9 <_panic+0x55>
  8002a6:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  8002ad:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  8002b1:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  8002b5:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  8002b9:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  8002bd:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  8002c1:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  8002c5:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  8002c9:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8002d0:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  8002d7:	00 00 00 
  8002da:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  8002e1:	00 00 00 
  8002e4:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8002e8:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8002ef:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8002f6:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8002fd:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800304:	00 00 00 
  800307:	48 8b 18             	mov    (%rax),%rbx
  80030a:	48 b8 15 19 80 00 00 	movabs $0x801915,%rax
  800311:	00 00 00 
  800314:	ff d0                	callq  *%rax
  800316:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  80031c:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800323:	41 89 c8             	mov    %ecx,%r8d
  800326:	48 89 d1             	mov    %rdx,%rcx
  800329:	48 89 da             	mov    %rbx,%rdx
  80032c:	89 c6                	mov    %eax,%esi
  80032e:	48 bf 90 49 80 00 00 	movabs $0x804990,%rdi
  800335:	00 00 00 
  800338:	b8 00 00 00 00       	mov    $0x0,%eax
  80033d:	49 b9 ad 04 80 00 00 	movabs $0x8004ad,%r9
  800344:	00 00 00 
  800347:	41 ff d1             	callq  *%r9
  80034a:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800351:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800358:	48 89 d6             	mov    %rdx,%rsi
  80035b:	48 89 c7             	mov    %rax,%rdi
  80035e:	48 b8 01 04 80 00 00 	movabs $0x800401,%rax
  800365:	00 00 00 
  800368:	ff d0                	callq  *%rax
  80036a:	48 bf b3 49 80 00 00 	movabs $0x8049b3,%rdi
  800371:	00 00 00 
  800374:	b8 00 00 00 00       	mov    $0x0,%eax
  800379:	48 ba ad 04 80 00 00 	movabs $0x8004ad,%rdx
  800380:	00 00 00 
  800383:	ff d2                	callq  *%rdx
  800385:	cc                   	int3   
  800386:	eb fd                	jmp    800385 <_panic+0x111>

0000000000800388 <putch>:
  800388:	55                   	push   %rbp
  800389:	48 89 e5             	mov    %rsp,%rbp
  80038c:	48 83 ec 10          	sub    $0x10,%rsp
  800390:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800393:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800397:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80039b:	8b 00                	mov    (%rax),%eax
  80039d:	8d 48 01             	lea    0x1(%rax),%ecx
  8003a0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003a4:	89 0a                	mov    %ecx,(%rdx)
  8003a6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8003a9:	89 d1                	mov    %edx,%ecx
  8003ab:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003af:	48 98                	cltq   
  8003b1:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8003b5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003b9:	8b 00                	mov    (%rax),%eax
  8003bb:	3d ff 00 00 00       	cmp    $0xff,%eax
  8003c0:	75 2c                	jne    8003ee <putch+0x66>
  8003c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003c6:	8b 00                	mov    (%rax),%eax
  8003c8:	48 98                	cltq   
  8003ca:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003ce:	48 83 c2 08          	add    $0x8,%rdx
  8003d2:	48 89 c6             	mov    %rax,%rsi
  8003d5:	48 89 d7             	mov    %rdx,%rdi
  8003d8:	48 b8 49 18 80 00 00 	movabs $0x801849,%rax
  8003df:	00 00 00 
  8003e2:	ff d0                	callq  *%rax
  8003e4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003e8:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8003ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003f2:	8b 40 04             	mov    0x4(%rax),%eax
  8003f5:	8d 50 01             	lea    0x1(%rax),%edx
  8003f8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003fc:	89 50 04             	mov    %edx,0x4(%rax)
  8003ff:	c9                   	leaveq 
  800400:	c3                   	retq   

0000000000800401 <vcprintf>:
  800401:	55                   	push   %rbp
  800402:	48 89 e5             	mov    %rsp,%rbp
  800405:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  80040c:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800413:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  80041a:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800421:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800428:	48 8b 0a             	mov    (%rdx),%rcx
  80042b:	48 89 08             	mov    %rcx,(%rax)
  80042e:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800432:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800436:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80043a:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80043e:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800445:	00 00 00 
  800448:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80044f:	00 00 00 
  800452:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800459:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800460:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800467:	48 89 c6             	mov    %rax,%rsi
  80046a:	48 bf 88 03 80 00 00 	movabs $0x800388,%rdi
  800471:	00 00 00 
  800474:	48 b8 60 08 80 00 00 	movabs $0x800860,%rax
  80047b:	00 00 00 
  80047e:	ff d0                	callq  *%rax
  800480:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800486:	48 98                	cltq   
  800488:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80048f:	48 83 c2 08          	add    $0x8,%rdx
  800493:	48 89 c6             	mov    %rax,%rsi
  800496:	48 89 d7             	mov    %rdx,%rdi
  800499:	48 b8 49 18 80 00 00 	movabs $0x801849,%rax
  8004a0:	00 00 00 
  8004a3:	ff d0                	callq  *%rax
  8004a5:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8004ab:	c9                   	leaveq 
  8004ac:	c3                   	retq   

00000000008004ad <cprintf>:
  8004ad:	55                   	push   %rbp
  8004ae:	48 89 e5             	mov    %rsp,%rbp
  8004b1:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  8004b8:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  8004bf:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8004c6:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8004cd:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8004d4:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8004db:	84 c0                	test   %al,%al
  8004dd:	74 20                	je     8004ff <cprintf+0x52>
  8004df:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8004e3:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8004e7:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8004eb:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8004ef:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8004f3:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8004f7:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8004fb:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8004ff:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800506:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  80050d:	00 00 00 
  800510:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800517:	00 00 00 
  80051a:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80051e:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800525:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80052c:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800533:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80053a:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800541:	48 8b 0a             	mov    (%rdx),%rcx
  800544:	48 89 08             	mov    %rcx,(%rax)
  800547:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80054b:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80054f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800553:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800557:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  80055e:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800565:	48 89 d6             	mov    %rdx,%rsi
  800568:	48 89 c7             	mov    %rax,%rdi
  80056b:	48 b8 01 04 80 00 00 	movabs $0x800401,%rax
  800572:	00 00 00 
  800575:	ff d0                	callq  *%rax
  800577:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80057d:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800583:	c9                   	leaveq 
  800584:	c3                   	retq   

0000000000800585 <printnum>:
  800585:	55                   	push   %rbp
  800586:	48 89 e5             	mov    %rsp,%rbp
  800589:	53                   	push   %rbx
  80058a:	48 83 ec 38          	sub    $0x38,%rsp
  80058e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800592:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800596:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80059a:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  80059d:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  8005a1:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  8005a5:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8005a8:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8005ac:	77 3b                	ja     8005e9 <printnum+0x64>
  8005ae:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8005b1:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  8005b5:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  8005b8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8005bc:	ba 00 00 00 00       	mov    $0x0,%edx
  8005c1:	48 f7 f3             	div    %rbx
  8005c4:	48 89 c2             	mov    %rax,%rdx
  8005c7:	8b 7d cc             	mov    -0x34(%rbp),%edi
  8005ca:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8005cd:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  8005d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005d5:	41 89 f9             	mov    %edi,%r9d
  8005d8:	48 89 c7             	mov    %rax,%rdi
  8005db:	48 b8 85 05 80 00 00 	movabs $0x800585,%rax
  8005e2:	00 00 00 
  8005e5:	ff d0                	callq  *%rax
  8005e7:	eb 1e                	jmp    800607 <printnum+0x82>
  8005e9:	eb 12                	jmp    8005fd <printnum+0x78>
  8005eb:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8005ef:	8b 55 cc             	mov    -0x34(%rbp),%edx
  8005f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005f6:	48 89 ce             	mov    %rcx,%rsi
  8005f9:	89 d7                	mov    %edx,%edi
  8005fb:	ff d0                	callq  *%rax
  8005fd:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  800601:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  800605:	7f e4                	jg     8005eb <printnum+0x66>
  800607:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  80060a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80060e:	ba 00 00 00 00       	mov    $0x0,%edx
  800613:	48 f7 f1             	div    %rcx
  800616:	48 89 d0             	mov    %rdx,%rax
  800619:	48 ba b0 4b 80 00 00 	movabs $0x804bb0,%rdx
  800620:	00 00 00 
  800623:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  800627:	0f be d0             	movsbl %al,%edx
  80062a:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80062e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800632:	48 89 ce             	mov    %rcx,%rsi
  800635:	89 d7                	mov    %edx,%edi
  800637:	ff d0                	callq  *%rax
  800639:	48 83 c4 38          	add    $0x38,%rsp
  80063d:	5b                   	pop    %rbx
  80063e:	5d                   	pop    %rbp
  80063f:	c3                   	retq   

0000000000800640 <getuint>:
  800640:	55                   	push   %rbp
  800641:	48 89 e5             	mov    %rsp,%rbp
  800644:	48 83 ec 1c          	sub    $0x1c,%rsp
  800648:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80064c:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80064f:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800653:	7e 52                	jle    8006a7 <getuint+0x67>
  800655:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800659:	8b 00                	mov    (%rax),%eax
  80065b:	83 f8 30             	cmp    $0x30,%eax
  80065e:	73 24                	jae    800684 <getuint+0x44>
  800660:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800664:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800668:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80066c:	8b 00                	mov    (%rax),%eax
  80066e:	89 c0                	mov    %eax,%eax
  800670:	48 01 d0             	add    %rdx,%rax
  800673:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800677:	8b 12                	mov    (%rdx),%edx
  800679:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80067c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800680:	89 0a                	mov    %ecx,(%rdx)
  800682:	eb 17                	jmp    80069b <getuint+0x5b>
  800684:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800688:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80068c:	48 89 d0             	mov    %rdx,%rax
  80068f:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800693:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800697:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80069b:	48 8b 00             	mov    (%rax),%rax
  80069e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006a2:	e9 a3 00 00 00       	jmpq   80074a <getuint+0x10a>
  8006a7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8006ab:	74 4f                	je     8006fc <getuint+0xbc>
  8006ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006b1:	8b 00                	mov    (%rax),%eax
  8006b3:	83 f8 30             	cmp    $0x30,%eax
  8006b6:	73 24                	jae    8006dc <getuint+0x9c>
  8006b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006bc:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006c0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006c4:	8b 00                	mov    (%rax),%eax
  8006c6:	89 c0                	mov    %eax,%eax
  8006c8:	48 01 d0             	add    %rdx,%rax
  8006cb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006cf:	8b 12                	mov    (%rdx),%edx
  8006d1:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006d4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006d8:	89 0a                	mov    %ecx,(%rdx)
  8006da:	eb 17                	jmp    8006f3 <getuint+0xb3>
  8006dc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006e0:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8006e4:	48 89 d0             	mov    %rdx,%rax
  8006e7:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8006eb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006ef:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8006f3:	48 8b 00             	mov    (%rax),%rax
  8006f6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006fa:	eb 4e                	jmp    80074a <getuint+0x10a>
  8006fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800700:	8b 00                	mov    (%rax),%eax
  800702:	83 f8 30             	cmp    $0x30,%eax
  800705:	73 24                	jae    80072b <getuint+0xeb>
  800707:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80070b:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80070f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800713:	8b 00                	mov    (%rax),%eax
  800715:	89 c0                	mov    %eax,%eax
  800717:	48 01 d0             	add    %rdx,%rax
  80071a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80071e:	8b 12                	mov    (%rdx),%edx
  800720:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800723:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800727:	89 0a                	mov    %ecx,(%rdx)
  800729:	eb 17                	jmp    800742 <getuint+0x102>
  80072b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80072f:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800733:	48 89 d0             	mov    %rdx,%rax
  800736:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80073a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80073e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800742:	8b 00                	mov    (%rax),%eax
  800744:	89 c0                	mov    %eax,%eax
  800746:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80074a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80074e:	c9                   	leaveq 
  80074f:	c3                   	retq   

0000000000800750 <getint>:
  800750:	55                   	push   %rbp
  800751:	48 89 e5             	mov    %rsp,%rbp
  800754:	48 83 ec 1c          	sub    $0x1c,%rsp
  800758:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80075c:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80075f:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800763:	7e 52                	jle    8007b7 <getint+0x67>
  800765:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800769:	8b 00                	mov    (%rax),%eax
  80076b:	83 f8 30             	cmp    $0x30,%eax
  80076e:	73 24                	jae    800794 <getint+0x44>
  800770:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800774:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800778:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80077c:	8b 00                	mov    (%rax),%eax
  80077e:	89 c0                	mov    %eax,%eax
  800780:	48 01 d0             	add    %rdx,%rax
  800783:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800787:	8b 12                	mov    (%rdx),%edx
  800789:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80078c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800790:	89 0a                	mov    %ecx,(%rdx)
  800792:	eb 17                	jmp    8007ab <getint+0x5b>
  800794:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800798:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80079c:	48 89 d0             	mov    %rdx,%rax
  80079f:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8007a3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007a7:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007ab:	48 8b 00             	mov    (%rax),%rax
  8007ae:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007b2:	e9 a3 00 00 00       	jmpq   80085a <getint+0x10a>
  8007b7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8007bb:	74 4f                	je     80080c <getint+0xbc>
  8007bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007c1:	8b 00                	mov    (%rax),%eax
  8007c3:	83 f8 30             	cmp    $0x30,%eax
  8007c6:	73 24                	jae    8007ec <getint+0x9c>
  8007c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007cc:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007d4:	8b 00                	mov    (%rax),%eax
  8007d6:	89 c0                	mov    %eax,%eax
  8007d8:	48 01 d0             	add    %rdx,%rax
  8007db:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007df:	8b 12                	mov    (%rdx),%edx
  8007e1:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007e4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007e8:	89 0a                	mov    %ecx,(%rdx)
  8007ea:	eb 17                	jmp    800803 <getint+0xb3>
  8007ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007f0:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8007f4:	48 89 d0             	mov    %rdx,%rax
  8007f7:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8007fb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007ff:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800803:	48 8b 00             	mov    (%rax),%rax
  800806:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80080a:	eb 4e                	jmp    80085a <getint+0x10a>
  80080c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800810:	8b 00                	mov    (%rax),%eax
  800812:	83 f8 30             	cmp    $0x30,%eax
  800815:	73 24                	jae    80083b <getint+0xeb>
  800817:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80081b:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80081f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800823:	8b 00                	mov    (%rax),%eax
  800825:	89 c0                	mov    %eax,%eax
  800827:	48 01 d0             	add    %rdx,%rax
  80082a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80082e:	8b 12                	mov    (%rdx),%edx
  800830:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800833:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800837:	89 0a                	mov    %ecx,(%rdx)
  800839:	eb 17                	jmp    800852 <getint+0x102>
  80083b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80083f:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800843:	48 89 d0             	mov    %rdx,%rax
  800846:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80084a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80084e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800852:	8b 00                	mov    (%rax),%eax
  800854:	48 98                	cltq   
  800856:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80085a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80085e:	c9                   	leaveq 
  80085f:	c3                   	retq   

0000000000800860 <vprintfmt>:
  800860:	55                   	push   %rbp
  800861:	48 89 e5             	mov    %rsp,%rbp
  800864:	41 54                	push   %r12
  800866:	53                   	push   %rbx
  800867:	48 83 ec 60          	sub    $0x60,%rsp
  80086b:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  80086f:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800873:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800877:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  80087b:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80087f:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800883:	48 8b 0a             	mov    (%rdx),%rcx
  800886:	48 89 08             	mov    %rcx,(%rax)
  800889:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80088d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800891:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800895:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800899:	eb 17                	jmp    8008b2 <vprintfmt+0x52>
  80089b:	85 db                	test   %ebx,%ebx
  80089d:	0f 84 cc 04 00 00    	je     800d6f <vprintfmt+0x50f>
  8008a3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8008a7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8008ab:	48 89 d6             	mov    %rdx,%rsi
  8008ae:	89 df                	mov    %ebx,%edi
  8008b0:	ff d0                	callq  *%rax
  8008b2:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8008b6:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8008ba:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8008be:	0f b6 00             	movzbl (%rax),%eax
  8008c1:	0f b6 d8             	movzbl %al,%ebx
  8008c4:	83 fb 25             	cmp    $0x25,%ebx
  8008c7:	75 d2                	jne    80089b <vprintfmt+0x3b>
  8008c9:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  8008cd:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  8008d4:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8008db:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8008e2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  8008e9:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8008ed:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8008f1:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8008f5:	0f b6 00             	movzbl (%rax),%eax
  8008f8:	0f b6 d8             	movzbl %al,%ebx
  8008fb:	8d 43 dd             	lea    -0x23(%rbx),%eax
  8008fe:	83 f8 55             	cmp    $0x55,%eax
  800901:	0f 87 34 04 00 00    	ja     800d3b <vprintfmt+0x4db>
  800907:	89 c0                	mov    %eax,%eax
  800909:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800910:	00 
  800911:	48 b8 d8 4b 80 00 00 	movabs $0x804bd8,%rax
  800918:	00 00 00 
  80091b:	48 01 d0             	add    %rdx,%rax
  80091e:	48 8b 00             	mov    (%rax),%rax
  800921:	ff e0                	jmpq   *%rax
  800923:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800927:	eb c0                	jmp    8008e9 <vprintfmt+0x89>
  800929:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  80092d:	eb ba                	jmp    8008e9 <vprintfmt+0x89>
  80092f:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800936:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800939:	89 d0                	mov    %edx,%eax
  80093b:	c1 e0 02             	shl    $0x2,%eax
  80093e:	01 d0                	add    %edx,%eax
  800940:	01 c0                	add    %eax,%eax
  800942:	01 d8                	add    %ebx,%eax
  800944:	83 e8 30             	sub    $0x30,%eax
  800947:	89 45 d8             	mov    %eax,-0x28(%rbp)
  80094a:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80094e:	0f b6 00             	movzbl (%rax),%eax
  800951:	0f be d8             	movsbl %al,%ebx
  800954:	83 fb 2f             	cmp    $0x2f,%ebx
  800957:	7e 0c                	jle    800965 <vprintfmt+0x105>
  800959:	83 fb 39             	cmp    $0x39,%ebx
  80095c:	7f 07                	jg     800965 <vprintfmt+0x105>
  80095e:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800963:	eb d1                	jmp    800936 <vprintfmt+0xd6>
  800965:	eb 58                	jmp    8009bf <vprintfmt+0x15f>
  800967:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80096a:	83 f8 30             	cmp    $0x30,%eax
  80096d:	73 17                	jae    800986 <vprintfmt+0x126>
  80096f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800973:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800976:	89 c0                	mov    %eax,%eax
  800978:	48 01 d0             	add    %rdx,%rax
  80097b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80097e:	83 c2 08             	add    $0x8,%edx
  800981:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800984:	eb 0f                	jmp    800995 <vprintfmt+0x135>
  800986:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80098a:	48 89 d0             	mov    %rdx,%rax
  80098d:	48 83 c2 08          	add    $0x8,%rdx
  800991:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800995:	8b 00                	mov    (%rax),%eax
  800997:	89 45 d8             	mov    %eax,-0x28(%rbp)
  80099a:	eb 23                	jmp    8009bf <vprintfmt+0x15f>
  80099c:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8009a0:	79 0c                	jns    8009ae <vprintfmt+0x14e>
  8009a2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  8009a9:	e9 3b ff ff ff       	jmpq   8008e9 <vprintfmt+0x89>
  8009ae:	e9 36 ff ff ff       	jmpq   8008e9 <vprintfmt+0x89>
  8009b3:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  8009ba:	e9 2a ff ff ff       	jmpq   8008e9 <vprintfmt+0x89>
  8009bf:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8009c3:	79 12                	jns    8009d7 <vprintfmt+0x177>
  8009c5:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8009c8:	89 45 dc             	mov    %eax,-0x24(%rbp)
  8009cb:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8009d2:	e9 12 ff ff ff       	jmpq   8008e9 <vprintfmt+0x89>
  8009d7:	e9 0d ff ff ff       	jmpq   8008e9 <vprintfmt+0x89>
  8009dc:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  8009e0:	e9 04 ff ff ff       	jmpq   8008e9 <vprintfmt+0x89>
  8009e5:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009e8:	83 f8 30             	cmp    $0x30,%eax
  8009eb:	73 17                	jae    800a04 <vprintfmt+0x1a4>
  8009ed:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8009f1:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009f4:	89 c0                	mov    %eax,%eax
  8009f6:	48 01 d0             	add    %rdx,%rax
  8009f9:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009fc:	83 c2 08             	add    $0x8,%edx
  8009ff:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a02:	eb 0f                	jmp    800a13 <vprintfmt+0x1b3>
  800a04:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800a08:	48 89 d0             	mov    %rdx,%rax
  800a0b:	48 83 c2 08          	add    $0x8,%rdx
  800a0f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a13:	8b 10                	mov    (%rax),%edx
  800a15:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800a19:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a1d:	48 89 ce             	mov    %rcx,%rsi
  800a20:	89 d7                	mov    %edx,%edi
  800a22:	ff d0                	callq  *%rax
  800a24:	e9 40 03 00 00       	jmpq   800d69 <vprintfmt+0x509>
  800a29:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a2c:	83 f8 30             	cmp    $0x30,%eax
  800a2f:	73 17                	jae    800a48 <vprintfmt+0x1e8>
  800a31:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800a35:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a38:	89 c0                	mov    %eax,%eax
  800a3a:	48 01 d0             	add    %rdx,%rax
  800a3d:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a40:	83 c2 08             	add    $0x8,%edx
  800a43:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a46:	eb 0f                	jmp    800a57 <vprintfmt+0x1f7>
  800a48:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800a4c:	48 89 d0             	mov    %rdx,%rax
  800a4f:	48 83 c2 08          	add    $0x8,%rdx
  800a53:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a57:	8b 18                	mov    (%rax),%ebx
  800a59:	85 db                	test   %ebx,%ebx
  800a5b:	79 02                	jns    800a5f <vprintfmt+0x1ff>
  800a5d:	f7 db                	neg    %ebx
  800a5f:	83 fb 15             	cmp    $0x15,%ebx
  800a62:	7f 16                	jg     800a7a <vprintfmt+0x21a>
  800a64:	48 b8 00 4b 80 00 00 	movabs $0x804b00,%rax
  800a6b:	00 00 00 
  800a6e:	48 63 d3             	movslq %ebx,%rdx
  800a71:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800a75:	4d 85 e4             	test   %r12,%r12
  800a78:	75 2e                	jne    800aa8 <vprintfmt+0x248>
  800a7a:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800a7e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a82:	89 d9                	mov    %ebx,%ecx
  800a84:	48 ba c1 4b 80 00 00 	movabs $0x804bc1,%rdx
  800a8b:	00 00 00 
  800a8e:	48 89 c7             	mov    %rax,%rdi
  800a91:	b8 00 00 00 00       	mov    $0x0,%eax
  800a96:	49 b8 78 0d 80 00 00 	movabs $0x800d78,%r8
  800a9d:	00 00 00 
  800aa0:	41 ff d0             	callq  *%r8
  800aa3:	e9 c1 02 00 00       	jmpq   800d69 <vprintfmt+0x509>
  800aa8:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800aac:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ab0:	4c 89 e1             	mov    %r12,%rcx
  800ab3:	48 ba ca 4b 80 00 00 	movabs $0x804bca,%rdx
  800aba:	00 00 00 
  800abd:	48 89 c7             	mov    %rax,%rdi
  800ac0:	b8 00 00 00 00       	mov    $0x0,%eax
  800ac5:	49 b8 78 0d 80 00 00 	movabs $0x800d78,%r8
  800acc:	00 00 00 
  800acf:	41 ff d0             	callq  *%r8
  800ad2:	e9 92 02 00 00       	jmpq   800d69 <vprintfmt+0x509>
  800ad7:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ada:	83 f8 30             	cmp    $0x30,%eax
  800add:	73 17                	jae    800af6 <vprintfmt+0x296>
  800adf:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800ae3:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ae6:	89 c0                	mov    %eax,%eax
  800ae8:	48 01 d0             	add    %rdx,%rax
  800aeb:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800aee:	83 c2 08             	add    $0x8,%edx
  800af1:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800af4:	eb 0f                	jmp    800b05 <vprintfmt+0x2a5>
  800af6:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800afa:	48 89 d0             	mov    %rdx,%rax
  800afd:	48 83 c2 08          	add    $0x8,%rdx
  800b01:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b05:	4c 8b 20             	mov    (%rax),%r12
  800b08:	4d 85 e4             	test   %r12,%r12
  800b0b:	75 0a                	jne    800b17 <vprintfmt+0x2b7>
  800b0d:	49 bc cd 4b 80 00 00 	movabs $0x804bcd,%r12
  800b14:	00 00 00 
  800b17:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b1b:	7e 3f                	jle    800b5c <vprintfmt+0x2fc>
  800b1d:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800b21:	74 39                	je     800b5c <vprintfmt+0x2fc>
  800b23:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b26:	48 98                	cltq   
  800b28:	48 89 c6             	mov    %rax,%rsi
  800b2b:	4c 89 e7             	mov    %r12,%rdi
  800b2e:	48 b8 24 10 80 00 00 	movabs $0x801024,%rax
  800b35:	00 00 00 
  800b38:	ff d0                	callq  *%rax
  800b3a:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800b3d:	eb 17                	jmp    800b56 <vprintfmt+0x2f6>
  800b3f:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800b43:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800b47:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b4b:	48 89 ce             	mov    %rcx,%rsi
  800b4e:	89 d7                	mov    %edx,%edi
  800b50:	ff d0                	callq  *%rax
  800b52:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800b56:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b5a:	7f e3                	jg     800b3f <vprintfmt+0x2df>
  800b5c:	eb 37                	jmp    800b95 <vprintfmt+0x335>
  800b5e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800b62:	74 1e                	je     800b82 <vprintfmt+0x322>
  800b64:	83 fb 1f             	cmp    $0x1f,%ebx
  800b67:	7e 05                	jle    800b6e <vprintfmt+0x30e>
  800b69:	83 fb 7e             	cmp    $0x7e,%ebx
  800b6c:	7e 14                	jle    800b82 <vprintfmt+0x322>
  800b6e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b72:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b76:	48 89 d6             	mov    %rdx,%rsi
  800b79:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800b7e:	ff d0                	callq  *%rax
  800b80:	eb 0f                	jmp    800b91 <vprintfmt+0x331>
  800b82:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b86:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b8a:	48 89 d6             	mov    %rdx,%rsi
  800b8d:	89 df                	mov    %ebx,%edi
  800b8f:	ff d0                	callq  *%rax
  800b91:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800b95:	4c 89 e0             	mov    %r12,%rax
  800b98:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800b9c:	0f b6 00             	movzbl (%rax),%eax
  800b9f:	0f be d8             	movsbl %al,%ebx
  800ba2:	85 db                	test   %ebx,%ebx
  800ba4:	74 10                	je     800bb6 <vprintfmt+0x356>
  800ba6:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800baa:	78 b2                	js     800b5e <vprintfmt+0x2fe>
  800bac:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800bb0:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800bb4:	79 a8                	jns    800b5e <vprintfmt+0x2fe>
  800bb6:	eb 16                	jmp    800bce <vprintfmt+0x36e>
  800bb8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bbc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bc0:	48 89 d6             	mov    %rdx,%rsi
  800bc3:	bf 20 00 00 00       	mov    $0x20,%edi
  800bc8:	ff d0                	callq  *%rax
  800bca:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800bce:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800bd2:	7f e4                	jg     800bb8 <vprintfmt+0x358>
  800bd4:	e9 90 01 00 00       	jmpq   800d69 <vprintfmt+0x509>
  800bd9:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800bdd:	be 03 00 00 00       	mov    $0x3,%esi
  800be2:	48 89 c7             	mov    %rax,%rdi
  800be5:	48 b8 50 07 80 00 00 	movabs $0x800750,%rax
  800bec:	00 00 00 
  800bef:	ff d0                	callq  *%rax
  800bf1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800bf5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bf9:	48 85 c0             	test   %rax,%rax
  800bfc:	79 1d                	jns    800c1b <vprintfmt+0x3bb>
  800bfe:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c02:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c06:	48 89 d6             	mov    %rdx,%rsi
  800c09:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800c0e:	ff d0                	callq  *%rax
  800c10:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c14:	48 f7 d8             	neg    %rax
  800c17:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c1b:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c22:	e9 d5 00 00 00       	jmpq   800cfc <vprintfmt+0x49c>
  800c27:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c2b:	be 03 00 00 00       	mov    $0x3,%esi
  800c30:	48 89 c7             	mov    %rax,%rdi
  800c33:	48 b8 40 06 80 00 00 	movabs $0x800640,%rax
  800c3a:	00 00 00 
  800c3d:	ff d0                	callq  *%rax
  800c3f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c43:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c4a:	e9 ad 00 00 00       	jmpq   800cfc <vprintfmt+0x49c>
  800c4f:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c53:	be 03 00 00 00       	mov    $0x3,%esi
  800c58:	48 89 c7             	mov    %rax,%rdi
  800c5b:	48 b8 40 06 80 00 00 	movabs $0x800640,%rax
  800c62:	00 00 00 
  800c65:	ff d0                	callq  *%rax
  800c67:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c6b:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800c72:	e9 85 00 00 00       	jmpq   800cfc <vprintfmt+0x49c>
  800c77:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c7b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c7f:	48 89 d6             	mov    %rdx,%rsi
  800c82:	bf 30 00 00 00       	mov    $0x30,%edi
  800c87:	ff d0                	callq  *%rax
  800c89:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c8d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c91:	48 89 d6             	mov    %rdx,%rsi
  800c94:	bf 78 00 00 00       	mov    $0x78,%edi
  800c99:	ff d0                	callq  *%rax
  800c9b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c9e:	83 f8 30             	cmp    $0x30,%eax
  800ca1:	73 17                	jae    800cba <vprintfmt+0x45a>
  800ca3:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800ca7:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800caa:	89 c0                	mov    %eax,%eax
  800cac:	48 01 d0             	add    %rdx,%rax
  800caf:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800cb2:	83 c2 08             	add    $0x8,%edx
  800cb5:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800cb8:	eb 0f                	jmp    800cc9 <vprintfmt+0x469>
  800cba:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800cbe:	48 89 d0             	mov    %rdx,%rax
  800cc1:	48 83 c2 08          	add    $0x8,%rdx
  800cc5:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800cc9:	48 8b 00             	mov    (%rax),%rax
  800ccc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cd0:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800cd7:	eb 23                	jmp    800cfc <vprintfmt+0x49c>
  800cd9:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800cdd:	be 03 00 00 00       	mov    $0x3,%esi
  800ce2:	48 89 c7             	mov    %rax,%rdi
  800ce5:	48 b8 40 06 80 00 00 	movabs $0x800640,%rax
  800cec:	00 00 00 
  800cef:	ff d0                	callq  *%rax
  800cf1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cf5:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800cfc:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800d01:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800d04:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800d07:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d0b:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800d0f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d13:	45 89 c1             	mov    %r8d,%r9d
  800d16:	41 89 f8             	mov    %edi,%r8d
  800d19:	48 89 c7             	mov    %rax,%rdi
  800d1c:	48 b8 85 05 80 00 00 	movabs $0x800585,%rax
  800d23:	00 00 00 
  800d26:	ff d0                	callq  *%rax
  800d28:	eb 3f                	jmp    800d69 <vprintfmt+0x509>
  800d2a:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d2e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d32:	48 89 d6             	mov    %rdx,%rsi
  800d35:	89 df                	mov    %ebx,%edi
  800d37:	ff d0                	callq  *%rax
  800d39:	eb 2e                	jmp    800d69 <vprintfmt+0x509>
  800d3b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d3f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d43:	48 89 d6             	mov    %rdx,%rsi
  800d46:	bf 25 00 00 00       	mov    $0x25,%edi
  800d4b:	ff d0                	callq  *%rax
  800d4d:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800d52:	eb 05                	jmp    800d59 <vprintfmt+0x4f9>
  800d54:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800d59:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800d5d:	48 83 e8 01          	sub    $0x1,%rax
  800d61:	0f b6 00             	movzbl (%rax),%eax
  800d64:	3c 25                	cmp    $0x25,%al
  800d66:	75 ec                	jne    800d54 <vprintfmt+0x4f4>
  800d68:	90                   	nop
  800d69:	90                   	nop
  800d6a:	e9 43 fb ff ff       	jmpq   8008b2 <vprintfmt+0x52>
  800d6f:	48 83 c4 60          	add    $0x60,%rsp
  800d73:	5b                   	pop    %rbx
  800d74:	41 5c                	pop    %r12
  800d76:	5d                   	pop    %rbp
  800d77:	c3                   	retq   

0000000000800d78 <printfmt>:
  800d78:	55                   	push   %rbp
  800d79:	48 89 e5             	mov    %rsp,%rbp
  800d7c:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800d83:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800d8a:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800d91:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800d98:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800d9f:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800da6:	84 c0                	test   %al,%al
  800da8:	74 20                	je     800dca <printfmt+0x52>
  800daa:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800dae:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800db2:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800db6:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800dba:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800dbe:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800dc2:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800dc6:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800dca:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800dd1:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800dd8:	00 00 00 
  800ddb:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800de2:	00 00 00 
  800de5:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800de9:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800df0:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800df7:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800dfe:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800e05:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800e0c:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800e13:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800e1a:	48 89 c7             	mov    %rax,%rdi
  800e1d:	48 b8 60 08 80 00 00 	movabs $0x800860,%rax
  800e24:	00 00 00 
  800e27:	ff d0                	callq  *%rax
  800e29:	c9                   	leaveq 
  800e2a:	c3                   	retq   

0000000000800e2b <sprintputch>:
  800e2b:	55                   	push   %rbp
  800e2c:	48 89 e5             	mov    %rsp,%rbp
  800e2f:	48 83 ec 10          	sub    $0x10,%rsp
  800e33:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800e36:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800e3a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e3e:	8b 40 10             	mov    0x10(%rax),%eax
  800e41:	8d 50 01             	lea    0x1(%rax),%edx
  800e44:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e48:	89 50 10             	mov    %edx,0x10(%rax)
  800e4b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e4f:	48 8b 10             	mov    (%rax),%rdx
  800e52:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e56:	48 8b 40 08          	mov    0x8(%rax),%rax
  800e5a:	48 39 c2             	cmp    %rax,%rdx
  800e5d:	73 17                	jae    800e76 <sprintputch+0x4b>
  800e5f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e63:	48 8b 00             	mov    (%rax),%rax
  800e66:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800e6a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800e6e:	48 89 0a             	mov    %rcx,(%rdx)
  800e71:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800e74:	88 10                	mov    %dl,(%rax)
  800e76:	c9                   	leaveq 
  800e77:	c3                   	retq   

0000000000800e78 <vsnprintf>:
  800e78:	55                   	push   %rbp
  800e79:	48 89 e5             	mov    %rsp,%rbp
  800e7c:	48 83 ec 50          	sub    $0x50,%rsp
  800e80:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800e84:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800e87:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800e8b:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800e8f:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800e93:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800e97:	48 8b 0a             	mov    (%rdx),%rcx
  800e9a:	48 89 08             	mov    %rcx,(%rax)
  800e9d:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ea1:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800ea5:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800ea9:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800ead:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800eb1:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800eb5:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800eb8:	48 98                	cltq   
  800eba:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800ebe:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ec2:	48 01 d0             	add    %rdx,%rax
  800ec5:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800ec9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800ed0:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800ed5:	74 06                	je     800edd <vsnprintf+0x65>
  800ed7:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800edb:	7f 07                	jg     800ee4 <vsnprintf+0x6c>
  800edd:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800ee2:	eb 2f                	jmp    800f13 <vsnprintf+0x9b>
  800ee4:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800ee8:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800eec:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800ef0:	48 89 c6             	mov    %rax,%rsi
  800ef3:	48 bf 2b 0e 80 00 00 	movabs $0x800e2b,%rdi
  800efa:	00 00 00 
  800efd:	48 b8 60 08 80 00 00 	movabs $0x800860,%rax
  800f04:	00 00 00 
  800f07:	ff d0                	callq  *%rax
  800f09:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800f0d:	c6 00 00             	movb   $0x0,(%rax)
  800f10:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800f13:	c9                   	leaveq 
  800f14:	c3                   	retq   

0000000000800f15 <snprintf>:
  800f15:	55                   	push   %rbp
  800f16:	48 89 e5             	mov    %rsp,%rbp
  800f19:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800f20:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800f27:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800f2d:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800f34:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800f3b:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f42:	84 c0                	test   %al,%al
  800f44:	74 20                	je     800f66 <snprintf+0x51>
  800f46:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800f4a:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f4e:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f52:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f56:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f5a:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800f5e:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800f62:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800f66:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800f6d:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800f74:	00 00 00 
  800f77:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800f7e:	00 00 00 
  800f81:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800f85:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800f8c:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800f93:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800f9a:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800fa1:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800fa8:	48 8b 0a             	mov    (%rdx),%rcx
  800fab:	48 89 08             	mov    %rcx,(%rax)
  800fae:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800fb2:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800fb6:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800fba:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800fbe:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  800fc5:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  800fcc:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  800fd2:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800fd9:	48 89 c7             	mov    %rax,%rdi
  800fdc:	48 b8 78 0e 80 00 00 	movabs $0x800e78,%rax
  800fe3:	00 00 00 
  800fe6:	ff d0                	callq  *%rax
  800fe8:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800fee:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800ff4:	c9                   	leaveq 
  800ff5:	c3                   	retq   

0000000000800ff6 <strlen>:
  800ff6:	55                   	push   %rbp
  800ff7:	48 89 e5             	mov    %rsp,%rbp
  800ffa:	48 83 ec 18          	sub    $0x18,%rsp
  800ffe:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801002:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801009:	eb 09                	jmp    801014 <strlen+0x1e>
  80100b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80100f:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801014:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801018:	0f b6 00             	movzbl (%rax),%eax
  80101b:	84 c0                	test   %al,%al
  80101d:	75 ec                	jne    80100b <strlen+0x15>
  80101f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801022:	c9                   	leaveq 
  801023:	c3                   	retq   

0000000000801024 <strnlen>:
  801024:	55                   	push   %rbp
  801025:	48 89 e5             	mov    %rsp,%rbp
  801028:	48 83 ec 20          	sub    $0x20,%rsp
  80102c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801030:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801034:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80103b:	eb 0e                	jmp    80104b <strnlen+0x27>
  80103d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801041:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801046:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  80104b:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  801050:	74 0b                	je     80105d <strnlen+0x39>
  801052:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801056:	0f b6 00             	movzbl (%rax),%eax
  801059:	84 c0                	test   %al,%al
  80105b:	75 e0                	jne    80103d <strnlen+0x19>
  80105d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801060:	c9                   	leaveq 
  801061:	c3                   	retq   

0000000000801062 <strcpy>:
  801062:	55                   	push   %rbp
  801063:	48 89 e5             	mov    %rsp,%rbp
  801066:	48 83 ec 20          	sub    $0x20,%rsp
  80106a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80106e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801072:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801076:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80107a:	90                   	nop
  80107b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80107f:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801083:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801087:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80108b:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80108f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801093:	0f b6 12             	movzbl (%rdx),%edx
  801096:	88 10                	mov    %dl,(%rax)
  801098:	0f b6 00             	movzbl (%rax),%eax
  80109b:	84 c0                	test   %al,%al
  80109d:	75 dc                	jne    80107b <strcpy+0x19>
  80109f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010a3:	c9                   	leaveq 
  8010a4:	c3                   	retq   

00000000008010a5 <strcat>:
  8010a5:	55                   	push   %rbp
  8010a6:	48 89 e5             	mov    %rsp,%rbp
  8010a9:	48 83 ec 20          	sub    $0x20,%rsp
  8010ad:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010b1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010b5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010b9:	48 89 c7             	mov    %rax,%rdi
  8010bc:	48 b8 f6 0f 80 00 00 	movabs $0x800ff6,%rax
  8010c3:	00 00 00 
  8010c6:	ff d0                	callq  *%rax
  8010c8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8010cb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8010ce:	48 63 d0             	movslq %eax,%rdx
  8010d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010d5:	48 01 c2             	add    %rax,%rdx
  8010d8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8010dc:	48 89 c6             	mov    %rax,%rsi
  8010df:	48 89 d7             	mov    %rdx,%rdi
  8010e2:	48 b8 62 10 80 00 00 	movabs $0x801062,%rax
  8010e9:	00 00 00 
  8010ec:	ff d0                	callq  *%rax
  8010ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010f2:	c9                   	leaveq 
  8010f3:	c3                   	retq   

00000000008010f4 <strncpy>:
  8010f4:	55                   	push   %rbp
  8010f5:	48 89 e5             	mov    %rsp,%rbp
  8010f8:	48 83 ec 28          	sub    $0x28,%rsp
  8010fc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801100:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801104:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801108:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80110c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801110:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801117:	00 
  801118:	eb 2a                	jmp    801144 <strncpy+0x50>
  80111a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80111e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801122:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801126:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80112a:	0f b6 12             	movzbl (%rdx),%edx
  80112d:	88 10                	mov    %dl,(%rax)
  80112f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801133:	0f b6 00             	movzbl (%rax),%eax
  801136:	84 c0                	test   %al,%al
  801138:	74 05                	je     80113f <strncpy+0x4b>
  80113a:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  80113f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801144:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801148:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80114c:	72 cc                	jb     80111a <strncpy+0x26>
  80114e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801152:	c9                   	leaveq 
  801153:	c3                   	retq   

0000000000801154 <strlcpy>:
  801154:	55                   	push   %rbp
  801155:	48 89 e5             	mov    %rsp,%rbp
  801158:	48 83 ec 28          	sub    $0x28,%rsp
  80115c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801160:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801164:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801168:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80116c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801170:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801175:	74 3d                	je     8011b4 <strlcpy+0x60>
  801177:	eb 1d                	jmp    801196 <strlcpy+0x42>
  801179:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80117d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801181:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801185:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801189:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80118d:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801191:	0f b6 12             	movzbl (%rdx),%edx
  801194:	88 10                	mov    %dl,(%rax)
  801196:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  80119b:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8011a0:	74 0b                	je     8011ad <strlcpy+0x59>
  8011a2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8011a6:	0f b6 00             	movzbl (%rax),%eax
  8011a9:	84 c0                	test   %al,%al
  8011ab:	75 cc                	jne    801179 <strlcpy+0x25>
  8011ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011b1:	c6 00 00             	movb   $0x0,(%rax)
  8011b4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011bc:	48 29 c2             	sub    %rax,%rdx
  8011bf:	48 89 d0             	mov    %rdx,%rax
  8011c2:	c9                   	leaveq 
  8011c3:	c3                   	retq   

00000000008011c4 <strcmp>:
  8011c4:	55                   	push   %rbp
  8011c5:	48 89 e5             	mov    %rsp,%rbp
  8011c8:	48 83 ec 10          	sub    $0x10,%rsp
  8011cc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8011d0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8011d4:	eb 0a                	jmp    8011e0 <strcmp+0x1c>
  8011d6:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8011db:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8011e0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011e4:	0f b6 00             	movzbl (%rax),%eax
  8011e7:	84 c0                	test   %al,%al
  8011e9:	74 12                	je     8011fd <strcmp+0x39>
  8011eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011ef:	0f b6 10             	movzbl (%rax),%edx
  8011f2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011f6:	0f b6 00             	movzbl (%rax),%eax
  8011f9:	38 c2                	cmp    %al,%dl
  8011fb:	74 d9                	je     8011d6 <strcmp+0x12>
  8011fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801201:	0f b6 00             	movzbl (%rax),%eax
  801204:	0f b6 d0             	movzbl %al,%edx
  801207:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80120b:	0f b6 00             	movzbl (%rax),%eax
  80120e:	0f b6 c0             	movzbl %al,%eax
  801211:	29 c2                	sub    %eax,%edx
  801213:	89 d0                	mov    %edx,%eax
  801215:	c9                   	leaveq 
  801216:	c3                   	retq   

0000000000801217 <strncmp>:
  801217:	55                   	push   %rbp
  801218:	48 89 e5             	mov    %rsp,%rbp
  80121b:	48 83 ec 18          	sub    $0x18,%rsp
  80121f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801223:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801227:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80122b:	eb 0f                	jmp    80123c <strncmp+0x25>
  80122d:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801232:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801237:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80123c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801241:	74 1d                	je     801260 <strncmp+0x49>
  801243:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801247:	0f b6 00             	movzbl (%rax),%eax
  80124a:	84 c0                	test   %al,%al
  80124c:	74 12                	je     801260 <strncmp+0x49>
  80124e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801252:	0f b6 10             	movzbl (%rax),%edx
  801255:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801259:	0f b6 00             	movzbl (%rax),%eax
  80125c:	38 c2                	cmp    %al,%dl
  80125e:	74 cd                	je     80122d <strncmp+0x16>
  801260:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801265:	75 07                	jne    80126e <strncmp+0x57>
  801267:	b8 00 00 00 00       	mov    $0x0,%eax
  80126c:	eb 18                	jmp    801286 <strncmp+0x6f>
  80126e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801272:	0f b6 00             	movzbl (%rax),%eax
  801275:	0f b6 d0             	movzbl %al,%edx
  801278:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80127c:	0f b6 00             	movzbl (%rax),%eax
  80127f:	0f b6 c0             	movzbl %al,%eax
  801282:	29 c2                	sub    %eax,%edx
  801284:	89 d0                	mov    %edx,%eax
  801286:	c9                   	leaveq 
  801287:	c3                   	retq   

0000000000801288 <strchr>:
  801288:	55                   	push   %rbp
  801289:	48 89 e5             	mov    %rsp,%rbp
  80128c:	48 83 ec 0c          	sub    $0xc,%rsp
  801290:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801294:	89 f0                	mov    %esi,%eax
  801296:	88 45 f4             	mov    %al,-0xc(%rbp)
  801299:	eb 17                	jmp    8012b2 <strchr+0x2a>
  80129b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80129f:	0f b6 00             	movzbl (%rax),%eax
  8012a2:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8012a5:	75 06                	jne    8012ad <strchr+0x25>
  8012a7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012ab:	eb 15                	jmp    8012c2 <strchr+0x3a>
  8012ad:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012b6:	0f b6 00             	movzbl (%rax),%eax
  8012b9:	84 c0                	test   %al,%al
  8012bb:	75 de                	jne    80129b <strchr+0x13>
  8012bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8012c2:	c9                   	leaveq 
  8012c3:	c3                   	retq   

00000000008012c4 <strfind>:
  8012c4:	55                   	push   %rbp
  8012c5:	48 89 e5             	mov    %rsp,%rbp
  8012c8:	48 83 ec 0c          	sub    $0xc,%rsp
  8012cc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012d0:	89 f0                	mov    %esi,%eax
  8012d2:	88 45 f4             	mov    %al,-0xc(%rbp)
  8012d5:	eb 13                	jmp    8012ea <strfind+0x26>
  8012d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012db:	0f b6 00             	movzbl (%rax),%eax
  8012de:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8012e1:	75 02                	jne    8012e5 <strfind+0x21>
  8012e3:	eb 10                	jmp    8012f5 <strfind+0x31>
  8012e5:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012ea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012ee:	0f b6 00             	movzbl (%rax),%eax
  8012f1:	84 c0                	test   %al,%al
  8012f3:	75 e2                	jne    8012d7 <strfind+0x13>
  8012f5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012f9:	c9                   	leaveq 
  8012fa:	c3                   	retq   

00000000008012fb <memset>:
  8012fb:	55                   	push   %rbp
  8012fc:	48 89 e5             	mov    %rsp,%rbp
  8012ff:	48 83 ec 18          	sub    $0x18,%rsp
  801303:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801307:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80130a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80130e:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801313:	75 06                	jne    80131b <memset+0x20>
  801315:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801319:	eb 69                	jmp    801384 <memset+0x89>
  80131b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80131f:	83 e0 03             	and    $0x3,%eax
  801322:	48 85 c0             	test   %rax,%rax
  801325:	75 48                	jne    80136f <memset+0x74>
  801327:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80132b:	83 e0 03             	and    $0x3,%eax
  80132e:	48 85 c0             	test   %rax,%rax
  801331:	75 3c                	jne    80136f <memset+0x74>
  801333:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  80133a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80133d:	c1 e0 18             	shl    $0x18,%eax
  801340:	89 c2                	mov    %eax,%edx
  801342:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801345:	c1 e0 10             	shl    $0x10,%eax
  801348:	09 c2                	or     %eax,%edx
  80134a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80134d:	c1 e0 08             	shl    $0x8,%eax
  801350:	09 d0                	or     %edx,%eax
  801352:	09 45 f4             	or     %eax,-0xc(%rbp)
  801355:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801359:	48 c1 e8 02          	shr    $0x2,%rax
  80135d:	48 89 c1             	mov    %rax,%rcx
  801360:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801364:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801367:	48 89 d7             	mov    %rdx,%rdi
  80136a:	fc                   	cld    
  80136b:	f3 ab                	rep stos %eax,%es:(%rdi)
  80136d:	eb 11                	jmp    801380 <memset+0x85>
  80136f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801373:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801376:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80137a:	48 89 d7             	mov    %rdx,%rdi
  80137d:	fc                   	cld    
  80137e:	f3 aa                	rep stos %al,%es:(%rdi)
  801380:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801384:	c9                   	leaveq 
  801385:	c3                   	retq   

0000000000801386 <memmove>:
  801386:	55                   	push   %rbp
  801387:	48 89 e5             	mov    %rsp,%rbp
  80138a:	48 83 ec 28          	sub    $0x28,%rsp
  80138e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801392:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801396:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80139a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80139e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8013a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013a6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8013aa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013ae:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8013b2:	0f 83 88 00 00 00    	jae    801440 <memmove+0xba>
  8013b8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013bc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013c0:	48 01 d0             	add    %rdx,%rax
  8013c3:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8013c7:	76 77                	jbe    801440 <memmove+0xba>
  8013c9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013cd:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8013d1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013d5:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8013d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013dd:	83 e0 03             	and    $0x3,%eax
  8013e0:	48 85 c0             	test   %rax,%rax
  8013e3:	75 3b                	jne    801420 <memmove+0x9a>
  8013e5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013e9:	83 e0 03             	and    $0x3,%eax
  8013ec:	48 85 c0             	test   %rax,%rax
  8013ef:	75 2f                	jne    801420 <memmove+0x9a>
  8013f1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013f5:	83 e0 03             	and    $0x3,%eax
  8013f8:	48 85 c0             	test   %rax,%rax
  8013fb:	75 23                	jne    801420 <memmove+0x9a>
  8013fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801401:	48 83 e8 04          	sub    $0x4,%rax
  801405:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801409:	48 83 ea 04          	sub    $0x4,%rdx
  80140d:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801411:	48 c1 e9 02          	shr    $0x2,%rcx
  801415:	48 89 c7             	mov    %rax,%rdi
  801418:	48 89 d6             	mov    %rdx,%rsi
  80141b:	fd                   	std    
  80141c:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80141e:	eb 1d                	jmp    80143d <memmove+0xb7>
  801420:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801424:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801428:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80142c:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801430:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801434:	48 89 d7             	mov    %rdx,%rdi
  801437:	48 89 c1             	mov    %rax,%rcx
  80143a:	fd                   	std    
  80143b:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80143d:	fc                   	cld    
  80143e:	eb 57                	jmp    801497 <memmove+0x111>
  801440:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801444:	83 e0 03             	and    $0x3,%eax
  801447:	48 85 c0             	test   %rax,%rax
  80144a:	75 36                	jne    801482 <memmove+0xfc>
  80144c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801450:	83 e0 03             	and    $0x3,%eax
  801453:	48 85 c0             	test   %rax,%rax
  801456:	75 2a                	jne    801482 <memmove+0xfc>
  801458:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80145c:	83 e0 03             	and    $0x3,%eax
  80145f:	48 85 c0             	test   %rax,%rax
  801462:	75 1e                	jne    801482 <memmove+0xfc>
  801464:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801468:	48 c1 e8 02          	shr    $0x2,%rax
  80146c:	48 89 c1             	mov    %rax,%rcx
  80146f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801473:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801477:	48 89 c7             	mov    %rax,%rdi
  80147a:	48 89 d6             	mov    %rdx,%rsi
  80147d:	fc                   	cld    
  80147e:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801480:	eb 15                	jmp    801497 <memmove+0x111>
  801482:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801486:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80148a:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80148e:	48 89 c7             	mov    %rax,%rdi
  801491:	48 89 d6             	mov    %rdx,%rsi
  801494:	fc                   	cld    
  801495:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801497:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80149b:	c9                   	leaveq 
  80149c:	c3                   	retq   

000000000080149d <memcpy>:
  80149d:	55                   	push   %rbp
  80149e:	48 89 e5             	mov    %rsp,%rbp
  8014a1:	48 83 ec 18          	sub    $0x18,%rsp
  8014a5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8014a9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8014ad:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8014b1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8014b5:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8014b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014bd:	48 89 ce             	mov    %rcx,%rsi
  8014c0:	48 89 c7             	mov    %rax,%rdi
  8014c3:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  8014ca:	00 00 00 
  8014cd:	ff d0                	callq  *%rax
  8014cf:	c9                   	leaveq 
  8014d0:	c3                   	retq   

00000000008014d1 <memcmp>:
  8014d1:	55                   	push   %rbp
  8014d2:	48 89 e5             	mov    %rsp,%rbp
  8014d5:	48 83 ec 28          	sub    $0x28,%rsp
  8014d9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014dd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014e1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014e9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8014ed:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014f1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8014f5:	eb 36                	jmp    80152d <memcmp+0x5c>
  8014f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014fb:	0f b6 10             	movzbl (%rax),%edx
  8014fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801502:	0f b6 00             	movzbl (%rax),%eax
  801505:	38 c2                	cmp    %al,%dl
  801507:	74 1a                	je     801523 <memcmp+0x52>
  801509:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80150d:	0f b6 00             	movzbl (%rax),%eax
  801510:	0f b6 d0             	movzbl %al,%edx
  801513:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801517:	0f b6 00             	movzbl (%rax),%eax
  80151a:	0f b6 c0             	movzbl %al,%eax
  80151d:	29 c2                	sub    %eax,%edx
  80151f:	89 d0                	mov    %edx,%eax
  801521:	eb 20                	jmp    801543 <memcmp+0x72>
  801523:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801528:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80152d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801531:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801535:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801539:	48 85 c0             	test   %rax,%rax
  80153c:	75 b9                	jne    8014f7 <memcmp+0x26>
  80153e:	b8 00 00 00 00       	mov    $0x0,%eax
  801543:	c9                   	leaveq 
  801544:	c3                   	retq   

0000000000801545 <memfind>:
  801545:	55                   	push   %rbp
  801546:	48 89 e5             	mov    %rsp,%rbp
  801549:	48 83 ec 28          	sub    $0x28,%rsp
  80154d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801551:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801554:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801558:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80155c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801560:	48 01 d0             	add    %rdx,%rax
  801563:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801567:	eb 15                	jmp    80157e <memfind+0x39>
  801569:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80156d:	0f b6 10             	movzbl (%rax),%edx
  801570:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801573:	38 c2                	cmp    %al,%dl
  801575:	75 02                	jne    801579 <memfind+0x34>
  801577:	eb 0f                	jmp    801588 <memfind+0x43>
  801579:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80157e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801582:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801586:	72 e1                	jb     801569 <memfind+0x24>
  801588:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80158c:	c9                   	leaveq 
  80158d:	c3                   	retq   

000000000080158e <strtol>:
  80158e:	55                   	push   %rbp
  80158f:	48 89 e5             	mov    %rsp,%rbp
  801592:	48 83 ec 34          	sub    $0x34,%rsp
  801596:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80159a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80159e:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8015a1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8015a8:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8015af:	00 
  8015b0:	eb 05                	jmp    8015b7 <strtol+0x29>
  8015b2:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015b7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015bb:	0f b6 00             	movzbl (%rax),%eax
  8015be:	3c 20                	cmp    $0x20,%al
  8015c0:	74 f0                	je     8015b2 <strtol+0x24>
  8015c2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015c6:	0f b6 00             	movzbl (%rax),%eax
  8015c9:	3c 09                	cmp    $0x9,%al
  8015cb:	74 e5                	je     8015b2 <strtol+0x24>
  8015cd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015d1:	0f b6 00             	movzbl (%rax),%eax
  8015d4:	3c 2b                	cmp    $0x2b,%al
  8015d6:	75 07                	jne    8015df <strtol+0x51>
  8015d8:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015dd:	eb 17                	jmp    8015f6 <strtol+0x68>
  8015df:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015e3:	0f b6 00             	movzbl (%rax),%eax
  8015e6:	3c 2d                	cmp    $0x2d,%al
  8015e8:	75 0c                	jne    8015f6 <strtol+0x68>
  8015ea:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015ef:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8015f6:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8015fa:	74 06                	je     801602 <strtol+0x74>
  8015fc:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801600:	75 28                	jne    80162a <strtol+0x9c>
  801602:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801606:	0f b6 00             	movzbl (%rax),%eax
  801609:	3c 30                	cmp    $0x30,%al
  80160b:	75 1d                	jne    80162a <strtol+0x9c>
  80160d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801611:	48 83 c0 01          	add    $0x1,%rax
  801615:	0f b6 00             	movzbl (%rax),%eax
  801618:	3c 78                	cmp    $0x78,%al
  80161a:	75 0e                	jne    80162a <strtol+0x9c>
  80161c:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801621:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801628:	eb 2c                	jmp    801656 <strtol+0xc8>
  80162a:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80162e:	75 19                	jne    801649 <strtol+0xbb>
  801630:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801634:	0f b6 00             	movzbl (%rax),%eax
  801637:	3c 30                	cmp    $0x30,%al
  801639:	75 0e                	jne    801649 <strtol+0xbb>
  80163b:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801640:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801647:	eb 0d                	jmp    801656 <strtol+0xc8>
  801649:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80164d:	75 07                	jne    801656 <strtol+0xc8>
  80164f:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801656:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80165a:	0f b6 00             	movzbl (%rax),%eax
  80165d:	3c 2f                	cmp    $0x2f,%al
  80165f:	7e 1d                	jle    80167e <strtol+0xf0>
  801661:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801665:	0f b6 00             	movzbl (%rax),%eax
  801668:	3c 39                	cmp    $0x39,%al
  80166a:	7f 12                	jg     80167e <strtol+0xf0>
  80166c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801670:	0f b6 00             	movzbl (%rax),%eax
  801673:	0f be c0             	movsbl %al,%eax
  801676:	83 e8 30             	sub    $0x30,%eax
  801679:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80167c:	eb 4e                	jmp    8016cc <strtol+0x13e>
  80167e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801682:	0f b6 00             	movzbl (%rax),%eax
  801685:	3c 60                	cmp    $0x60,%al
  801687:	7e 1d                	jle    8016a6 <strtol+0x118>
  801689:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80168d:	0f b6 00             	movzbl (%rax),%eax
  801690:	3c 7a                	cmp    $0x7a,%al
  801692:	7f 12                	jg     8016a6 <strtol+0x118>
  801694:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801698:	0f b6 00             	movzbl (%rax),%eax
  80169b:	0f be c0             	movsbl %al,%eax
  80169e:	83 e8 57             	sub    $0x57,%eax
  8016a1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016a4:	eb 26                	jmp    8016cc <strtol+0x13e>
  8016a6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016aa:	0f b6 00             	movzbl (%rax),%eax
  8016ad:	3c 40                	cmp    $0x40,%al
  8016af:	7e 48                	jle    8016f9 <strtol+0x16b>
  8016b1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016b5:	0f b6 00             	movzbl (%rax),%eax
  8016b8:	3c 5a                	cmp    $0x5a,%al
  8016ba:	7f 3d                	jg     8016f9 <strtol+0x16b>
  8016bc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016c0:	0f b6 00             	movzbl (%rax),%eax
  8016c3:	0f be c0             	movsbl %al,%eax
  8016c6:	83 e8 37             	sub    $0x37,%eax
  8016c9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016cc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8016cf:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  8016d2:	7c 02                	jl     8016d6 <strtol+0x148>
  8016d4:	eb 23                	jmp    8016f9 <strtol+0x16b>
  8016d6:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8016db:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8016de:	48 98                	cltq   
  8016e0:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8016e5:	48 89 c2             	mov    %rax,%rdx
  8016e8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8016eb:	48 98                	cltq   
  8016ed:	48 01 d0             	add    %rdx,%rax
  8016f0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8016f4:	e9 5d ff ff ff       	jmpq   801656 <strtol+0xc8>
  8016f9:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8016fe:	74 0b                	je     80170b <strtol+0x17d>
  801700:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801704:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801708:	48 89 10             	mov    %rdx,(%rax)
  80170b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80170f:	74 09                	je     80171a <strtol+0x18c>
  801711:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801715:	48 f7 d8             	neg    %rax
  801718:	eb 04                	jmp    80171e <strtol+0x190>
  80171a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80171e:	c9                   	leaveq 
  80171f:	c3                   	retq   

0000000000801720 <strstr>:
  801720:	55                   	push   %rbp
  801721:	48 89 e5             	mov    %rsp,%rbp
  801724:	48 83 ec 30          	sub    $0x30,%rsp
  801728:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80172c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801730:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801734:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801738:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80173c:	0f b6 00             	movzbl (%rax),%eax
  80173f:	88 45 ff             	mov    %al,-0x1(%rbp)
  801742:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801746:	75 06                	jne    80174e <strstr+0x2e>
  801748:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80174c:	eb 6b                	jmp    8017b9 <strstr+0x99>
  80174e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801752:	48 89 c7             	mov    %rax,%rdi
  801755:	48 b8 f6 0f 80 00 00 	movabs $0x800ff6,%rax
  80175c:	00 00 00 
  80175f:	ff d0                	callq  *%rax
  801761:	48 98                	cltq   
  801763:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801767:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80176b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80176f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801773:	0f b6 00             	movzbl (%rax),%eax
  801776:	88 45 ef             	mov    %al,-0x11(%rbp)
  801779:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  80177d:	75 07                	jne    801786 <strstr+0x66>
  80177f:	b8 00 00 00 00       	mov    $0x0,%eax
  801784:	eb 33                	jmp    8017b9 <strstr+0x99>
  801786:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  80178a:	3a 45 ff             	cmp    -0x1(%rbp),%al
  80178d:	75 d8                	jne    801767 <strstr+0x47>
  80178f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801793:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801797:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80179b:	48 89 ce             	mov    %rcx,%rsi
  80179e:	48 89 c7             	mov    %rax,%rdi
  8017a1:	48 b8 17 12 80 00 00 	movabs $0x801217,%rax
  8017a8:	00 00 00 
  8017ab:	ff d0                	callq  *%rax
  8017ad:	85 c0                	test   %eax,%eax
  8017af:	75 b6                	jne    801767 <strstr+0x47>
  8017b1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017b5:	48 83 e8 01          	sub    $0x1,%rax
  8017b9:	c9                   	leaveq 
  8017ba:	c3                   	retq   

00000000008017bb <syscall>:
  8017bb:	55                   	push   %rbp
  8017bc:	48 89 e5             	mov    %rsp,%rbp
  8017bf:	53                   	push   %rbx
  8017c0:	48 83 ec 48          	sub    $0x48,%rsp
  8017c4:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8017c7:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8017ca:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8017ce:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  8017d2:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8017d6:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  8017da:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8017dd:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8017e1:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8017e5:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8017e9:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8017ed:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  8017f1:	4c 89 c3             	mov    %r8,%rbx
  8017f4:	cd 30                	int    $0x30
  8017f6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8017fa:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8017fe:	74 3e                	je     80183e <syscall+0x83>
  801800:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801805:	7e 37                	jle    80183e <syscall+0x83>
  801807:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80180b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80180e:	49 89 d0             	mov    %rdx,%r8
  801811:	89 c1                	mov    %eax,%ecx
  801813:	48 ba 88 4e 80 00 00 	movabs $0x804e88,%rdx
  80181a:	00 00 00 
  80181d:	be 24 00 00 00       	mov    $0x24,%esi
  801822:	48 bf a5 4e 80 00 00 	movabs $0x804ea5,%rdi
  801829:	00 00 00 
  80182c:	b8 00 00 00 00       	mov    $0x0,%eax
  801831:	49 b9 74 02 80 00 00 	movabs $0x800274,%r9
  801838:	00 00 00 
  80183b:	41 ff d1             	callq  *%r9
  80183e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801842:	48 83 c4 48          	add    $0x48,%rsp
  801846:	5b                   	pop    %rbx
  801847:	5d                   	pop    %rbp
  801848:	c3                   	retq   

0000000000801849 <sys_cputs>:
  801849:	55                   	push   %rbp
  80184a:	48 89 e5             	mov    %rsp,%rbp
  80184d:	48 83 ec 20          	sub    $0x20,%rsp
  801851:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801855:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801859:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80185d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801861:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801868:	00 
  801869:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80186f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801875:	48 89 d1             	mov    %rdx,%rcx
  801878:	48 89 c2             	mov    %rax,%rdx
  80187b:	be 00 00 00 00       	mov    $0x0,%esi
  801880:	bf 00 00 00 00       	mov    $0x0,%edi
  801885:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  80188c:	00 00 00 
  80188f:	ff d0                	callq  *%rax
  801891:	c9                   	leaveq 
  801892:	c3                   	retq   

0000000000801893 <sys_cgetc>:
  801893:	55                   	push   %rbp
  801894:	48 89 e5             	mov    %rsp,%rbp
  801897:	48 83 ec 10          	sub    $0x10,%rsp
  80189b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8018a2:	00 
  8018a3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018a9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018af:	b9 00 00 00 00       	mov    $0x0,%ecx
  8018b4:	ba 00 00 00 00       	mov    $0x0,%edx
  8018b9:	be 00 00 00 00       	mov    $0x0,%esi
  8018be:	bf 01 00 00 00       	mov    $0x1,%edi
  8018c3:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  8018ca:	00 00 00 
  8018cd:	ff d0                	callq  *%rax
  8018cf:	c9                   	leaveq 
  8018d0:	c3                   	retq   

00000000008018d1 <sys_env_destroy>:
  8018d1:	55                   	push   %rbp
  8018d2:	48 89 e5             	mov    %rsp,%rbp
  8018d5:	48 83 ec 10          	sub    $0x10,%rsp
  8018d9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8018dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018df:	48 98                	cltq   
  8018e1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8018e8:	00 
  8018e9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018ef:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018f5:	b9 00 00 00 00       	mov    $0x0,%ecx
  8018fa:	48 89 c2             	mov    %rax,%rdx
  8018fd:	be 01 00 00 00       	mov    $0x1,%esi
  801902:	bf 03 00 00 00       	mov    $0x3,%edi
  801907:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  80190e:	00 00 00 
  801911:	ff d0                	callq  *%rax
  801913:	c9                   	leaveq 
  801914:	c3                   	retq   

0000000000801915 <sys_getenvid>:
  801915:	55                   	push   %rbp
  801916:	48 89 e5             	mov    %rsp,%rbp
  801919:	48 83 ec 10          	sub    $0x10,%rsp
  80191d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801924:	00 
  801925:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80192b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801931:	b9 00 00 00 00       	mov    $0x0,%ecx
  801936:	ba 00 00 00 00       	mov    $0x0,%edx
  80193b:	be 00 00 00 00       	mov    $0x0,%esi
  801940:	bf 02 00 00 00       	mov    $0x2,%edi
  801945:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  80194c:	00 00 00 
  80194f:	ff d0                	callq  *%rax
  801951:	c9                   	leaveq 
  801952:	c3                   	retq   

0000000000801953 <sys_yield>:
  801953:	55                   	push   %rbp
  801954:	48 89 e5             	mov    %rsp,%rbp
  801957:	48 83 ec 10          	sub    $0x10,%rsp
  80195b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801962:	00 
  801963:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801969:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80196f:	b9 00 00 00 00       	mov    $0x0,%ecx
  801974:	ba 00 00 00 00       	mov    $0x0,%edx
  801979:	be 00 00 00 00       	mov    $0x0,%esi
  80197e:	bf 0b 00 00 00       	mov    $0xb,%edi
  801983:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  80198a:	00 00 00 
  80198d:	ff d0                	callq  *%rax
  80198f:	c9                   	leaveq 
  801990:	c3                   	retq   

0000000000801991 <sys_page_alloc>:
  801991:	55                   	push   %rbp
  801992:	48 89 e5             	mov    %rsp,%rbp
  801995:	48 83 ec 20          	sub    $0x20,%rsp
  801999:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80199c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019a0:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8019a3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8019a6:	48 63 c8             	movslq %eax,%rcx
  8019a9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019b0:	48 98                	cltq   
  8019b2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8019b9:	00 
  8019ba:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019c0:	49 89 c8             	mov    %rcx,%r8
  8019c3:	48 89 d1             	mov    %rdx,%rcx
  8019c6:	48 89 c2             	mov    %rax,%rdx
  8019c9:	be 01 00 00 00       	mov    $0x1,%esi
  8019ce:	bf 04 00 00 00       	mov    $0x4,%edi
  8019d3:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  8019da:	00 00 00 
  8019dd:	ff d0                	callq  *%rax
  8019df:	c9                   	leaveq 
  8019e0:	c3                   	retq   

00000000008019e1 <sys_page_map>:
  8019e1:	55                   	push   %rbp
  8019e2:	48 89 e5             	mov    %rsp,%rbp
  8019e5:	48 83 ec 30          	sub    $0x30,%rsp
  8019e9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019ec:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019f0:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8019f3:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  8019f7:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  8019fb:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8019fe:	48 63 c8             	movslq %eax,%rcx
  801a01:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801a05:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a08:	48 63 f0             	movslq %eax,%rsi
  801a0b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a0f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a12:	48 98                	cltq   
  801a14:	48 89 0c 24          	mov    %rcx,(%rsp)
  801a18:	49 89 f9             	mov    %rdi,%r9
  801a1b:	49 89 f0             	mov    %rsi,%r8
  801a1e:	48 89 d1             	mov    %rdx,%rcx
  801a21:	48 89 c2             	mov    %rax,%rdx
  801a24:	be 01 00 00 00       	mov    $0x1,%esi
  801a29:	bf 05 00 00 00       	mov    $0x5,%edi
  801a2e:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801a35:	00 00 00 
  801a38:	ff d0                	callq  *%rax
  801a3a:	c9                   	leaveq 
  801a3b:	c3                   	retq   

0000000000801a3c <sys_page_unmap>:
  801a3c:	55                   	push   %rbp
  801a3d:	48 89 e5             	mov    %rsp,%rbp
  801a40:	48 83 ec 20          	sub    $0x20,%rsp
  801a44:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a47:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a4b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a4f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a52:	48 98                	cltq   
  801a54:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a5b:	00 
  801a5c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a62:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a68:	48 89 d1             	mov    %rdx,%rcx
  801a6b:	48 89 c2             	mov    %rax,%rdx
  801a6e:	be 01 00 00 00       	mov    $0x1,%esi
  801a73:	bf 06 00 00 00       	mov    $0x6,%edi
  801a78:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801a7f:	00 00 00 
  801a82:	ff d0                	callq  *%rax
  801a84:	c9                   	leaveq 
  801a85:	c3                   	retq   

0000000000801a86 <sys_env_set_status>:
  801a86:	55                   	push   %rbp
  801a87:	48 89 e5             	mov    %rsp,%rbp
  801a8a:	48 83 ec 10          	sub    $0x10,%rsp
  801a8e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a91:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801a94:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a97:	48 63 d0             	movslq %eax,%rdx
  801a9a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a9d:	48 98                	cltq   
  801a9f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801aa6:	00 
  801aa7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801aad:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ab3:	48 89 d1             	mov    %rdx,%rcx
  801ab6:	48 89 c2             	mov    %rax,%rdx
  801ab9:	be 01 00 00 00       	mov    $0x1,%esi
  801abe:	bf 08 00 00 00       	mov    $0x8,%edi
  801ac3:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801aca:	00 00 00 
  801acd:	ff d0                	callq  *%rax
  801acf:	c9                   	leaveq 
  801ad0:	c3                   	retq   

0000000000801ad1 <sys_env_set_trapframe>:
  801ad1:	55                   	push   %rbp
  801ad2:	48 89 e5             	mov    %rsp,%rbp
  801ad5:	48 83 ec 20          	sub    $0x20,%rsp
  801ad9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801adc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ae0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ae4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ae7:	48 98                	cltq   
  801ae9:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801af0:	00 
  801af1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801af7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801afd:	48 89 d1             	mov    %rdx,%rcx
  801b00:	48 89 c2             	mov    %rax,%rdx
  801b03:	be 01 00 00 00       	mov    $0x1,%esi
  801b08:	bf 09 00 00 00       	mov    $0x9,%edi
  801b0d:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801b14:	00 00 00 
  801b17:	ff d0                	callq  *%rax
  801b19:	c9                   	leaveq 
  801b1a:	c3                   	retq   

0000000000801b1b <sys_env_set_pgfault_upcall>:
  801b1b:	55                   	push   %rbp
  801b1c:	48 89 e5             	mov    %rsp,%rbp
  801b1f:	48 83 ec 20          	sub    $0x20,%rsp
  801b23:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b26:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b2a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b31:	48 98                	cltq   
  801b33:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b3a:	00 
  801b3b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b41:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b47:	48 89 d1             	mov    %rdx,%rcx
  801b4a:	48 89 c2             	mov    %rax,%rdx
  801b4d:	be 01 00 00 00       	mov    $0x1,%esi
  801b52:	bf 0a 00 00 00       	mov    $0xa,%edi
  801b57:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801b5e:	00 00 00 
  801b61:	ff d0                	callq  *%rax
  801b63:	c9                   	leaveq 
  801b64:	c3                   	retq   

0000000000801b65 <sys_ipc_try_send>:
  801b65:	55                   	push   %rbp
  801b66:	48 89 e5             	mov    %rsp,%rbp
  801b69:	48 83 ec 20          	sub    $0x20,%rsp
  801b6d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b70:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b74:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801b78:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801b7b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b7e:	48 63 f0             	movslq %eax,%rsi
  801b81:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801b85:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b88:	48 98                	cltq   
  801b8a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b8e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b95:	00 
  801b96:	49 89 f1             	mov    %rsi,%r9
  801b99:	49 89 c8             	mov    %rcx,%r8
  801b9c:	48 89 d1             	mov    %rdx,%rcx
  801b9f:	48 89 c2             	mov    %rax,%rdx
  801ba2:	be 00 00 00 00       	mov    $0x0,%esi
  801ba7:	bf 0c 00 00 00       	mov    $0xc,%edi
  801bac:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801bb3:	00 00 00 
  801bb6:	ff d0                	callq  *%rax
  801bb8:	c9                   	leaveq 
  801bb9:	c3                   	retq   

0000000000801bba <sys_ipc_recv>:
  801bba:	55                   	push   %rbp
  801bbb:	48 89 e5             	mov    %rsp,%rbp
  801bbe:	48 83 ec 10          	sub    $0x10,%rsp
  801bc2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801bc6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bca:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bd1:	00 
  801bd2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bd8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bde:	b9 00 00 00 00       	mov    $0x0,%ecx
  801be3:	48 89 c2             	mov    %rax,%rdx
  801be6:	be 01 00 00 00       	mov    $0x1,%esi
  801beb:	bf 0d 00 00 00       	mov    $0xd,%edi
  801bf0:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801bf7:	00 00 00 
  801bfa:	ff d0                	callq  *%rax
  801bfc:	c9                   	leaveq 
  801bfd:	c3                   	retq   

0000000000801bfe <sys_time_msec>:
  801bfe:	55                   	push   %rbp
  801bff:	48 89 e5             	mov    %rsp,%rbp
  801c02:	48 83 ec 10          	sub    $0x10,%rsp
  801c06:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c0d:	00 
  801c0e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c14:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c1a:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c1f:	ba 00 00 00 00       	mov    $0x0,%edx
  801c24:	be 00 00 00 00       	mov    $0x0,%esi
  801c29:	bf 0e 00 00 00       	mov    $0xe,%edi
  801c2e:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801c35:	00 00 00 
  801c38:	ff d0                	callq  *%rax
  801c3a:	c9                   	leaveq 
  801c3b:	c3                   	retq   

0000000000801c3c <sys_net_transmit>:
  801c3c:	55                   	push   %rbp
  801c3d:	48 89 e5             	mov    %rsp,%rbp
  801c40:	48 83 ec 20          	sub    $0x20,%rsp
  801c44:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c48:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801c4b:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801c4e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c52:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c59:	00 
  801c5a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c60:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c66:	48 89 d1             	mov    %rdx,%rcx
  801c69:	48 89 c2             	mov    %rax,%rdx
  801c6c:	be 00 00 00 00       	mov    $0x0,%esi
  801c71:	bf 0f 00 00 00       	mov    $0xf,%edi
  801c76:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801c7d:	00 00 00 
  801c80:	ff d0                	callq  *%rax
  801c82:	c9                   	leaveq 
  801c83:	c3                   	retq   

0000000000801c84 <sys_net_receive>:
  801c84:	55                   	push   %rbp
  801c85:	48 89 e5             	mov    %rsp,%rbp
  801c88:	48 83 ec 20          	sub    $0x20,%rsp
  801c8c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c90:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801c93:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801c96:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c9a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ca1:	00 
  801ca2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ca8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cae:	48 89 d1             	mov    %rdx,%rcx
  801cb1:	48 89 c2             	mov    %rax,%rdx
  801cb4:	be 00 00 00 00       	mov    $0x0,%esi
  801cb9:	bf 10 00 00 00       	mov    $0x10,%edi
  801cbe:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801cc5:	00 00 00 
  801cc8:	ff d0                	callq  *%rax
  801cca:	c9                   	leaveq 
  801ccb:	c3                   	retq   

0000000000801ccc <sys_ept_map>:
  801ccc:	55                   	push   %rbp
  801ccd:	48 89 e5             	mov    %rsp,%rbp
  801cd0:	48 83 ec 30          	sub    $0x30,%rsp
  801cd4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801cd7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801cdb:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801cde:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801ce2:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801ce6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801ce9:	48 63 c8             	movslq %eax,%rcx
  801cec:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801cf0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801cf3:	48 63 f0             	movslq %eax,%rsi
  801cf6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801cfa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cfd:	48 98                	cltq   
  801cff:	48 89 0c 24          	mov    %rcx,(%rsp)
  801d03:	49 89 f9             	mov    %rdi,%r9
  801d06:	49 89 f0             	mov    %rsi,%r8
  801d09:	48 89 d1             	mov    %rdx,%rcx
  801d0c:	48 89 c2             	mov    %rax,%rdx
  801d0f:	be 00 00 00 00       	mov    $0x0,%esi
  801d14:	bf 11 00 00 00       	mov    $0x11,%edi
  801d19:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801d20:	00 00 00 
  801d23:	ff d0                	callq  *%rax
  801d25:	c9                   	leaveq 
  801d26:	c3                   	retq   

0000000000801d27 <sys_env_mkguest>:
  801d27:	55                   	push   %rbp
  801d28:	48 89 e5             	mov    %rsp,%rbp
  801d2b:	48 83 ec 20          	sub    $0x20,%rsp
  801d2f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d33:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d37:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d3b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d3f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d46:	00 
  801d47:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d4d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d53:	48 89 d1             	mov    %rdx,%rcx
  801d56:	48 89 c2             	mov    %rax,%rdx
  801d59:	be 00 00 00 00       	mov    $0x0,%esi
  801d5e:	bf 12 00 00 00       	mov    $0x12,%edi
  801d63:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801d6a:	00 00 00 
  801d6d:	ff d0                	callq  *%rax
  801d6f:	c9                   	leaveq 
  801d70:	c3                   	retq   

0000000000801d71 <pgfault>:
  801d71:	55                   	push   %rbp
  801d72:	48 89 e5             	mov    %rsp,%rbp
  801d75:	48 83 ec 30          	sub    $0x30,%rsp
  801d79:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801d7d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d81:	48 8b 00             	mov    (%rax),%rax
  801d84:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  801d88:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d8c:	48 8b 40 08          	mov    0x8(%rax),%rax
  801d90:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801d93:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d96:	83 e0 02             	and    $0x2,%eax
  801d99:	85 c0                	test   %eax,%eax
  801d9b:	75 40                	jne    801ddd <pgfault+0x6c>
  801d9d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801da1:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  801da8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801dac:	49 89 d0             	mov    %rdx,%r8
  801daf:	48 89 c1             	mov    %rax,%rcx
  801db2:	48 ba b8 4e 80 00 00 	movabs $0x804eb8,%rdx
  801db9:	00 00 00 
  801dbc:	be 1f 00 00 00       	mov    $0x1f,%esi
  801dc1:	48 bf d1 4e 80 00 00 	movabs $0x804ed1,%rdi
  801dc8:	00 00 00 
  801dcb:	b8 00 00 00 00       	mov    $0x0,%eax
  801dd0:	49 b9 74 02 80 00 00 	movabs $0x800274,%r9
  801dd7:	00 00 00 
  801dda:	41 ff d1             	callq  *%r9
  801ddd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801de1:	48 c1 e8 0c          	shr    $0xc,%rax
  801de5:	48 89 c2             	mov    %rax,%rdx
  801de8:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801def:	01 00 00 
  801df2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801df6:	25 07 08 00 00       	and    $0x807,%eax
  801dfb:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  801e01:	74 4e                	je     801e51 <pgfault+0xe0>
  801e03:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801e07:	48 c1 e8 0c          	shr    $0xc,%rax
  801e0b:	48 89 c2             	mov    %rax,%rdx
  801e0e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801e15:	01 00 00 
  801e18:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  801e1c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801e20:	49 89 d0             	mov    %rdx,%r8
  801e23:	48 89 c1             	mov    %rax,%rcx
  801e26:	48 ba e0 4e 80 00 00 	movabs $0x804ee0,%rdx
  801e2d:	00 00 00 
  801e30:	be 22 00 00 00       	mov    $0x22,%esi
  801e35:	48 bf d1 4e 80 00 00 	movabs $0x804ed1,%rdi
  801e3c:	00 00 00 
  801e3f:	b8 00 00 00 00       	mov    $0x0,%eax
  801e44:	49 b9 74 02 80 00 00 	movabs $0x800274,%r9
  801e4b:	00 00 00 
  801e4e:	41 ff d1             	callq  *%r9
  801e51:	ba 07 00 00 00       	mov    $0x7,%edx
  801e56:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  801e5b:	bf 00 00 00 00       	mov    $0x0,%edi
  801e60:	48 b8 91 19 80 00 00 	movabs $0x801991,%rax
  801e67:	00 00 00 
  801e6a:	ff d0                	callq  *%rax
  801e6c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801e6f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801e73:	79 30                	jns    801ea5 <pgfault+0x134>
  801e75:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e78:	89 c1                	mov    %eax,%ecx
  801e7a:	48 ba 0b 4f 80 00 00 	movabs $0x804f0b,%rdx
  801e81:	00 00 00 
  801e84:	be 30 00 00 00       	mov    $0x30,%esi
  801e89:	48 bf d1 4e 80 00 00 	movabs $0x804ed1,%rdi
  801e90:	00 00 00 
  801e93:	b8 00 00 00 00       	mov    $0x0,%eax
  801e98:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  801e9f:	00 00 00 
  801ea2:	41 ff d0             	callq  *%r8
  801ea5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801ea9:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801ead:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801eb1:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  801eb7:	ba 00 10 00 00       	mov    $0x1000,%edx
  801ebc:	48 89 c6             	mov    %rax,%rsi
  801ebf:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  801ec4:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  801ecb:	00 00 00 
  801ece:	ff d0                	callq  *%rax
  801ed0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801ed4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801ed8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801edc:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  801ee2:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  801ee8:	48 89 c1             	mov    %rax,%rcx
  801eeb:	ba 00 00 00 00       	mov    $0x0,%edx
  801ef0:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  801ef5:	bf 00 00 00 00       	mov    $0x0,%edi
  801efa:	48 b8 e1 19 80 00 00 	movabs $0x8019e1,%rax
  801f01:	00 00 00 
  801f04:	ff d0                	callq  *%rax
  801f06:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801f09:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801f0d:	79 30                	jns    801f3f <pgfault+0x1ce>
  801f0f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f12:	89 c1                	mov    %eax,%ecx
  801f14:	48 ba 1e 4f 80 00 00 	movabs $0x804f1e,%rdx
  801f1b:	00 00 00 
  801f1e:	be 35 00 00 00       	mov    $0x35,%esi
  801f23:	48 bf d1 4e 80 00 00 	movabs $0x804ed1,%rdi
  801f2a:	00 00 00 
  801f2d:	b8 00 00 00 00       	mov    $0x0,%eax
  801f32:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  801f39:	00 00 00 
  801f3c:	41 ff d0             	callq  *%r8
  801f3f:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  801f44:	bf 00 00 00 00       	mov    $0x0,%edi
  801f49:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  801f50:	00 00 00 
  801f53:	ff d0                	callq  *%rax
  801f55:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801f58:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801f5c:	79 30                	jns    801f8e <pgfault+0x21d>
  801f5e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f61:	89 c1                	mov    %eax,%ecx
  801f63:	48 ba 2f 4f 80 00 00 	movabs $0x804f2f,%rdx
  801f6a:	00 00 00 
  801f6d:	be 39 00 00 00       	mov    $0x39,%esi
  801f72:	48 bf d1 4e 80 00 00 	movabs $0x804ed1,%rdi
  801f79:	00 00 00 
  801f7c:	b8 00 00 00 00       	mov    $0x0,%eax
  801f81:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  801f88:	00 00 00 
  801f8b:	41 ff d0             	callq  *%r8
  801f8e:	c9                   	leaveq 
  801f8f:	c3                   	retq   

0000000000801f90 <duppage>:
  801f90:	55                   	push   %rbp
  801f91:	48 89 e5             	mov    %rsp,%rbp
  801f94:	48 83 ec 30          	sub    $0x30,%rsp
  801f98:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801f9b:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801f9e:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801fa1:	c1 e0 0c             	shl    $0xc,%eax
  801fa4:	89 c0                	mov    %eax,%eax
  801fa6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801faa:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801fb1:	01 00 00 
  801fb4:	8b 55 d8             	mov    -0x28(%rbp),%edx
  801fb7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801fbb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801fbf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801fc3:	25 02 08 00 00       	and    $0x802,%eax
  801fc8:	48 85 c0             	test   %rax,%rax
  801fcb:	74 0e                	je     801fdb <duppage+0x4b>
  801fcd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801fd1:	25 00 04 00 00       	and    $0x400,%eax
  801fd6:	48 85 c0             	test   %rax,%rax
  801fd9:	74 70                	je     80204b <duppage+0xbb>
  801fdb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801fdf:	25 07 0e 00 00       	and    $0xe07,%eax
  801fe4:	89 c6                	mov    %eax,%esi
  801fe6:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  801fea:	8b 55 dc             	mov    -0x24(%rbp),%edx
  801fed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ff1:	41 89 f0             	mov    %esi,%r8d
  801ff4:	48 89 c6             	mov    %rax,%rsi
  801ff7:	bf 00 00 00 00       	mov    $0x0,%edi
  801ffc:	48 b8 e1 19 80 00 00 	movabs $0x8019e1,%rax
  802003:	00 00 00 
  802006:	ff d0                	callq  *%rax
  802008:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80200b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80200f:	79 30                	jns    802041 <duppage+0xb1>
  802011:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802014:	89 c1                	mov    %eax,%ecx
  802016:	48 ba 1e 4f 80 00 00 	movabs $0x804f1e,%rdx
  80201d:	00 00 00 
  802020:	be 63 00 00 00       	mov    $0x63,%esi
  802025:	48 bf d1 4e 80 00 00 	movabs $0x804ed1,%rdi
  80202c:	00 00 00 
  80202f:	b8 00 00 00 00       	mov    $0x0,%eax
  802034:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  80203b:	00 00 00 
  80203e:	41 ff d0             	callq  *%r8
  802041:	b8 00 00 00 00       	mov    $0x0,%eax
  802046:	e9 c4 00 00 00       	jmpq   80210f <duppage+0x17f>
  80204b:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  80204f:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802052:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802056:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  80205c:	48 89 c6             	mov    %rax,%rsi
  80205f:	bf 00 00 00 00       	mov    $0x0,%edi
  802064:	48 b8 e1 19 80 00 00 	movabs $0x8019e1,%rax
  80206b:	00 00 00 
  80206e:	ff d0                	callq  *%rax
  802070:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802073:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802077:	79 30                	jns    8020a9 <duppage+0x119>
  802079:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80207c:	89 c1                	mov    %eax,%ecx
  80207e:	48 ba 1e 4f 80 00 00 	movabs $0x804f1e,%rdx
  802085:	00 00 00 
  802088:	be 7e 00 00 00       	mov    $0x7e,%esi
  80208d:	48 bf d1 4e 80 00 00 	movabs $0x804ed1,%rdi
  802094:	00 00 00 
  802097:	b8 00 00 00 00       	mov    $0x0,%eax
  80209c:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  8020a3:	00 00 00 
  8020a6:	41 ff d0             	callq  *%r8
  8020a9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8020ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8020b1:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8020b7:	48 89 d1             	mov    %rdx,%rcx
  8020ba:	ba 00 00 00 00       	mov    $0x0,%edx
  8020bf:	48 89 c6             	mov    %rax,%rsi
  8020c2:	bf 00 00 00 00       	mov    $0x0,%edi
  8020c7:	48 b8 e1 19 80 00 00 	movabs $0x8019e1,%rax
  8020ce:	00 00 00 
  8020d1:	ff d0                	callq  *%rax
  8020d3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8020d6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8020da:	79 30                	jns    80210c <duppage+0x17c>
  8020dc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8020df:	89 c1                	mov    %eax,%ecx
  8020e1:	48 ba 1e 4f 80 00 00 	movabs $0x804f1e,%rdx
  8020e8:	00 00 00 
  8020eb:	be 80 00 00 00       	mov    $0x80,%esi
  8020f0:	48 bf d1 4e 80 00 00 	movabs $0x804ed1,%rdi
  8020f7:	00 00 00 
  8020fa:	b8 00 00 00 00       	mov    $0x0,%eax
  8020ff:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  802106:	00 00 00 
  802109:	41 ff d0             	callq  *%r8
  80210c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80210f:	c9                   	leaveq 
  802110:	c3                   	retq   

0000000000802111 <fork>:
  802111:	55                   	push   %rbp
  802112:	48 89 e5             	mov    %rsp,%rbp
  802115:	48 83 ec 20          	sub    $0x20,%rsp
  802119:	48 bf 71 1d 80 00 00 	movabs $0x801d71,%rdi
  802120:	00 00 00 
  802123:	48 b8 9d 47 80 00 00 	movabs $0x80479d,%rax
  80212a:	00 00 00 
  80212d:	ff d0                	callq  *%rax
  80212f:	b8 07 00 00 00       	mov    $0x7,%eax
  802134:	cd 30                	int    $0x30
  802136:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802139:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80213c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80213f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802143:	79 08                	jns    80214d <fork+0x3c>
  802145:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802148:	e9 09 02 00 00       	jmpq   802356 <fork+0x245>
  80214d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802151:	75 3e                	jne    802191 <fork+0x80>
  802153:	48 b8 15 19 80 00 00 	movabs $0x801915,%rax
  80215a:	00 00 00 
  80215d:	ff d0                	callq  *%rax
  80215f:	25 ff 03 00 00       	and    $0x3ff,%eax
  802164:	48 98                	cltq   
  802166:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80216d:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802174:	00 00 00 
  802177:	48 01 c2             	add    %rax,%rdx
  80217a:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802181:	00 00 00 
  802184:	48 89 10             	mov    %rdx,(%rax)
  802187:	b8 00 00 00 00       	mov    $0x0,%eax
  80218c:	e9 c5 01 00 00       	jmpq   802356 <fork+0x245>
  802191:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802198:	e9 a4 00 00 00       	jmpq   802241 <fork+0x130>
  80219d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021a0:	c1 f8 12             	sar    $0x12,%eax
  8021a3:	89 c2                	mov    %eax,%edx
  8021a5:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  8021ac:	01 00 00 
  8021af:	48 63 d2             	movslq %edx,%rdx
  8021b2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021b6:	83 e0 01             	and    $0x1,%eax
  8021b9:	48 85 c0             	test   %rax,%rax
  8021bc:	74 21                	je     8021df <fork+0xce>
  8021be:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021c1:	c1 f8 09             	sar    $0x9,%eax
  8021c4:	89 c2                	mov    %eax,%edx
  8021c6:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8021cd:	01 00 00 
  8021d0:	48 63 d2             	movslq %edx,%rdx
  8021d3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021d7:	83 e0 01             	and    $0x1,%eax
  8021da:	48 85 c0             	test   %rax,%rax
  8021dd:	75 09                	jne    8021e8 <fork+0xd7>
  8021df:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  8021e6:	eb 59                	jmp    802241 <fork+0x130>
  8021e8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021eb:	05 00 02 00 00       	add    $0x200,%eax
  8021f0:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8021f3:	eb 44                	jmp    802239 <fork+0x128>
  8021f5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8021fc:	01 00 00 
  8021ff:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802202:	48 63 d2             	movslq %edx,%rdx
  802205:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802209:	83 e0 05             	and    $0x5,%eax
  80220c:	48 83 f8 05          	cmp    $0x5,%rax
  802210:	74 02                	je     802214 <fork+0x103>
  802212:	eb 21                	jmp    802235 <fork+0x124>
  802214:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  80221b:	75 02                	jne    80221f <fork+0x10e>
  80221d:	eb 16                	jmp    802235 <fork+0x124>
  80221f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802222:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802225:	89 d6                	mov    %edx,%esi
  802227:	89 c7                	mov    %eax,%edi
  802229:	48 b8 90 1f 80 00 00 	movabs $0x801f90,%rax
  802230:	00 00 00 
  802233:	ff d0                	callq  *%rax
  802235:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802239:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80223c:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  80223f:	7c b4                	jl     8021f5 <fork+0xe4>
  802241:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802244:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  802249:	0f 86 4e ff ff ff    	jbe    80219d <fork+0x8c>
  80224f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802252:	ba 07 00 00 00       	mov    $0x7,%edx
  802257:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  80225c:	89 c7                	mov    %eax,%edi
  80225e:	48 b8 91 19 80 00 00 	movabs $0x801991,%rax
  802265:	00 00 00 
  802268:	ff d0                	callq  *%rax
  80226a:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80226d:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802271:	79 30                	jns    8022a3 <fork+0x192>
  802273:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802276:	89 c1                	mov    %eax,%ecx
  802278:	48 ba 48 4f 80 00 00 	movabs $0x804f48,%rdx
  80227f:	00 00 00 
  802282:	be bc 00 00 00       	mov    $0xbc,%esi
  802287:	48 bf d1 4e 80 00 00 	movabs $0x804ed1,%rdi
  80228e:	00 00 00 
  802291:	b8 00 00 00 00       	mov    $0x0,%eax
  802296:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  80229d:	00 00 00 
  8022a0:	41 ff d0             	callq  *%r8
  8022a3:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8022aa:	00 00 00 
  8022ad:	48 8b 00             	mov    (%rax),%rax
  8022b0:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  8022b7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8022ba:	48 89 d6             	mov    %rdx,%rsi
  8022bd:	89 c7                	mov    %eax,%edi
  8022bf:	48 b8 1b 1b 80 00 00 	movabs $0x801b1b,%rax
  8022c6:	00 00 00 
  8022c9:	ff d0                	callq  *%rax
  8022cb:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8022ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8022d2:	79 30                	jns    802304 <fork+0x1f3>
  8022d4:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8022d7:	89 c1                	mov    %eax,%ecx
  8022d9:	48 ba 68 4f 80 00 00 	movabs $0x804f68,%rdx
  8022e0:	00 00 00 
  8022e3:	be c0 00 00 00       	mov    $0xc0,%esi
  8022e8:	48 bf d1 4e 80 00 00 	movabs $0x804ed1,%rdi
  8022ef:	00 00 00 
  8022f2:	b8 00 00 00 00       	mov    $0x0,%eax
  8022f7:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  8022fe:	00 00 00 
  802301:	41 ff d0             	callq  *%r8
  802304:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802307:	be 02 00 00 00       	mov    $0x2,%esi
  80230c:	89 c7                	mov    %eax,%edi
  80230e:	48 b8 86 1a 80 00 00 	movabs $0x801a86,%rax
  802315:	00 00 00 
  802318:	ff d0                	callq  *%rax
  80231a:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80231d:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802321:	79 30                	jns    802353 <fork+0x242>
  802323:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802326:	89 c1                	mov    %eax,%ecx
  802328:	48 ba 87 4f 80 00 00 	movabs $0x804f87,%rdx
  80232f:	00 00 00 
  802332:	be c5 00 00 00       	mov    $0xc5,%esi
  802337:	48 bf d1 4e 80 00 00 	movabs $0x804ed1,%rdi
  80233e:	00 00 00 
  802341:	b8 00 00 00 00       	mov    $0x0,%eax
  802346:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  80234d:	00 00 00 
  802350:	41 ff d0             	callq  *%r8
  802353:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802356:	c9                   	leaveq 
  802357:	c3                   	retq   

0000000000802358 <sfork>:
  802358:	55                   	push   %rbp
  802359:	48 89 e5             	mov    %rsp,%rbp
  80235c:	48 ba 9e 4f 80 00 00 	movabs $0x804f9e,%rdx
  802363:	00 00 00 
  802366:	be d2 00 00 00       	mov    $0xd2,%esi
  80236b:	48 bf d1 4e 80 00 00 	movabs $0x804ed1,%rdi
  802372:	00 00 00 
  802375:	b8 00 00 00 00       	mov    $0x0,%eax
  80237a:	48 b9 74 02 80 00 00 	movabs $0x800274,%rcx
  802381:	00 00 00 
  802384:	ff d1                	callq  *%rcx

0000000000802386 <ipc_recv>:
  802386:	55                   	push   %rbp
  802387:	48 89 e5             	mov    %rsp,%rbp
  80238a:	48 83 ec 30          	sub    $0x30,%rsp
  80238e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802392:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802396:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80239a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80239f:	75 0e                	jne    8023af <ipc_recv+0x29>
  8023a1:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8023a8:	00 00 00 
  8023ab:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8023af:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8023b3:	48 89 c7             	mov    %rax,%rdi
  8023b6:	48 b8 ba 1b 80 00 00 	movabs $0x801bba,%rax
  8023bd:	00 00 00 
  8023c0:	ff d0                	callq  *%rax
  8023c2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023c5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023c9:	79 27                	jns    8023f2 <ipc_recv+0x6c>
  8023cb:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8023d0:	74 0a                	je     8023dc <ipc_recv+0x56>
  8023d2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023d6:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8023dc:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8023e1:	74 0a                	je     8023ed <ipc_recv+0x67>
  8023e3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8023e7:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8023ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023f0:	eb 53                	jmp    802445 <ipc_recv+0xbf>
  8023f2:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8023f7:	74 19                	je     802412 <ipc_recv+0x8c>
  8023f9:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802400:	00 00 00 
  802403:	48 8b 00             	mov    (%rax),%rax
  802406:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  80240c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802410:	89 10                	mov    %edx,(%rax)
  802412:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802417:	74 19                	je     802432 <ipc_recv+0xac>
  802419:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802420:	00 00 00 
  802423:	48 8b 00             	mov    (%rax),%rax
  802426:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  80242c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802430:	89 10                	mov    %edx,(%rax)
  802432:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802439:	00 00 00 
  80243c:	48 8b 00             	mov    (%rax),%rax
  80243f:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  802445:	c9                   	leaveq 
  802446:	c3                   	retq   

0000000000802447 <ipc_send>:
  802447:	55                   	push   %rbp
  802448:	48 89 e5             	mov    %rsp,%rbp
  80244b:	48 83 ec 30          	sub    $0x30,%rsp
  80244f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802452:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802455:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  802459:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80245c:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802461:	75 10                	jne    802473 <ipc_send+0x2c>
  802463:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80246a:	00 00 00 
  80246d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802471:	eb 0e                	jmp    802481 <ipc_send+0x3a>
  802473:	eb 0c                	jmp    802481 <ipc_send+0x3a>
  802475:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  80247c:	00 00 00 
  80247f:	ff d0                	callq  *%rax
  802481:	8b 75 e8             	mov    -0x18(%rbp),%esi
  802484:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  802487:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80248b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80248e:	89 c7                	mov    %eax,%edi
  802490:	48 b8 65 1b 80 00 00 	movabs $0x801b65,%rax
  802497:	00 00 00 
  80249a:	ff d0                	callq  *%rax
  80249c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80249f:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  8024a3:	74 d0                	je     802475 <ipc_send+0x2e>
  8024a5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024a9:	79 30                	jns    8024db <ipc_send+0x94>
  8024ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024ae:	89 c1                	mov    %eax,%ecx
  8024b0:	48 ba b4 4f 80 00 00 	movabs $0x804fb4,%rdx
  8024b7:	00 00 00 
  8024ba:	be 44 00 00 00       	mov    $0x44,%esi
  8024bf:	48 bf ca 4f 80 00 00 	movabs $0x804fca,%rdi
  8024c6:	00 00 00 
  8024c9:	b8 00 00 00 00       	mov    $0x0,%eax
  8024ce:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  8024d5:	00 00 00 
  8024d8:	41 ff d0             	callq  *%r8
  8024db:	c9                   	leaveq 
  8024dc:	c3                   	retq   

00000000008024dd <ipc_host_recv>:
  8024dd:	55                   	push   %rbp
  8024de:	48 89 e5             	mov    %rsp,%rbp
  8024e1:	53                   	push   %rbx
  8024e2:	48 83 ec 28          	sub    $0x28,%rsp
  8024e6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8024ea:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  8024f1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
  8024f8:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8024fd:	75 0e                	jne    80250d <ipc_host_recv+0x30>
  8024ff:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802506:	00 00 00 
  802509:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  80250d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802511:	ba 07 00 00 00       	mov    $0x7,%edx
  802516:	48 89 c6             	mov    %rax,%rsi
  802519:	bf 00 00 00 00       	mov    $0x0,%edi
  80251e:	48 b8 91 19 80 00 00 	movabs $0x801991,%rax
  802525:	00 00 00 
  802528:	ff d0                	callq  *%rax
  80252a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80252e:	48 c1 e8 0c          	shr    $0xc,%rax
  802532:	48 89 c2             	mov    %rax,%rdx
  802535:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80253c:	01 00 00 
  80253f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802543:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802549:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80254d:	b8 03 00 00 00       	mov    $0x3,%eax
  802552:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802556:	48 89 d3             	mov    %rdx,%rbx
  802559:	0f 01 c1             	vmcall 
  80255c:	89 f2                	mov    %esi,%edx
  80255e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802561:	89 55 e8             	mov    %edx,-0x18(%rbp)
  802564:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802568:	79 05                	jns    80256f <ipc_host_recv+0x92>
  80256a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80256d:	eb 03                	jmp    802572 <ipc_host_recv+0x95>
  80256f:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802572:	48 83 c4 28          	add    $0x28,%rsp
  802576:	5b                   	pop    %rbx
  802577:	5d                   	pop    %rbp
  802578:	c3                   	retq   

0000000000802579 <ipc_host_send>:
  802579:	55                   	push   %rbp
  80257a:	48 89 e5             	mov    %rsp,%rbp
  80257d:	53                   	push   %rbx
  80257e:	48 83 ec 38          	sub    $0x38,%rsp
  802582:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802585:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802588:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80258c:	89 4d cc             	mov    %ecx,-0x34(%rbp)
  80258f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  802596:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  80259b:	75 0e                	jne    8025ab <ipc_host_send+0x32>
  80259d:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8025a4:	00 00 00 
  8025a7:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  8025ab:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8025af:	48 c1 e8 0c          	shr    $0xc,%rax
  8025b3:	48 89 c2             	mov    %rax,%rdx
  8025b6:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8025bd:	01 00 00 
  8025c0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8025c4:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  8025ca:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8025ce:	b8 02 00 00 00       	mov    $0x2,%eax
  8025d3:	8b 7d dc             	mov    -0x24(%rbp),%edi
  8025d6:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8025d9:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8025dd:	8b 75 cc             	mov    -0x34(%rbp),%esi
  8025e0:	89 fb                	mov    %edi,%ebx
  8025e2:	0f 01 c1             	vmcall 
  8025e5:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8025e8:	eb 26                	jmp    802610 <ipc_host_send+0x97>
  8025ea:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  8025f1:	00 00 00 
  8025f4:	ff d0                	callq  *%rax
  8025f6:	b8 02 00 00 00       	mov    $0x2,%eax
  8025fb:	8b 7d dc             	mov    -0x24(%rbp),%edi
  8025fe:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802601:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802605:	8b 75 cc             	mov    -0x34(%rbp),%esi
  802608:	89 fb                	mov    %edi,%ebx
  80260a:	0f 01 c1             	vmcall 
  80260d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802610:	83 7d ec f8          	cmpl   $0xfffffff8,-0x14(%rbp)
  802614:	74 d4                	je     8025ea <ipc_host_send+0x71>
  802616:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80261a:	79 55                	jns    802671 <ipc_host_send+0xf8>
  80261c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80261f:	89 c2                	mov    %eax,%edx
  802621:	be 81 00 00 00       	mov    $0x81,%esi
  802626:	48 bf d7 4f 80 00 00 	movabs $0x804fd7,%rdi
  80262d:	00 00 00 
  802630:	b8 00 00 00 00       	mov    $0x0,%eax
  802635:	48 b9 ad 04 80 00 00 	movabs $0x8004ad,%rcx
  80263c:	00 00 00 
  80263f:	ff d1                	callq  *%rcx
  802641:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802644:	89 c1                	mov    %eax,%ecx
  802646:	48 ba b4 4f 80 00 00 	movabs $0x804fb4,%rdx
  80264d:	00 00 00 
  802650:	be 82 00 00 00       	mov    $0x82,%esi
  802655:	48 bf ca 4f 80 00 00 	movabs $0x804fca,%rdi
  80265c:	00 00 00 
  80265f:	b8 00 00 00 00       	mov    $0x0,%eax
  802664:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  80266b:	00 00 00 
  80266e:	41 ff d0             	callq  *%r8
  802671:	48 83 c4 38          	add    $0x38,%rsp
  802675:	5b                   	pop    %rbx
  802676:	5d                   	pop    %rbp
  802677:	c3                   	retq   

0000000000802678 <ipc_find_env>:
  802678:	55                   	push   %rbp
  802679:	48 89 e5             	mov    %rsp,%rbp
  80267c:	48 83 ec 14          	sub    $0x14,%rsp
  802680:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802683:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80268a:	eb 4e                	jmp    8026da <ipc_find_env+0x62>
  80268c:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802693:	00 00 00 
  802696:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802699:	48 98                	cltq   
  80269b:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8026a2:	48 01 d0             	add    %rdx,%rax
  8026a5:	48 05 d0 00 00 00    	add    $0xd0,%rax
  8026ab:	8b 00                	mov    (%rax),%eax
  8026ad:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8026b0:	75 24                	jne    8026d6 <ipc_find_env+0x5e>
  8026b2:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8026b9:	00 00 00 
  8026bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026bf:	48 98                	cltq   
  8026c1:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8026c8:	48 01 d0             	add    %rdx,%rax
  8026cb:	48 05 c0 00 00 00    	add    $0xc0,%rax
  8026d1:	8b 40 08             	mov    0x8(%rax),%eax
  8026d4:	eb 12                	jmp    8026e8 <ipc_find_env+0x70>
  8026d6:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8026da:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  8026e1:	7e a9                	jle    80268c <ipc_find_env+0x14>
  8026e3:	b8 00 00 00 00       	mov    $0x0,%eax
  8026e8:	c9                   	leaveq 
  8026e9:	c3                   	retq   

00000000008026ea <fd2num>:
  8026ea:	55                   	push   %rbp
  8026eb:	48 89 e5             	mov    %rsp,%rbp
  8026ee:	48 83 ec 08          	sub    $0x8,%rsp
  8026f2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8026f6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8026fa:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802701:	ff ff ff 
  802704:	48 01 d0             	add    %rdx,%rax
  802707:	48 c1 e8 0c          	shr    $0xc,%rax
  80270b:	c9                   	leaveq 
  80270c:	c3                   	retq   

000000000080270d <fd2data>:
  80270d:	55                   	push   %rbp
  80270e:	48 89 e5             	mov    %rsp,%rbp
  802711:	48 83 ec 08          	sub    $0x8,%rsp
  802715:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802719:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80271d:	48 89 c7             	mov    %rax,%rdi
  802720:	48 b8 ea 26 80 00 00 	movabs $0x8026ea,%rax
  802727:	00 00 00 
  80272a:	ff d0                	callq  *%rax
  80272c:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802732:	48 c1 e0 0c          	shl    $0xc,%rax
  802736:	c9                   	leaveq 
  802737:	c3                   	retq   

0000000000802738 <fd_alloc>:
  802738:	55                   	push   %rbp
  802739:	48 89 e5             	mov    %rsp,%rbp
  80273c:	48 83 ec 18          	sub    $0x18,%rsp
  802740:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802744:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80274b:	eb 6b                	jmp    8027b8 <fd_alloc+0x80>
  80274d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802750:	48 98                	cltq   
  802752:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802758:	48 c1 e0 0c          	shl    $0xc,%rax
  80275c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802760:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802764:	48 c1 e8 15          	shr    $0x15,%rax
  802768:	48 89 c2             	mov    %rax,%rdx
  80276b:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802772:	01 00 00 
  802775:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802779:	83 e0 01             	and    $0x1,%eax
  80277c:	48 85 c0             	test   %rax,%rax
  80277f:	74 21                	je     8027a2 <fd_alloc+0x6a>
  802781:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802785:	48 c1 e8 0c          	shr    $0xc,%rax
  802789:	48 89 c2             	mov    %rax,%rdx
  80278c:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802793:	01 00 00 
  802796:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80279a:	83 e0 01             	and    $0x1,%eax
  80279d:	48 85 c0             	test   %rax,%rax
  8027a0:	75 12                	jne    8027b4 <fd_alloc+0x7c>
  8027a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027a6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8027aa:	48 89 10             	mov    %rdx,(%rax)
  8027ad:	b8 00 00 00 00       	mov    $0x0,%eax
  8027b2:	eb 1a                	jmp    8027ce <fd_alloc+0x96>
  8027b4:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8027b8:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8027bc:	7e 8f                	jle    80274d <fd_alloc+0x15>
  8027be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027c2:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8027c9:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  8027ce:	c9                   	leaveq 
  8027cf:	c3                   	retq   

00000000008027d0 <fd_lookup>:
  8027d0:	55                   	push   %rbp
  8027d1:	48 89 e5             	mov    %rsp,%rbp
  8027d4:	48 83 ec 20          	sub    $0x20,%rsp
  8027d8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8027db:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8027df:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8027e3:	78 06                	js     8027eb <fd_lookup+0x1b>
  8027e5:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  8027e9:	7e 07                	jle    8027f2 <fd_lookup+0x22>
  8027eb:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8027f0:	eb 6c                	jmp    80285e <fd_lookup+0x8e>
  8027f2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8027f5:	48 98                	cltq   
  8027f7:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8027fd:	48 c1 e0 0c          	shl    $0xc,%rax
  802801:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802805:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802809:	48 c1 e8 15          	shr    $0x15,%rax
  80280d:	48 89 c2             	mov    %rax,%rdx
  802810:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802817:	01 00 00 
  80281a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80281e:	83 e0 01             	and    $0x1,%eax
  802821:	48 85 c0             	test   %rax,%rax
  802824:	74 21                	je     802847 <fd_lookup+0x77>
  802826:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80282a:	48 c1 e8 0c          	shr    $0xc,%rax
  80282e:	48 89 c2             	mov    %rax,%rdx
  802831:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802838:	01 00 00 
  80283b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80283f:	83 e0 01             	and    $0x1,%eax
  802842:	48 85 c0             	test   %rax,%rax
  802845:	75 07                	jne    80284e <fd_lookup+0x7e>
  802847:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80284c:	eb 10                	jmp    80285e <fd_lookup+0x8e>
  80284e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802852:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802856:	48 89 10             	mov    %rdx,(%rax)
  802859:	b8 00 00 00 00       	mov    $0x0,%eax
  80285e:	c9                   	leaveq 
  80285f:	c3                   	retq   

0000000000802860 <fd_close>:
  802860:	55                   	push   %rbp
  802861:	48 89 e5             	mov    %rsp,%rbp
  802864:	48 83 ec 30          	sub    $0x30,%rsp
  802868:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80286c:	89 f0                	mov    %esi,%eax
  80286e:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802871:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802875:	48 89 c7             	mov    %rax,%rdi
  802878:	48 b8 ea 26 80 00 00 	movabs $0x8026ea,%rax
  80287f:	00 00 00 
  802882:	ff d0                	callq  *%rax
  802884:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802888:	48 89 d6             	mov    %rdx,%rsi
  80288b:	89 c7                	mov    %eax,%edi
  80288d:	48 b8 d0 27 80 00 00 	movabs $0x8027d0,%rax
  802894:	00 00 00 
  802897:	ff d0                	callq  *%rax
  802899:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80289c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028a0:	78 0a                	js     8028ac <fd_close+0x4c>
  8028a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028a6:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  8028aa:	74 12                	je     8028be <fd_close+0x5e>
  8028ac:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  8028b0:	74 05                	je     8028b7 <fd_close+0x57>
  8028b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028b5:	eb 05                	jmp    8028bc <fd_close+0x5c>
  8028b7:	b8 00 00 00 00       	mov    $0x0,%eax
  8028bc:	eb 69                	jmp    802927 <fd_close+0xc7>
  8028be:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028c2:	8b 00                	mov    (%rax),%eax
  8028c4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8028c8:	48 89 d6             	mov    %rdx,%rsi
  8028cb:	89 c7                	mov    %eax,%edi
  8028cd:	48 b8 29 29 80 00 00 	movabs $0x802929,%rax
  8028d4:	00 00 00 
  8028d7:	ff d0                	callq  *%rax
  8028d9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028dc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028e0:	78 2a                	js     80290c <fd_close+0xac>
  8028e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028e6:	48 8b 40 20          	mov    0x20(%rax),%rax
  8028ea:	48 85 c0             	test   %rax,%rax
  8028ed:	74 16                	je     802905 <fd_close+0xa5>
  8028ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028f3:	48 8b 40 20          	mov    0x20(%rax),%rax
  8028f7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8028fb:	48 89 d7             	mov    %rdx,%rdi
  8028fe:	ff d0                	callq  *%rax
  802900:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802903:	eb 07                	jmp    80290c <fd_close+0xac>
  802905:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80290c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802910:	48 89 c6             	mov    %rax,%rsi
  802913:	bf 00 00 00 00       	mov    $0x0,%edi
  802918:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  80291f:	00 00 00 
  802922:	ff d0                	callq  *%rax
  802924:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802927:	c9                   	leaveq 
  802928:	c3                   	retq   

0000000000802929 <dev_lookup>:
  802929:	55                   	push   %rbp
  80292a:	48 89 e5             	mov    %rsp,%rbp
  80292d:	48 83 ec 20          	sub    $0x20,%rsp
  802931:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802934:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802938:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80293f:	eb 41                	jmp    802982 <dev_lookup+0x59>
  802941:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802948:	00 00 00 
  80294b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80294e:	48 63 d2             	movslq %edx,%rdx
  802951:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802955:	8b 00                	mov    (%rax),%eax
  802957:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80295a:	75 22                	jne    80297e <dev_lookup+0x55>
  80295c:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802963:	00 00 00 
  802966:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802969:	48 63 d2             	movslq %edx,%rdx
  80296c:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802970:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802974:	48 89 10             	mov    %rdx,(%rax)
  802977:	b8 00 00 00 00       	mov    $0x0,%eax
  80297c:	eb 60                	jmp    8029de <dev_lookup+0xb5>
  80297e:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802982:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802989:	00 00 00 
  80298c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80298f:	48 63 d2             	movslq %edx,%rdx
  802992:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802996:	48 85 c0             	test   %rax,%rax
  802999:	75 a6                	jne    802941 <dev_lookup+0x18>
  80299b:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8029a2:	00 00 00 
  8029a5:	48 8b 00             	mov    (%rax),%rax
  8029a8:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8029ae:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8029b1:	89 c6                	mov    %eax,%esi
  8029b3:	48 bf f8 4f 80 00 00 	movabs $0x804ff8,%rdi
  8029ba:	00 00 00 
  8029bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8029c2:	48 b9 ad 04 80 00 00 	movabs $0x8004ad,%rcx
  8029c9:	00 00 00 
  8029cc:	ff d1                	callq  *%rcx
  8029ce:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8029d2:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8029d9:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8029de:	c9                   	leaveq 
  8029df:	c3                   	retq   

00000000008029e0 <close>:
  8029e0:	55                   	push   %rbp
  8029e1:	48 89 e5             	mov    %rsp,%rbp
  8029e4:	48 83 ec 20          	sub    $0x20,%rsp
  8029e8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8029eb:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8029ef:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8029f2:	48 89 d6             	mov    %rdx,%rsi
  8029f5:	89 c7                	mov    %eax,%edi
  8029f7:	48 b8 d0 27 80 00 00 	movabs $0x8027d0,%rax
  8029fe:	00 00 00 
  802a01:	ff d0                	callq  *%rax
  802a03:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a06:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a0a:	79 05                	jns    802a11 <close+0x31>
  802a0c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a0f:	eb 18                	jmp    802a29 <close+0x49>
  802a11:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a15:	be 01 00 00 00       	mov    $0x1,%esi
  802a1a:	48 89 c7             	mov    %rax,%rdi
  802a1d:	48 b8 60 28 80 00 00 	movabs $0x802860,%rax
  802a24:	00 00 00 
  802a27:	ff d0                	callq  *%rax
  802a29:	c9                   	leaveq 
  802a2a:	c3                   	retq   

0000000000802a2b <close_all>:
  802a2b:	55                   	push   %rbp
  802a2c:	48 89 e5             	mov    %rsp,%rbp
  802a2f:	48 83 ec 10          	sub    $0x10,%rsp
  802a33:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802a3a:	eb 15                	jmp    802a51 <close_all+0x26>
  802a3c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a3f:	89 c7                	mov    %eax,%edi
  802a41:	48 b8 e0 29 80 00 00 	movabs $0x8029e0,%rax
  802a48:	00 00 00 
  802a4b:	ff d0                	callq  *%rax
  802a4d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802a51:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802a55:	7e e5                	jle    802a3c <close_all+0x11>
  802a57:	c9                   	leaveq 
  802a58:	c3                   	retq   

0000000000802a59 <dup>:
  802a59:	55                   	push   %rbp
  802a5a:	48 89 e5             	mov    %rsp,%rbp
  802a5d:	48 83 ec 40          	sub    $0x40,%rsp
  802a61:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802a64:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802a67:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802a6b:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802a6e:	48 89 d6             	mov    %rdx,%rsi
  802a71:	89 c7                	mov    %eax,%edi
  802a73:	48 b8 d0 27 80 00 00 	movabs $0x8027d0,%rax
  802a7a:	00 00 00 
  802a7d:	ff d0                	callq  *%rax
  802a7f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a82:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a86:	79 08                	jns    802a90 <dup+0x37>
  802a88:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a8b:	e9 70 01 00 00       	jmpq   802c00 <dup+0x1a7>
  802a90:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802a93:	89 c7                	mov    %eax,%edi
  802a95:	48 b8 e0 29 80 00 00 	movabs $0x8029e0,%rax
  802a9c:	00 00 00 
  802a9f:	ff d0                	callq  *%rax
  802aa1:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802aa4:	48 98                	cltq   
  802aa6:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802aac:	48 c1 e0 0c          	shl    $0xc,%rax
  802ab0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802ab4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802ab8:	48 89 c7             	mov    %rax,%rdi
  802abb:	48 b8 0d 27 80 00 00 	movabs $0x80270d,%rax
  802ac2:	00 00 00 
  802ac5:	ff d0                	callq  *%rax
  802ac7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802acb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802acf:	48 89 c7             	mov    %rax,%rdi
  802ad2:	48 b8 0d 27 80 00 00 	movabs $0x80270d,%rax
  802ad9:	00 00 00 
  802adc:	ff d0                	callq  *%rax
  802ade:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802ae2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ae6:	48 c1 e8 15          	shr    $0x15,%rax
  802aea:	48 89 c2             	mov    %rax,%rdx
  802aed:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802af4:	01 00 00 
  802af7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802afb:	83 e0 01             	and    $0x1,%eax
  802afe:	48 85 c0             	test   %rax,%rax
  802b01:	74 73                	je     802b76 <dup+0x11d>
  802b03:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b07:	48 c1 e8 0c          	shr    $0xc,%rax
  802b0b:	48 89 c2             	mov    %rax,%rdx
  802b0e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802b15:	01 00 00 
  802b18:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b1c:	83 e0 01             	and    $0x1,%eax
  802b1f:	48 85 c0             	test   %rax,%rax
  802b22:	74 52                	je     802b76 <dup+0x11d>
  802b24:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b28:	48 c1 e8 0c          	shr    $0xc,%rax
  802b2c:	48 89 c2             	mov    %rax,%rdx
  802b2f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802b36:	01 00 00 
  802b39:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b3d:	25 07 0e 00 00       	and    $0xe07,%eax
  802b42:	89 c1                	mov    %eax,%ecx
  802b44:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802b48:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b4c:	41 89 c8             	mov    %ecx,%r8d
  802b4f:	48 89 d1             	mov    %rdx,%rcx
  802b52:	ba 00 00 00 00       	mov    $0x0,%edx
  802b57:	48 89 c6             	mov    %rax,%rsi
  802b5a:	bf 00 00 00 00       	mov    $0x0,%edi
  802b5f:	48 b8 e1 19 80 00 00 	movabs $0x8019e1,%rax
  802b66:	00 00 00 
  802b69:	ff d0                	callq  *%rax
  802b6b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b6e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b72:	79 02                	jns    802b76 <dup+0x11d>
  802b74:	eb 57                	jmp    802bcd <dup+0x174>
  802b76:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802b7a:	48 c1 e8 0c          	shr    $0xc,%rax
  802b7e:	48 89 c2             	mov    %rax,%rdx
  802b81:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802b88:	01 00 00 
  802b8b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b8f:	25 07 0e 00 00       	and    $0xe07,%eax
  802b94:	89 c1                	mov    %eax,%ecx
  802b96:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802b9a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802b9e:	41 89 c8             	mov    %ecx,%r8d
  802ba1:	48 89 d1             	mov    %rdx,%rcx
  802ba4:	ba 00 00 00 00       	mov    $0x0,%edx
  802ba9:	48 89 c6             	mov    %rax,%rsi
  802bac:	bf 00 00 00 00       	mov    $0x0,%edi
  802bb1:	48 b8 e1 19 80 00 00 	movabs $0x8019e1,%rax
  802bb8:	00 00 00 
  802bbb:	ff d0                	callq  *%rax
  802bbd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802bc0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802bc4:	79 02                	jns    802bc8 <dup+0x16f>
  802bc6:	eb 05                	jmp    802bcd <dup+0x174>
  802bc8:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802bcb:	eb 33                	jmp    802c00 <dup+0x1a7>
  802bcd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bd1:	48 89 c6             	mov    %rax,%rsi
  802bd4:	bf 00 00 00 00       	mov    $0x0,%edi
  802bd9:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  802be0:	00 00 00 
  802be3:	ff d0                	callq  *%rax
  802be5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802be9:	48 89 c6             	mov    %rax,%rsi
  802bec:	bf 00 00 00 00       	mov    $0x0,%edi
  802bf1:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  802bf8:	00 00 00 
  802bfb:	ff d0                	callq  *%rax
  802bfd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c00:	c9                   	leaveq 
  802c01:	c3                   	retq   

0000000000802c02 <read>:
  802c02:	55                   	push   %rbp
  802c03:	48 89 e5             	mov    %rsp,%rbp
  802c06:	48 83 ec 40          	sub    $0x40,%rsp
  802c0a:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802c0d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802c11:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802c15:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802c19:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802c1c:	48 89 d6             	mov    %rdx,%rsi
  802c1f:	89 c7                	mov    %eax,%edi
  802c21:	48 b8 d0 27 80 00 00 	movabs $0x8027d0,%rax
  802c28:	00 00 00 
  802c2b:	ff d0                	callq  *%rax
  802c2d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c30:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c34:	78 24                	js     802c5a <read+0x58>
  802c36:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c3a:	8b 00                	mov    (%rax),%eax
  802c3c:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802c40:	48 89 d6             	mov    %rdx,%rsi
  802c43:	89 c7                	mov    %eax,%edi
  802c45:	48 b8 29 29 80 00 00 	movabs $0x802929,%rax
  802c4c:	00 00 00 
  802c4f:	ff d0                	callq  *%rax
  802c51:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c54:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c58:	79 05                	jns    802c5f <read+0x5d>
  802c5a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c5d:	eb 76                	jmp    802cd5 <read+0xd3>
  802c5f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c63:	8b 40 08             	mov    0x8(%rax),%eax
  802c66:	83 e0 03             	and    $0x3,%eax
  802c69:	83 f8 01             	cmp    $0x1,%eax
  802c6c:	75 3a                	jne    802ca8 <read+0xa6>
  802c6e:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802c75:	00 00 00 
  802c78:	48 8b 00             	mov    (%rax),%rax
  802c7b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802c81:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802c84:	89 c6                	mov    %eax,%esi
  802c86:	48 bf 17 50 80 00 00 	movabs $0x805017,%rdi
  802c8d:	00 00 00 
  802c90:	b8 00 00 00 00       	mov    $0x0,%eax
  802c95:	48 b9 ad 04 80 00 00 	movabs $0x8004ad,%rcx
  802c9c:	00 00 00 
  802c9f:	ff d1                	callq  *%rcx
  802ca1:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802ca6:	eb 2d                	jmp    802cd5 <read+0xd3>
  802ca8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cac:	48 8b 40 10          	mov    0x10(%rax),%rax
  802cb0:	48 85 c0             	test   %rax,%rax
  802cb3:	75 07                	jne    802cbc <read+0xba>
  802cb5:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802cba:	eb 19                	jmp    802cd5 <read+0xd3>
  802cbc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cc0:	48 8b 40 10          	mov    0x10(%rax),%rax
  802cc4:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802cc8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802ccc:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802cd0:	48 89 cf             	mov    %rcx,%rdi
  802cd3:	ff d0                	callq  *%rax
  802cd5:	c9                   	leaveq 
  802cd6:	c3                   	retq   

0000000000802cd7 <readn>:
  802cd7:	55                   	push   %rbp
  802cd8:	48 89 e5             	mov    %rsp,%rbp
  802cdb:	48 83 ec 30          	sub    $0x30,%rsp
  802cdf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802ce2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ce6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802cea:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802cf1:	eb 49                	jmp    802d3c <readn+0x65>
  802cf3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cf6:	48 98                	cltq   
  802cf8:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802cfc:	48 29 c2             	sub    %rax,%rdx
  802cff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d02:	48 63 c8             	movslq %eax,%rcx
  802d05:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d09:	48 01 c1             	add    %rax,%rcx
  802d0c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802d0f:	48 89 ce             	mov    %rcx,%rsi
  802d12:	89 c7                	mov    %eax,%edi
  802d14:	48 b8 02 2c 80 00 00 	movabs $0x802c02,%rax
  802d1b:	00 00 00 
  802d1e:	ff d0                	callq  *%rax
  802d20:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802d23:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802d27:	79 05                	jns    802d2e <readn+0x57>
  802d29:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d2c:	eb 1c                	jmp    802d4a <readn+0x73>
  802d2e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802d32:	75 02                	jne    802d36 <readn+0x5f>
  802d34:	eb 11                	jmp    802d47 <readn+0x70>
  802d36:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d39:	01 45 fc             	add    %eax,-0x4(%rbp)
  802d3c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d3f:	48 98                	cltq   
  802d41:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802d45:	72 ac                	jb     802cf3 <readn+0x1c>
  802d47:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d4a:	c9                   	leaveq 
  802d4b:	c3                   	retq   

0000000000802d4c <write>:
  802d4c:	55                   	push   %rbp
  802d4d:	48 89 e5             	mov    %rsp,%rbp
  802d50:	48 83 ec 40          	sub    $0x40,%rsp
  802d54:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802d57:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802d5b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802d5f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802d63:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802d66:	48 89 d6             	mov    %rdx,%rsi
  802d69:	89 c7                	mov    %eax,%edi
  802d6b:	48 b8 d0 27 80 00 00 	movabs $0x8027d0,%rax
  802d72:	00 00 00 
  802d75:	ff d0                	callq  *%rax
  802d77:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d7a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d7e:	78 24                	js     802da4 <write+0x58>
  802d80:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d84:	8b 00                	mov    (%rax),%eax
  802d86:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d8a:	48 89 d6             	mov    %rdx,%rsi
  802d8d:	89 c7                	mov    %eax,%edi
  802d8f:	48 b8 29 29 80 00 00 	movabs $0x802929,%rax
  802d96:	00 00 00 
  802d99:	ff d0                	callq  *%rax
  802d9b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d9e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802da2:	79 05                	jns    802da9 <write+0x5d>
  802da4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802da7:	eb 75                	jmp    802e1e <write+0xd2>
  802da9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802dad:	8b 40 08             	mov    0x8(%rax),%eax
  802db0:	83 e0 03             	and    $0x3,%eax
  802db3:	85 c0                	test   %eax,%eax
  802db5:	75 3a                	jne    802df1 <write+0xa5>
  802db7:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802dbe:	00 00 00 
  802dc1:	48 8b 00             	mov    (%rax),%rax
  802dc4:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802dca:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802dcd:	89 c6                	mov    %eax,%esi
  802dcf:	48 bf 33 50 80 00 00 	movabs $0x805033,%rdi
  802dd6:	00 00 00 
  802dd9:	b8 00 00 00 00       	mov    $0x0,%eax
  802dde:	48 b9 ad 04 80 00 00 	movabs $0x8004ad,%rcx
  802de5:	00 00 00 
  802de8:	ff d1                	callq  *%rcx
  802dea:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802def:	eb 2d                	jmp    802e1e <write+0xd2>
  802df1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802df5:	48 8b 40 18          	mov    0x18(%rax),%rax
  802df9:	48 85 c0             	test   %rax,%rax
  802dfc:	75 07                	jne    802e05 <write+0xb9>
  802dfe:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802e03:	eb 19                	jmp    802e1e <write+0xd2>
  802e05:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e09:	48 8b 40 18          	mov    0x18(%rax),%rax
  802e0d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802e11:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802e15:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802e19:	48 89 cf             	mov    %rcx,%rdi
  802e1c:	ff d0                	callq  *%rax
  802e1e:	c9                   	leaveq 
  802e1f:	c3                   	retq   

0000000000802e20 <seek>:
  802e20:	55                   	push   %rbp
  802e21:	48 89 e5             	mov    %rsp,%rbp
  802e24:	48 83 ec 18          	sub    $0x18,%rsp
  802e28:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802e2b:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802e2e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802e32:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e35:	48 89 d6             	mov    %rdx,%rsi
  802e38:	89 c7                	mov    %eax,%edi
  802e3a:	48 b8 d0 27 80 00 00 	movabs $0x8027d0,%rax
  802e41:	00 00 00 
  802e44:	ff d0                	callq  *%rax
  802e46:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e49:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e4d:	79 05                	jns    802e54 <seek+0x34>
  802e4f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e52:	eb 0f                	jmp    802e63 <seek+0x43>
  802e54:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e58:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802e5b:	89 50 04             	mov    %edx,0x4(%rax)
  802e5e:	b8 00 00 00 00       	mov    $0x0,%eax
  802e63:	c9                   	leaveq 
  802e64:	c3                   	retq   

0000000000802e65 <ftruncate>:
  802e65:	55                   	push   %rbp
  802e66:	48 89 e5             	mov    %rsp,%rbp
  802e69:	48 83 ec 30          	sub    $0x30,%rsp
  802e6d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802e70:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802e73:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802e77:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802e7a:	48 89 d6             	mov    %rdx,%rsi
  802e7d:	89 c7                	mov    %eax,%edi
  802e7f:	48 b8 d0 27 80 00 00 	movabs $0x8027d0,%rax
  802e86:	00 00 00 
  802e89:	ff d0                	callq  *%rax
  802e8b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e8e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e92:	78 24                	js     802eb8 <ftruncate+0x53>
  802e94:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e98:	8b 00                	mov    (%rax),%eax
  802e9a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802e9e:	48 89 d6             	mov    %rdx,%rsi
  802ea1:	89 c7                	mov    %eax,%edi
  802ea3:	48 b8 29 29 80 00 00 	movabs $0x802929,%rax
  802eaa:	00 00 00 
  802ead:	ff d0                	callq  *%rax
  802eaf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802eb2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802eb6:	79 05                	jns    802ebd <ftruncate+0x58>
  802eb8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ebb:	eb 72                	jmp    802f2f <ftruncate+0xca>
  802ebd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ec1:	8b 40 08             	mov    0x8(%rax),%eax
  802ec4:	83 e0 03             	and    $0x3,%eax
  802ec7:	85 c0                	test   %eax,%eax
  802ec9:	75 3a                	jne    802f05 <ftruncate+0xa0>
  802ecb:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802ed2:	00 00 00 
  802ed5:	48 8b 00             	mov    (%rax),%rax
  802ed8:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802ede:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802ee1:	89 c6                	mov    %eax,%esi
  802ee3:	48 bf 50 50 80 00 00 	movabs $0x805050,%rdi
  802eea:	00 00 00 
  802eed:	b8 00 00 00 00       	mov    $0x0,%eax
  802ef2:	48 b9 ad 04 80 00 00 	movabs $0x8004ad,%rcx
  802ef9:	00 00 00 
  802efc:	ff d1                	callq  *%rcx
  802efe:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802f03:	eb 2a                	jmp    802f2f <ftruncate+0xca>
  802f05:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f09:	48 8b 40 30          	mov    0x30(%rax),%rax
  802f0d:	48 85 c0             	test   %rax,%rax
  802f10:	75 07                	jne    802f19 <ftruncate+0xb4>
  802f12:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802f17:	eb 16                	jmp    802f2f <ftruncate+0xca>
  802f19:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f1d:	48 8b 40 30          	mov    0x30(%rax),%rax
  802f21:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802f25:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802f28:	89 ce                	mov    %ecx,%esi
  802f2a:	48 89 d7             	mov    %rdx,%rdi
  802f2d:	ff d0                	callq  *%rax
  802f2f:	c9                   	leaveq 
  802f30:	c3                   	retq   

0000000000802f31 <fstat>:
  802f31:	55                   	push   %rbp
  802f32:	48 89 e5             	mov    %rsp,%rbp
  802f35:	48 83 ec 30          	sub    $0x30,%rsp
  802f39:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802f3c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802f40:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802f44:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802f47:	48 89 d6             	mov    %rdx,%rsi
  802f4a:	89 c7                	mov    %eax,%edi
  802f4c:	48 b8 d0 27 80 00 00 	movabs $0x8027d0,%rax
  802f53:	00 00 00 
  802f56:	ff d0                	callq  *%rax
  802f58:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f5b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f5f:	78 24                	js     802f85 <fstat+0x54>
  802f61:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f65:	8b 00                	mov    (%rax),%eax
  802f67:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802f6b:	48 89 d6             	mov    %rdx,%rsi
  802f6e:	89 c7                	mov    %eax,%edi
  802f70:	48 b8 29 29 80 00 00 	movabs $0x802929,%rax
  802f77:	00 00 00 
  802f7a:	ff d0                	callq  *%rax
  802f7c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f7f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f83:	79 05                	jns    802f8a <fstat+0x59>
  802f85:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f88:	eb 5e                	jmp    802fe8 <fstat+0xb7>
  802f8a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f8e:	48 8b 40 28          	mov    0x28(%rax),%rax
  802f92:	48 85 c0             	test   %rax,%rax
  802f95:	75 07                	jne    802f9e <fstat+0x6d>
  802f97:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802f9c:	eb 4a                	jmp    802fe8 <fstat+0xb7>
  802f9e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802fa2:	c6 00 00             	movb   $0x0,(%rax)
  802fa5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802fa9:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802fb0:	00 00 00 
  802fb3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802fb7:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802fbe:	00 00 00 
  802fc1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802fc5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802fc9:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802fd0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fd4:	48 8b 40 28          	mov    0x28(%rax),%rax
  802fd8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802fdc:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802fe0:	48 89 ce             	mov    %rcx,%rsi
  802fe3:	48 89 d7             	mov    %rdx,%rdi
  802fe6:	ff d0                	callq  *%rax
  802fe8:	c9                   	leaveq 
  802fe9:	c3                   	retq   

0000000000802fea <stat>:
  802fea:	55                   	push   %rbp
  802feb:	48 89 e5             	mov    %rsp,%rbp
  802fee:	48 83 ec 20          	sub    $0x20,%rsp
  802ff2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802ff6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ffa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ffe:	be 00 00 00 00       	mov    $0x0,%esi
  803003:	48 89 c7             	mov    %rax,%rdi
  803006:	48 b8 d8 30 80 00 00 	movabs $0x8030d8,%rax
  80300d:	00 00 00 
  803010:	ff d0                	callq  *%rax
  803012:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803015:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803019:	79 05                	jns    803020 <stat+0x36>
  80301b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80301e:	eb 2f                	jmp    80304f <stat+0x65>
  803020:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803024:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803027:	48 89 d6             	mov    %rdx,%rsi
  80302a:	89 c7                	mov    %eax,%edi
  80302c:	48 b8 31 2f 80 00 00 	movabs $0x802f31,%rax
  803033:	00 00 00 
  803036:	ff d0                	callq  *%rax
  803038:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80303b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80303e:	89 c7                	mov    %eax,%edi
  803040:	48 b8 e0 29 80 00 00 	movabs $0x8029e0,%rax
  803047:	00 00 00 
  80304a:	ff d0                	callq  *%rax
  80304c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80304f:	c9                   	leaveq 
  803050:	c3                   	retq   

0000000000803051 <fsipc>:
  803051:	55                   	push   %rbp
  803052:	48 89 e5             	mov    %rsp,%rbp
  803055:	48 83 ec 10          	sub    $0x10,%rsp
  803059:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80305c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803060:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  803067:	00 00 00 
  80306a:	8b 00                	mov    (%rax),%eax
  80306c:	85 c0                	test   %eax,%eax
  80306e:	75 1d                	jne    80308d <fsipc+0x3c>
  803070:	bf 01 00 00 00       	mov    $0x1,%edi
  803075:	48 b8 78 26 80 00 00 	movabs $0x802678,%rax
  80307c:	00 00 00 
  80307f:	ff d0                	callq  *%rax
  803081:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  803088:	00 00 00 
  80308b:	89 02                	mov    %eax,(%rdx)
  80308d:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  803094:	00 00 00 
  803097:	8b 00                	mov    (%rax),%eax
  803099:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80309c:	b9 07 00 00 00       	mov    $0x7,%ecx
  8030a1:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  8030a8:	00 00 00 
  8030ab:	89 c7                	mov    %eax,%edi
  8030ad:	48 b8 47 24 80 00 00 	movabs $0x802447,%rax
  8030b4:	00 00 00 
  8030b7:	ff d0                	callq  *%rax
  8030b9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030bd:	ba 00 00 00 00       	mov    $0x0,%edx
  8030c2:	48 89 c6             	mov    %rax,%rsi
  8030c5:	bf 00 00 00 00       	mov    $0x0,%edi
  8030ca:	48 b8 86 23 80 00 00 	movabs $0x802386,%rax
  8030d1:	00 00 00 
  8030d4:	ff d0                	callq  *%rax
  8030d6:	c9                   	leaveq 
  8030d7:	c3                   	retq   

00000000008030d8 <open>:
  8030d8:	55                   	push   %rbp
  8030d9:	48 89 e5             	mov    %rsp,%rbp
  8030dc:	48 83 ec 20          	sub    $0x20,%rsp
  8030e0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8030e4:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8030e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030eb:	48 89 c7             	mov    %rax,%rdi
  8030ee:	48 b8 f6 0f 80 00 00 	movabs $0x800ff6,%rax
  8030f5:	00 00 00 
  8030f8:	ff d0                	callq  *%rax
  8030fa:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8030ff:	7e 0a                	jle    80310b <open+0x33>
  803101:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803106:	e9 a5 00 00 00       	jmpq   8031b0 <open+0xd8>
  80310b:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80310f:	48 89 c7             	mov    %rax,%rdi
  803112:	48 b8 38 27 80 00 00 	movabs $0x802738,%rax
  803119:	00 00 00 
  80311c:	ff d0                	callq  *%rax
  80311e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803121:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803125:	79 08                	jns    80312f <open+0x57>
  803127:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80312a:	e9 81 00 00 00       	jmpq   8031b0 <open+0xd8>
  80312f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803133:	48 89 c6             	mov    %rax,%rsi
  803136:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  80313d:	00 00 00 
  803140:	48 b8 62 10 80 00 00 	movabs $0x801062,%rax
  803147:	00 00 00 
  80314a:	ff d0                	callq  *%rax
  80314c:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803153:	00 00 00 
  803156:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803159:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  80315f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803163:	48 89 c6             	mov    %rax,%rsi
  803166:	bf 01 00 00 00       	mov    $0x1,%edi
  80316b:	48 b8 51 30 80 00 00 	movabs $0x803051,%rax
  803172:	00 00 00 
  803175:	ff d0                	callq  *%rax
  803177:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80317a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80317e:	79 1d                	jns    80319d <open+0xc5>
  803180:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803184:	be 00 00 00 00       	mov    $0x0,%esi
  803189:	48 89 c7             	mov    %rax,%rdi
  80318c:	48 b8 60 28 80 00 00 	movabs $0x802860,%rax
  803193:	00 00 00 
  803196:	ff d0                	callq  *%rax
  803198:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80319b:	eb 13                	jmp    8031b0 <open+0xd8>
  80319d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031a1:	48 89 c7             	mov    %rax,%rdi
  8031a4:	48 b8 ea 26 80 00 00 	movabs $0x8026ea,%rax
  8031ab:	00 00 00 
  8031ae:	ff d0                	callq  *%rax
  8031b0:	c9                   	leaveq 
  8031b1:	c3                   	retq   

00000000008031b2 <devfile_flush>:
  8031b2:	55                   	push   %rbp
  8031b3:	48 89 e5             	mov    %rsp,%rbp
  8031b6:	48 83 ec 10          	sub    $0x10,%rsp
  8031ba:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8031be:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8031c2:	8b 50 0c             	mov    0xc(%rax),%edx
  8031c5:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8031cc:	00 00 00 
  8031cf:	89 10                	mov    %edx,(%rax)
  8031d1:	be 00 00 00 00       	mov    $0x0,%esi
  8031d6:	bf 06 00 00 00       	mov    $0x6,%edi
  8031db:	48 b8 51 30 80 00 00 	movabs $0x803051,%rax
  8031e2:	00 00 00 
  8031e5:	ff d0                	callq  *%rax
  8031e7:	c9                   	leaveq 
  8031e8:	c3                   	retq   

00000000008031e9 <devfile_read>:
  8031e9:	55                   	push   %rbp
  8031ea:	48 89 e5             	mov    %rsp,%rbp
  8031ed:	48 83 ec 30          	sub    $0x30,%rsp
  8031f1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8031f5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8031f9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8031fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803201:	8b 50 0c             	mov    0xc(%rax),%edx
  803204:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80320b:	00 00 00 
  80320e:	89 10                	mov    %edx,(%rax)
  803210:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803217:	00 00 00 
  80321a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80321e:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803222:	be 00 00 00 00       	mov    $0x0,%esi
  803227:	bf 03 00 00 00       	mov    $0x3,%edi
  80322c:	48 b8 51 30 80 00 00 	movabs $0x803051,%rax
  803233:	00 00 00 
  803236:	ff d0                	callq  *%rax
  803238:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80323b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80323f:	79 08                	jns    803249 <devfile_read+0x60>
  803241:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803244:	e9 a4 00 00 00       	jmpq   8032ed <devfile_read+0x104>
  803249:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80324c:	48 98                	cltq   
  80324e:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803252:	76 35                	jbe    803289 <devfile_read+0xa0>
  803254:	48 b9 76 50 80 00 00 	movabs $0x805076,%rcx
  80325b:	00 00 00 
  80325e:	48 ba 7d 50 80 00 00 	movabs $0x80507d,%rdx
  803265:	00 00 00 
  803268:	be 89 00 00 00       	mov    $0x89,%esi
  80326d:	48 bf 92 50 80 00 00 	movabs $0x805092,%rdi
  803274:	00 00 00 
  803277:	b8 00 00 00 00       	mov    $0x0,%eax
  80327c:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  803283:	00 00 00 
  803286:	41 ff d0             	callq  *%r8
  803289:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  803290:	7e 35                	jle    8032c7 <devfile_read+0xde>
  803292:	48 b9 a0 50 80 00 00 	movabs $0x8050a0,%rcx
  803299:	00 00 00 
  80329c:	48 ba 7d 50 80 00 00 	movabs $0x80507d,%rdx
  8032a3:	00 00 00 
  8032a6:	be 8a 00 00 00       	mov    $0x8a,%esi
  8032ab:	48 bf 92 50 80 00 00 	movabs $0x805092,%rdi
  8032b2:	00 00 00 
  8032b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8032ba:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  8032c1:	00 00 00 
  8032c4:	41 ff d0             	callq  *%r8
  8032c7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032ca:	48 63 d0             	movslq %eax,%rdx
  8032cd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8032d1:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8032d8:	00 00 00 
  8032db:	48 89 c7             	mov    %rax,%rdi
  8032de:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  8032e5:	00 00 00 
  8032e8:	ff d0                	callq  *%rax
  8032ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032ed:	c9                   	leaveq 
  8032ee:	c3                   	retq   

00000000008032ef <devfile_write>:
  8032ef:	55                   	push   %rbp
  8032f0:	48 89 e5             	mov    %rsp,%rbp
  8032f3:	48 83 ec 40          	sub    $0x40,%rsp
  8032f7:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8032fb:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8032ff:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803303:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803307:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80330b:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  803312:	00 
  803313:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803317:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  80331b:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  803320:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  803324:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803328:	8b 50 0c             	mov    0xc(%rax),%edx
  80332b:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803332:	00 00 00 
  803335:	89 10                	mov    %edx,(%rax)
  803337:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80333e:	00 00 00 
  803341:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803345:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803349:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80334d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803351:	48 89 c6             	mov    %rax,%rsi
  803354:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  80335b:	00 00 00 
  80335e:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  803365:	00 00 00 
  803368:	ff d0                	callq  *%rax
  80336a:	be 00 00 00 00       	mov    $0x0,%esi
  80336f:	bf 04 00 00 00       	mov    $0x4,%edi
  803374:	48 b8 51 30 80 00 00 	movabs $0x803051,%rax
  80337b:	00 00 00 
  80337e:	ff d0                	callq  *%rax
  803380:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803383:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803387:	79 05                	jns    80338e <devfile_write+0x9f>
  803389:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80338c:	eb 43                	jmp    8033d1 <devfile_write+0xe2>
  80338e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803391:	48 98                	cltq   
  803393:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803397:	76 35                	jbe    8033ce <devfile_write+0xdf>
  803399:	48 b9 76 50 80 00 00 	movabs $0x805076,%rcx
  8033a0:	00 00 00 
  8033a3:	48 ba 7d 50 80 00 00 	movabs $0x80507d,%rdx
  8033aa:	00 00 00 
  8033ad:	be a8 00 00 00       	mov    $0xa8,%esi
  8033b2:	48 bf 92 50 80 00 00 	movabs $0x805092,%rdi
  8033b9:	00 00 00 
  8033bc:	b8 00 00 00 00       	mov    $0x0,%eax
  8033c1:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  8033c8:	00 00 00 
  8033cb:	41 ff d0             	callq  *%r8
  8033ce:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8033d1:	c9                   	leaveq 
  8033d2:	c3                   	retq   

00000000008033d3 <devfile_stat>:
  8033d3:	55                   	push   %rbp
  8033d4:	48 89 e5             	mov    %rsp,%rbp
  8033d7:	48 83 ec 20          	sub    $0x20,%rsp
  8033db:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8033df:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8033e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8033e7:	8b 50 0c             	mov    0xc(%rax),%edx
  8033ea:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8033f1:	00 00 00 
  8033f4:	89 10                	mov    %edx,(%rax)
  8033f6:	be 00 00 00 00       	mov    $0x0,%esi
  8033fb:	bf 05 00 00 00       	mov    $0x5,%edi
  803400:	48 b8 51 30 80 00 00 	movabs $0x803051,%rax
  803407:	00 00 00 
  80340a:	ff d0                	callq  *%rax
  80340c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80340f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803413:	79 05                	jns    80341a <devfile_stat+0x47>
  803415:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803418:	eb 56                	jmp    803470 <devfile_stat+0x9d>
  80341a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80341e:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  803425:	00 00 00 
  803428:	48 89 c7             	mov    %rax,%rdi
  80342b:	48 b8 62 10 80 00 00 	movabs $0x801062,%rax
  803432:	00 00 00 
  803435:	ff d0                	callq  *%rax
  803437:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80343e:	00 00 00 
  803441:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  803447:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80344b:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803451:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803458:	00 00 00 
  80345b:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  803461:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803465:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  80346b:	b8 00 00 00 00       	mov    $0x0,%eax
  803470:	c9                   	leaveq 
  803471:	c3                   	retq   

0000000000803472 <devfile_trunc>:
  803472:	55                   	push   %rbp
  803473:	48 89 e5             	mov    %rsp,%rbp
  803476:	48 83 ec 10          	sub    $0x10,%rsp
  80347a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80347e:	89 75 f4             	mov    %esi,-0xc(%rbp)
  803481:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803485:	8b 50 0c             	mov    0xc(%rax),%edx
  803488:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80348f:	00 00 00 
  803492:	89 10                	mov    %edx,(%rax)
  803494:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80349b:	00 00 00 
  80349e:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8034a1:	89 50 04             	mov    %edx,0x4(%rax)
  8034a4:	be 00 00 00 00       	mov    $0x0,%esi
  8034a9:	bf 02 00 00 00       	mov    $0x2,%edi
  8034ae:	48 b8 51 30 80 00 00 	movabs $0x803051,%rax
  8034b5:	00 00 00 
  8034b8:	ff d0                	callq  *%rax
  8034ba:	c9                   	leaveq 
  8034bb:	c3                   	retq   

00000000008034bc <remove>:
  8034bc:	55                   	push   %rbp
  8034bd:	48 89 e5             	mov    %rsp,%rbp
  8034c0:	48 83 ec 10          	sub    $0x10,%rsp
  8034c4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8034c8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8034cc:	48 89 c7             	mov    %rax,%rdi
  8034cf:	48 b8 f6 0f 80 00 00 	movabs $0x800ff6,%rax
  8034d6:	00 00 00 
  8034d9:	ff d0                	callq  *%rax
  8034db:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8034e0:	7e 07                	jle    8034e9 <remove+0x2d>
  8034e2:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8034e7:	eb 33                	jmp    80351c <remove+0x60>
  8034e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8034ed:	48 89 c6             	mov    %rax,%rsi
  8034f0:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8034f7:	00 00 00 
  8034fa:	48 b8 62 10 80 00 00 	movabs $0x801062,%rax
  803501:	00 00 00 
  803504:	ff d0                	callq  *%rax
  803506:	be 00 00 00 00       	mov    $0x0,%esi
  80350b:	bf 07 00 00 00       	mov    $0x7,%edi
  803510:	48 b8 51 30 80 00 00 	movabs $0x803051,%rax
  803517:	00 00 00 
  80351a:	ff d0                	callq  *%rax
  80351c:	c9                   	leaveq 
  80351d:	c3                   	retq   

000000000080351e <sync>:
  80351e:	55                   	push   %rbp
  80351f:	48 89 e5             	mov    %rsp,%rbp
  803522:	be 00 00 00 00       	mov    $0x0,%esi
  803527:	bf 08 00 00 00       	mov    $0x8,%edi
  80352c:	48 b8 51 30 80 00 00 	movabs $0x803051,%rax
  803533:	00 00 00 
  803536:	ff d0                	callq  *%rax
  803538:	5d                   	pop    %rbp
  803539:	c3                   	retq   

000000000080353a <copy>:
  80353a:	55                   	push   %rbp
  80353b:	48 89 e5             	mov    %rsp,%rbp
  80353e:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  803545:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  80354c:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  803553:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  80355a:	be 00 00 00 00       	mov    $0x0,%esi
  80355f:	48 89 c7             	mov    %rax,%rdi
  803562:	48 b8 d8 30 80 00 00 	movabs $0x8030d8,%rax
  803569:	00 00 00 
  80356c:	ff d0                	callq  *%rax
  80356e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803571:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803575:	79 28                	jns    80359f <copy+0x65>
  803577:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80357a:	89 c6                	mov    %eax,%esi
  80357c:	48 bf ac 50 80 00 00 	movabs $0x8050ac,%rdi
  803583:	00 00 00 
  803586:	b8 00 00 00 00       	mov    $0x0,%eax
  80358b:	48 ba ad 04 80 00 00 	movabs $0x8004ad,%rdx
  803592:	00 00 00 
  803595:	ff d2                	callq  *%rdx
  803597:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80359a:	e9 74 01 00 00       	jmpq   803713 <copy+0x1d9>
  80359f:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  8035a6:	be 01 01 00 00       	mov    $0x101,%esi
  8035ab:	48 89 c7             	mov    %rax,%rdi
  8035ae:	48 b8 d8 30 80 00 00 	movabs $0x8030d8,%rax
  8035b5:	00 00 00 
  8035b8:	ff d0                	callq  *%rax
  8035ba:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8035bd:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8035c1:	79 39                	jns    8035fc <copy+0xc2>
  8035c3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035c6:	89 c6                	mov    %eax,%esi
  8035c8:	48 bf c2 50 80 00 00 	movabs $0x8050c2,%rdi
  8035cf:	00 00 00 
  8035d2:	b8 00 00 00 00       	mov    $0x0,%eax
  8035d7:	48 ba ad 04 80 00 00 	movabs $0x8004ad,%rdx
  8035de:	00 00 00 
  8035e1:	ff d2                	callq  *%rdx
  8035e3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035e6:	89 c7                	mov    %eax,%edi
  8035e8:	48 b8 e0 29 80 00 00 	movabs $0x8029e0,%rax
  8035ef:	00 00 00 
  8035f2:	ff d0                	callq  *%rax
  8035f4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035f7:	e9 17 01 00 00       	jmpq   803713 <copy+0x1d9>
  8035fc:	eb 74                	jmp    803672 <copy+0x138>
  8035fe:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803601:	48 63 d0             	movslq %eax,%rdx
  803604:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  80360b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80360e:	48 89 ce             	mov    %rcx,%rsi
  803611:	89 c7                	mov    %eax,%edi
  803613:	48 b8 4c 2d 80 00 00 	movabs $0x802d4c,%rax
  80361a:	00 00 00 
  80361d:	ff d0                	callq  *%rax
  80361f:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803622:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803626:	79 4a                	jns    803672 <copy+0x138>
  803628:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80362b:	89 c6                	mov    %eax,%esi
  80362d:	48 bf dc 50 80 00 00 	movabs $0x8050dc,%rdi
  803634:	00 00 00 
  803637:	b8 00 00 00 00       	mov    $0x0,%eax
  80363c:	48 ba ad 04 80 00 00 	movabs $0x8004ad,%rdx
  803643:	00 00 00 
  803646:	ff d2                	callq  *%rdx
  803648:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80364b:	89 c7                	mov    %eax,%edi
  80364d:	48 b8 e0 29 80 00 00 	movabs $0x8029e0,%rax
  803654:	00 00 00 
  803657:	ff d0                	callq  *%rax
  803659:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80365c:	89 c7                	mov    %eax,%edi
  80365e:	48 b8 e0 29 80 00 00 	movabs $0x8029e0,%rax
  803665:	00 00 00 
  803668:	ff d0                	callq  *%rax
  80366a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80366d:	e9 a1 00 00 00       	jmpq   803713 <copy+0x1d9>
  803672:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803679:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80367c:	ba 00 02 00 00       	mov    $0x200,%edx
  803681:	48 89 ce             	mov    %rcx,%rsi
  803684:	89 c7                	mov    %eax,%edi
  803686:	48 b8 02 2c 80 00 00 	movabs $0x802c02,%rax
  80368d:	00 00 00 
  803690:	ff d0                	callq  *%rax
  803692:	89 45 f4             	mov    %eax,-0xc(%rbp)
  803695:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803699:	0f 8f 5f ff ff ff    	jg     8035fe <copy+0xc4>
  80369f:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8036a3:	79 47                	jns    8036ec <copy+0x1b2>
  8036a5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8036a8:	89 c6                	mov    %eax,%esi
  8036aa:	48 bf ef 50 80 00 00 	movabs $0x8050ef,%rdi
  8036b1:	00 00 00 
  8036b4:	b8 00 00 00 00       	mov    $0x0,%eax
  8036b9:	48 ba ad 04 80 00 00 	movabs $0x8004ad,%rdx
  8036c0:	00 00 00 
  8036c3:	ff d2                	callq  *%rdx
  8036c5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036c8:	89 c7                	mov    %eax,%edi
  8036ca:	48 b8 e0 29 80 00 00 	movabs $0x8029e0,%rax
  8036d1:	00 00 00 
  8036d4:	ff d0                	callq  *%rax
  8036d6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8036d9:	89 c7                	mov    %eax,%edi
  8036db:	48 b8 e0 29 80 00 00 	movabs $0x8029e0,%rax
  8036e2:	00 00 00 
  8036e5:	ff d0                	callq  *%rax
  8036e7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8036ea:	eb 27                	jmp    803713 <copy+0x1d9>
  8036ec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036ef:	89 c7                	mov    %eax,%edi
  8036f1:	48 b8 e0 29 80 00 00 	movabs $0x8029e0,%rax
  8036f8:	00 00 00 
  8036fb:	ff d0                	callq  *%rax
  8036fd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803700:	89 c7                	mov    %eax,%edi
  803702:	48 b8 e0 29 80 00 00 	movabs $0x8029e0,%rax
  803709:	00 00 00 
  80370c:	ff d0                	callq  *%rax
  80370e:	b8 00 00 00 00       	mov    $0x0,%eax
  803713:	c9                   	leaveq 
  803714:	c3                   	retq   

0000000000803715 <fd2sockid>:
  803715:	55                   	push   %rbp
  803716:	48 89 e5             	mov    %rsp,%rbp
  803719:	48 83 ec 20          	sub    $0x20,%rsp
  80371d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803720:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803724:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803727:	48 89 d6             	mov    %rdx,%rsi
  80372a:	89 c7                	mov    %eax,%edi
  80372c:	48 b8 d0 27 80 00 00 	movabs $0x8027d0,%rax
  803733:	00 00 00 
  803736:	ff d0                	callq  *%rax
  803738:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80373b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80373f:	79 05                	jns    803746 <fd2sockid+0x31>
  803741:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803744:	eb 24                	jmp    80376a <fd2sockid+0x55>
  803746:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80374a:	8b 10                	mov    (%rax),%edx
  80374c:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  803753:	00 00 00 
  803756:	8b 00                	mov    (%rax),%eax
  803758:	39 c2                	cmp    %eax,%edx
  80375a:	74 07                	je     803763 <fd2sockid+0x4e>
  80375c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803761:	eb 07                	jmp    80376a <fd2sockid+0x55>
  803763:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803767:	8b 40 0c             	mov    0xc(%rax),%eax
  80376a:	c9                   	leaveq 
  80376b:	c3                   	retq   

000000000080376c <alloc_sockfd>:
  80376c:	55                   	push   %rbp
  80376d:	48 89 e5             	mov    %rsp,%rbp
  803770:	48 83 ec 20          	sub    $0x20,%rsp
  803774:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803777:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80377b:	48 89 c7             	mov    %rax,%rdi
  80377e:	48 b8 38 27 80 00 00 	movabs $0x802738,%rax
  803785:	00 00 00 
  803788:	ff d0                	callq  *%rax
  80378a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80378d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803791:	78 26                	js     8037b9 <alloc_sockfd+0x4d>
  803793:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803797:	ba 07 04 00 00       	mov    $0x407,%edx
  80379c:	48 89 c6             	mov    %rax,%rsi
  80379f:	bf 00 00 00 00       	mov    $0x0,%edi
  8037a4:	48 b8 91 19 80 00 00 	movabs $0x801991,%rax
  8037ab:	00 00 00 
  8037ae:	ff d0                	callq  *%rax
  8037b0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037b3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037b7:	79 16                	jns    8037cf <alloc_sockfd+0x63>
  8037b9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8037bc:	89 c7                	mov    %eax,%edi
  8037be:	48 b8 79 3c 80 00 00 	movabs $0x803c79,%rax
  8037c5:	00 00 00 
  8037c8:	ff d0                	callq  *%rax
  8037ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037cd:	eb 3a                	jmp    803809 <alloc_sockfd+0x9d>
  8037cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037d3:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  8037da:	00 00 00 
  8037dd:	8b 12                	mov    (%rdx),%edx
  8037df:	89 10                	mov    %edx,(%rax)
  8037e1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037e5:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8037ec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037f0:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8037f3:	89 50 0c             	mov    %edx,0xc(%rax)
  8037f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037fa:	48 89 c7             	mov    %rax,%rdi
  8037fd:	48 b8 ea 26 80 00 00 	movabs $0x8026ea,%rax
  803804:	00 00 00 
  803807:	ff d0                	callq  *%rax
  803809:	c9                   	leaveq 
  80380a:	c3                   	retq   

000000000080380b <accept>:
  80380b:	55                   	push   %rbp
  80380c:	48 89 e5             	mov    %rsp,%rbp
  80380f:	48 83 ec 30          	sub    $0x30,%rsp
  803813:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803816:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80381a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80381e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803821:	89 c7                	mov    %eax,%edi
  803823:	48 b8 15 37 80 00 00 	movabs $0x803715,%rax
  80382a:	00 00 00 
  80382d:	ff d0                	callq  *%rax
  80382f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803832:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803836:	79 05                	jns    80383d <accept+0x32>
  803838:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80383b:	eb 3b                	jmp    803878 <accept+0x6d>
  80383d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803841:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803845:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803848:	48 89 ce             	mov    %rcx,%rsi
  80384b:	89 c7                	mov    %eax,%edi
  80384d:	48 b8 56 3b 80 00 00 	movabs $0x803b56,%rax
  803854:	00 00 00 
  803857:	ff d0                	callq  *%rax
  803859:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80385c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803860:	79 05                	jns    803867 <accept+0x5c>
  803862:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803865:	eb 11                	jmp    803878 <accept+0x6d>
  803867:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80386a:	89 c7                	mov    %eax,%edi
  80386c:	48 b8 6c 37 80 00 00 	movabs $0x80376c,%rax
  803873:	00 00 00 
  803876:	ff d0                	callq  *%rax
  803878:	c9                   	leaveq 
  803879:	c3                   	retq   

000000000080387a <bind>:
  80387a:	55                   	push   %rbp
  80387b:	48 89 e5             	mov    %rsp,%rbp
  80387e:	48 83 ec 20          	sub    $0x20,%rsp
  803882:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803885:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803889:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80388c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80388f:	89 c7                	mov    %eax,%edi
  803891:	48 b8 15 37 80 00 00 	movabs $0x803715,%rax
  803898:	00 00 00 
  80389b:	ff d0                	callq  *%rax
  80389d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038a0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038a4:	79 05                	jns    8038ab <bind+0x31>
  8038a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038a9:	eb 1b                	jmp    8038c6 <bind+0x4c>
  8038ab:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8038ae:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8038b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038b5:	48 89 ce             	mov    %rcx,%rsi
  8038b8:	89 c7                	mov    %eax,%edi
  8038ba:	48 b8 d5 3b 80 00 00 	movabs $0x803bd5,%rax
  8038c1:	00 00 00 
  8038c4:	ff d0                	callq  *%rax
  8038c6:	c9                   	leaveq 
  8038c7:	c3                   	retq   

00000000008038c8 <shutdown>:
  8038c8:	55                   	push   %rbp
  8038c9:	48 89 e5             	mov    %rsp,%rbp
  8038cc:	48 83 ec 20          	sub    $0x20,%rsp
  8038d0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8038d3:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8038d6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8038d9:	89 c7                	mov    %eax,%edi
  8038db:	48 b8 15 37 80 00 00 	movabs $0x803715,%rax
  8038e2:	00 00 00 
  8038e5:	ff d0                	callq  *%rax
  8038e7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038ea:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038ee:	79 05                	jns    8038f5 <shutdown+0x2d>
  8038f0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038f3:	eb 16                	jmp    80390b <shutdown+0x43>
  8038f5:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8038f8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038fb:	89 d6                	mov    %edx,%esi
  8038fd:	89 c7                	mov    %eax,%edi
  8038ff:	48 b8 39 3c 80 00 00 	movabs $0x803c39,%rax
  803906:	00 00 00 
  803909:	ff d0                	callq  *%rax
  80390b:	c9                   	leaveq 
  80390c:	c3                   	retq   

000000000080390d <devsock_close>:
  80390d:	55                   	push   %rbp
  80390e:	48 89 e5             	mov    %rsp,%rbp
  803911:	48 83 ec 10          	sub    $0x10,%rsp
  803915:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803919:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80391d:	48 89 c7             	mov    %rax,%rdi
  803920:	48 b8 c5 48 80 00 00 	movabs $0x8048c5,%rax
  803927:	00 00 00 
  80392a:	ff d0                	callq  *%rax
  80392c:	83 f8 01             	cmp    $0x1,%eax
  80392f:	75 17                	jne    803948 <devsock_close+0x3b>
  803931:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803935:	8b 40 0c             	mov    0xc(%rax),%eax
  803938:	89 c7                	mov    %eax,%edi
  80393a:	48 b8 79 3c 80 00 00 	movabs $0x803c79,%rax
  803941:	00 00 00 
  803944:	ff d0                	callq  *%rax
  803946:	eb 05                	jmp    80394d <devsock_close+0x40>
  803948:	b8 00 00 00 00       	mov    $0x0,%eax
  80394d:	c9                   	leaveq 
  80394e:	c3                   	retq   

000000000080394f <connect>:
  80394f:	55                   	push   %rbp
  803950:	48 89 e5             	mov    %rsp,%rbp
  803953:	48 83 ec 20          	sub    $0x20,%rsp
  803957:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80395a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80395e:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803961:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803964:	89 c7                	mov    %eax,%edi
  803966:	48 b8 15 37 80 00 00 	movabs $0x803715,%rax
  80396d:	00 00 00 
  803970:	ff d0                	callq  *%rax
  803972:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803975:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803979:	79 05                	jns    803980 <connect+0x31>
  80397b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80397e:	eb 1b                	jmp    80399b <connect+0x4c>
  803980:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803983:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803987:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80398a:	48 89 ce             	mov    %rcx,%rsi
  80398d:	89 c7                	mov    %eax,%edi
  80398f:	48 b8 a6 3c 80 00 00 	movabs $0x803ca6,%rax
  803996:	00 00 00 
  803999:	ff d0                	callq  *%rax
  80399b:	c9                   	leaveq 
  80399c:	c3                   	retq   

000000000080399d <listen>:
  80399d:	55                   	push   %rbp
  80399e:	48 89 e5             	mov    %rsp,%rbp
  8039a1:	48 83 ec 20          	sub    $0x20,%rsp
  8039a5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8039a8:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8039ab:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8039ae:	89 c7                	mov    %eax,%edi
  8039b0:	48 b8 15 37 80 00 00 	movabs $0x803715,%rax
  8039b7:	00 00 00 
  8039ba:	ff d0                	callq  *%rax
  8039bc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039bf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039c3:	79 05                	jns    8039ca <listen+0x2d>
  8039c5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039c8:	eb 16                	jmp    8039e0 <listen+0x43>
  8039ca:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8039cd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039d0:	89 d6                	mov    %edx,%esi
  8039d2:	89 c7                	mov    %eax,%edi
  8039d4:	48 b8 0a 3d 80 00 00 	movabs $0x803d0a,%rax
  8039db:	00 00 00 
  8039de:	ff d0                	callq  *%rax
  8039e0:	c9                   	leaveq 
  8039e1:	c3                   	retq   

00000000008039e2 <devsock_read>:
  8039e2:	55                   	push   %rbp
  8039e3:	48 89 e5             	mov    %rsp,%rbp
  8039e6:	48 83 ec 20          	sub    $0x20,%rsp
  8039ea:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8039ee:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8039f2:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8039f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039fa:	89 c2                	mov    %eax,%edx
  8039fc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a00:	8b 40 0c             	mov    0xc(%rax),%eax
  803a03:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803a07:	b9 00 00 00 00       	mov    $0x0,%ecx
  803a0c:	89 c7                	mov    %eax,%edi
  803a0e:	48 b8 4a 3d 80 00 00 	movabs $0x803d4a,%rax
  803a15:	00 00 00 
  803a18:	ff d0                	callq  *%rax
  803a1a:	c9                   	leaveq 
  803a1b:	c3                   	retq   

0000000000803a1c <devsock_write>:
  803a1c:	55                   	push   %rbp
  803a1d:	48 89 e5             	mov    %rsp,%rbp
  803a20:	48 83 ec 20          	sub    $0x20,%rsp
  803a24:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803a28:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803a2c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803a30:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a34:	89 c2                	mov    %eax,%edx
  803a36:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a3a:	8b 40 0c             	mov    0xc(%rax),%eax
  803a3d:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803a41:	b9 00 00 00 00       	mov    $0x0,%ecx
  803a46:	89 c7                	mov    %eax,%edi
  803a48:	48 b8 16 3e 80 00 00 	movabs $0x803e16,%rax
  803a4f:	00 00 00 
  803a52:	ff d0                	callq  *%rax
  803a54:	c9                   	leaveq 
  803a55:	c3                   	retq   

0000000000803a56 <devsock_stat>:
  803a56:	55                   	push   %rbp
  803a57:	48 89 e5             	mov    %rsp,%rbp
  803a5a:	48 83 ec 10          	sub    $0x10,%rsp
  803a5e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803a62:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803a66:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a6a:	48 be 0a 51 80 00 00 	movabs $0x80510a,%rsi
  803a71:	00 00 00 
  803a74:	48 89 c7             	mov    %rax,%rdi
  803a77:	48 b8 62 10 80 00 00 	movabs $0x801062,%rax
  803a7e:	00 00 00 
  803a81:	ff d0                	callq  *%rax
  803a83:	b8 00 00 00 00       	mov    $0x0,%eax
  803a88:	c9                   	leaveq 
  803a89:	c3                   	retq   

0000000000803a8a <socket>:
  803a8a:	55                   	push   %rbp
  803a8b:	48 89 e5             	mov    %rsp,%rbp
  803a8e:	48 83 ec 20          	sub    $0x20,%rsp
  803a92:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a95:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803a98:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803a9b:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803a9e:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803aa1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803aa4:	89 ce                	mov    %ecx,%esi
  803aa6:	89 c7                	mov    %eax,%edi
  803aa8:	48 b8 ce 3e 80 00 00 	movabs $0x803ece,%rax
  803aaf:	00 00 00 
  803ab2:	ff d0                	callq  *%rax
  803ab4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ab7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803abb:	79 05                	jns    803ac2 <socket+0x38>
  803abd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ac0:	eb 11                	jmp    803ad3 <socket+0x49>
  803ac2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ac5:	89 c7                	mov    %eax,%edi
  803ac7:	48 b8 6c 37 80 00 00 	movabs $0x80376c,%rax
  803ace:	00 00 00 
  803ad1:	ff d0                	callq  *%rax
  803ad3:	c9                   	leaveq 
  803ad4:	c3                   	retq   

0000000000803ad5 <nsipc>:
  803ad5:	55                   	push   %rbp
  803ad6:	48 89 e5             	mov    %rsp,%rbp
  803ad9:	48 83 ec 10          	sub    $0x10,%rsp
  803add:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ae0:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803ae7:	00 00 00 
  803aea:	8b 00                	mov    (%rax),%eax
  803aec:	85 c0                	test   %eax,%eax
  803aee:	75 1d                	jne    803b0d <nsipc+0x38>
  803af0:	bf 02 00 00 00       	mov    $0x2,%edi
  803af5:	48 b8 78 26 80 00 00 	movabs $0x802678,%rax
  803afc:	00 00 00 
  803aff:	ff d0                	callq  *%rax
  803b01:	48 ba 04 80 80 00 00 	movabs $0x808004,%rdx
  803b08:	00 00 00 
  803b0b:	89 02                	mov    %eax,(%rdx)
  803b0d:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803b14:	00 00 00 
  803b17:	8b 00                	mov    (%rax),%eax
  803b19:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803b1c:	b9 07 00 00 00       	mov    $0x7,%ecx
  803b21:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803b28:	00 00 00 
  803b2b:	89 c7                	mov    %eax,%edi
  803b2d:	48 b8 47 24 80 00 00 	movabs $0x802447,%rax
  803b34:	00 00 00 
  803b37:	ff d0                	callq  *%rax
  803b39:	ba 00 00 00 00       	mov    $0x0,%edx
  803b3e:	be 00 00 00 00       	mov    $0x0,%esi
  803b43:	bf 00 00 00 00       	mov    $0x0,%edi
  803b48:	48 b8 86 23 80 00 00 	movabs $0x802386,%rax
  803b4f:	00 00 00 
  803b52:	ff d0                	callq  *%rax
  803b54:	c9                   	leaveq 
  803b55:	c3                   	retq   

0000000000803b56 <nsipc_accept>:
  803b56:	55                   	push   %rbp
  803b57:	48 89 e5             	mov    %rsp,%rbp
  803b5a:	48 83 ec 30          	sub    $0x30,%rsp
  803b5e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b61:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803b65:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803b69:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b70:	00 00 00 
  803b73:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803b76:	89 10                	mov    %edx,(%rax)
  803b78:	bf 01 00 00 00       	mov    $0x1,%edi
  803b7d:	48 b8 d5 3a 80 00 00 	movabs $0x803ad5,%rax
  803b84:	00 00 00 
  803b87:	ff d0                	callq  *%rax
  803b89:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b8c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b90:	78 3e                	js     803bd0 <nsipc_accept+0x7a>
  803b92:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b99:	00 00 00 
  803b9c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803ba0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ba4:	8b 40 10             	mov    0x10(%rax),%eax
  803ba7:	89 c2                	mov    %eax,%edx
  803ba9:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803bad:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803bb1:	48 89 ce             	mov    %rcx,%rsi
  803bb4:	48 89 c7             	mov    %rax,%rdi
  803bb7:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  803bbe:	00 00 00 
  803bc1:	ff d0                	callq  *%rax
  803bc3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bc7:	8b 50 10             	mov    0x10(%rax),%edx
  803bca:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803bce:	89 10                	mov    %edx,(%rax)
  803bd0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bd3:	c9                   	leaveq 
  803bd4:	c3                   	retq   

0000000000803bd5 <nsipc_bind>:
  803bd5:	55                   	push   %rbp
  803bd6:	48 89 e5             	mov    %rsp,%rbp
  803bd9:	48 83 ec 10          	sub    $0x10,%rsp
  803bdd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803be0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803be4:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803be7:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803bee:	00 00 00 
  803bf1:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803bf4:	89 10                	mov    %edx,(%rax)
  803bf6:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803bf9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bfd:	48 89 c6             	mov    %rax,%rsi
  803c00:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803c07:	00 00 00 
  803c0a:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  803c11:	00 00 00 
  803c14:	ff d0                	callq  *%rax
  803c16:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c1d:	00 00 00 
  803c20:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803c23:	89 50 14             	mov    %edx,0x14(%rax)
  803c26:	bf 02 00 00 00       	mov    $0x2,%edi
  803c2b:	48 b8 d5 3a 80 00 00 	movabs $0x803ad5,%rax
  803c32:	00 00 00 
  803c35:	ff d0                	callq  *%rax
  803c37:	c9                   	leaveq 
  803c38:	c3                   	retq   

0000000000803c39 <nsipc_shutdown>:
  803c39:	55                   	push   %rbp
  803c3a:	48 89 e5             	mov    %rsp,%rbp
  803c3d:	48 83 ec 10          	sub    $0x10,%rsp
  803c41:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c44:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803c47:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c4e:	00 00 00 
  803c51:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c54:	89 10                	mov    %edx,(%rax)
  803c56:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c5d:	00 00 00 
  803c60:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803c63:	89 50 04             	mov    %edx,0x4(%rax)
  803c66:	bf 03 00 00 00       	mov    $0x3,%edi
  803c6b:	48 b8 d5 3a 80 00 00 	movabs $0x803ad5,%rax
  803c72:	00 00 00 
  803c75:	ff d0                	callq  *%rax
  803c77:	c9                   	leaveq 
  803c78:	c3                   	retq   

0000000000803c79 <nsipc_close>:
  803c79:	55                   	push   %rbp
  803c7a:	48 89 e5             	mov    %rsp,%rbp
  803c7d:	48 83 ec 10          	sub    $0x10,%rsp
  803c81:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c84:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c8b:	00 00 00 
  803c8e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c91:	89 10                	mov    %edx,(%rax)
  803c93:	bf 04 00 00 00       	mov    $0x4,%edi
  803c98:	48 b8 d5 3a 80 00 00 	movabs $0x803ad5,%rax
  803c9f:	00 00 00 
  803ca2:	ff d0                	callq  *%rax
  803ca4:	c9                   	leaveq 
  803ca5:	c3                   	retq   

0000000000803ca6 <nsipc_connect>:
  803ca6:	55                   	push   %rbp
  803ca7:	48 89 e5             	mov    %rsp,%rbp
  803caa:	48 83 ec 10          	sub    $0x10,%rsp
  803cae:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803cb1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803cb5:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803cb8:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cbf:	00 00 00 
  803cc2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803cc5:	89 10                	mov    %edx,(%rax)
  803cc7:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803cca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cce:	48 89 c6             	mov    %rax,%rsi
  803cd1:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803cd8:	00 00 00 
  803cdb:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  803ce2:	00 00 00 
  803ce5:	ff d0                	callq  *%rax
  803ce7:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cee:	00 00 00 
  803cf1:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803cf4:	89 50 14             	mov    %edx,0x14(%rax)
  803cf7:	bf 05 00 00 00       	mov    $0x5,%edi
  803cfc:	48 b8 d5 3a 80 00 00 	movabs $0x803ad5,%rax
  803d03:	00 00 00 
  803d06:	ff d0                	callq  *%rax
  803d08:	c9                   	leaveq 
  803d09:	c3                   	retq   

0000000000803d0a <nsipc_listen>:
  803d0a:	55                   	push   %rbp
  803d0b:	48 89 e5             	mov    %rsp,%rbp
  803d0e:	48 83 ec 10          	sub    $0x10,%rsp
  803d12:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d15:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803d18:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d1f:	00 00 00 
  803d22:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d25:	89 10                	mov    %edx,(%rax)
  803d27:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d2e:	00 00 00 
  803d31:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d34:	89 50 04             	mov    %edx,0x4(%rax)
  803d37:	bf 06 00 00 00       	mov    $0x6,%edi
  803d3c:	48 b8 d5 3a 80 00 00 	movabs $0x803ad5,%rax
  803d43:	00 00 00 
  803d46:	ff d0                	callq  *%rax
  803d48:	c9                   	leaveq 
  803d49:	c3                   	retq   

0000000000803d4a <nsipc_recv>:
  803d4a:	55                   	push   %rbp
  803d4b:	48 89 e5             	mov    %rsp,%rbp
  803d4e:	48 83 ec 30          	sub    $0x30,%rsp
  803d52:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d55:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803d59:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803d5c:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803d5f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d66:	00 00 00 
  803d69:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803d6c:	89 10                	mov    %edx,(%rax)
  803d6e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d75:	00 00 00 
  803d78:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803d7b:	89 50 04             	mov    %edx,0x4(%rax)
  803d7e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d85:	00 00 00 
  803d88:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803d8b:	89 50 08             	mov    %edx,0x8(%rax)
  803d8e:	bf 07 00 00 00       	mov    $0x7,%edi
  803d93:	48 b8 d5 3a 80 00 00 	movabs $0x803ad5,%rax
  803d9a:	00 00 00 
  803d9d:	ff d0                	callq  *%rax
  803d9f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803da2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803da6:	78 69                	js     803e11 <nsipc_recv+0xc7>
  803da8:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803daf:	7f 08                	jg     803db9 <nsipc_recv+0x6f>
  803db1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803db4:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803db7:	7e 35                	jle    803dee <nsipc_recv+0xa4>
  803db9:	48 b9 11 51 80 00 00 	movabs $0x805111,%rcx
  803dc0:	00 00 00 
  803dc3:	48 ba 26 51 80 00 00 	movabs $0x805126,%rdx
  803dca:	00 00 00 
  803dcd:	be 62 00 00 00       	mov    $0x62,%esi
  803dd2:	48 bf 3b 51 80 00 00 	movabs $0x80513b,%rdi
  803dd9:	00 00 00 
  803ddc:	b8 00 00 00 00       	mov    $0x0,%eax
  803de1:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  803de8:	00 00 00 
  803deb:	41 ff d0             	callq  *%r8
  803dee:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803df1:	48 63 d0             	movslq %eax,%rdx
  803df4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803df8:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  803dff:	00 00 00 
  803e02:	48 89 c7             	mov    %rax,%rdi
  803e05:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  803e0c:	00 00 00 
  803e0f:	ff d0                	callq  *%rax
  803e11:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e14:	c9                   	leaveq 
  803e15:	c3                   	retq   

0000000000803e16 <nsipc_send>:
  803e16:	55                   	push   %rbp
  803e17:	48 89 e5             	mov    %rsp,%rbp
  803e1a:	48 83 ec 20          	sub    $0x20,%rsp
  803e1e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e21:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803e25:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803e28:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803e2b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e32:	00 00 00 
  803e35:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803e38:	89 10                	mov    %edx,(%rax)
  803e3a:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803e41:	7e 35                	jle    803e78 <nsipc_send+0x62>
  803e43:	48 b9 4a 51 80 00 00 	movabs $0x80514a,%rcx
  803e4a:	00 00 00 
  803e4d:	48 ba 26 51 80 00 00 	movabs $0x805126,%rdx
  803e54:	00 00 00 
  803e57:	be 6d 00 00 00       	mov    $0x6d,%esi
  803e5c:	48 bf 3b 51 80 00 00 	movabs $0x80513b,%rdi
  803e63:	00 00 00 
  803e66:	b8 00 00 00 00       	mov    $0x0,%eax
  803e6b:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  803e72:	00 00 00 
  803e75:	41 ff d0             	callq  *%r8
  803e78:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803e7b:	48 63 d0             	movslq %eax,%rdx
  803e7e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e82:	48 89 c6             	mov    %rax,%rsi
  803e85:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  803e8c:	00 00 00 
  803e8f:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  803e96:	00 00 00 
  803e99:	ff d0                	callq  *%rax
  803e9b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ea2:	00 00 00 
  803ea5:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ea8:	89 50 04             	mov    %edx,0x4(%rax)
  803eab:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803eb2:	00 00 00 
  803eb5:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803eb8:	89 50 08             	mov    %edx,0x8(%rax)
  803ebb:	bf 08 00 00 00       	mov    $0x8,%edi
  803ec0:	48 b8 d5 3a 80 00 00 	movabs $0x803ad5,%rax
  803ec7:	00 00 00 
  803eca:	ff d0                	callq  *%rax
  803ecc:	c9                   	leaveq 
  803ecd:	c3                   	retq   

0000000000803ece <nsipc_socket>:
  803ece:	55                   	push   %rbp
  803ecf:	48 89 e5             	mov    %rsp,%rbp
  803ed2:	48 83 ec 10          	sub    $0x10,%rsp
  803ed6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ed9:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803edc:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803edf:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ee6:	00 00 00 
  803ee9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803eec:	89 10                	mov    %edx,(%rax)
  803eee:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ef5:	00 00 00 
  803ef8:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803efb:	89 50 04             	mov    %edx,0x4(%rax)
  803efe:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f05:	00 00 00 
  803f08:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803f0b:	89 50 08             	mov    %edx,0x8(%rax)
  803f0e:	bf 09 00 00 00       	mov    $0x9,%edi
  803f13:	48 b8 d5 3a 80 00 00 	movabs $0x803ad5,%rax
  803f1a:	00 00 00 
  803f1d:	ff d0                	callq  *%rax
  803f1f:	c9                   	leaveq 
  803f20:	c3                   	retq   

0000000000803f21 <pipe>:
  803f21:	55                   	push   %rbp
  803f22:	48 89 e5             	mov    %rsp,%rbp
  803f25:	53                   	push   %rbx
  803f26:	48 83 ec 38          	sub    $0x38,%rsp
  803f2a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803f2e:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803f32:	48 89 c7             	mov    %rax,%rdi
  803f35:	48 b8 38 27 80 00 00 	movabs $0x802738,%rax
  803f3c:	00 00 00 
  803f3f:	ff d0                	callq  *%rax
  803f41:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f44:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f48:	0f 88 bf 01 00 00    	js     80410d <pipe+0x1ec>
  803f4e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f52:	ba 07 04 00 00       	mov    $0x407,%edx
  803f57:	48 89 c6             	mov    %rax,%rsi
  803f5a:	bf 00 00 00 00       	mov    $0x0,%edi
  803f5f:	48 b8 91 19 80 00 00 	movabs $0x801991,%rax
  803f66:	00 00 00 
  803f69:	ff d0                	callq  *%rax
  803f6b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f6e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f72:	0f 88 95 01 00 00    	js     80410d <pipe+0x1ec>
  803f78:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803f7c:	48 89 c7             	mov    %rax,%rdi
  803f7f:	48 b8 38 27 80 00 00 	movabs $0x802738,%rax
  803f86:	00 00 00 
  803f89:	ff d0                	callq  *%rax
  803f8b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f8e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f92:	0f 88 5d 01 00 00    	js     8040f5 <pipe+0x1d4>
  803f98:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f9c:	ba 07 04 00 00       	mov    $0x407,%edx
  803fa1:	48 89 c6             	mov    %rax,%rsi
  803fa4:	bf 00 00 00 00       	mov    $0x0,%edi
  803fa9:	48 b8 91 19 80 00 00 	movabs $0x801991,%rax
  803fb0:	00 00 00 
  803fb3:	ff d0                	callq  *%rax
  803fb5:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803fb8:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803fbc:	0f 88 33 01 00 00    	js     8040f5 <pipe+0x1d4>
  803fc2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803fc6:	48 89 c7             	mov    %rax,%rdi
  803fc9:	48 b8 0d 27 80 00 00 	movabs $0x80270d,%rax
  803fd0:	00 00 00 
  803fd3:	ff d0                	callq  *%rax
  803fd5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803fd9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803fdd:	ba 07 04 00 00       	mov    $0x407,%edx
  803fe2:	48 89 c6             	mov    %rax,%rsi
  803fe5:	bf 00 00 00 00       	mov    $0x0,%edi
  803fea:	48 b8 91 19 80 00 00 	movabs $0x801991,%rax
  803ff1:	00 00 00 
  803ff4:	ff d0                	callq  *%rax
  803ff6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803ff9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803ffd:	79 05                	jns    804004 <pipe+0xe3>
  803fff:	e9 d9 00 00 00       	jmpq   8040dd <pipe+0x1bc>
  804004:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804008:	48 89 c7             	mov    %rax,%rdi
  80400b:	48 b8 0d 27 80 00 00 	movabs $0x80270d,%rax
  804012:	00 00 00 
  804015:	ff d0                	callq  *%rax
  804017:	48 89 c2             	mov    %rax,%rdx
  80401a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80401e:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  804024:	48 89 d1             	mov    %rdx,%rcx
  804027:	ba 00 00 00 00       	mov    $0x0,%edx
  80402c:	48 89 c6             	mov    %rax,%rsi
  80402f:	bf 00 00 00 00       	mov    $0x0,%edi
  804034:	48 b8 e1 19 80 00 00 	movabs $0x8019e1,%rax
  80403b:	00 00 00 
  80403e:	ff d0                	callq  *%rax
  804040:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804043:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804047:	79 1b                	jns    804064 <pipe+0x143>
  804049:	90                   	nop
  80404a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80404e:	48 89 c6             	mov    %rax,%rsi
  804051:	bf 00 00 00 00       	mov    $0x0,%edi
  804056:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  80405d:	00 00 00 
  804060:	ff d0                	callq  *%rax
  804062:	eb 79                	jmp    8040dd <pipe+0x1bc>
  804064:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804068:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  80406f:	00 00 00 
  804072:	8b 12                	mov    (%rdx),%edx
  804074:	89 10                	mov    %edx,(%rax)
  804076:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80407a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  804081:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804085:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  80408c:	00 00 00 
  80408f:	8b 12                	mov    (%rdx),%edx
  804091:	89 10                	mov    %edx,(%rax)
  804093:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804097:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  80409e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8040a2:	48 89 c7             	mov    %rax,%rdi
  8040a5:	48 b8 ea 26 80 00 00 	movabs $0x8026ea,%rax
  8040ac:	00 00 00 
  8040af:	ff d0                	callq  *%rax
  8040b1:	89 c2                	mov    %eax,%edx
  8040b3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8040b7:	89 10                	mov    %edx,(%rax)
  8040b9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8040bd:	48 8d 58 04          	lea    0x4(%rax),%rbx
  8040c1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8040c5:	48 89 c7             	mov    %rax,%rdi
  8040c8:	48 b8 ea 26 80 00 00 	movabs $0x8026ea,%rax
  8040cf:	00 00 00 
  8040d2:	ff d0                	callq  *%rax
  8040d4:	89 03                	mov    %eax,(%rbx)
  8040d6:	b8 00 00 00 00       	mov    $0x0,%eax
  8040db:	eb 33                	jmp    804110 <pipe+0x1ef>
  8040dd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8040e1:	48 89 c6             	mov    %rax,%rsi
  8040e4:	bf 00 00 00 00       	mov    $0x0,%edi
  8040e9:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  8040f0:	00 00 00 
  8040f3:	ff d0                	callq  *%rax
  8040f5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8040f9:	48 89 c6             	mov    %rax,%rsi
  8040fc:	bf 00 00 00 00       	mov    $0x0,%edi
  804101:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  804108:	00 00 00 
  80410b:	ff d0                	callq  *%rax
  80410d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804110:	48 83 c4 38          	add    $0x38,%rsp
  804114:	5b                   	pop    %rbx
  804115:	5d                   	pop    %rbp
  804116:	c3                   	retq   

0000000000804117 <_pipeisclosed>:
  804117:	55                   	push   %rbp
  804118:	48 89 e5             	mov    %rsp,%rbp
  80411b:	53                   	push   %rbx
  80411c:	48 83 ec 28          	sub    $0x28,%rsp
  804120:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804124:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804128:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80412f:	00 00 00 
  804132:	48 8b 00             	mov    (%rax),%rax
  804135:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80413b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80413e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804142:	48 89 c7             	mov    %rax,%rdi
  804145:	48 b8 c5 48 80 00 00 	movabs $0x8048c5,%rax
  80414c:	00 00 00 
  80414f:	ff d0                	callq  *%rax
  804151:	89 c3                	mov    %eax,%ebx
  804153:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804157:	48 89 c7             	mov    %rax,%rdi
  80415a:	48 b8 c5 48 80 00 00 	movabs $0x8048c5,%rax
  804161:	00 00 00 
  804164:	ff d0                	callq  *%rax
  804166:	39 c3                	cmp    %eax,%ebx
  804168:	0f 94 c0             	sete   %al
  80416b:	0f b6 c0             	movzbl %al,%eax
  80416e:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804171:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804178:	00 00 00 
  80417b:	48 8b 00             	mov    (%rax),%rax
  80417e:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804184:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804187:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80418a:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80418d:	75 05                	jne    804194 <_pipeisclosed+0x7d>
  80418f:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804192:	eb 4f                	jmp    8041e3 <_pipeisclosed+0xcc>
  804194:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804197:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80419a:	74 42                	je     8041de <_pipeisclosed+0xc7>
  80419c:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  8041a0:	75 3c                	jne    8041de <_pipeisclosed+0xc7>
  8041a2:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8041a9:	00 00 00 
  8041ac:	48 8b 00             	mov    (%rax),%rax
  8041af:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  8041b5:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8041b8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8041bb:	89 c6                	mov    %eax,%esi
  8041bd:	48 bf 5b 51 80 00 00 	movabs $0x80515b,%rdi
  8041c4:	00 00 00 
  8041c7:	b8 00 00 00 00       	mov    $0x0,%eax
  8041cc:	49 b8 ad 04 80 00 00 	movabs $0x8004ad,%r8
  8041d3:	00 00 00 
  8041d6:	41 ff d0             	callq  *%r8
  8041d9:	e9 4a ff ff ff       	jmpq   804128 <_pipeisclosed+0x11>
  8041de:	e9 45 ff ff ff       	jmpq   804128 <_pipeisclosed+0x11>
  8041e3:	48 83 c4 28          	add    $0x28,%rsp
  8041e7:	5b                   	pop    %rbx
  8041e8:	5d                   	pop    %rbp
  8041e9:	c3                   	retq   

00000000008041ea <pipeisclosed>:
  8041ea:	55                   	push   %rbp
  8041eb:	48 89 e5             	mov    %rsp,%rbp
  8041ee:	48 83 ec 30          	sub    $0x30,%rsp
  8041f2:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8041f5:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8041f9:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8041fc:	48 89 d6             	mov    %rdx,%rsi
  8041ff:	89 c7                	mov    %eax,%edi
  804201:	48 b8 d0 27 80 00 00 	movabs $0x8027d0,%rax
  804208:	00 00 00 
  80420b:	ff d0                	callq  *%rax
  80420d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804210:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804214:	79 05                	jns    80421b <pipeisclosed+0x31>
  804216:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804219:	eb 31                	jmp    80424c <pipeisclosed+0x62>
  80421b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80421f:	48 89 c7             	mov    %rax,%rdi
  804222:	48 b8 0d 27 80 00 00 	movabs $0x80270d,%rax
  804229:	00 00 00 
  80422c:	ff d0                	callq  *%rax
  80422e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804232:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804236:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80423a:	48 89 d6             	mov    %rdx,%rsi
  80423d:	48 89 c7             	mov    %rax,%rdi
  804240:	48 b8 17 41 80 00 00 	movabs $0x804117,%rax
  804247:	00 00 00 
  80424a:	ff d0                	callq  *%rax
  80424c:	c9                   	leaveq 
  80424d:	c3                   	retq   

000000000080424e <devpipe_read>:
  80424e:	55                   	push   %rbp
  80424f:	48 89 e5             	mov    %rsp,%rbp
  804252:	48 83 ec 40          	sub    $0x40,%rsp
  804256:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80425a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80425e:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804262:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804266:	48 89 c7             	mov    %rax,%rdi
  804269:	48 b8 0d 27 80 00 00 	movabs $0x80270d,%rax
  804270:	00 00 00 
  804273:	ff d0                	callq  *%rax
  804275:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804279:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80427d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804281:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804288:	00 
  804289:	e9 92 00 00 00       	jmpq   804320 <devpipe_read+0xd2>
  80428e:	eb 41                	jmp    8042d1 <devpipe_read+0x83>
  804290:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  804295:	74 09                	je     8042a0 <devpipe_read+0x52>
  804297:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80429b:	e9 92 00 00 00       	jmpq   804332 <devpipe_read+0xe4>
  8042a0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8042a4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042a8:	48 89 d6             	mov    %rdx,%rsi
  8042ab:	48 89 c7             	mov    %rax,%rdi
  8042ae:	48 b8 17 41 80 00 00 	movabs $0x804117,%rax
  8042b5:	00 00 00 
  8042b8:	ff d0                	callq  *%rax
  8042ba:	85 c0                	test   %eax,%eax
  8042bc:	74 07                	je     8042c5 <devpipe_read+0x77>
  8042be:	b8 00 00 00 00       	mov    $0x0,%eax
  8042c3:	eb 6d                	jmp    804332 <devpipe_read+0xe4>
  8042c5:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  8042cc:	00 00 00 
  8042cf:	ff d0                	callq  *%rax
  8042d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042d5:	8b 10                	mov    (%rax),%edx
  8042d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042db:	8b 40 04             	mov    0x4(%rax),%eax
  8042de:	39 c2                	cmp    %eax,%edx
  8042e0:	74 ae                	je     804290 <devpipe_read+0x42>
  8042e2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042e6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8042ea:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8042ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042f2:	8b 00                	mov    (%rax),%eax
  8042f4:	99                   	cltd   
  8042f5:	c1 ea 1b             	shr    $0x1b,%edx
  8042f8:	01 d0                	add    %edx,%eax
  8042fa:	83 e0 1f             	and    $0x1f,%eax
  8042fd:	29 d0                	sub    %edx,%eax
  8042ff:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804303:	48 98                	cltq   
  804305:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  80430a:	88 01                	mov    %al,(%rcx)
  80430c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804310:	8b 00                	mov    (%rax),%eax
  804312:	8d 50 01             	lea    0x1(%rax),%edx
  804315:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804319:	89 10                	mov    %edx,(%rax)
  80431b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804320:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804324:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804328:	0f 82 60 ff ff ff    	jb     80428e <devpipe_read+0x40>
  80432e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804332:	c9                   	leaveq 
  804333:	c3                   	retq   

0000000000804334 <devpipe_write>:
  804334:	55                   	push   %rbp
  804335:	48 89 e5             	mov    %rsp,%rbp
  804338:	48 83 ec 40          	sub    $0x40,%rsp
  80433c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804340:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804344:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804348:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80434c:	48 89 c7             	mov    %rax,%rdi
  80434f:	48 b8 0d 27 80 00 00 	movabs $0x80270d,%rax
  804356:	00 00 00 
  804359:	ff d0                	callq  *%rax
  80435b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80435f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804363:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804367:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80436e:	00 
  80436f:	e9 8e 00 00 00       	jmpq   804402 <devpipe_write+0xce>
  804374:	eb 31                	jmp    8043a7 <devpipe_write+0x73>
  804376:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80437a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80437e:	48 89 d6             	mov    %rdx,%rsi
  804381:	48 89 c7             	mov    %rax,%rdi
  804384:	48 b8 17 41 80 00 00 	movabs $0x804117,%rax
  80438b:	00 00 00 
  80438e:	ff d0                	callq  *%rax
  804390:	85 c0                	test   %eax,%eax
  804392:	74 07                	je     80439b <devpipe_write+0x67>
  804394:	b8 00 00 00 00       	mov    $0x0,%eax
  804399:	eb 79                	jmp    804414 <devpipe_write+0xe0>
  80439b:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  8043a2:	00 00 00 
  8043a5:	ff d0                	callq  *%rax
  8043a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043ab:	8b 40 04             	mov    0x4(%rax),%eax
  8043ae:	48 63 d0             	movslq %eax,%rdx
  8043b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043b5:	8b 00                	mov    (%rax),%eax
  8043b7:	48 98                	cltq   
  8043b9:	48 83 c0 20          	add    $0x20,%rax
  8043bd:	48 39 c2             	cmp    %rax,%rdx
  8043c0:	73 b4                	jae    804376 <devpipe_write+0x42>
  8043c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043c6:	8b 40 04             	mov    0x4(%rax),%eax
  8043c9:	99                   	cltd   
  8043ca:	c1 ea 1b             	shr    $0x1b,%edx
  8043cd:	01 d0                	add    %edx,%eax
  8043cf:	83 e0 1f             	and    $0x1f,%eax
  8043d2:	29 d0                	sub    %edx,%eax
  8043d4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8043d8:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8043dc:	48 01 ca             	add    %rcx,%rdx
  8043df:	0f b6 0a             	movzbl (%rdx),%ecx
  8043e2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8043e6:	48 98                	cltq   
  8043e8:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8043ec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043f0:	8b 40 04             	mov    0x4(%rax),%eax
  8043f3:	8d 50 01             	lea    0x1(%rax),%edx
  8043f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043fa:	89 50 04             	mov    %edx,0x4(%rax)
  8043fd:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804402:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804406:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80440a:	0f 82 64 ff ff ff    	jb     804374 <devpipe_write+0x40>
  804410:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804414:	c9                   	leaveq 
  804415:	c3                   	retq   

0000000000804416 <devpipe_stat>:
  804416:	55                   	push   %rbp
  804417:	48 89 e5             	mov    %rsp,%rbp
  80441a:	48 83 ec 20          	sub    $0x20,%rsp
  80441e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804422:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804426:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80442a:	48 89 c7             	mov    %rax,%rdi
  80442d:	48 b8 0d 27 80 00 00 	movabs $0x80270d,%rax
  804434:	00 00 00 
  804437:	ff d0                	callq  *%rax
  804439:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80443d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804441:	48 be 6e 51 80 00 00 	movabs $0x80516e,%rsi
  804448:	00 00 00 
  80444b:	48 89 c7             	mov    %rax,%rdi
  80444e:	48 b8 62 10 80 00 00 	movabs $0x801062,%rax
  804455:	00 00 00 
  804458:	ff d0                	callq  *%rax
  80445a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80445e:	8b 50 04             	mov    0x4(%rax),%edx
  804461:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804465:	8b 00                	mov    (%rax),%eax
  804467:	29 c2                	sub    %eax,%edx
  804469:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80446d:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804473:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804477:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80447e:	00 00 00 
  804481:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804485:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  80448c:	00 00 00 
  80448f:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804496:	b8 00 00 00 00       	mov    $0x0,%eax
  80449b:	c9                   	leaveq 
  80449c:	c3                   	retq   

000000000080449d <devpipe_close>:
  80449d:	55                   	push   %rbp
  80449e:	48 89 e5             	mov    %rsp,%rbp
  8044a1:	48 83 ec 10          	sub    $0x10,%rsp
  8044a5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8044a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044ad:	48 89 c6             	mov    %rax,%rsi
  8044b0:	bf 00 00 00 00       	mov    $0x0,%edi
  8044b5:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  8044bc:	00 00 00 
  8044bf:	ff d0                	callq  *%rax
  8044c1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044c5:	48 89 c7             	mov    %rax,%rdi
  8044c8:	48 b8 0d 27 80 00 00 	movabs $0x80270d,%rax
  8044cf:	00 00 00 
  8044d2:	ff d0                	callq  *%rax
  8044d4:	48 89 c6             	mov    %rax,%rsi
  8044d7:	bf 00 00 00 00       	mov    $0x0,%edi
  8044dc:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  8044e3:	00 00 00 
  8044e6:	ff d0                	callq  *%rax
  8044e8:	c9                   	leaveq 
  8044e9:	c3                   	retq   

00000000008044ea <cputchar>:
  8044ea:	55                   	push   %rbp
  8044eb:	48 89 e5             	mov    %rsp,%rbp
  8044ee:	48 83 ec 20          	sub    $0x20,%rsp
  8044f2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8044f5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8044f8:	88 45 ff             	mov    %al,-0x1(%rbp)
  8044fb:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  8044ff:	be 01 00 00 00       	mov    $0x1,%esi
  804504:	48 89 c7             	mov    %rax,%rdi
  804507:	48 b8 49 18 80 00 00 	movabs $0x801849,%rax
  80450e:	00 00 00 
  804511:	ff d0                	callq  *%rax
  804513:	c9                   	leaveq 
  804514:	c3                   	retq   

0000000000804515 <getchar>:
  804515:	55                   	push   %rbp
  804516:	48 89 e5             	mov    %rsp,%rbp
  804519:	48 83 ec 10          	sub    $0x10,%rsp
  80451d:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804521:	ba 01 00 00 00       	mov    $0x1,%edx
  804526:	48 89 c6             	mov    %rax,%rsi
  804529:	bf 00 00 00 00       	mov    $0x0,%edi
  80452e:	48 b8 02 2c 80 00 00 	movabs $0x802c02,%rax
  804535:	00 00 00 
  804538:	ff d0                	callq  *%rax
  80453a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80453d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804541:	79 05                	jns    804548 <getchar+0x33>
  804543:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804546:	eb 14                	jmp    80455c <getchar+0x47>
  804548:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80454c:	7f 07                	jg     804555 <getchar+0x40>
  80454e:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804553:	eb 07                	jmp    80455c <getchar+0x47>
  804555:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  804559:	0f b6 c0             	movzbl %al,%eax
  80455c:	c9                   	leaveq 
  80455d:	c3                   	retq   

000000000080455e <iscons>:
  80455e:	55                   	push   %rbp
  80455f:	48 89 e5             	mov    %rsp,%rbp
  804562:	48 83 ec 20          	sub    $0x20,%rsp
  804566:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804569:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80456d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804570:	48 89 d6             	mov    %rdx,%rsi
  804573:	89 c7                	mov    %eax,%edi
  804575:	48 b8 d0 27 80 00 00 	movabs $0x8027d0,%rax
  80457c:	00 00 00 
  80457f:	ff d0                	callq  *%rax
  804581:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804584:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804588:	79 05                	jns    80458f <iscons+0x31>
  80458a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80458d:	eb 1a                	jmp    8045a9 <iscons+0x4b>
  80458f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804593:	8b 10                	mov    (%rax),%edx
  804595:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  80459c:	00 00 00 
  80459f:	8b 00                	mov    (%rax),%eax
  8045a1:	39 c2                	cmp    %eax,%edx
  8045a3:	0f 94 c0             	sete   %al
  8045a6:	0f b6 c0             	movzbl %al,%eax
  8045a9:	c9                   	leaveq 
  8045aa:	c3                   	retq   

00000000008045ab <opencons>:
  8045ab:	55                   	push   %rbp
  8045ac:	48 89 e5             	mov    %rsp,%rbp
  8045af:	48 83 ec 10          	sub    $0x10,%rsp
  8045b3:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8045b7:	48 89 c7             	mov    %rax,%rdi
  8045ba:	48 b8 38 27 80 00 00 	movabs $0x802738,%rax
  8045c1:	00 00 00 
  8045c4:	ff d0                	callq  *%rax
  8045c6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8045c9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8045cd:	79 05                	jns    8045d4 <opencons+0x29>
  8045cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045d2:	eb 5b                	jmp    80462f <opencons+0x84>
  8045d4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045d8:	ba 07 04 00 00       	mov    $0x407,%edx
  8045dd:	48 89 c6             	mov    %rax,%rsi
  8045e0:	bf 00 00 00 00       	mov    $0x0,%edi
  8045e5:	48 b8 91 19 80 00 00 	movabs $0x801991,%rax
  8045ec:	00 00 00 
  8045ef:	ff d0                	callq  *%rax
  8045f1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8045f4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8045f8:	79 05                	jns    8045ff <opencons+0x54>
  8045fa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045fd:	eb 30                	jmp    80462f <opencons+0x84>
  8045ff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804603:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  80460a:	00 00 00 
  80460d:	8b 12                	mov    (%rdx),%edx
  80460f:	89 10                	mov    %edx,(%rax)
  804611:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804615:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80461c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804620:	48 89 c7             	mov    %rax,%rdi
  804623:	48 b8 ea 26 80 00 00 	movabs $0x8026ea,%rax
  80462a:	00 00 00 
  80462d:	ff d0                	callq  *%rax
  80462f:	c9                   	leaveq 
  804630:	c3                   	retq   

0000000000804631 <devcons_read>:
  804631:	55                   	push   %rbp
  804632:	48 89 e5             	mov    %rsp,%rbp
  804635:	48 83 ec 30          	sub    $0x30,%rsp
  804639:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80463d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804641:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804645:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80464a:	75 07                	jne    804653 <devcons_read+0x22>
  80464c:	b8 00 00 00 00       	mov    $0x0,%eax
  804651:	eb 4b                	jmp    80469e <devcons_read+0x6d>
  804653:	eb 0c                	jmp    804661 <devcons_read+0x30>
  804655:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  80465c:	00 00 00 
  80465f:	ff d0                	callq  *%rax
  804661:	48 b8 93 18 80 00 00 	movabs $0x801893,%rax
  804668:	00 00 00 
  80466b:	ff d0                	callq  *%rax
  80466d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804670:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804674:	74 df                	je     804655 <devcons_read+0x24>
  804676:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80467a:	79 05                	jns    804681 <devcons_read+0x50>
  80467c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80467f:	eb 1d                	jmp    80469e <devcons_read+0x6d>
  804681:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804685:	75 07                	jne    80468e <devcons_read+0x5d>
  804687:	b8 00 00 00 00       	mov    $0x0,%eax
  80468c:	eb 10                	jmp    80469e <devcons_read+0x6d>
  80468e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804691:	89 c2                	mov    %eax,%edx
  804693:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804697:	88 10                	mov    %dl,(%rax)
  804699:	b8 01 00 00 00       	mov    $0x1,%eax
  80469e:	c9                   	leaveq 
  80469f:	c3                   	retq   

00000000008046a0 <devcons_write>:
  8046a0:	55                   	push   %rbp
  8046a1:	48 89 e5             	mov    %rsp,%rbp
  8046a4:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8046ab:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  8046b2:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  8046b9:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  8046c0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8046c7:	eb 76                	jmp    80473f <devcons_write+0x9f>
  8046c9:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8046d0:	89 c2                	mov    %eax,%edx
  8046d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046d5:	29 c2                	sub    %eax,%edx
  8046d7:	89 d0                	mov    %edx,%eax
  8046d9:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8046dc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8046df:	83 f8 7f             	cmp    $0x7f,%eax
  8046e2:	76 07                	jbe    8046eb <devcons_write+0x4b>
  8046e4:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8046eb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8046ee:	48 63 d0             	movslq %eax,%rdx
  8046f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046f4:	48 63 c8             	movslq %eax,%rcx
  8046f7:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  8046fe:	48 01 c1             	add    %rax,%rcx
  804701:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804708:	48 89 ce             	mov    %rcx,%rsi
  80470b:	48 89 c7             	mov    %rax,%rdi
  80470e:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  804715:	00 00 00 
  804718:	ff d0                	callq  *%rax
  80471a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80471d:	48 63 d0             	movslq %eax,%rdx
  804720:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804727:	48 89 d6             	mov    %rdx,%rsi
  80472a:	48 89 c7             	mov    %rax,%rdi
  80472d:	48 b8 49 18 80 00 00 	movabs $0x801849,%rax
  804734:	00 00 00 
  804737:	ff d0                	callq  *%rax
  804739:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80473c:	01 45 fc             	add    %eax,-0x4(%rbp)
  80473f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804742:	48 98                	cltq   
  804744:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  80474b:	0f 82 78 ff ff ff    	jb     8046c9 <devcons_write+0x29>
  804751:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804754:	c9                   	leaveq 
  804755:	c3                   	retq   

0000000000804756 <devcons_close>:
  804756:	55                   	push   %rbp
  804757:	48 89 e5             	mov    %rsp,%rbp
  80475a:	48 83 ec 08          	sub    $0x8,%rsp
  80475e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804762:	b8 00 00 00 00       	mov    $0x0,%eax
  804767:	c9                   	leaveq 
  804768:	c3                   	retq   

0000000000804769 <devcons_stat>:
  804769:	55                   	push   %rbp
  80476a:	48 89 e5             	mov    %rsp,%rbp
  80476d:	48 83 ec 10          	sub    $0x10,%rsp
  804771:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804775:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804779:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80477d:	48 be 7a 51 80 00 00 	movabs $0x80517a,%rsi
  804784:	00 00 00 
  804787:	48 89 c7             	mov    %rax,%rdi
  80478a:	48 b8 62 10 80 00 00 	movabs $0x801062,%rax
  804791:	00 00 00 
  804794:	ff d0                	callq  *%rax
  804796:	b8 00 00 00 00       	mov    $0x0,%eax
  80479b:	c9                   	leaveq 
  80479c:	c3                   	retq   

000000000080479d <set_pgfault_handler>:
  80479d:	55                   	push   %rbp
  80479e:	48 89 e5             	mov    %rsp,%rbp
  8047a1:	48 83 ec 20          	sub    $0x20,%rsp
  8047a5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8047a9:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8047b0:	00 00 00 
  8047b3:	48 8b 00             	mov    (%rax),%rax
  8047b6:	48 85 c0             	test   %rax,%rax
  8047b9:	75 6f                	jne    80482a <set_pgfault_handler+0x8d>
  8047bb:	ba 07 00 00 00       	mov    $0x7,%edx
  8047c0:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8047c5:	bf 00 00 00 00       	mov    $0x0,%edi
  8047ca:	48 b8 91 19 80 00 00 	movabs $0x801991,%rax
  8047d1:	00 00 00 
  8047d4:	ff d0                	callq  *%rax
  8047d6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8047d9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8047dd:	79 30                	jns    80480f <set_pgfault_handler+0x72>
  8047df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047e2:	89 c1                	mov    %eax,%ecx
  8047e4:	48 ba 88 51 80 00 00 	movabs $0x805188,%rdx
  8047eb:	00 00 00 
  8047ee:	be 22 00 00 00       	mov    $0x22,%esi
  8047f3:	48 bf a7 51 80 00 00 	movabs $0x8051a7,%rdi
  8047fa:	00 00 00 
  8047fd:	b8 00 00 00 00       	mov    $0x0,%eax
  804802:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  804809:	00 00 00 
  80480c:	41 ff d0             	callq  *%r8
  80480f:	48 be 3d 48 80 00 00 	movabs $0x80483d,%rsi
  804816:	00 00 00 
  804819:	bf 00 00 00 00       	mov    $0x0,%edi
  80481e:	48 b8 1b 1b 80 00 00 	movabs $0x801b1b,%rax
  804825:	00 00 00 
  804828:	ff d0                	callq  *%rax
  80482a:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804831:	00 00 00 
  804834:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804838:	48 89 10             	mov    %rdx,(%rax)
  80483b:	c9                   	leaveq 
  80483c:	c3                   	retq   

000000000080483d <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  80483d:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  804840:	48 a1 00 c0 80 00 00 	movabs 0x80c000,%rax
  804847:	00 00 00 
call *%rax
  80484a:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  80484c:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  804853:	00 08 
    movq 152(%rsp), %rax
  804855:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  80485c:	00 
    movq 136(%rsp), %rbx
  80485d:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  804864:	00 
movq %rbx, (%rax)
  804865:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  804868:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  80486c:	4c 8b 3c 24          	mov    (%rsp),%r15
  804870:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  804875:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  80487a:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  80487f:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  804884:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  804889:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  80488e:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  804893:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  804898:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  80489d:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  8048a2:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  8048a7:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  8048ac:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  8048b1:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  8048b6:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  8048ba:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  8048be:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  8048bf:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  8048c4:	c3                   	retq   

00000000008048c5 <pageref>:
  8048c5:	55                   	push   %rbp
  8048c6:	48 89 e5             	mov    %rsp,%rbp
  8048c9:	48 83 ec 18          	sub    $0x18,%rsp
  8048cd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8048d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8048d5:	48 c1 e8 15          	shr    $0x15,%rax
  8048d9:	48 89 c2             	mov    %rax,%rdx
  8048dc:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8048e3:	01 00 00 
  8048e6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8048ea:	83 e0 01             	and    $0x1,%eax
  8048ed:	48 85 c0             	test   %rax,%rax
  8048f0:	75 07                	jne    8048f9 <pageref+0x34>
  8048f2:	b8 00 00 00 00       	mov    $0x0,%eax
  8048f7:	eb 53                	jmp    80494c <pageref+0x87>
  8048f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8048fd:	48 c1 e8 0c          	shr    $0xc,%rax
  804901:	48 89 c2             	mov    %rax,%rdx
  804904:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80490b:	01 00 00 
  80490e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804912:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804916:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80491a:	83 e0 01             	and    $0x1,%eax
  80491d:	48 85 c0             	test   %rax,%rax
  804920:	75 07                	jne    804929 <pageref+0x64>
  804922:	b8 00 00 00 00       	mov    $0x0,%eax
  804927:	eb 23                	jmp    80494c <pageref+0x87>
  804929:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80492d:	48 c1 e8 0c          	shr    $0xc,%rax
  804931:	48 89 c2             	mov    %rax,%rdx
  804934:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  80493b:	00 00 00 
  80493e:	48 c1 e2 04          	shl    $0x4,%rdx
  804942:	48 01 d0             	add    %rdx,%rax
  804945:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804949:	0f b7 c0             	movzwl %ax,%eax
  80494c:	c9                   	leaveq 
  80494d:	c3                   	retq   
