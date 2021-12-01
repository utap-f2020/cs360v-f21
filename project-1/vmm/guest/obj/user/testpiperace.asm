
vmm/guest/obj/user/testpiperace:     file format elf64-x86-64


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
  80003c:	e8 44 03 00 00       	callq  800385 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 50          	sub    $0x50,%rsp
  80004b:	89 7d bc             	mov    %edi,-0x44(%rbp)
  80004e:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
  800052:	48 bf 20 4b 80 00 00 	movabs $0x804b20,%rdi
  800059:	00 00 00 
  80005c:	b8 00 00 00 00       	mov    $0x0,%eax
  800061:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  800068:	00 00 00 
  80006b:	ff d2                	callq  *%rdx
  80006d:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800071:	48 89 c7             	mov    %rax,%rdi
  800074:	48 b8 61 41 80 00 00 	movabs $0x804161,%rax
  80007b:	00 00 00 
  80007e:	ff d0                	callq  *%rax
  800080:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800083:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800087:	79 30                	jns    8000b9 <umain+0x76>
  800089:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80008c:	89 c1                	mov    %eax,%ecx
  80008e:	48 ba 39 4b 80 00 00 	movabs $0x804b39,%rdx
  800095:	00 00 00 
  800098:	be 0e 00 00 00       	mov    $0xe,%esi
  80009d:	48 bf 42 4b 80 00 00 	movabs $0x804b42,%rdi
  8000a4:	00 00 00 
  8000a7:	b8 00 00 00 00       	mov    $0x0,%eax
  8000ac:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  8000b3:	00 00 00 
  8000b6:	41 ff d0             	callq  *%r8
  8000b9:	c7 45 f4 c8 00 00 00 	movl   $0xc8,-0xc(%rbp)
  8000c0:	48 b8 c8 22 80 00 00 	movabs $0x8022c8,%rax
  8000c7:	00 00 00 
  8000ca:	ff d0                	callq  *%rax
  8000cc:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8000cf:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8000d3:	79 30                	jns    800105 <umain+0xc2>
  8000d5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000d8:	89 c1                	mov    %eax,%ecx
  8000da:	48 ba 59 4b 80 00 00 	movabs $0x804b59,%rdx
  8000e1:	00 00 00 
  8000e4:	be 11 00 00 00       	mov    $0x11,%esi
  8000e9:	48 bf 42 4b 80 00 00 	movabs $0x804b42,%rdi
  8000f0:	00 00 00 
  8000f3:	b8 00 00 00 00       	mov    $0x0,%eax
  8000f8:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  8000ff:	00 00 00 
  800102:	41 ff d0             	callq  *%r8
  800105:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800109:	0f 85 89 00 00 00    	jne    800198 <umain+0x155>
  80010f:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  800112:	89 c7                	mov    %eax,%edi
  800114:	48 b8 97 2b 80 00 00 	movabs $0x802b97,%rax
  80011b:	00 00 00 
  80011e:	ff d0                	callq  *%rax
  800120:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800127:	eb 4c                	jmp    800175 <umain+0x132>
  800129:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80012c:	89 c7                	mov    %eax,%edi
  80012e:	48 b8 2a 44 80 00 00 	movabs $0x80442a,%rax
  800135:	00 00 00 
  800138:	ff d0                	callq  *%rax
  80013a:	85 c0                	test   %eax,%eax
  80013c:	74 27                	je     800165 <umain+0x122>
  80013e:	48 bf 62 4b 80 00 00 	movabs $0x804b62,%rdi
  800145:	00 00 00 
  800148:	b8 00 00 00 00       	mov    $0x0,%eax
  80014d:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  800154:	00 00 00 
  800157:	ff d2                	callq  *%rdx
  800159:	48 b8 08 04 80 00 00 	movabs $0x800408,%rax
  800160:	00 00 00 
  800163:	ff d0                	callq  *%rax
  800165:	48 b8 0a 1b 80 00 00 	movabs $0x801b0a,%rax
  80016c:	00 00 00 
  80016f:	ff d0                	callq  *%rax
  800171:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800175:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800178:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  80017b:	7c ac                	jl     800129 <umain+0xe6>
  80017d:	ba 00 00 00 00       	mov    $0x0,%edx
  800182:	be 00 00 00 00       	mov    $0x0,%esi
  800187:	bf 00 00 00 00       	mov    $0x0,%edi
  80018c:	48 b8 3d 25 80 00 00 	movabs $0x80253d,%rax
  800193:	00 00 00 
  800196:	ff d0                	callq  *%rax
  800198:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80019b:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80019e:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8001a1:	89 c6                	mov    %eax,%esi
  8001a3:	48 bf 7d 4b 80 00 00 	movabs $0x804b7d,%rdi
  8001aa:	00 00 00 
  8001ad:	b8 00 00 00 00       	mov    $0x0,%eax
  8001b2:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  8001b9:	00 00 00 
  8001bc:	ff d2                	callq  *%rdx
  8001be:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  8001c5:	00 
  8001c6:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8001c9:	25 ff 03 00 00       	and    $0x3ff,%eax
  8001ce:	48 98                	cltq   
  8001d0:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8001d7:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8001de:	00 00 00 
  8001e1:	48 01 d0             	add    %rdx,%rax
  8001e4:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8001e8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8001ec:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8001f3:	00 00 00 
  8001f6:	48 29 c2             	sub    %rax,%rdx
  8001f9:	48 89 d0             	mov    %rdx,%rax
  8001fc:	48 c1 f8 03          	sar    $0x3,%rax
  800200:	48 89 c2             	mov    %rax,%rdx
  800203:	48 b8 a5 4f fa a4 4f 	movabs $0x4fa4fa4fa4fa4fa5,%rax
  80020a:	fa a4 4f 
  80020d:	48 0f af c2          	imul   %rdx,%rax
  800211:	48 89 c6             	mov    %rax,%rsi
  800214:	48 bf 88 4b 80 00 00 	movabs $0x804b88,%rdi
  80021b:	00 00 00 
  80021e:	b8 00 00 00 00       	mov    $0x0,%eax
  800223:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  80022a:	00 00 00 
  80022d:	ff d2                	callq  *%rdx
  80022f:	8b 45 d0             	mov    -0x30(%rbp),%eax
  800232:	be 0a 00 00 00       	mov    $0xa,%esi
  800237:	89 c7                	mov    %eax,%edi
  800239:	48 b8 10 2c 80 00 00 	movabs $0x802c10,%rax
  800240:	00 00 00 
  800243:	ff d0                	callq  *%rax
  800245:	eb 16                	jmp    80025d <umain+0x21a>
  800247:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80024a:	be 0a 00 00 00       	mov    $0xa,%esi
  80024f:	89 c7                	mov    %eax,%edi
  800251:	48 b8 10 2c 80 00 00 	movabs $0x802c10,%rax
  800258:	00 00 00 
  80025b:	ff d0                	callq  *%rax
  80025d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800261:	8b 80 d4 00 00 00    	mov    0xd4(%rax),%eax
  800267:	83 f8 02             	cmp    $0x2,%eax
  80026a:	74 db                	je     800247 <umain+0x204>
  80026c:	48 bf 93 4b 80 00 00 	movabs $0x804b93,%rdi
  800273:	00 00 00 
  800276:	b8 00 00 00 00       	mov    $0x0,%eax
  80027b:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  800282:	00 00 00 
  800285:	ff d2                	callq  *%rdx
  800287:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80028a:	89 c7                	mov    %eax,%edi
  80028c:	48 b8 2a 44 80 00 00 	movabs $0x80442a,%rax
  800293:	00 00 00 
  800296:	ff d0                	callq  *%rax
  800298:	85 c0                	test   %eax,%eax
  80029a:	74 2a                	je     8002c6 <umain+0x283>
  80029c:	48 ba b0 4b 80 00 00 	movabs $0x804bb0,%rdx
  8002a3:	00 00 00 
  8002a6:	be 3b 00 00 00       	mov    $0x3b,%esi
  8002ab:	48 bf 42 4b 80 00 00 	movabs $0x804b42,%rdi
  8002b2:	00 00 00 
  8002b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8002ba:	48 b9 2b 04 80 00 00 	movabs $0x80042b,%rcx
  8002c1:	00 00 00 
  8002c4:	ff d1                	callq  *%rcx
  8002c6:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8002c9:	48 8d 55 c8          	lea    -0x38(%rbp),%rdx
  8002cd:	48 89 d6             	mov    %rdx,%rsi
  8002d0:	89 c7                	mov    %eax,%edi
  8002d2:	48 b8 87 29 80 00 00 	movabs $0x802987,%rax
  8002d9:	00 00 00 
  8002dc:	ff d0                	callq  *%rax
  8002de:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8002e1:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8002e5:	79 30                	jns    800317 <umain+0x2d4>
  8002e7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8002ea:	89 c1                	mov    %eax,%ecx
  8002ec:	48 ba da 4b 80 00 00 	movabs $0x804bda,%rdx
  8002f3:	00 00 00 
  8002f6:	be 3d 00 00 00       	mov    $0x3d,%esi
  8002fb:	48 bf 42 4b 80 00 00 	movabs $0x804b42,%rdi
  800302:	00 00 00 
  800305:	b8 00 00 00 00       	mov    $0x0,%eax
  80030a:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  800311:	00 00 00 
  800314:	41 ff d0             	callq  *%r8
  800317:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80031b:	48 89 c7             	mov    %rax,%rdi
  80031e:	48 b8 c4 28 80 00 00 	movabs $0x8028c4,%rax
  800325:	00 00 00 
  800328:	ff d0                	callq  *%rax
  80032a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80032e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800332:	48 89 c7             	mov    %rax,%rdi
  800335:	48 b8 cc 38 80 00 00 	movabs $0x8038cc,%rax
  80033c:	00 00 00 
  80033f:	ff d0                	callq  *%rax
  800341:	83 f8 04             	cmp    $0x4,%eax
  800344:	74 1d                	je     800363 <umain+0x320>
  800346:	48 bf f2 4b 80 00 00 	movabs $0x804bf2,%rdi
  80034d:	00 00 00 
  800350:	b8 00 00 00 00       	mov    $0x0,%eax
  800355:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  80035c:	00 00 00 
  80035f:	ff d2                	callq  *%rdx
  800361:	eb 20                	jmp    800383 <umain+0x340>
  800363:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800366:	89 c6                	mov    %eax,%esi
  800368:	48 bf 08 4c 80 00 00 	movabs $0x804c08,%rdi
  80036f:	00 00 00 
  800372:	b8 00 00 00 00       	mov    $0x0,%eax
  800377:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  80037e:	00 00 00 
  800381:	ff d2                	callq  *%rdx
  800383:	c9                   	leaveq 
  800384:	c3                   	retq   

0000000000800385 <libmain>:
  800385:	55                   	push   %rbp
  800386:	48 89 e5             	mov    %rsp,%rbp
  800389:	48 83 ec 10          	sub    $0x10,%rsp
  80038d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800390:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800394:	48 b8 cc 1a 80 00 00 	movabs $0x801acc,%rax
  80039b:	00 00 00 
  80039e:	ff d0                	callq  *%rax
  8003a0:	25 ff 03 00 00       	and    $0x3ff,%eax
  8003a5:	48 98                	cltq   
  8003a7:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8003ae:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8003b5:	00 00 00 
  8003b8:	48 01 c2             	add    %rax,%rdx
  8003bb:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8003c2:	00 00 00 
  8003c5:	48 89 10             	mov    %rdx,(%rax)
  8003c8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8003cc:	7e 14                	jle    8003e2 <libmain+0x5d>
  8003ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003d2:	48 8b 10             	mov    (%rax),%rdx
  8003d5:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8003dc:	00 00 00 
  8003df:	48 89 10             	mov    %rdx,(%rax)
  8003e2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003e6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003e9:	48 89 d6             	mov    %rdx,%rsi
  8003ec:	89 c7                	mov    %eax,%edi
  8003ee:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8003f5:	00 00 00 
  8003f8:	ff d0                	callq  *%rax
  8003fa:	48 b8 08 04 80 00 00 	movabs $0x800408,%rax
  800401:	00 00 00 
  800404:	ff d0                	callq  *%rax
  800406:	c9                   	leaveq 
  800407:	c3                   	retq   

0000000000800408 <exit>:
  800408:	55                   	push   %rbp
  800409:	48 89 e5             	mov    %rsp,%rbp
  80040c:	48 b8 e2 2b 80 00 00 	movabs $0x802be2,%rax
  800413:	00 00 00 
  800416:	ff d0                	callq  *%rax
  800418:	bf 00 00 00 00       	mov    $0x0,%edi
  80041d:	48 b8 88 1a 80 00 00 	movabs $0x801a88,%rax
  800424:	00 00 00 
  800427:	ff d0                	callq  *%rax
  800429:	5d                   	pop    %rbp
  80042a:	c3                   	retq   

000000000080042b <_panic>:
  80042b:	55                   	push   %rbp
  80042c:	48 89 e5             	mov    %rsp,%rbp
  80042f:	53                   	push   %rbx
  800430:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  800437:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  80043e:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800444:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  80044b:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800452:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800459:	84 c0                	test   %al,%al
  80045b:	74 23                	je     800480 <_panic+0x55>
  80045d:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800464:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800468:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  80046c:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800470:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800474:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800478:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  80047c:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800480:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800487:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  80048e:	00 00 00 
  800491:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  800498:	00 00 00 
  80049b:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80049f:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8004a6:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8004ad:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8004b4:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8004bb:	00 00 00 
  8004be:	48 8b 18             	mov    (%rax),%rbx
  8004c1:	48 b8 cc 1a 80 00 00 	movabs $0x801acc,%rax
  8004c8:	00 00 00 
  8004cb:	ff d0                	callq  *%rax
  8004cd:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  8004d3:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8004da:	41 89 c8             	mov    %ecx,%r8d
  8004dd:	48 89 d1             	mov    %rdx,%rcx
  8004e0:	48 89 da             	mov    %rbx,%rdx
  8004e3:	89 c6                	mov    %eax,%esi
  8004e5:	48 bf 28 4c 80 00 00 	movabs $0x804c28,%rdi
  8004ec:	00 00 00 
  8004ef:	b8 00 00 00 00       	mov    $0x0,%eax
  8004f4:	49 b9 64 06 80 00 00 	movabs $0x800664,%r9
  8004fb:	00 00 00 
  8004fe:	41 ff d1             	callq  *%r9
  800501:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800508:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80050f:	48 89 d6             	mov    %rdx,%rsi
  800512:	48 89 c7             	mov    %rax,%rdi
  800515:	48 b8 b8 05 80 00 00 	movabs $0x8005b8,%rax
  80051c:	00 00 00 
  80051f:	ff d0                	callq  *%rax
  800521:	48 bf 4b 4c 80 00 00 	movabs $0x804c4b,%rdi
  800528:	00 00 00 
  80052b:	b8 00 00 00 00       	mov    $0x0,%eax
  800530:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  800537:	00 00 00 
  80053a:	ff d2                	callq  *%rdx
  80053c:	cc                   	int3   
  80053d:	eb fd                	jmp    80053c <_panic+0x111>

000000000080053f <putch>:
  80053f:	55                   	push   %rbp
  800540:	48 89 e5             	mov    %rsp,%rbp
  800543:	48 83 ec 10          	sub    $0x10,%rsp
  800547:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80054a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80054e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800552:	8b 00                	mov    (%rax),%eax
  800554:	8d 48 01             	lea    0x1(%rax),%ecx
  800557:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80055b:	89 0a                	mov    %ecx,(%rdx)
  80055d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800560:	89 d1                	mov    %edx,%ecx
  800562:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800566:	48 98                	cltq   
  800568:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80056c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800570:	8b 00                	mov    (%rax),%eax
  800572:	3d ff 00 00 00       	cmp    $0xff,%eax
  800577:	75 2c                	jne    8005a5 <putch+0x66>
  800579:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80057d:	8b 00                	mov    (%rax),%eax
  80057f:	48 98                	cltq   
  800581:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800585:	48 83 c2 08          	add    $0x8,%rdx
  800589:	48 89 c6             	mov    %rax,%rsi
  80058c:	48 89 d7             	mov    %rdx,%rdi
  80058f:	48 b8 00 1a 80 00 00 	movabs $0x801a00,%rax
  800596:	00 00 00 
  800599:	ff d0                	callq  *%rax
  80059b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80059f:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8005a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8005a9:	8b 40 04             	mov    0x4(%rax),%eax
  8005ac:	8d 50 01             	lea    0x1(%rax),%edx
  8005af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8005b3:	89 50 04             	mov    %edx,0x4(%rax)
  8005b6:	c9                   	leaveq 
  8005b7:	c3                   	retq   

00000000008005b8 <vcprintf>:
  8005b8:	55                   	push   %rbp
  8005b9:	48 89 e5             	mov    %rsp,%rbp
  8005bc:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8005c3:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8005ca:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8005d1:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8005d8:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8005df:	48 8b 0a             	mov    (%rdx),%rcx
  8005e2:	48 89 08             	mov    %rcx,(%rax)
  8005e5:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8005e9:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8005ed:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8005f1:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8005f5:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8005fc:	00 00 00 
  8005ff:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800606:	00 00 00 
  800609:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800610:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800617:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  80061e:	48 89 c6             	mov    %rax,%rsi
  800621:	48 bf 3f 05 80 00 00 	movabs $0x80053f,%rdi
  800628:	00 00 00 
  80062b:	48 b8 17 0a 80 00 00 	movabs $0x800a17,%rax
  800632:	00 00 00 
  800635:	ff d0                	callq  *%rax
  800637:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  80063d:	48 98                	cltq   
  80063f:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800646:	48 83 c2 08          	add    $0x8,%rdx
  80064a:	48 89 c6             	mov    %rax,%rsi
  80064d:	48 89 d7             	mov    %rdx,%rdi
  800650:	48 b8 00 1a 80 00 00 	movabs $0x801a00,%rax
  800657:	00 00 00 
  80065a:	ff d0                	callq  *%rax
  80065c:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800662:	c9                   	leaveq 
  800663:	c3                   	retq   

0000000000800664 <cprintf>:
  800664:	55                   	push   %rbp
  800665:	48 89 e5             	mov    %rsp,%rbp
  800668:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  80066f:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800676:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80067d:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800684:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80068b:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800692:	84 c0                	test   %al,%al
  800694:	74 20                	je     8006b6 <cprintf+0x52>
  800696:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80069a:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80069e:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8006a2:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8006a6:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8006aa:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8006ae:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8006b2:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8006b6:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8006bd:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8006c4:	00 00 00 
  8006c7:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8006ce:	00 00 00 
  8006d1:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8006d5:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8006dc:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8006e3:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8006ea:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8006f1:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8006f8:	48 8b 0a             	mov    (%rdx),%rcx
  8006fb:	48 89 08             	mov    %rcx,(%rax)
  8006fe:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800702:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800706:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80070a:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80070e:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800715:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80071c:	48 89 d6             	mov    %rdx,%rsi
  80071f:	48 89 c7             	mov    %rax,%rdi
  800722:	48 b8 b8 05 80 00 00 	movabs $0x8005b8,%rax
  800729:	00 00 00 
  80072c:	ff d0                	callq  *%rax
  80072e:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800734:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80073a:	c9                   	leaveq 
  80073b:	c3                   	retq   

000000000080073c <printnum>:
  80073c:	55                   	push   %rbp
  80073d:	48 89 e5             	mov    %rsp,%rbp
  800740:	53                   	push   %rbx
  800741:	48 83 ec 38          	sub    $0x38,%rsp
  800745:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800749:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80074d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800751:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  800754:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  800758:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  80075c:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80075f:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800763:	77 3b                	ja     8007a0 <printnum+0x64>
  800765:	8b 45 d0             	mov    -0x30(%rbp),%eax
  800768:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  80076c:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  80076f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800773:	ba 00 00 00 00       	mov    $0x0,%edx
  800778:	48 f7 f3             	div    %rbx
  80077b:	48 89 c2             	mov    %rax,%rdx
  80077e:	8b 7d cc             	mov    -0x34(%rbp),%edi
  800781:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800784:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  800788:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80078c:	41 89 f9             	mov    %edi,%r9d
  80078f:	48 89 c7             	mov    %rax,%rdi
  800792:	48 b8 3c 07 80 00 00 	movabs $0x80073c,%rax
  800799:	00 00 00 
  80079c:	ff d0                	callq  *%rax
  80079e:	eb 1e                	jmp    8007be <printnum+0x82>
  8007a0:	eb 12                	jmp    8007b4 <printnum+0x78>
  8007a2:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8007a6:	8b 55 cc             	mov    -0x34(%rbp),%edx
  8007a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ad:	48 89 ce             	mov    %rcx,%rsi
  8007b0:	89 d7                	mov    %edx,%edi
  8007b2:	ff d0                	callq  *%rax
  8007b4:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  8007b8:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  8007bc:	7f e4                	jg     8007a2 <printnum+0x66>
  8007be:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8007c1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8007c5:	ba 00 00 00 00       	mov    $0x0,%edx
  8007ca:	48 f7 f1             	div    %rcx
  8007cd:	48 89 d0             	mov    %rdx,%rax
  8007d0:	48 ba 50 4e 80 00 00 	movabs $0x804e50,%rdx
  8007d7:	00 00 00 
  8007da:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  8007de:	0f be d0             	movsbl %al,%edx
  8007e1:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8007e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007e9:	48 89 ce             	mov    %rcx,%rsi
  8007ec:	89 d7                	mov    %edx,%edi
  8007ee:	ff d0                	callq  *%rax
  8007f0:	48 83 c4 38          	add    $0x38,%rsp
  8007f4:	5b                   	pop    %rbx
  8007f5:	5d                   	pop    %rbp
  8007f6:	c3                   	retq   

00000000008007f7 <getuint>:
  8007f7:	55                   	push   %rbp
  8007f8:	48 89 e5             	mov    %rsp,%rbp
  8007fb:	48 83 ec 1c          	sub    $0x1c,%rsp
  8007ff:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800803:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800806:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80080a:	7e 52                	jle    80085e <getuint+0x67>
  80080c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800810:	8b 00                	mov    (%rax),%eax
  800812:	83 f8 30             	cmp    $0x30,%eax
  800815:	73 24                	jae    80083b <getuint+0x44>
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
  800839:	eb 17                	jmp    800852 <getuint+0x5b>
  80083b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80083f:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800843:	48 89 d0             	mov    %rdx,%rax
  800846:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80084a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80084e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800852:	48 8b 00             	mov    (%rax),%rax
  800855:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800859:	e9 a3 00 00 00       	jmpq   800901 <getuint+0x10a>
  80085e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800862:	74 4f                	je     8008b3 <getuint+0xbc>
  800864:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800868:	8b 00                	mov    (%rax),%eax
  80086a:	83 f8 30             	cmp    $0x30,%eax
  80086d:	73 24                	jae    800893 <getuint+0x9c>
  80086f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800873:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800877:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80087b:	8b 00                	mov    (%rax),%eax
  80087d:	89 c0                	mov    %eax,%eax
  80087f:	48 01 d0             	add    %rdx,%rax
  800882:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800886:	8b 12                	mov    (%rdx),%edx
  800888:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80088b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80088f:	89 0a                	mov    %ecx,(%rdx)
  800891:	eb 17                	jmp    8008aa <getuint+0xb3>
  800893:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800897:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80089b:	48 89 d0             	mov    %rdx,%rax
  80089e:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8008a2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008a6:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008aa:	48 8b 00             	mov    (%rax),%rax
  8008ad:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008b1:	eb 4e                	jmp    800901 <getuint+0x10a>
  8008b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008b7:	8b 00                	mov    (%rax),%eax
  8008b9:	83 f8 30             	cmp    $0x30,%eax
  8008bc:	73 24                	jae    8008e2 <getuint+0xeb>
  8008be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008c2:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8008c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008ca:	8b 00                	mov    (%rax),%eax
  8008cc:	89 c0                	mov    %eax,%eax
  8008ce:	48 01 d0             	add    %rdx,%rax
  8008d1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008d5:	8b 12                	mov    (%rdx),%edx
  8008d7:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8008da:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008de:	89 0a                	mov    %ecx,(%rdx)
  8008e0:	eb 17                	jmp    8008f9 <getuint+0x102>
  8008e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008e6:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8008ea:	48 89 d0             	mov    %rdx,%rax
  8008ed:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8008f1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008f5:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008f9:	8b 00                	mov    (%rax),%eax
  8008fb:	89 c0                	mov    %eax,%eax
  8008fd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800901:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800905:	c9                   	leaveq 
  800906:	c3                   	retq   

0000000000800907 <getint>:
  800907:	55                   	push   %rbp
  800908:	48 89 e5             	mov    %rsp,%rbp
  80090b:	48 83 ec 1c          	sub    $0x1c,%rsp
  80090f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800913:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800916:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80091a:	7e 52                	jle    80096e <getint+0x67>
  80091c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800920:	8b 00                	mov    (%rax),%eax
  800922:	83 f8 30             	cmp    $0x30,%eax
  800925:	73 24                	jae    80094b <getint+0x44>
  800927:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80092b:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80092f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800933:	8b 00                	mov    (%rax),%eax
  800935:	89 c0                	mov    %eax,%eax
  800937:	48 01 d0             	add    %rdx,%rax
  80093a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80093e:	8b 12                	mov    (%rdx),%edx
  800940:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800943:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800947:	89 0a                	mov    %ecx,(%rdx)
  800949:	eb 17                	jmp    800962 <getint+0x5b>
  80094b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80094f:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800953:	48 89 d0             	mov    %rdx,%rax
  800956:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80095a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80095e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800962:	48 8b 00             	mov    (%rax),%rax
  800965:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800969:	e9 a3 00 00 00       	jmpq   800a11 <getint+0x10a>
  80096e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800972:	74 4f                	je     8009c3 <getint+0xbc>
  800974:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800978:	8b 00                	mov    (%rax),%eax
  80097a:	83 f8 30             	cmp    $0x30,%eax
  80097d:	73 24                	jae    8009a3 <getint+0x9c>
  80097f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800983:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800987:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80098b:	8b 00                	mov    (%rax),%eax
  80098d:	89 c0                	mov    %eax,%eax
  80098f:	48 01 d0             	add    %rdx,%rax
  800992:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800996:	8b 12                	mov    (%rdx),%edx
  800998:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80099b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80099f:	89 0a                	mov    %ecx,(%rdx)
  8009a1:	eb 17                	jmp    8009ba <getint+0xb3>
  8009a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009a7:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8009ab:	48 89 d0             	mov    %rdx,%rax
  8009ae:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8009b2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009b6:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8009ba:	48 8b 00             	mov    (%rax),%rax
  8009bd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8009c1:	eb 4e                	jmp    800a11 <getint+0x10a>
  8009c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009c7:	8b 00                	mov    (%rax),%eax
  8009c9:	83 f8 30             	cmp    $0x30,%eax
  8009cc:	73 24                	jae    8009f2 <getint+0xeb>
  8009ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009d2:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8009d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009da:	8b 00                	mov    (%rax),%eax
  8009dc:	89 c0                	mov    %eax,%eax
  8009de:	48 01 d0             	add    %rdx,%rax
  8009e1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009e5:	8b 12                	mov    (%rdx),%edx
  8009e7:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8009ea:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009ee:	89 0a                	mov    %ecx,(%rdx)
  8009f0:	eb 17                	jmp    800a09 <getint+0x102>
  8009f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009f6:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8009fa:	48 89 d0             	mov    %rdx,%rax
  8009fd:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800a01:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a05:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a09:	8b 00                	mov    (%rax),%eax
  800a0b:	48 98                	cltq   
  800a0d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a11:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800a15:	c9                   	leaveq 
  800a16:	c3                   	retq   

0000000000800a17 <vprintfmt>:
  800a17:	55                   	push   %rbp
  800a18:	48 89 e5             	mov    %rsp,%rbp
  800a1b:	41 54                	push   %r12
  800a1d:	53                   	push   %rbx
  800a1e:	48 83 ec 60          	sub    $0x60,%rsp
  800a22:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800a26:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800a2a:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a2e:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800a32:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800a36:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800a3a:	48 8b 0a             	mov    (%rdx),%rcx
  800a3d:	48 89 08             	mov    %rcx,(%rax)
  800a40:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800a44:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800a48:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800a4c:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800a50:	eb 17                	jmp    800a69 <vprintfmt+0x52>
  800a52:	85 db                	test   %ebx,%ebx
  800a54:	0f 84 cc 04 00 00    	je     800f26 <vprintfmt+0x50f>
  800a5a:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a5e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a62:	48 89 d6             	mov    %rdx,%rsi
  800a65:	89 df                	mov    %ebx,%edi
  800a67:	ff d0                	callq  *%rax
  800a69:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a6d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800a71:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a75:	0f b6 00             	movzbl (%rax),%eax
  800a78:	0f b6 d8             	movzbl %al,%ebx
  800a7b:	83 fb 25             	cmp    $0x25,%ebx
  800a7e:	75 d2                	jne    800a52 <vprintfmt+0x3b>
  800a80:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800a84:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800a8b:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800a92:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800a99:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800aa0:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800aa4:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800aa8:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800aac:	0f b6 00             	movzbl (%rax),%eax
  800aaf:	0f b6 d8             	movzbl %al,%ebx
  800ab2:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800ab5:	83 f8 55             	cmp    $0x55,%eax
  800ab8:	0f 87 34 04 00 00    	ja     800ef2 <vprintfmt+0x4db>
  800abe:	89 c0                	mov    %eax,%eax
  800ac0:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800ac7:	00 
  800ac8:	48 b8 78 4e 80 00 00 	movabs $0x804e78,%rax
  800acf:	00 00 00 
  800ad2:	48 01 d0             	add    %rdx,%rax
  800ad5:	48 8b 00             	mov    (%rax),%rax
  800ad8:	ff e0                	jmpq   *%rax
  800ada:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800ade:	eb c0                	jmp    800aa0 <vprintfmt+0x89>
  800ae0:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800ae4:	eb ba                	jmp    800aa0 <vprintfmt+0x89>
  800ae6:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800aed:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800af0:	89 d0                	mov    %edx,%eax
  800af2:	c1 e0 02             	shl    $0x2,%eax
  800af5:	01 d0                	add    %edx,%eax
  800af7:	01 c0                	add    %eax,%eax
  800af9:	01 d8                	add    %ebx,%eax
  800afb:	83 e8 30             	sub    $0x30,%eax
  800afe:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800b01:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800b05:	0f b6 00             	movzbl (%rax),%eax
  800b08:	0f be d8             	movsbl %al,%ebx
  800b0b:	83 fb 2f             	cmp    $0x2f,%ebx
  800b0e:	7e 0c                	jle    800b1c <vprintfmt+0x105>
  800b10:	83 fb 39             	cmp    $0x39,%ebx
  800b13:	7f 07                	jg     800b1c <vprintfmt+0x105>
  800b15:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800b1a:	eb d1                	jmp    800aed <vprintfmt+0xd6>
  800b1c:	eb 58                	jmp    800b76 <vprintfmt+0x15f>
  800b1e:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b21:	83 f8 30             	cmp    $0x30,%eax
  800b24:	73 17                	jae    800b3d <vprintfmt+0x126>
  800b26:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800b2a:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b2d:	89 c0                	mov    %eax,%eax
  800b2f:	48 01 d0             	add    %rdx,%rax
  800b32:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b35:	83 c2 08             	add    $0x8,%edx
  800b38:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b3b:	eb 0f                	jmp    800b4c <vprintfmt+0x135>
  800b3d:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800b41:	48 89 d0             	mov    %rdx,%rax
  800b44:	48 83 c2 08          	add    $0x8,%rdx
  800b48:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b4c:	8b 00                	mov    (%rax),%eax
  800b4e:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800b51:	eb 23                	jmp    800b76 <vprintfmt+0x15f>
  800b53:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b57:	79 0c                	jns    800b65 <vprintfmt+0x14e>
  800b59:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800b60:	e9 3b ff ff ff       	jmpq   800aa0 <vprintfmt+0x89>
  800b65:	e9 36 ff ff ff       	jmpq   800aa0 <vprintfmt+0x89>
  800b6a:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800b71:	e9 2a ff ff ff       	jmpq   800aa0 <vprintfmt+0x89>
  800b76:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b7a:	79 12                	jns    800b8e <vprintfmt+0x177>
  800b7c:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b7f:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800b82:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800b89:	e9 12 ff ff ff       	jmpq   800aa0 <vprintfmt+0x89>
  800b8e:	e9 0d ff ff ff       	jmpq   800aa0 <vprintfmt+0x89>
  800b93:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800b97:	e9 04 ff ff ff       	jmpq   800aa0 <vprintfmt+0x89>
  800b9c:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b9f:	83 f8 30             	cmp    $0x30,%eax
  800ba2:	73 17                	jae    800bbb <vprintfmt+0x1a4>
  800ba4:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800ba8:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800bab:	89 c0                	mov    %eax,%eax
  800bad:	48 01 d0             	add    %rdx,%rax
  800bb0:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bb3:	83 c2 08             	add    $0x8,%edx
  800bb6:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800bb9:	eb 0f                	jmp    800bca <vprintfmt+0x1b3>
  800bbb:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800bbf:	48 89 d0             	mov    %rdx,%rax
  800bc2:	48 83 c2 08          	add    $0x8,%rdx
  800bc6:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800bca:	8b 10                	mov    (%rax),%edx
  800bcc:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800bd0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bd4:	48 89 ce             	mov    %rcx,%rsi
  800bd7:	89 d7                	mov    %edx,%edi
  800bd9:	ff d0                	callq  *%rax
  800bdb:	e9 40 03 00 00       	jmpq   800f20 <vprintfmt+0x509>
  800be0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800be3:	83 f8 30             	cmp    $0x30,%eax
  800be6:	73 17                	jae    800bff <vprintfmt+0x1e8>
  800be8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800bec:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800bef:	89 c0                	mov    %eax,%eax
  800bf1:	48 01 d0             	add    %rdx,%rax
  800bf4:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bf7:	83 c2 08             	add    $0x8,%edx
  800bfa:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800bfd:	eb 0f                	jmp    800c0e <vprintfmt+0x1f7>
  800bff:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800c03:	48 89 d0             	mov    %rdx,%rax
  800c06:	48 83 c2 08          	add    $0x8,%rdx
  800c0a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800c0e:	8b 18                	mov    (%rax),%ebx
  800c10:	85 db                	test   %ebx,%ebx
  800c12:	79 02                	jns    800c16 <vprintfmt+0x1ff>
  800c14:	f7 db                	neg    %ebx
  800c16:	83 fb 15             	cmp    $0x15,%ebx
  800c19:	7f 16                	jg     800c31 <vprintfmt+0x21a>
  800c1b:	48 b8 a0 4d 80 00 00 	movabs $0x804da0,%rax
  800c22:	00 00 00 
  800c25:	48 63 d3             	movslq %ebx,%rdx
  800c28:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800c2c:	4d 85 e4             	test   %r12,%r12
  800c2f:	75 2e                	jne    800c5f <vprintfmt+0x248>
  800c31:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800c35:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c39:	89 d9                	mov    %ebx,%ecx
  800c3b:	48 ba 61 4e 80 00 00 	movabs $0x804e61,%rdx
  800c42:	00 00 00 
  800c45:	48 89 c7             	mov    %rax,%rdi
  800c48:	b8 00 00 00 00       	mov    $0x0,%eax
  800c4d:	49 b8 2f 0f 80 00 00 	movabs $0x800f2f,%r8
  800c54:	00 00 00 
  800c57:	41 ff d0             	callq  *%r8
  800c5a:	e9 c1 02 00 00       	jmpq   800f20 <vprintfmt+0x509>
  800c5f:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800c63:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c67:	4c 89 e1             	mov    %r12,%rcx
  800c6a:	48 ba 6a 4e 80 00 00 	movabs $0x804e6a,%rdx
  800c71:	00 00 00 
  800c74:	48 89 c7             	mov    %rax,%rdi
  800c77:	b8 00 00 00 00       	mov    $0x0,%eax
  800c7c:	49 b8 2f 0f 80 00 00 	movabs $0x800f2f,%r8
  800c83:	00 00 00 
  800c86:	41 ff d0             	callq  *%r8
  800c89:	e9 92 02 00 00       	jmpq   800f20 <vprintfmt+0x509>
  800c8e:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c91:	83 f8 30             	cmp    $0x30,%eax
  800c94:	73 17                	jae    800cad <vprintfmt+0x296>
  800c96:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800c9a:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c9d:	89 c0                	mov    %eax,%eax
  800c9f:	48 01 d0             	add    %rdx,%rax
  800ca2:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ca5:	83 c2 08             	add    $0x8,%edx
  800ca8:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800cab:	eb 0f                	jmp    800cbc <vprintfmt+0x2a5>
  800cad:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800cb1:	48 89 d0             	mov    %rdx,%rax
  800cb4:	48 83 c2 08          	add    $0x8,%rdx
  800cb8:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800cbc:	4c 8b 20             	mov    (%rax),%r12
  800cbf:	4d 85 e4             	test   %r12,%r12
  800cc2:	75 0a                	jne    800cce <vprintfmt+0x2b7>
  800cc4:	49 bc 6d 4e 80 00 00 	movabs $0x804e6d,%r12
  800ccb:	00 00 00 
  800cce:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800cd2:	7e 3f                	jle    800d13 <vprintfmt+0x2fc>
  800cd4:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800cd8:	74 39                	je     800d13 <vprintfmt+0x2fc>
  800cda:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800cdd:	48 98                	cltq   
  800cdf:	48 89 c6             	mov    %rax,%rsi
  800ce2:	4c 89 e7             	mov    %r12,%rdi
  800ce5:	48 b8 db 11 80 00 00 	movabs $0x8011db,%rax
  800cec:	00 00 00 
  800cef:	ff d0                	callq  *%rax
  800cf1:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800cf4:	eb 17                	jmp    800d0d <vprintfmt+0x2f6>
  800cf6:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800cfa:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800cfe:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d02:	48 89 ce             	mov    %rcx,%rsi
  800d05:	89 d7                	mov    %edx,%edi
  800d07:	ff d0                	callq  *%rax
  800d09:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800d0d:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d11:	7f e3                	jg     800cf6 <vprintfmt+0x2df>
  800d13:	eb 37                	jmp    800d4c <vprintfmt+0x335>
  800d15:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800d19:	74 1e                	je     800d39 <vprintfmt+0x322>
  800d1b:	83 fb 1f             	cmp    $0x1f,%ebx
  800d1e:	7e 05                	jle    800d25 <vprintfmt+0x30e>
  800d20:	83 fb 7e             	cmp    $0x7e,%ebx
  800d23:	7e 14                	jle    800d39 <vprintfmt+0x322>
  800d25:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d29:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d2d:	48 89 d6             	mov    %rdx,%rsi
  800d30:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800d35:	ff d0                	callq  *%rax
  800d37:	eb 0f                	jmp    800d48 <vprintfmt+0x331>
  800d39:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d3d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d41:	48 89 d6             	mov    %rdx,%rsi
  800d44:	89 df                	mov    %ebx,%edi
  800d46:	ff d0                	callq  *%rax
  800d48:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800d4c:	4c 89 e0             	mov    %r12,%rax
  800d4f:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800d53:	0f b6 00             	movzbl (%rax),%eax
  800d56:	0f be d8             	movsbl %al,%ebx
  800d59:	85 db                	test   %ebx,%ebx
  800d5b:	74 10                	je     800d6d <vprintfmt+0x356>
  800d5d:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800d61:	78 b2                	js     800d15 <vprintfmt+0x2fe>
  800d63:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800d67:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800d6b:	79 a8                	jns    800d15 <vprintfmt+0x2fe>
  800d6d:	eb 16                	jmp    800d85 <vprintfmt+0x36e>
  800d6f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d73:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d77:	48 89 d6             	mov    %rdx,%rsi
  800d7a:	bf 20 00 00 00       	mov    $0x20,%edi
  800d7f:	ff d0                	callq  *%rax
  800d81:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800d85:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d89:	7f e4                	jg     800d6f <vprintfmt+0x358>
  800d8b:	e9 90 01 00 00       	jmpq   800f20 <vprintfmt+0x509>
  800d90:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d94:	be 03 00 00 00       	mov    $0x3,%esi
  800d99:	48 89 c7             	mov    %rax,%rdi
  800d9c:	48 b8 07 09 80 00 00 	movabs $0x800907,%rax
  800da3:	00 00 00 
  800da6:	ff d0                	callq  *%rax
  800da8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800dac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800db0:	48 85 c0             	test   %rax,%rax
  800db3:	79 1d                	jns    800dd2 <vprintfmt+0x3bb>
  800db5:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800db9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dbd:	48 89 d6             	mov    %rdx,%rsi
  800dc0:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800dc5:	ff d0                	callq  *%rax
  800dc7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800dcb:	48 f7 d8             	neg    %rax
  800dce:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800dd2:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800dd9:	e9 d5 00 00 00       	jmpq   800eb3 <vprintfmt+0x49c>
  800dde:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800de2:	be 03 00 00 00       	mov    $0x3,%esi
  800de7:	48 89 c7             	mov    %rax,%rdi
  800dea:	48 b8 f7 07 80 00 00 	movabs $0x8007f7,%rax
  800df1:	00 00 00 
  800df4:	ff d0                	callq  *%rax
  800df6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800dfa:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800e01:	e9 ad 00 00 00       	jmpq   800eb3 <vprintfmt+0x49c>
  800e06:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800e0a:	be 03 00 00 00       	mov    $0x3,%esi
  800e0f:	48 89 c7             	mov    %rax,%rdi
  800e12:	48 b8 f7 07 80 00 00 	movabs $0x8007f7,%rax
  800e19:	00 00 00 
  800e1c:	ff d0                	callq  *%rax
  800e1e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e22:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800e29:	e9 85 00 00 00       	jmpq   800eb3 <vprintfmt+0x49c>
  800e2e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e32:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e36:	48 89 d6             	mov    %rdx,%rsi
  800e39:	bf 30 00 00 00       	mov    $0x30,%edi
  800e3e:	ff d0                	callq  *%rax
  800e40:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e44:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e48:	48 89 d6             	mov    %rdx,%rsi
  800e4b:	bf 78 00 00 00       	mov    $0x78,%edi
  800e50:	ff d0                	callq  *%rax
  800e52:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e55:	83 f8 30             	cmp    $0x30,%eax
  800e58:	73 17                	jae    800e71 <vprintfmt+0x45a>
  800e5a:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800e5e:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e61:	89 c0                	mov    %eax,%eax
  800e63:	48 01 d0             	add    %rdx,%rax
  800e66:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e69:	83 c2 08             	add    $0x8,%edx
  800e6c:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800e6f:	eb 0f                	jmp    800e80 <vprintfmt+0x469>
  800e71:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800e75:	48 89 d0             	mov    %rdx,%rax
  800e78:	48 83 c2 08          	add    $0x8,%rdx
  800e7c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800e80:	48 8b 00             	mov    (%rax),%rax
  800e83:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e87:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800e8e:	eb 23                	jmp    800eb3 <vprintfmt+0x49c>
  800e90:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800e94:	be 03 00 00 00       	mov    $0x3,%esi
  800e99:	48 89 c7             	mov    %rax,%rdi
  800e9c:	48 b8 f7 07 80 00 00 	movabs $0x8007f7,%rax
  800ea3:	00 00 00 
  800ea6:	ff d0                	callq  *%rax
  800ea8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800eac:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800eb3:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800eb8:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800ebb:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800ebe:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ec2:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800ec6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800eca:	45 89 c1             	mov    %r8d,%r9d
  800ecd:	41 89 f8             	mov    %edi,%r8d
  800ed0:	48 89 c7             	mov    %rax,%rdi
  800ed3:	48 b8 3c 07 80 00 00 	movabs $0x80073c,%rax
  800eda:	00 00 00 
  800edd:	ff d0                	callq  *%rax
  800edf:	eb 3f                	jmp    800f20 <vprintfmt+0x509>
  800ee1:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ee5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ee9:	48 89 d6             	mov    %rdx,%rsi
  800eec:	89 df                	mov    %ebx,%edi
  800eee:	ff d0                	callq  *%rax
  800ef0:	eb 2e                	jmp    800f20 <vprintfmt+0x509>
  800ef2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ef6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800efa:	48 89 d6             	mov    %rdx,%rsi
  800efd:	bf 25 00 00 00       	mov    $0x25,%edi
  800f02:	ff d0                	callq  *%rax
  800f04:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800f09:	eb 05                	jmp    800f10 <vprintfmt+0x4f9>
  800f0b:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800f10:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800f14:	48 83 e8 01          	sub    $0x1,%rax
  800f18:	0f b6 00             	movzbl (%rax),%eax
  800f1b:	3c 25                	cmp    $0x25,%al
  800f1d:	75 ec                	jne    800f0b <vprintfmt+0x4f4>
  800f1f:	90                   	nop
  800f20:	90                   	nop
  800f21:	e9 43 fb ff ff       	jmpq   800a69 <vprintfmt+0x52>
  800f26:	48 83 c4 60          	add    $0x60,%rsp
  800f2a:	5b                   	pop    %rbx
  800f2b:	41 5c                	pop    %r12
  800f2d:	5d                   	pop    %rbp
  800f2e:	c3                   	retq   

0000000000800f2f <printfmt>:
  800f2f:	55                   	push   %rbp
  800f30:	48 89 e5             	mov    %rsp,%rbp
  800f33:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800f3a:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800f41:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800f48:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800f4f:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800f56:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f5d:	84 c0                	test   %al,%al
  800f5f:	74 20                	je     800f81 <printfmt+0x52>
  800f61:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800f65:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f69:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f6d:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f71:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f75:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800f79:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800f7d:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800f81:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800f88:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800f8f:	00 00 00 
  800f92:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800f99:	00 00 00 
  800f9c:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800fa0:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800fa7:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800fae:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800fb5:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800fbc:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800fc3:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800fca:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800fd1:	48 89 c7             	mov    %rax,%rdi
  800fd4:	48 b8 17 0a 80 00 00 	movabs $0x800a17,%rax
  800fdb:	00 00 00 
  800fde:	ff d0                	callq  *%rax
  800fe0:	c9                   	leaveq 
  800fe1:	c3                   	retq   

0000000000800fe2 <sprintputch>:
  800fe2:	55                   	push   %rbp
  800fe3:	48 89 e5             	mov    %rsp,%rbp
  800fe6:	48 83 ec 10          	sub    $0x10,%rsp
  800fea:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800fed:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800ff1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ff5:	8b 40 10             	mov    0x10(%rax),%eax
  800ff8:	8d 50 01             	lea    0x1(%rax),%edx
  800ffb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fff:	89 50 10             	mov    %edx,0x10(%rax)
  801002:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801006:	48 8b 10             	mov    (%rax),%rdx
  801009:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80100d:	48 8b 40 08          	mov    0x8(%rax),%rax
  801011:	48 39 c2             	cmp    %rax,%rdx
  801014:	73 17                	jae    80102d <sprintputch+0x4b>
  801016:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80101a:	48 8b 00             	mov    (%rax),%rax
  80101d:	48 8d 48 01          	lea    0x1(%rax),%rcx
  801021:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801025:	48 89 0a             	mov    %rcx,(%rdx)
  801028:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80102b:	88 10                	mov    %dl,(%rax)
  80102d:	c9                   	leaveq 
  80102e:	c3                   	retq   

000000000080102f <vsnprintf>:
  80102f:	55                   	push   %rbp
  801030:	48 89 e5             	mov    %rsp,%rbp
  801033:	48 83 ec 50          	sub    $0x50,%rsp
  801037:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  80103b:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  80103e:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  801042:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  801046:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  80104a:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  80104e:	48 8b 0a             	mov    (%rdx),%rcx
  801051:	48 89 08             	mov    %rcx,(%rax)
  801054:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801058:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80105c:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801060:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801064:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801068:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  80106c:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  80106f:	48 98                	cltq   
  801071:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801075:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801079:	48 01 d0             	add    %rdx,%rax
  80107c:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801080:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  801087:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  80108c:	74 06                	je     801094 <vsnprintf+0x65>
  80108e:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801092:	7f 07                	jg     80109b <vsnprintf+0x6c>
  801094:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801099:	eb 2f                	jmp    8010ca <vsnprintf+0x9b>
  80109b:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  80109f:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  8010a3:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8010a7:	48 89 c6             	mov    %rax,%rsi
  8010aa:	48 bf e2 0f 80 00 00 	movabs $0x800fe2,%rdi
  8010b1:	00 00 00 
  8010b4:	48 b8 17 0a 80 00 00 	movabs $0x800a17,%rax
  8010bb:	00 00 00 
  8010be:	ff d0                	callq  *%rax
  8010c0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8010c4:	c6 00 00             	movb   $0x0,(%rax)
  8010c7:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8010ca:	c9                   	leaveq 
  8010cb:	c3                   	retq   

00000000008010cc <snprintf>:
  8010cc:	55                   	push   %rbp
  8010cd:	48 89 e5             	mov    %rsp,%rbp
  8010d0:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  8010d7:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8010de:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  8010e4:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8010eb:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8010f2:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8010f9:	84 c0                	test   %al,%al
  8010fb:	74 20                	je     80111d <snprintf+0x51>
  8010fd:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801101:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801105:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801109:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80110d:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801111:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801115:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801119:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80111d:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  801124:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  80112b:	00 00 00 
  80112e:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  801135:	00 00 00 
  801138:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80113c:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801143:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80114a:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801151:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  801158:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80115f:	48 8b 0a             	mov    (%rdx),%rcx
  801162:	48 89 08             	mov    %rcx,(%rax)
  801165:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801169:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80116d:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801171:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801175:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80117c:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801183:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  801189:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801190:	48 89 c7             	mov    %rax,%rdi
  801193:	48 b8 2f 10 80 00 00 	movabs $0x80102f,%rax
  80119a:	00 00 00 
  80119d:	ff d0                	callq  *%rax
  80119f:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8011a5:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8011ab:	c9                   	leaveq 
  8011ac:	c3                   	retq   

00000000008011ad <strlen>:
  8011ad:	55                   	push   %rbp
  8011ae:	48 89 e5             	mov    %rsp,%rbp
  8011b1:	48 83 ec 18          	sub    $0x18,%rsp
  8011b5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011b9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8011c0:	eb 09                	jmp    8011cb <strlen+0x1e>
  8011c2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8011c6:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8011cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011cf:	0f b6 00             	movzbl (%rax),%eax
  8011d2:	84 c0                	test   %al,%al
  8011d4:	75 ec                	jne    8011c2 <strlen+0x15>
  8011d6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011d9:	c9                   	leaveq 
  8011da:	c3                   	retq   

00000000008011db <strnlen>:
  8011db:	55                   	push   %rbp
  8011dc:	48 89 e5             	mov    %rsp,%rbp
  8011df:	48 83 ec 20          	sub    $0x20,%rsp
  8011e3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011e7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011eb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8011f2:	eb 0e                	jmp    801202 <strnlen+0x27>
  8011f4:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8011f8:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8011fd:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801202:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  801207:	74 0b                	je     801214 <strnlen+0x39>
  801209:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80120d:	0f b6 00             	movzbl (%rax),%eax
  801210:	84 c0                	test   %al,%al
  801212:	75 e0                	jne    8011f4 <strnlen+0x19>
  801214:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801217:	c9                   	leaveq 
  801218:	c3                   	retq   

0000000000801219 <strcpy>:
  801219:	55                   	push   %rbp
  80121a:	48 89 e5             	mov    %rsp,%rbp
  80121d:	48 83 ec 20          	sub    $0x20,%rsp
  801221:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801225:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801229:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80122d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801231:	90                   	nop
  801232:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801236:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80123a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80123e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801242:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801246:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80124a:	0f b6 12             	movzbl (%rdx),%edx
  80124d:	88 10                	mov    %dl,(%rax)
  80124f:	0f b6 00             	movzbl (%rax),%eax
  801252:	84 c0                	test   %al,%al
  801254:	75 dc                	jne    801232 <strcpy+0x19>
  801256:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80125a:	c9                   	leaveq 
  80125b:	c3                   	retq   

000000000080125c <strcat>:
  80125c:	55                   	push   %rbp
  80125d:	48 89 e5             	mov    %rsp,%rbp
  801260:	48 83 ec 20          	sub    $0x20,%rsp
  801264:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801268:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80126c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801270:	48 89 c7             	mov    %rax,%rdi
  801273:	48 b8 ad 11 80 00 00 	movabs $0x8011ad,%rax
  80127a:	00 00 00 
  80127d:	ff d0                	callq  *%rax
  80127f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801282:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801285:	48 63 d0             	movslq %eax,%rdx
  801288:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80128c:	48 01 c2             	add    %rax,%rdx
  80128f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801293:	48 89 c6             	mov    %rax,%rsi
  801296:	48 89 d7             	mov    %rdx,%rdi
  801299:	48 b8 19 12 80 00 00 	movabs $0x801219,%rax
  8012a0:	00 00 00 
  8012a3:	ff d0                	callq  *%rax
  8012a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012a9:	c9                   	leaveq 
  8012aa:	c3                   	retq   

00000000008012ab <strncpy>:
  8012ab:	55                   	push   %rbp
  8012ac:	48 89 e5             	mov    %rsp,%rbp
  8012af:	48 83 ec 28          	sub    $0x28,%rsp
  8012b3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8012b7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8012bb:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8012bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012c3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8012c7:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8012ce:	00 
  8012cf:	eb 2a                	jmp    8012fb <strncpy+0x50>
  8012d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012d5:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8012d9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8012dd:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8012e1:	0f b6 12             	movzbl (%rdx),%edx
  8012e4:	88 10                	mov    %dl,(%rax)
  8012e6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8012ea:	0f b6 00             	movzbl (%rax),%eax
  8012ed:	84 c0                	test   %al,%al
  8012ef:	74 05                	je     8012f6 <strncpy+0x4b>
  8012f1:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  8012f6:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012ff:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801303:	72 cc                	jb     8012d1 <strncpy+0x26>
  801305:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801309:	c9                   	leaveq 
  80130a:	c3                   	retq   

000000000080130b <strlcpy>:
  80130b:	55                   	push   %rbp
  80130c:	48 89 e5             	mov    %rsp,%rbp
  80130f:	48 83 ec 28          	sub    $0x28,%rsp
  801313:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801317:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80131b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80131f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801323:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801327:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80132c:	74 3d                	je     80136b <strlcpy+0x60>
  80132e:	eb 1d                	jmp    80134d <strlcpy+0x42>
  801330:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801334:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801338:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80133c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801340:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801344:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801348:	0f b6 12             	movzbl (%rdx),%edx
  80134b:	88 10                	mov    %dl,(%rax)
  80134d:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801352:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801357:	74 0b                	je     801364 <strlcpy+0x59>
  801359:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80135d:	0f b6 00             	movzbl (%rax),%eax
  801360:	84 c0                	test   %al,%al
  801362:	75 cc                	jne    801330 <strlcpy+0x25>
  801364:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801368:	c6 00 00             	movb   $0x0,(%rax)
  80136b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80136f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801373:	48 29 c2             	sub    %rax,%rdx
  801376:	48 89 d0             	mov    %rdx,%rax
  801379:	c9                   	leaveq 
  80137a:	c3                   	retq   

000000000080137b <strcmp>:
  80137b:	55                   	push   %rbp
  80137c:	48 89 e5             	mov    %rsp,%rbp
  80137f:	48 83 ec 10          	sub    $0x10,%rsp
  801383:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801387:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80138b:	eb 0a                	jmp    801397 <strcmp+0x1c>
  80138d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801392:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801397:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80139b:	0f b6 00             	movzbl (%rax),%eax
  80139e:	84 c0                	test   %al,%al
  8013a0:	74 12                	je     8013b4 <strcmp+0x39>
  8013a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013a6:	0f b6 10             	movzbl (%rax),%edx
  8013a9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013ad:	0f b6 00             	movzbl (%rax),%eax
  8013b0:	38 c2                	cmp    %al,%dl
  8013b2:	74 d9                	je     80138d <strcmp+0x12>
  8013b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013b8:	0f b6 00             	movzbl (%rax),%eax
  8013bb:	0f b6 d0             	movzbl %al,%edx
  8013be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013c2:	0f b6 00             	movzbl (%rax),%eax
  8013c5:	0f b6 c0             	movzbl %al,%eax
  8013c8:	29 c2                	sub    %eax,%edx
  8013ca:	89 d0                	mov    %edx,%eax
  8013cc:	c9                   	leaveq 
  8013cd:	c3                   	retq   

00000000008013ce <strncmp>:
  8013ce:	55                   	push   %rbp
  8013cf:	48 89 e5             	mov    %rsp,%rbp
  8013d2:	48 83 ec 18          	sub    $0x18,%rsp
  8013d6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8013da:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8013de:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8013e2:	eb 0f                	jmp    8013f3 <strncmp+0x25>
  8013e4:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  8013e9:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8013ee:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8013f3:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8013f8:	74 1d                	je     801417 <strncmp+0x49>
  8013fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013fe:	0f b6 00             	movzbl (%rax),%eax
  801401:	84 c0                	test   %al,%al
  801403:	74 12                	je     801417 <strncmp+0x49>
  801405:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801409:	0f b6 10             	movzbl (%rax),%edx
  80140c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801410:	0f b6 00             	movzbl (%rax),%eax
  801413:	38 c2                	cmp    %al,%dl
  801415:	74 cd                	je     8013e4 <strncmp+0x16>
  801417:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80141c:	75 07                	jne    801425 <strncmp+0x57>
  80141e:	b8 00 00 00 00       	mov    $0x0,%eax
  801423:	eb 18                	jmp    80143d <strncmp+0x6f>
  801425:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801429:	0f b6 00             	movzbl (%rax),%eax
  80142c:	0f b6 d0             	movzbl %al,%edx
  80142f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801433:	0f b6 00             	movzbl (%rax),%eax
  801436:	0f b6 c0             	movzbl %al,%eax
  801439:	29 c2                	sub    %eax,%edx
  80143b:	89 d0                	mov    %edx,%eax
  80143d:	c9                   	leaveq 
  80143e:	c3                   	retq   

000000000080143f <strchr>:
  80143f:	55                   	push   %rbp
  801440:	48 89 e5             	mov    %rsp,%rbp
  801443:	48 83 ec 0c          	sub    $0xc,%rsp
  801447:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80144b:	89 f0                	mov    %esi,%eax
  80144d:	88 45 f4             	mov    %al,-0xc(%rbp)
  801450:	eb 17                	jmp    801469 <strchr+0x2a>
  801452:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801456:	0f b6 00             	movzbl (%rax),%eax
  801459:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80145c:	75 06                	jne    801464 <strchr+0x25>
  80145e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801462:	eb 15                	jmp    801479 <strchr+0x3a>
  801464:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801469:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80146d:	0f b6 00             	movzbl (%rax),%eax
  801470:	84 c0                	test   %al,%al
  801472:	75 de                	jne    801452 <strchr+0x13>
  801474:	b8 00 00 00 00       	mov    $0x0,%eax
  801479:	c9                   	leaveq 
  80147a:	c3                   	retq   

000000000080147b <strfind>:
  80147b:	55                   	push   %rbp
  80147c:	48 89 e5             	mov    %rsp,%rbp
  80147f:	48 83 ec 0c          	sub    $0xc,%rsp
  801483:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801487:	89 f0                	mov    %esi,%eax
  801489:	88 45 f4             	mov    %al,-0xc(%rbp)
  80148c:	eb 13                	jmp    8014a1 <strfind+0x26>
  80148e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801492:	0f b6 00             	movzbl (%rax),%eax
  801495:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801498:	75 02                	jne    80149c <strfind+0x21>
  80149a:	eb 10                	jmp    8014ac <strfind+0x31>
  80149c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8014a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014a5:	0f b6 00             	movzbl (%rax),%eax
  8014a8:	84 c0                	test   %al,%al
  8014aa:	75 e2                	jne    80148e <strfind+0x13>
  8014ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014b0:	c9                   	leaveq 
  8014b1:	c3                   	retq   

00000000008014b2 <memset>:
  8014b2:	55                   	push   %rbp
  8014b3:	48 89 e5             	mov    %rsp,%rbp
  8014b6:	48 83 ec 18          	sub    $0x18,%rsp
  8014ba:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8014be:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8014c1:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8014c5:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8014ca:	75 06                	jne    8014d2 <memset+0x20>
  8014cc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014d0:	eb 69                	jmp    80153b <memset+0x89>
  8014d2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014d6:	83 e0 03             	and    $0x3,%eax
  8014d9:	48 85 c0             	test   %rax,%rax
  8014dc:	75 48                	jne    801526 <memset+0x74>
  8014de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014e2:	83 e0 03             	and    $0x3,%eax
  8014e5:	48 85 c0             	test   %rax,%rax
  8014e8:	75 3c                	jne    801526 <memset+0x74>
  8014ea:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8014f1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014f4:	c1 e0 18             	shl    $0x18,%eax
  8014f7:	89 c2                	mov    %eax,%edx
  8014f9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014fc:	c1 e0 10             	shl    $0x10,%eax
  8014ff:	09 c2                	or     %eax,%edx
  801501:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801504:	c1 e0 08             	shl    $0x8,%eax
  801507:	09 d0                	or     %edx,%eax
  801509:	09 45 f4             	or     %eax,-0xc(%rbp)
  80150c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801510:	48 c1 e8 02          	shr    $0x2,%rax
  801514:	48 89 c1             	mov    %rax,%rcx
  801517:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80151b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80151e:	48 89 d7             	mov    %rdx,%rdi
  801521:	fc                   	cld    
  801522:	f3 ab                	rep stos %eax,%es:(%rdi)
  801524:	eb 11                	jmp    801537 <memset+0x85>
  801526:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80152a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80152d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801531:	48 89 d7             	mov    %rdx,%rdi
  801534:	fc                   	cld    
  801535:	f3 aa                	rep stos %al,%es:(%rdi)
  801537:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80153b:	c9                   	leaveq 
  80153c:	c3                   	retq   

000000000080153d <memmove>:
  80153d:	55                   	push   %rbp
  80153e:	48 89 e5             	mov    %rsp,%rbp
  801541:	48 83 ec 28          	sub    $0x28,%rsp
  801545:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801549:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80154d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801551:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801555:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801559:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80155d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801561:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801565:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801569:	0f 83 88 00 00 00    	jae    8015f7 <memmove+0xba>
  80156f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801573:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801577:	48 01 d0             	add    %rdx,%rax
  80157a:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80157e:	76 77                	jbe    8015f7 <memmove+0xba>
  801580:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801584:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801588:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80158c:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801590:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801594:	83 e0 03             	and    $0x3,%eax
  801597:	48 85 c0             	test   %rax,%rax
  80159a:	75 3b                	jne    8015d7 <memmove+0x9a>
  80159c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015a0:	83 e0 03             	and    $0x3,%eax
  8015a3:	48 85 c0             	test   %rax,%rax
  8015a6:	75 2f                	jne    8015d7 <memmove+0x9a>
  8015a8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015ac:	83 e0 03             	and    $0x3,%eax
  8015af:	48 85 c0             	test   %rax,%rax
  8015b2:	75 23                	jne    8015d7 <memmove+0x9a>
  8015b4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015b8:	48 83 e8 04          	sub    $0x4,%rax
  8015bc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8015c0:	48 83 ea 04          	sub    $0x4,%rdx
  8015c4:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8015c8:	48 c1 e9 02          	shr    $0x2,%rcx
  8015cc:	48 89 c7             	mov    %rax,%rdi
  8015cf:	48 89 d6             	mov    %rdx,%rsi
  8015d2:	fd                   	std    
  8015d3:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8015d5:	eb 1d                	jmp    8015f4 <memmove+0xb7>
  8015d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015db:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8015df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015e3:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8015e7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015eb:	48 89 d7             	mov    %rdx,%rdi
  8015ee:	48 89 c1             	mov    %rax,%rcx
  8015f1:	fd                   	std    
  8015f2:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8015f4:	fc                   	cld    
  8015f5:	eb 57                	jmp    80164e <memmove+0x111>
  8015f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015fb:	83 e0 03             	and    $0x3,%eax
  8015fe:	48 85 c0             	test   %rax,%rax
  801601:	75 36                	jne    801639 <memmove+0xfc>
  801603:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801607:	83 e0 03             	and    $0x3,%eax
  80160a:	48 85 c0             	test   %rax,%rax
  80160d:	75 2a                	jne    801639 <memmove+0xfc>
  80160f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801613:	83 e0 03             	and    $0x3,%eax
  801616:	48 85 c0             	test   %rax,%rax
  801619:	75 1e                	jne    801639 <memmove+0xfc>
  80161b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80161f:	48 c1 e8 02          	shr    $0x2,%rax
  801623:	48 89 c1             	mov    %rax,%rcx
  801626:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80162a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80162e:	48 89 c7             	mov    %rax,%rdi
  801631:	48 89 d6             	mov    %rdx,%rsi
  801634:	fc                   	cld    
  801635:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801637:	eb 15                	jmp    80164e <memmove+0x111>
  801639:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80163d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801641:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801645:	48 89 c7             	mov    %rax,%rdi
  801648:	48 89 d6             	mov    %rdx,%rsi
  80164b:	fc                   	cld    
  80164c:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80164e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801652:	c9                   	leaveq 
  801653:	c3                   	retq   

0000000000801654 <memcpy>:
  801654:	55                   	push   %rbp
  801655:	48 89 e5             	mov    %rsp,%rbp
  801658:	48 83 ec 18          	sub    $0x18,%rsp
  80165c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801660:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801664:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801668:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80166c:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801670:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801674:	48 89 ce             	mov    %rcx,%rsi
  801677:	48 89 c7             	mov    %rax,%rdi
  80167a:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  801681:	00 00 00 
  801684:	ff d0                	callq  *%rax
  801686:	c9                   	leaveq 
  801687:	c3                   	retq   

0000000000801688 <memcmp>:
  801688:	55                   	push   %rbp
  801689:	48 89 e5             	mov    %rsp,%rbp
  80168c:	48 83 ec 28          	sub    $0x28,%rsp
  801690:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801694:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801698:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80169c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016a0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8016a4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8016a8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8016ac:	eb 36                	jmp    8016e4 <memcmp+0x5c>
  8016ae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016b2:	0f b6 10             	movzbl (%rax),%edx
  8016b5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016b9:	0f b6 00             	movzbl (%rax),%eax
  8016bc:	38 c2                	cmp    %al,%dl
  8016be:	74 1a                	je     8016da <memcmp+0x52>
  8016c0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016c4:	0f b6 00             	movzbl (%rax),%eax
  8016c7:	0f b6 d0             	movzbl %al,%edx
  8016ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016ce:	0f b6 00             	movzbl (%rax),%eax
  8016d1:	0f b6 c0             	movzbl %al,%eax
  8016d4:	29 c2                	sub    %eax,%edx
  8016d6:	89 d0                	mov    %edx,%eax
  8016d8:	eb 20                	jmp    8016fa <memcmp+0x72>
  8016da:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8016df:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8016e4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016e8:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8016ec:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8016f0:	48 85 c0             	test   %rax,%rax
  8016f3:	75 b9                	jne    8016ae <memcmp+0x26>
  8016f5:	b8 00 00 00 00       	mov    $0x0,%eax
  8016fa:	c9                   	leaveq 
  8016fb:	c3                   	retq   

00000000008016fc <memfind>:
  8016fc:	55                   	push   %rbp
  8016fd:	48 89 e5             	mov    %rsp,%rbp
  801700:	48 83 ec 28          	sub    $0x28,%rsp
  801704:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801708:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80170b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80170f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801713:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801717:	48 01 d0             	add    %rdx,%rax
  80171a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80171e:	eb 15                	jmp    801735 <memfind+0x39>
  801720:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801724:	0f b6 10             	movzbl (%rax),%edx
  801727:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80172a:	38 c2                	cmp    %al,%dl
  80172c:	75 02                	jne    801730 <memfind+0x34>
  80172e:	eb 0f                	jmp    80173f <memfind+0x43>
  801730:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801735:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801739:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  80173d:	72 e1                	jb     801720 <memfind+0x24>
  80173f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801743:	c9                   	leaveq 
  801744:	c3                   	retq   

0000000000801745 <strtol>:
  801745:	55                   	push   %rbp
  801746:	48 89 e5             	mov    %rsp,%rbp
  801749:	48 83 ec 34          	sub    $0x34,%rsp
  80174d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801751:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801755:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801758:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80175f:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801766:	00 
  801767:	eb 05                	jmp    80176e <strtol+0x29>
  801769:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80176e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801772:	0f b6 00             	movzbl (%rax),%eax
  801775:	3c 20                	cmp    $0x20,%al
  801777:	74 f0                	je     801769 <strtol+0x24>
  801779:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80177d:	0f b6 00             	movzbl (%rax),%eax
  801780:	3c 09                	cmp    $0x9,%al
  801782:	74 e5                	je     801769 <strtol+0x24>
  801784:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801788:	0f b6 00             	movzbl (%rax),%eax
  80178b:	3c 2b                	cmp    $0x2b,%al
  80178d:	75 07                	jne    801796 <strtol+0x51>
  80178f:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801794:	eb 17                	jmp    8017ad <strtol+0x68>
  801796:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80179a:	0f b6 00             	movzbl (%rax),%eax
  80179d:	3c 2d                	cmp    $0x2d,%al
  80179f:	75 0c                	jne    8017ad <strtol+0x68>
  8017a1:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8017a6:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8017ad:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8017b1:	74 06                	je     8017b9 <strtol+0x74>
  8017b3:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8017b7:	75 28                	jne    8017e1 <strtol+0x9c>
  8017b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017bd:	0f b6 00             	movzbl (%rax),%eax
  8017c0:	3c 30                	cmp    $0x30,%al
  8017c2:	75 1d                	jne    8017e1 <strtol+0x9c>
  8017c4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017c8:	48 83 c0 01          	add    $0x1,%rax
  8017cc:	0f b6 00             	movzbl (%rax),%eax
  8017cf:	3c 78                	cmp    $0x78,%al
  8017d1:	75 0e                	jne    8017e1 <strtol+0x9c>
  8017d3:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8017d8:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8017df:	eb 2c                	jmp    80180d <strtol+0xc8>
  8017e1:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8017e5:	75 19                	jne    801800 <strtol+0xbb>
  8017e7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017eb:	0f b6 00             	movzbl (%rax),%eax
  8017ee:	3c 30                	cmp    $0x30,%al
  8017f0:	75 0e                	jne    801800 <strtol+0xbb>
  8017f2:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8017f7:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  8017fe:	eb 0d                	jmp    80180d <strtol+0xc8>
  801800:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801804:	75 07                	jne    80180d <strtol+0xc8>
  801806:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  80180d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801811:	0f b6 00             	movzbl (%rax),%eax
  801814:	3c 2f                	cmp    $0x2f,%al
  801816:	7e 1d                	jle    801835 <strtol+0xf0>
  801818:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80181c:	0f b6 00             	movzbl (%rax),%eax
  80181f:	3c 39                	cmp    $0x39,%al
  801821:	7f 12                	jg     801835 <strtol+0xf0>
  801823:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801827:	0f b6 00             	movzbl (%rax),%eax
  80182a:	0f be c0             	movsbl %al,%eax
  80182d:	83 e8 30             	sub    $0x30,%eax
  801830:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801833:	eb 4e                	jmp    801883 <strtol+0x13e>
  801835:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801839:	0f b6 00             	movzbl (%rax),%eax
  80183c:	3c 60                	cmp    $0x60,%al
  80183e:	7e 1d                	jle    80185d <strtol+0x118>
  801840:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801844:	0f b6 00             	movzbl (%rax),%eax
  801847:	3c 7a                	cmp    $0x7a,%al
  801849:	7f 12                	jg     80185d <strtol+0x118>
  80184b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80184f:	0f b6 00             	movzbl (%rax),%eax
  801852:	0f be c0             	movsbl %al,%eax
  801855:	83 e8 57             	sub    $0x57,%eax
  801858:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80185b:	eb 26                	jmp    801883 <strtol+0x13e>
  80185d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801861:	0f b6 00             	movzbl (%rax),%eax
  801864:	3c 40                	cmp    $0x40,%al
  801866:	7e 48                	jle    8018b0 <strtol+0x16b>
  801868:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80186c:	0f b6 00             	movzbl (%rax),%eax
  80186f:	3c 5a                	cmp    $0x5a,%al
  801871:	7f 3d                	jg     8018b0 <strtol+0x16b>
  801873:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801877:	0f b6 00             	movzbl (%rax),%eax
  80187a:	0f be c0             	movsbl %al,%eax
  80187d:	83 e8 37             	sub    $0x37,%eax
  801880:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801883:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801886:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801889:	7c 02                	jl     80188d <strtol+0x148>
  80188b:	eb 23                	jmp    8018b0 <strtol+0x16b>
  80188d:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801892:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801895:	48 98                	cltq   
  801897:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  80189c:	48 89 c2             	mov    %rax,%rdx
  80189f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8018a2:	48 98                	cltq   
  8018a4:	48 01 d0             	add    %rdx,%rax
  8018a7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8018ab:	e9 5d ff ff ff       	jmpq   80180d <strtol+0xc8>
  8018b0:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8018b5:	74 0b                	je     8018c2 <strtol+0x17d>
  8018b7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8018bb:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8018bf:	48 89 10             	mov    %rdx,(%rax)
  8018c2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8018c6:	74 09                	je     8018d1 <strtol+0x18c>
  8018c8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018cc:	48 f7 d8             	neg    %rax
  8018cf:	eb 04                	jmp    8018d5 <strtol+0x190>
  8018d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018d5:	c9                   	leaveq 
  8018d6:	c3                   	retq   

00000000008018d7 <strstr>:
  8018d7:	55                   	push   %rbp
  8018d8:	48 89 e5             	mov    %rsp,%rbp
  8018db:	48 83 ec 30          	sub    $0x30,%rsp
  8018df:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8018e3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8018e7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8018eb:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8018ef:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8018f3:	0f b6 00             	movzbl (%rax),%eax
  8018f6:	88 45 ff             	mov    %al,-0x1(%rbp)
  8018f9:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  8018fd:	75 06                	jne    801905 <strstr+0x2e>
  8018ff:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801903:	eb 6b                	jmp    801970 <strstr+0x99>
  801905:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801909:	48 89 c7             	mov    %rax,%rdi
  80190c:	48 b8 ad 11 80 00 00 	movabs $0x8011ad,%rax
  801913:	00 00 00 
  801916:	ff d0                	callq  *%rax
  801918:	48 98                	cltq   
  80191a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80191e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801922:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801926:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80192a:	0f b6 00             	movzbl (%rax),%eax
  80192d:	88 45 ef             	mov    %al,-0x11(%rbp)
  801930:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801934:	75 07                	jne    80193d <strstr+0x66>
  801936:	b8 00 00 00 00       	mov    $0x0,%eax
  80193b:	eb 33                	jmp    801970 <strstr+0x99>
  80193d:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801941:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801944:	75 d8                	jne    80191e <strstr+0x47>
  801946:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80194a:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  80194e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801952:	48 89 ce             	mov    %rcx,%rsi
  801955:	48 89 c7             	mov    %rax,%rdi
  801958:	48 b8 ce 13 80 00 00 	movabs $0x8013ce,%rax
  80195f:	00 00 00 
  801962:	ff d0                	callq  *%rax
  801964:	85 c0                	test   %eax,%eax
  801966:	75 b6                	jne    80191e <strstr+0x47>
  801968:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80196c:	48 83 e8 01          	sub    $0x1,%rax
  801970:	c9                   	leaveq 
  801971:	c3                   	retq   

0000000000801972 <syscall>:
  801972:	55                   	push   %rbp
  801973:	48 89 e5             	mov    %rsp,%rbp
  801976:	53                   	push   %rbx
  801977:	48 83 ec 48          	sub    $0x48,%rsp
  80197b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80197e:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801981:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801985:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801989:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  80198d:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801991:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801994:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801998:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  80199c:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8019a0:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8019a4:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  8019a8:	4c 89 c3             	mov    %r8,%rbx
  8019ab:	cd 30                	int    $0x30
  8019ad:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8019b1:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8019b5:	74 3e                	je     8019f5 <syscall+0x83>
  8019b7:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8019bc:	7e 37                	jle    8019f5 <syscall+0x83>
  8019be:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8019c2:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8019c5:	49 89 d0             	mov    %rdx,%r8
  8019c8:	89 c1                	mov    %eax,%ecx
  8019ca:	48 ba 28 51 80 00 00 	movabs $0x805128,%rdx
  8019d1:	00 00 00 
  8019d4:	be 24 00 00 00       	mov    $0x24,%esi
  8019d9:	48 bf 45 51 80 00 00 	movabs $0x805145,%rdi
  8019e0:	00 00 00 
  8019e3:	b8 00 00 00 00       	mov    $0x0,%eax
  8019e8:	49 b9 2b 04 80 00 00 	movabs $0x80042b,%r9
  8019ef:	00 00 00 
  8019f2:	41 ff d1             	callq  *%r9
  8019f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019f9:	48 83 c4 48          	add    $0x48,%rsp
  8019fd:	5b                   	pop    %rbx
  8019fe:	5d                   	pop    %rbp
  8019ff:	c3                   	retq   

0000000000801a00 <sys_cputs>:
  801a00:	55                   	push   %rbp
  801a01:	48 89 e5             	mov    %rsp,%rbp
  801a04:	48 83 ec 20          	sub    $0x20,%rsp
  801a08:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801a0c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a10:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a14:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a18:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a1f:	00 
  801a20:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a26:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a2c:	48 89 d1             	mov    %rdx,%rcx
  801a2f:	48 89 c2             	mov    %rax,%rdx
  801a32:	be 00 00 00 00       	mov    $0x0,%esi
  801a37:	bf 00 00 00 00       	mov    $0x0,%edi
  801a3c:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801a43:	00 00 00 
  801a46:	ff d0                	callq  *%rax
  801a48:	c9                   	leaveq 
  801a49:	c3                   	retq   

0000000000801a4a <sys_cgetc>:
  801a4a:	55                   	push   %rbp
  801a4b:	48 89 e5             	mov    %rsp,%rbp
  801a4e:	48 83 ec 10          	sub    $0x10,%rsp
  801a52:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a59:	00 
  801a5a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a60:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a66:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a6b:	ba 00 00 00 00       	mov    $0x0,%edx
  801a70:	be 00 00 00 00       	mov    $0x0,%esi
  801a75:	bf 01 00 00 00       	mov    $0x1,%edi
  801a7a:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801a81:	00 00 00 
  801a84:	ff d0                	callq  *%rax
  801a86:	c9                   	leaveq 
  801a87:	c3                   	retq   

0000000000801a88 <sys_env_destroy>:
  801a88:	55                   	push   %rbp
  801a89:	48 89 e5             	mov    %rsp,%rbp
  801a8c:	48 83 ec 10          	sub    $0x10,%rsp
  801a90:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a93:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a96:	48 98                	cltq   
  801a98:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a9f:	00 
  801aa0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801aa6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801aac:	b9 00 00 00 00       	mov    $0x0,%ecx
  801ab1:	48 89 c2             	mov    %rax,%rdx
  801ab4:	be 01 00 00 00       	mov    $0x1,%esi
  801ab9:	bf 03 00 00 00       	mov    $0x3,%edi
  801abe:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801ac5:	00 00 00 
  801ac8:	ff d0                	callq  *%rax
  801aca:	c9                   	leaveq 
  801acb:	c3                   	retq   

0000000000801acc <sys_getenvid>:
  801acc:	55                   	push   %rbp
  801acd:	48 89 e5             	mov    %rsp,%rbp
  801ad0:	48 83 ec 10          	sub    $0x10,%rsp
  801ad4:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801adb:	00 
  801adc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ae2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ae8:	b9 00 00 00 00       	mov    $0x0,%ecx
  801aed:	ba 00 00 00 00       	mov    $0x0,%edx
  801af2:	be 00 00 00 00       	mov    $0x0,%esi
  801af7:	bf 02 00 00 00       	mov    $0x2,%edi
  801afc:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801b03:	00 00 00 
  801b06:	ff d0                	callq  *%rax
  801b08:	c9                   	leaveq 
  801b09:	c3                   	retq   

0000000000801b0a <sys_yield>:
  801b0a:	55                   	push   %rbp
  801b0b:	48 89 e5             	mov    %rsp,%rbp
  801b0e:	48 83 ec 10          	sub    $0x10,%rsp
  801b12:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b19:	00 
  801b1a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b20:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b26:	b9 00 00 00 00       	mov    $0x0,%ecx
  801b2b:	ba 00 00 00 00       	mov    $0x0,%edx
  801b30:	be 00 00 00 00       	mov    $0x0,%esi
  801b35:	bf 0b 00 00 00       	mov    $0xb,%edi
  801b3a:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801b41:	00 00 00 
  801b44:	ff d0                	callq  *%rax
  801b46:	c9                   	leaveq 
  801b47:	c3                   	retq   

0000000000801b48 <sys_page_alloc>:
  801b48:	55                   	push   %rbp
  801b49:	48 89 e5             	mov    %rsp,%rbp
  801b4c:	48 83 ec 20          	sub    $0x20,%rsp
  801b50:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b53:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b57:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801b5a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b5d:	48 63 c8             	movslq %eax,%rcx
  801b60:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b64:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b67:	48 98                	cltq   
  801b69:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b70:	00 
  801b71:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b77:	49 89 c8             	mov    %rcx,%r8
  801b7a:	48 89 d1             	mov    %rdx,%rcx
  801b7d:	48 89 c2             	mov    %rax,%rdx
  801b80:	be 01 00 00 00       	mov    $0x1,%esi
  801b85:	bf 04 00 00 00       	mov    $0x4,%edi
  801b8a:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801b91:	00 00 00 
  801b94:	ff d0                	callq  *%rax
  801b96:	c9                   	leaveq 
  801b97:	c3                   	retq   

0000000000801b98 <sys_page_map>:
  801b98:	55                   	push   %rbp
  801b99:	48 89 e5             	mov    %rsp,%rbp
  801b9c:	48 83 ec 30          	sub    $0x30,%rsp
  801ba0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ba3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ba7:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801baa:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801bae:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801bb2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801bb5:	48 63 c8             	movslq %eax,%rcx
  801bb8:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801bbc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801bbf:	48 63 f0             	movslq %eax,%rsi
  801bc2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bc6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bc9:	48 98                	cltq   
  801bcb:	48 89 0c 24          	mov    %rcx,(%rsp)
  801bcf:	49 89 f9             	mov    %rdi,%r9
  801bd2:	49 89 f0             	mov    %rsi,%r8
  801bd5:	48 89 d1             	mov    %rdx,%rcx
  801bd8:	48 89 c2             	mov    %rax,%rdx
  801bdb:	be 01 00 00 00       	mov    $0x1,%esi
  801be0:	bf 05 00 00 00       	mov    $0x5,%edi
  801be5:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801bec:	00 00 00 
  801bef:	ff d0                	callq  *%rax
  801bf1:	c9                   	leaveq 
  801bf2:	c3                   	retq   

0000000000801bf3 <sys_page_unmap>:
  801bf3:	55                   	push   %rbp
  801bf4:	48 89 e5             	mov    %rsp,%rbp
  801bf7:	48 83 ec 20          	sub    $0x20,%rsp
  801bfb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bfe:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c02:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c06:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c09:	48 98                	cltq   
  801c0b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c12:	00 
  801c13:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c19:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c1f:	48 89 d1             	mov    %rdx,%rcx
  801c22:	48 89 c2             	mov    %rax,%rdx
  801c25:	be 01 00 00 00       	mov    $0x1,%esi
  801c2a:	bf 06 00 00 00       	mov    $0x6,%edi
  801c2f:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801c36:	00 00 00 
  801c39:	ff d0                	callq  *%rax
  801c3b:	c9                   	leaveq 
  801c3c:	c3                   	retq   

0000000000801c3d <sys_env_set_status>:
  801c3d:	55                   	push   %rbp
  801c3e:	48 89 e5             	mov    %rsp,%rbp
  801c41:	48 83 ec 10          	sub    $0x10,%rsp
  801c45:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c48:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801c4b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801c4e:	48 63 d0             	movslq %eax,%rdx
  801c51:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c54:	48 98                	cltq   
  801c56:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c5d:	00 
  801c5e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c64:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c6a:	48 89 d1             	mov    %rdx,%rcx
  801c6d:	48 89 c2             	mov    %rax,%rdx
  801c70:	be 01 00 00 00       	mov    $0x1,%esi
  801c75:	bf 08 00 00 00       	mov    $0x8,%edi
  801c7a:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801c81:	00 00 00 
  801c84:	ff d0                	callq  *%rax
  801c86:	c9                   	leaveq 
  801c87:	c3                   	retq   

0000000000801c88 <sys_env_set_trapframe>:
  801c88:	55                   	push   %rbp
  801c89:	48 89 e5             	mov    %rsp,%rbp
  801c8c:	48 83 ec 20          	sub    $0x20,%rsp
  801c90:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c93:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c97:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c9b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c9e:	48 98                	cltq   
  801ca0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ca7:	00 
  801ca8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cae:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cb4:	48 89 d1             	mov    %rdx,%rcx
  801cb7:	48 89 c2             	mov    %rax,%rdx
  801cba:	be 01 00 00 00       	mov    $0x1,%esi
  801cbf:	bf 09 00 00 00       	mov    $0x9,%edi
  801cc4:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801ccb:	00 00 00 
  801cce:	ff d0                	callq  *%rax
  801cd0:	c9                   	leaveq 
  801cd1:	c3                   	retq   

0000000000801cd2 <sys_env_set_pgfault_upcall>:
  801cd2:	55                   	push   %rbp
  801cd3:	48 89 e5             	mov    %rsp,%rbp
  801cd6:	48 83 ec 20          	sub    $0x20,%rsp
  801cda:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801cdd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ce1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ce5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ce8:	48 98                	cltq   
  801cea:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801cf1:	00 
  801cf2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cf8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cfe:	48 89 d1             	mov    %rdx,%rcx
  801d01:	48 89 c2             	mov    %rax,%rdx
  801d04:	be 01 00 00 00       	mov    $0x1,%esi
  801d09:	bf 0a 00 00 00       	mov    $0xa,%edi
  801d0e:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801d15:	00 00 00 
  801d18:	ff d0                	callq  *%rax
  801d1a:	c9                   	leaveq 
  801d1b:	c3                   	retq   

0000000000801d1c <sys_ipc_try_send>:
  801d1c:	55                   	push   %rbp
  801d1d:	48 89 e5             	mov    %rsp,%rbp
  801d20:	48 83 ec 20          	sub    $0x20,%rsp
  801d24:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d27:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d2b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801d2f:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801d32:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d35:	48 63 f0             	movslq %eax,%rsi
  801d38:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801d3c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d3f:	48 98                	cltq   
  801d41:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d45:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d4c:	00 
  801d4d:	49 89 f1             	mov    %rsi,%r9
  801d50:	49 89 c8             	mov    %rcx,%r8
  801d53:	48 89 d1             	mov    %rdx,%rcx
  801d56:	48 89 c2             	mov    %rax,%rdx
  801d59:	be 00 00 00 00       	mov    $0x0,%esi
  801d5e:	bf 0c 00 00 00       	mov    $0xc,%edi
  801d63:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801d6a:	00 00 00 
  801d6d:	ff d0                	callq  *%rax
  801d6f:	c9                   	leaveq 
  801d70:	c3                   	retq   

0000000000801d71 <sys_ipc_recv>:
  801d71:	55                   	push   %rbp
  801d72:	48 89 e5             	mov    %rsp,%rbp
  801d75:	48 83 ec 10          	sub    $0x10,%rsp
  801d79:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d7d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d81:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d88:	00 
  801d89:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d8f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d95:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d9a:	48 89 c2             	mov    %rax,%rdx
  801d9d:	be 01 00 00 00       	mov    $0x1,%esi
  801da2:	bf 0d 00 00 00       	mov    $0xd,%edi
  801da7:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801dae:	00 00 00 
  801db1:	ff d0                	callq  *%rax
  801db3:	c9                   	leaveq 
  801db4:	c3                   	retq   

0000000000801db5 <sys_time_msec>:
  801db5:	55                   	push   %rbp
  801db6:	48 89 e5             	mov    %rsp,%rbp
  801db9:	48 83 ec 10          	sub    $0x10,%rsp
  801dbd:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801dc4:	00 
  801dc5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801dcb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801dd1:	b9 00 00 00 00       	mov    $0x0,%ecx
  801dd6:	ba 00 00 00 00       	mov    $0x0,%edx
  801ddb:	be 00 00 00 00       	mov    $0x0,%esi
  801de0:	bf 0e 00 00 00       	mov    $0xe,%edi
  801de5:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801dec:	00 00 00 
  801def:	ff d0                	callq  *%rax
  801df1:	c9                   	leaveq 
  801df2:	c3                   	retq   

0000000000801df3 <sys_net_transmit>:
  801df3:	55                   	push   %rbp
  801df4:	48 89 e5             	mov    %rsp,%rbp
  801df7:	48 83 ec 20          	sub    $0x20,%rsp
  801dfb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801dff:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801e02:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801e05:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e09:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e10:	00 
  801e11:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e17:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e1d:	48 89 d1             	mov    %rdx,%rcx
  801e20:	48 89 c2             	mov    %rax,%rdx
  801e23:	be 00 00 00 00       	mov    $0x0,%esi
  801e28:	bf 0f 00 00 00       	mov    $0xf,%edi
  801e2d:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801e34:	00 00 00 
  801e37:	ff d0                	callq  *%rax
  801e39:	c9                   	leaveq 
  801e3a:	c3                   	retq   

0000000000801e3b <sys_net_receive>:
  801e3b:	55                   	push   %rbp
  801e3c:	48 89 e5             	mov    %rsp,%rbp
  801e3f:	48 83 ec 20          	sub    $0x20,%rsp
  801e43:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e47:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801e4a:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801e4d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e51:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e58:	00 
  801e59:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e5f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e65:	48 89 d1             	mov    %rdx,%rcx
  801e68:	48 89 c2             	mov    %rax,%rdx
  801e6b:	be 00 00 00 00       	mov    $0x0,%esi
  801e70:	bf 10 00 00 00       	mov    $0x10,%edi
  801e75:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801e7c:	00 00 00 
  801e7f:	ff d0                	callq  *%rax
  801e81:	c9                   	leaveq 
  801e82:	c3                   	retq   

0000000000801e83 <sys_ept_map>:
  801e83:	55                   	push   %rbp
  801e84:	48 89 e5             	mov    %rsp,%rbp
  801e87:	48 83 ec 30          	sub    $0x30,%rsp
  801e8b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e8e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e92:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801e95:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801e99:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801e9d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801ea0:	48 63 c8             	movslq %eax,%rcx
  801ea3:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801ea7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801eaa:	48 63 f0             	movslq %eax,%rsi
  801ead:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801eb1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801eb4:	48 98                	cltq   
  801eb6:	48 89 0c 24          	mov    %rcx,(%rsp)
  801eba:	49 89 f9             	mov    %rdi,%r9
  801ebd:	49 89 f0             	mov    %rsi,%r8
  801ec0:	48 89 d1             	mov    %rdx,%rcx
  801ec3:	48 89 c2             	mov    %rax,%rdx
  801ec6:	be 00 00 00 00       	mov    $0x0,%esi
  801ecb:	bf 11 00 00 00       	mov    $0x11,%edi
  801ed0:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801ed7:	00 00 00 
  801eda:	ff d0                	callq  *%rax
  801edc:	c9                   	leaveq 
  801edd:	c3                   	retq   

0000000000801ede <sys_env_mkguest>:
  801ede:	55                   	push   %rbp
  801edf:	48 89 e5             	mov    %rsp,%rbp
  801ee2:	48 83 ec 20          	sub    $0x20,%rsp
  801ee6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801eea:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801eee:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ef2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ef6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801efd:	00 
  801efe:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f04:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f0a:	48 89 d1             	mov    %rdx,%rcx
  801f0d:	48 89 c2             	mov    %rax,%rdx
  801f10:	be 00 00 00 00       	mov    $0x0,%esi
  801f15:	bf 12 00 00 00       	mov    $0x12,%edi
  801f1a:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801f21:	00 00 00 
  801f24:	ff d0                	callq  *%rax
  801f26:	c9                   	leaveq 
  801f27:	c3                   	retq   

0000000000801f28 <pgfault>:
  801f28:	55                   	push   %rbp
  801f29:	48 89 e5             	mov    %rsp,%rbp
  801f2c:	48 83 ec 30          	sub    $0x30,%rsp
  801f30:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801f34:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f38:	48 8b 00             	mov    (%rax),%rax
  801f3b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  801f3f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f43:	48 8b 40 08          	mov    0x8(%rax),%rax
  801f47:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801f4a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f4d:	83 e0 02             	and    $0x2,%eax
  801f50:	85 c0                	test   %eax,%eax
  801f52:	75 40                	jne    801f94 <pgfault+0x6c>
  801f54:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f58:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  801f5f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f63:	49 89 d0             	mov    %rdx,%r8
  801f66:	48 89 c1             	mov    %rax,%rcx
  801f69:	48 ba 58 51 80 00 00 	movabs $0x805158,%rdx
  801f70:	00 00 00 
  801f73:	be 1f 00 00 00       	mov    $0x1f,%esi
  801f78:	48 bf 71 51 80 00 00 	movabs $0x805171,%rdi
  801f7f:	00 00 00 
  801f82:	b8 00 00 00 00       	mov    $0x0,%eax
  801f87:	49 b9 2b 04 80 00 00 	movabs $0x80042b,%r9
  801f8e:	00 00 00 
  801f91:	41 ff d1             	callq  *%r9
  801f94:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f98:	48 c1 e8 0c          	shr    $0xc,%rax
  801f9c:	48 89 c2             	mov    %rax,%rdx
  801f9f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801fa6:	01 00 00 
  801fa9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801fad:	25 07 08 00 00       	and    $0x807,%eax
  801fb2:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  801fb8:	74 4e                	je     802008 <pgfault+0xe0>
  801fba:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801fbe:	48 c1 e8 0c          	shr    $0xc,%rax
  801fc2:	48 89 c2             	mov    %rax,%rdx
  801fc5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801fcc:	01 00 00 
  801fcf:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  801fd3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801fd7:	49 89 d0             	mov    %rdx,%r8
  801fda:	48 89 c1             	mov    %rax,%rcx
  801fdd:	48 ba 80 51 80 00 00 	movabs $0x805180,%rdx
  801fe4:	00 00 00 
  801fe7:	be 22 00 00 00       	mov    $0x22,%esi
  801fec:	48 bf 71 51 80 00 00 	movabs $0x805171,%rdi
  801ff3:	00 00 00 
  801ff6:	b8 00 00 00 00       	mov    $0x0,%eax
  801ffb:	49 b9 2b 04 80 00 00 	movabs $0x80042b,%r9
  802002:	00 00 00 
  802005:	41 ff d1             	callq  *%r9
  802008:	ba 07 00 00 00       	mov    $0x7,%edx
  80200d:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802012:	bf 00 00 00 00       	mov    $0x0,%edi
  802017:	48 b8 48 1b 80 00 00 	movabs $0x801b48,%rax
  80201e:	00 00 00 
  802021:	ff d0                	callq  *%rax
  802023:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802026:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80202a:	79 30                	jns    80205c <pgfault+0x134>
  80202c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80202f:	89 c1                	mov    %eax,%ecx
  802031:	48 ba ab 51 80 00 00 	movabs $0x8051ab,%rdx
  802038:	00 00 00 
  80203b:	be 30 00 00 00       	mov    $0x30,%esi
  802040:	48 bf 71 51 80 00 00 	movabs $0x805171,%rdi
  802047:	00 00 00 
  80204a:	b8 00 00 00 00       	mov    $0x0,%eax
  80204f:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  802056:	00 00 00 
  802059:	41 ff d0             	callq  *%r8
  80205c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802060:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802064:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802068:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  80206e:	ba 00 10 00 00       	mov    $0x1000,%edx
  802073:	48 89 c6             	mov    %rax,%rsi
  802076:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  80207b:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  802082:	00 00 00 
  802085:	ff d0                	callq  *%rax
  802087:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80208b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80208f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802093:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802099:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  80209f:	48 89 c1             	mov    %rax,%rcx
  8020a2:	ba 00 00 00 00       	mov    $0x0,%edx
  8020a7:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8020ac:	bf 00 00 00 00       	mov    $0x0,%edi
  8020b1:	48 b8 98 1b 80 00 00 	movabs $0x801b98,%rax
  8020b8:	00 00 00 
  8020bb:	ff d0                	callq  *%rax
  8020bd:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8020c0:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8020c4:	79 30                	jns    8020f6 <pgfault+0x1ce>
  8020c6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8020c9:	89 c1                	mov    %eax,%ecx
  8020cb:	48 ba be 51 80 00 00 	movabs $0x8051be,%rdx
  8020d2:	00 00 00 
  8020d5:	be 35 00 00 00       	mov    $0x35,%esi
  8020da:	48 bf 71 51 80 00 00 	movabs $0x805171,%rdi
  8020e1:	00 00 00 
  8020e4:	b8 00 00 00 00       	mov    $0x0,%eax
  8020e9:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  8020f0:	00 00 00 
  8020f3:	41 ff d0             	callq  *%r8
  8020f6:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8020fb:	bf 00 00 00 00       	mov    $0x0,%edi
  802100:	48 b8 f3 1b 80 00 00 	movabs $0x801bf3,%rax
  802107:	00 00 00 
  80210a:	ff d0                	callq  *%rax
  80210c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80210f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802113:	79 30                	jns    802145 <pgfault+0x21d>
  802115:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802118:	89 c1                	mov    %eax,%ecx
  80211a:	48 ba cf 51 80 00 00 	movabs $0x8051cf,%rdx
  802121:	00 00 00 
  802124:	be 39 00 00 00       	mov    $0x39,%esi
  802129:	48 bf 71 51 80 00 00 	movabs $0x805171,%rdi
  802130:	00 00 00 
  802133:	b8 00 00 00 00       	mov    $0x0,%eax
  802138:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  80213f:	00 00 00 
  802142:	41 ff d0             	callq  *%r8
  802145:	c9                   	leaveq 
  802146:	c3                   	retq   

0000000000802147 <duppage>:
  802147:	55                   	push   %rbp
  802148:	48 89 e5             	mov    %rsp,%rbp
  80214b:	48 83 ec 30          	sub    $0x30,%rsp
  80214f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802152:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802155:	8b 45 d8             	mov    -0x28(%rbp),%eax
  802158:	c1 e0 0c             	shl    $0xc,%eax
  80215b:	89 c0                	mov    %eax,%eax
  80215d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802161:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802168:	01 00 00 
  80216b:	8b 55 d8             	mov    -0x28(%rbp),%edx
  80216e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802172:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802176:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80217a:	25 02 08 00 00       	and    $0x802,%eax
  80217f:	48 85 c0             	test   %rax,%rax
  802182:	74 0e                	je     802192 <duppage+0x4b>
  802184:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802188:	25 00 04 00 00       	and    $0x400,%eax
  80218d:	48 85 c0             	test   %rax,%rax
  802190:	74 70                	je     802202 <duppage+0xbb>
  802192:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802196:	25 07 0e 00 00       	and    $0xe07,%eax
  80219b:	89 c6                	mov    %eax,%esi
  80219d:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8021a1:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8021a4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8021a8:	41 89 f0             	mov    %esi,%r8d
  8021ab:	48 89 c6             	mov    %rax,%rsi
  8021ae:	bf 00 00 00 00       	mov    $0x0,%edi
  8021b3:	48 b8 98 1b 80 00 00 	movabs $0x801b98,%rax
  8021ba:	00 00 00 
  8021bd:	ff d0                	callq  *%rax
  8021bf:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8021c2:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8021c6:	79 30                	jns    8021f8 <duppage+0xb1>
  8021c8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8021cb:	89 c1                	mov    %eax,%ecx
  8021cd:	48 ba be 51 80 00 00 	movabs $0x8051be,%rdx
  8021d4:	00 00 00 
  8021d7:	be 63 00 00 00       	mov    $0x63,%esi
  8021dc:	48 bf 71 51 80 00 00 	movabs $0x805171,%rdi
  8021e3:	00 00 00 
  8021e6:	b8 00 00 00 00       	mov    $0x0,%eax
  8021eb:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  8021f2:	00 00 00 
  8021f5:	41 ff d0             	callq  *%r8
  8021f8:	b8 00 00 00 00       	mov    $0x0,%eax
  8021fd:	e9 c4 00 00 00       	jmpq   8022c6 <duppage+0x17f>
  802202:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  802206:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802209:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80220d:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  802213:	48 89 c6             	mov    %rax,%rsi
  802216:	bf 00 00 00 00       	mov    $0x0,%edi
  80221b:	48 b8 98 1b 80 00 00 	movabs $0x801b98,%rax
  802222:	00 00 00 
  802225:	ff d0                	callq  *%rax
  802227:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80222a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80222e:	79 30                	jns    802260 <duppage+0x119>
  802230:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802233:	89 c1                	mov    %eax,%ecx
  802235:	48 ba be 51 80 00 00 	movabs $0x8051be,%rdx
  80223c:	00 00 00 
  80223f:	be 7e 00 00 00       	mov    $0x7e,%esi
  802244:	48 bf 71 51 80 00 00 	movabs $0x805171,%rdi
  80224b:	00 00 00 
  80224e:	b8 00 00 00 00       	mov    $0x0,%eax
  802253:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  80225a:	00 00 00 
  80225d:	41 ff d0             	callq  *%r8
  802260:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802264:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802268:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  80226e:	48 89 d1             	mov    %rdx,%rcx
  802271:	ba 00 00 00 00       	mov    $0x0,%edx
  802276:	48 89 c6             	mov    %rax,%rsi
  802279:	bf 00 00 00 00       	mov    $0x0,%edi
  80227e:	48 b8 98 1b 80 00 00 	movabs $0x801b98,%rax
  802285:	00 00 00 
  802288:	ff d0                	callq  *%rax
  80228a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80228d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802291:	79 30                	jns    8022c3 <duppage+0x17c>
  802293:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802296:	89 c1                	mov    %eax,%ecx
  802298:	48 ba be 51 80 00 00 	movabs $0x8051be,%rdx
  80229f:	00 00 00 
  8022a2:	be 80 00 00 00       	mov    $0x80,%esi
  8022a7:	48 bf 71 51 80 00 00 	movabs $0x805171,%rdi
  8022ae:	00 00 00 
  8022b1:	b8 00 00 00 00       	mov    $0x0,%eax
  8022b6:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  8022bd:	00 00 00 
  8022c0:	41 ff d0             	callq  *%r8
  8022c3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8022c6:	c9                   	leaveq 
  8022c7:	c3                   	retq   

00000000008022c8 <fork>:
  8022c8:	55                   	push   %rbp
  8022c9:	48 89 e5             	mov    %rsp,%rbp
  8022cc:	48 83 ec 20          	sub    $0x20,%rsp
  8022d0:	48 bf 28 1f 80 00 00 	movabs $0x801f28,%rdi
  8022d7:	00 00 00 
  8022da:	48 b8 dd 49 80 00 00 	movabs $0x8049dd,%rax
  8022e1:	00 00 00 
  8022e4:	ff d0                	callq  *%rax
  8022e6:	b8 07 00 00 00       	mov    $0x7,%eax
  8022eb:	cd 30                	int    $0x30
  8022ed:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8022f0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8022f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8022f6:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8022fa:	79 08                	jns    802304 <fork+0x3c>
  8022fc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8022ff:	e9 09 02 00 00       	jmpq   80250d <fork+0x245>
  802304:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802308:	75 3e                	jne    802348 <fork+0x80>
  80230a:	48 b8 cc 1a 80 00 00 	movabs $0x801acc,%rax
  802311:	00 00 00 
  802314:	ff d0                	callq  *%rax
  802316:	25 ff 03 00 00       	and    $0x3ff,%eax
  80231b:	48 98                	cltq   
  80231d:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  802324:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80232b:	00 00 00 
  80232e:	48 01 c2             	add    %rax,%rdx
  802331:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802338:	00 00 00 
  80233b:	48 89 10             	mov    %rdx,(%rax)
  80233e:	b8 00 00 00 00       	mov    $0x0,%eax
  802343:	e9 c5 01 00 00       	jmpq   80250d <fork+0x245>
  802348:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80234f:	e9 a4 00 00 00       	jmpq   8023f8 <fork+0x130>
  802354:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802357:	c1 f8 12             	sar    $0x12,%eax
  80235a:	89 c2                	mov    %eax,%edx
  80235c:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  802363:	01 00 00 
  802366:	48 63 d2             	movslq %edx,%rdx
  802369:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80236d:	83 e0 01             	and    $0x1,%eax
  802370:	48 85 c0             	test   %rax,%rax
  802373:	74 21                	je     802396 <fork+0xce>
  802375:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802378:	c1 f8 09             	sar    $0x9,%eax
  80237b:	89 c2                	mov    %eax,%edx
  80237d:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802384:	01 00 00 
  802387:	48 63 d2             	movslq %edx,%rdx
  80238a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80238e:	83 e0 01             	and    $0x1,%eax
  802391:	48 85 c0             	test   %rax,%rax
  802394:	75 09                	jne    80239f <fork+0xd7>
  802396:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  80239d:	eb 59                	jmp    8023f8 <fork+0x130>
  80239f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023a2:	05 00 02 00 00       	add    $0x200,%eax
  8023a7:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8023aa:	eb 44                	jmp    8023f0 <fork+0x128>
  8023ac:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8023b3:	01 00 00 
  8023b6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8023b9:	48 63 d2             	movslq %edx,%rdx
  8023bc:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8023c0:	83 e0 05             	and    $0x5,%eax
  8023c3:	48 83 f8 05          	cmp    $0x5,%rax
  8023c7:	74 02                	je     8023cb <fork+0x103>
  8023c9:	eb 21                	jmp    8023ec <fork+0x124>
  8023cb:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  8023d2:	75 02                	jne    8023d6 <fork+0x10e>
  8023d4:	eb 16                	jmp    8023ec <fork+0x124>
  8023d6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8023d9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8023dc:	89 d6                	mov    %edx,%esi
  8023de:	89 c7                	mov    %eax,%edi
  8023e0:	48 b8 47 21 80 00 00 	movabs $0x802147,%rax
  8023e7:	00 00 00 
  8023ea:	ff d0                	callq  *%rax
  8023ec:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8023f0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023f3:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8023f6:	7c b4                	jl     8023ac <fork+0xe4>
  8023f8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023fb:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  802400:	0f 86 4e ff ff ff    	jbe    802354 <fork+0x8c>
  802406:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802409:	ba 07 00 00 00       	mov    $0x7,%edx
  80240e:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  802413:	89 c7                	mov    %eax,%edi
  802415:	48 b8 48 1b 80 00 00 	movabs $0x801b48,%rax
  80241c:	00 00 00 
  80241f:	ff d0                	callq  *%rax
  802421:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802424:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802428:	79 30                	jns    80245a <fork+0x192>
  80242a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80242d:	89 c1                	mov    %eax,%ecx
  80242f:	48 ba e8 51 80 00 00 	movabs $0x8051e8,%rdx
  802436:	00 00 00 
  802439:	be bc 00 00 00       	mov    $0xbc,%esi
  80243e:	48 bf 71 51 80 00 00 	movabs $0x805171,%rdi
  802445:	00 00 00 
  802448:	b8 00 00 00 00       	mov    $0x0,%eax
  80244d:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  802454:	00 00 00 
  802457:	41 ff d0             	callq  *%r8
  80245a:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802461:	00 00 00 
  802464:	48 8b 00             	mov    (%rax),%rax
  802467:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  80246e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802471:	48 89 d6             	mov    %rdx,%rsi
  802474:	89 c7                	mov    %eax,%edi
  802476:	48 b8 d2 1c 80 00 00 	movabs $0x801cd2,%rax
  80247d:	00 00 00 
  802480:	ff d0                	callq  *%rax
  802482:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802485:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802489:	79 30                	jns    8024bb <fork+0x1f3>
  80248b:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80248e:	89 c1                	mov    %eax,%ecx
  802490:	48 ba 08 52 80 00 00 	movabs $0x805208,%rdx
  802497:	00 00 00 
  80249a:	be c0 00 00 00       	mov    $0xc0,%esi
  80249f:	48 bf 71 51 80 00 00 	movabs $0x805171,%rdi
  8024a6:	00 00 00 
  8024a9:	b8 00 00 00 00       	mov    $0x0,%eax
  8024ae:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  8024b5:	00 00 00 
  8024b8:	41 ff d0             	callq  *%r8
  8024bb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8024be:	be 02 00 00 00       	mov    $0x2,%esi
  8024c3:	89 c7                	mov    %eax,%edi
  8024c5:	48 b8 3d 1c 80 00 00 	movabs $0x801c3d,%rax
  8024cc:	00 00 00 
  8024cf:	ff d0                	callq  *%rax
  8024d1:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8024d4:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8024d8:	79 30                	jns    80250a <fork+0x242>
  8024da:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8024dd:	89 c1                	mov    %eax,%ecx
  8024df:	48 ba 27 52 80 00 00 	movabs $0x805227,%rdx
  8024e6:	00 00 00 
  8024e9:	be c5 00 00 00       	mov    $0xc5,%esi
  8024ee:	48 bf 71 51 80 00 00 	movabs $0x805171,%rdi
  8024f5:	00 00 00 
  8024f8:	b8 00 00 00 00       	mov    $0x0,%eax
  8024fd:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  802504:	00 00 00 
  802507:	41 ff d0             	callq  *%r8
  80250a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80250d:	c9                   	leaveq 
  80250e:	c3                   	retq   

000000000080250f <sfork>:
  80250f:	55                   	push   %rbp
  802510:	48 89 e5             	mov    %rsp,%rbp
  802513:	48 ba 3e 52 80 00 00 	movabs $0x80523e,%rdx
  80251a:	00 00 00 
  80251d:	be d2 00 00 00       	mov    $0xd2,%esi
  802522:	48 bf 71 51 80 00 00 	movabs $0x805171,%rdi
  802529:	00 00 00 
  80252c:	b8 00 00 00 00       	mov    $0x0,%eax
  802531:	48 b9 2b 04 80 00 00 	movabs $0x80042b,%rcx
  802538:	00 00 00 
  80253b:	ff d1                	callq  *%rcx

000000000080253d <ipc_recv>:
  80253d:	55                   	push   %rbp
  80253e:	48 89 e5             	mov    %rsp,%rbp
  802541:	48 83 ec 30          	sub    $0x30,%rsp
  802545:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802549:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80254d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802551:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802556:	75 0e                	jne    802566 <ipc_recv+0x29>
  802558:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80255f:	00 00 00 
  802562:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802566:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80256a:	48 89 c7             	mov    %rax,%rdi
  80256d:	48 b8 71 1d 80 00 00 	movabs $0x801d71,%rax
  802574:	00 00 00 
  802577:	ff d0                	callq  *%rax
  802579:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80257c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802580:	79 27                	jns    8025a9 <ipc_recv+0x6c>
  802582:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802587:	74 0a                	je     802593 <ipc_recv+0x56>
  802589:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80258d:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  802593:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802598:	74 0a                	je     8025a4 <ipc_recv+0x67>
  80259a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80259e:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8025a4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025a7:	eb 53                	jmp    8025fc <ipc_recv+0xbf>
  8025a9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8025ae:	74 19                	je     8025c9 <ipc_recv+0x8c>
  8025b0:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8025b7:	00 00 00 
  8025ba:	48 8b 00             	mov    (%rax),%rax
  8025bd:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8025c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025c7:	89 10                	mov    %edx,(%rax)
  8025c9:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8025ce:	74 19                	je     8025e9 <ipc_recv+0xac>
  8025d0:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8025d7:	00 00 00 
  8025da:	48 8b 00             	mov    (%rax),%rax
  8025dd:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8025e3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8025e7:	89 10                	mov    %edx,(%rax)
  8025e9:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8025f0:	00 00 00 
  8025f3:	48 8b 00             	mov    (%rax),%rax
  8025f6:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  8025fc:	c9                   	leaveq 
  8025fd:	c3                   	retq   

00000000008025fe <ipc_send>:
  8025fe:	55                   	push   %rbp
  8025ff:	48 89 e5             	mov    %rsp,%rbp
  802602:	48 83 ec 30          	sub    $0x30,%rsp
  802606:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802609:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80260c:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  802610:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  802613:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802618:	75 10                	jne    80262a <ipc_send+0x2c>
  80261a:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802621:	00 00 00 
  802624:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802628:	eb 0e                	jmp    802638 <ipc_send+0x3a>
  80262a:	eb 0c                	jmp    802638 <ipc_send+0x3a>
  80262c:	48 b8 0a 1b 80 00 00 	movabs $0x801b0a,%rax
  802633:	00 00 00 
  802636:	ff d0                	callq  *%rax
  802638:	8b 75 e8             	mov    -0x18(%rbp),%esi
  80263b:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  80263e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802642:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802645:	89 c7                	mov    %eax,%edi
  802647:	48 b8 1c 1d 80 00 00 	movabs $0x801d1c,%rax
  80264e:	00 00 00 
  802651:	ff d0                	callq  *%rax
  802653:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802656:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  80265a:	74 d0                	je     80262c <ipc_send+0x2e>
  80265c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802660:	79 30                	jns    802692 <ipc_send+0x94>
  802662:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802665:	89 c1                	mov    %eax,%ecx
  802667:	48 ba 54 52 80 00 00 	movabs $0x805254,%rdx
  80266e:	00 00 00 
  802671:	be 44 00 00 00       	mov    $0x44,%esi
  802676:	48 bf 6a 52 80 00 00 	movabs $0x80526a,%rdi
  80267d:	00 00 00 
  802680:	b8 00 00 00 00       	mov    $0x0,%eax
  802685:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  80268c:	00 00 00 
  80268f:	41 ff d0             	callq  *%r8
  802692:	c9                   	leaveq 
  802693:	c3                   	retq   

0000000000802694 <ipc_host_recv>:
  802694:	55                   	push   %rbp
  802695:	48 89 e5             	mov    %rsp,%rbp
  802698:	53                   	push   %rbx
  802699:	48 83 ec 28          	sub    $0x28,%rsp
  80269d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8026a1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  8026a8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
  8026af:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8026b4:	75 0e                	jne    8026c4 <ipc_host_recv+0x30>
  8026b6:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8026bd:	00 00 00 
  8026c0:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8026c4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8026c8:	ba 07 00 00 00       	mov    $0x7,%edx
  8026cd:	48 89 c6             	mov    %rax,%rsi
  8026d0:	bf 00 00 00 00       	mov    $0x0,%edi
  8026d5:	48 b8 48 1b 80 00 00 	movabs $0x801b48,%rax
  8026dc:	00 00 00 
  8026df:	ff d0                	callq  *%rax
  8026e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8026e5:	48 c1 e8 0c          	shr    $0xc,%rax
  8026e9:	48 89 c2             	mov    %rax,%rdx
  8026ec:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8026f3:	01 00 00 
  8026f6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8026fa:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802700:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802704:	b8 03 00 00 00       	mov    $0x3,%eax
  802709:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80270d:	48 89 d3             	mov    %rdx,%rbx
  802710:	0f 01 c1             	vmcall 
  802713:	89 f2                	mov    %esi,%edx
  802715:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802718:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80271b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80271f:	79 05                	jns    802726 <ipc_host_recv+0x92>
  802721:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802724:	eb 03                	jmp    802729 <ipc_host_recv+0x95>
  802726:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802729:	48 83 c4 28          	add    $0x28,%rsp
  80272d:	5b                   	pop    %rbx
  80272e:	5d                   	pop    %rbp
  80272f:	c3                   	retq   

0000000000802730 <ipc_host_send>:
  802730:	55                   	push   %rbp
  802731:	48 89 e5             	mov    %rsp,%rbp
  802734:	53                   	push   %rbx
  802735:	48 83 ec 38          	sub    $0x38,%rsp
  802739:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80273c:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80273f:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  802743:	89 4d cc             	mov    %ecx,-0x34(%rbp)
  802746:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  80274d:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  802752:	75 0e                	jne    802762 <ipc_host_send+0x32>
  802754:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80275b:	00 00 00 
  80275e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  802762:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802766:	48 c1 e8 0c          	shr    $0xc,%rax
  80276a:	48 89 c2             	mov    %rax,%rdx
  80276d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802774:	01 00 00 
  802777:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80277b:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802781:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802785:	b8 02 00 00 00       	mov    $0x2,%eax
  80278a:	8b 7d dc             	mov    -0x24(%rbp),%edi
  80278d:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802790:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802794:	8b 75 cc             	mov    -0x34(%rbp),%esi
  802797:	89 fb                	mov    %edi,%ebx
  802799:	0f 01 c1             	vmcall 
  80279c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80279f:	eb 26                	jmp    8027c7 <ipc_host_send+0x97>
  8027a1:	48 b8 0a 1b 80 00 00 	movabs $0x801b0a,%rax
  8027a8:	00 00 00 
  8027ab:	ff d0                	callq  *%rax
  8027ad:	b8 02 00 00 00       	mov    $0x2,%eax
  8027b2:	8b 7d dc             	mov    -0x24(%rbp),%edi
  8027b5:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8027b8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8027bc:	8b 75 cc             	mov    -0x34(%rbp),%esi
  8027bf:	89 fb                	mov    %edi,%ebx
  8027c1:	0f 01 c1             	vmcall 
  8027c4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8027c7:	83 7d ec f8          	cmpl   $0xfffffff8,-0x14(%rbp)
  8027cb:	74 d4                	je     8027a1 <ipc_host_send+0x71>
  8027cd:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8027d1:	79 55                	jns    802828 <ipc_host_send+0xf8>
  8027d3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8027d6:	89 c2                	mov    %eax,%edx
  8027d8:	be 81 00 00 00       	mov    $0x81,%esi
  8027dd:	48 bf 77 52 80 00 00 	movabs $0x805277,%rdi
  8027e4:	00 00 00 
  8027e7:	b8 00 00 00 00       	mov    $0x0,%eax
  8027ec:	48 b9 64 06 80 00 00 	movabs $0x800664,%rcx
  8027f3:	00 00 00 
  8027f6:	ff d1                	callq  *%rcx
  8027f8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8027fb:	89 c1                	mov    %eax,%ecx
  8027fd:	48 ba 54 52 80 00 00 	movabs $0x805254,%rdx
  802804:	00 00 00 
  802807:	be 82 00 00 00       	mov    $0x82,%esi
  80280c:	48 bf 6a 52 80 00 00 	movabs $0x80526a,%rdi
  802813:	00 00 00 
  802816:	b8 00 00 00 00       	mov    $0x0,%eax
  80281b:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  802822:	00 00 00 
  802825:	41 ff d0             	callq  *%r8
  802828:	48 83 c4 38          	add    $0x38,%rsp
  80282c:	5b                   	pop    %rbx
  80282d:	5d                   	pop    %rbp
  80282e:	c3                   	retq   

000000000080282f <ipc_find_env>:
  80282f:	55                   	push   %rbp
  802830:	48 89 e5             	mov    %rsp,%rbp
  802833:	48 83 ec 14          	sub    $0x14,%rsp
  802837:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80283a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802841:	eb 4e                	jmp    802891 <ipc_find_env+0x62>
  802843:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80284a:	00 00 00 
  80284d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802850:	48 98                	cltq   
  802852:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802859:	48 01 d0             	add    %rdx,%rax
  80285c:	48 05 d0 00 00 00    	add    $0xd0,%rax
  802862:	8b 00                	mov    (%rax),%eax
  802864:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802867:	75 24                	jne    80288d <ipc_find_env+0x5e>
  802869:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802870:	00 00 00 
  802873:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802876:	48 98                	cltq   
  802878:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80287f:	48 01 d0             	add    %rdx,%rax
  802882:	48 05 c0 00 00 00    	add    $0xc0,%rax
  802888:	8b 40 08             	mov    0x8(%rax),%eax
  80288b:	eb 12                	jmp    80289f <ipc_find_env+0x70>
  80288d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802891:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  802898:	7e a9                	jle    802843 <ipc_find_env+0x14>
  80289a:	b8 00 00 00 00       	mov    $0x0,%eax
  80289f:	c9                   	leaveq 
  8028a0:	c3                   	retq   

00000000008028a1 <fd2num>:
  8028a1:	55                   	push   %rbp
  8028a2:	48 89 e5             	mov    %rsp,%rbp
  8028a5:	48 83 ec 08          	sub    $0x8,%rsp
  8028a9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8028ad:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8028b1:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  8028b8:	ff ff ff 
  8028bb:	48 01 d0             	add    %rdx,%rax
  8028be:	48 c1 e8 0c          	shr    $0xc,%rax
  8028c2:	c9                   	leaveq 
  8028c3:	c3                   	retq   

00000000008028c4 <fd2data>:
  8028c4:	55                   	push   %rbp
  8028c5:	48 89 e5             	mov    %rsp,%rbp
  8028c8:	48 83 ec 08          	sub    $0x8,%rsp
  8028cc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8028d0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8028d4:	48 89 c7             	mov    %rax,%rdi
  8028d7:	48 b8 a1 28 80 00 00 	movabs $0x8028a1,%rax
  8028de:	00 00 00 
  8028e1:	ff d0                	callq  *%rax
  8028e3:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  8028e9:	48 c1 e0 0c          	shl    $0xc,%rax
  8028ed:	c9                   	leaveq 
  8028ee:	c3                   	retq   

00000000008028ef <fd_alloc>:
  8028ef:	55                   	push   %rbp
  8028f0:	48 89 e5             	mov    %rsp,%rbp
  8028f3:	48 83 ec 18          	sub    $0x18,%rsp
  8028f7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8028fb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802902:	eb 6b                	jmp    80296f <fd_alloc+0x80>
  802904:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802907:	48 98                	cltq   
  802909:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80290f:	48 c1 e0 0c          	shl    $0xc,%rax
  802913:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802917:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80291b:	48 c1 e8 15          	shr    $0x15,%rax
  80291f:	48 89 c2             	mov    %rax,%rdx
  802922:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802929:	01 00 00 
  80292c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802930:	83 e0 01             	and    $0x1,%eax
  802933:	48 85 c0             	test   %rax,%rax
  802936:	74 21                	je     802959 <fd_alloc+0x6a>
  802938:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80293c:	48 c1 e8 0c          	shr    $0xc,%rax
  802940:	48 89 c2             	mov    %rax,%rdx
  802943:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80294a:	01 00 00 
  80294d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802951:	83 e0 01             	and    $0x1,%eax
  802954:	48 85 c0             	test   %rax,%rax
  802957:	75 12                	jne    80296b <fd_alloc+0x7c>
  802959:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80295d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802961:	48 89 10             	mov    %rdx,(%rax)
  802964:	b8 00 00 00 00       	mov    $0x0,%eax
  802969:	eb 1a                	jmp    802985 <fd_alloc+0x96>
  80296b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80296f:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802973:	7e 8f                	jle    802904 <fd_alloc+0x15>
  802975:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802979:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802980:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  802985:	c9                   	leaveq 
  802986:	c3                   	retq   

0000000000802987 <fd_lookup>:
  802987:	55                   	push   %rbp
  802988:	48 89 e5             	mov    %rsp,%rbp
  80298b:	48 83 ec 20          	sub    $0x20,%rsp
  80298f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802992:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802996:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80299a:	78 06                	js     8029a2 <fd_lookup+0x1b>
  80299c:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  8029a0:	7e 07                	jle    8029a9 <fd_lookup+0x22>
  8029a2:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8029a7:	eb 6c                	jmp    802a15 <fd_lookup+0x8e>
  8029a9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8029ac:	48 98                	cltq   
  8029ae:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8029b4:	48 c1 e0 0c          	shl    $0xc,%rax
  8029b8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8029bc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8029c0:	48 c1 e8 15          	shr    $0x15,%rax
  8029c4:	48 89 c2             	mov    %rax,%rdx
  8029c7:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8029ce:	01 00 00 
  8029d1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8029d5:	83 e0 01             	and    $0x1,%eax
  8029d8:	48 85 c0             	test   %rax,%rax
  8029db:	74 21                	je     8029fe <fd_lookup+0x77>
  8029dd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8029e1:	48 c1 e8 0c          	shr    $0xc,%rax
  8029e5:	48 89 c2             	mov    %rax,%rdx
  8029e8:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8029ef:	01 00 00 
  8029f2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8029f6:	83 e0 01             	and    $0x1,%eax
  8029f9:	48 85 c0             	test   %rax,%rax
  8029fc:	75 07                	jne    802a05 <fd_lookup+0x7e>
  8029fe:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802a03:	eb 10                	jmp    802a15 <fd_lookup+0x8e>
  802a05:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802a09:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802a0d:	48 89 10             	mov    %rdx,(%rax)
  802a10:	b8 00 00 00 00       	mov    $0x0,%eax
  802a15:	c9                   	leaveq 
  802a16:	c3                   	retq   

0000000000802a17 <fd_close>:
  802a17:	55                   	push   %rbp
  802a18:	48 89 e5             	mov    %rsp,%rbp
  802a1b:	48 83 ec 30          	sub    $0x30,%rsp
  802a1f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802a23:	89 f0                	mov    %esi,%eax
  802a25:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802a28:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a2c:	48 89 c7             	mov    %rax,%rdi
  802a2f:	48 b8 a1 28 80 00 00 	movabs $0x8028a1,%rax
  802a36:	00 00 00 
  802a39:	ff d0                	callq  *%rax
  802a3b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802a3f:	48 89 d6             	mov    %rdx,%rsi
  802a42:	89 c7                	mov    %eax,%edi
  802a44:	48 b8 87 29 80 00 00 	movabs $0x802987,%rax
  802a4b:	00 00 00 
  802a4e:	ff d0                	callq  *%rax
  802a50:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a53:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a57:	78 0a                	js     802a63 <fd_close+0x4c>
  802a59:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a5d:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802a61:	74 12                	je     802a75 <fd_close+0x5e>
  802a63:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802a67:	74 05                	je     802a6e <fd_close+0x57>
  802a69:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a6c:	eb 05                	jmp    802a73 <fd_close+0x5c>
  802a6e:	b8 00 00 00 00       	mov    $0x0,%eax
  802a73:	eb 69                	jmp    802ade <fd_close+0xc7>
  802a75:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a79:	8b 00                	mov    (%rax),%eax
  802a7b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802a7f:	48 89 d6             	mov    %rdx,%rsi
  802a82:	89 c7                	mov    %eax,%edi
  802a84:	48 b8 e0 2a 80 00 00 	movabs $0x802ae0,%rax
  802a8b:	00 00 00 
  802a8e:	ff d0                	callq  *%rax
  802a90:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a93:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a97:	78 2a                	js     802ac3 <fd_close+0xac>
  802a99:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a9d:	48 8b 40 20          	mov    0x20(%rax),%rax
  802aa1:	48 85 c0             	test   %rax,%rax
  802aa4:	74 16                	je     802abc <fd_close+0xa5>
  802aa6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802aaa:	48 8b 40 20          	mov    0x20(%rax),%rax
  802aae:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802ab2:	48 89 d7             	mov    %rdx,%rdi
  802ab5:	ff d0                	callq  *%rax
  802ab7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802aba:	eb 07                	jmp    802ac3 <fd_close+0xac>
  802abc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802ac3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802ac7:	48 89 c6             	mov    %rax,%rsi
  802aca:	bf 00 00 00 00       	mov    $0x0,%edi
  802acf:	48 b8 f3 1b 80 00 00 	movabs $0x801bf3,%rax
  802ad6:	00 00 00 
  802ad9:	ff d0                	callq  *%rax
  802adb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ade:	c9                   	leaveq 
  802adf:	c3                   	retq   

0000000000802ae0 <dev_lookup>:
  802ae0:	55                   	push   %rbp
  802ae1:	48 89 e5             	mov    %rsp,%rbp
  802ae4:	48 83 ec 20          	sub    $0x20,%rsp
  802ae8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802aeb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802aef:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802af6:	eb 41                	jmp    802b39 <dev_lookup+0x59>
  802af8:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802aff:	00 00 00 
  802b02:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802b05:	48 63 d2             	movslq %edx,%rdx
  802b08:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b0c:	8b 00                	mov    (%rax),%eax
  802b0e:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802b11:	75 22                	jne    802b35 <dev_lookup+0x55>
  802b13:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802b1a:	00 00 00 
  802b1d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802b20:	48 63 d2             	movslq %edx,%rdx
  802b23:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802b27:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b2b:	48 89 10             	mov    %rdx,(%rax)
  802b2e:	b8 00 00 00 00       	mov    $0x0,%eax
  802b33:	eb 60                	jmp    802b95 <dev_lookup+0xb5>
  802b35:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802b39:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802b40:	00 00 00 
  802b43:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802b46:	48 63 d2             	movslq %edx,%rdx
  802b49:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b4d:	48 85 c0             	test   %rax,%rax
  802b50:	75 a6                	jne    802af8 <dev_lookup+0x18>
  802b52:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802b59:	00 00 00 
  802b5c:	48 8b 00             	mov    (%rax),%rax
  802b5f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802b65:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802b68:	89 c6                	mov    %eax,%esi
  802b6a:	48 bf 98 52 80 00 00 	movabs $0x805298,%rdi
  802b71:	00 00 00 
  802b74:	b8 00 00 00 00       	mov    $0x0,%eax
  802b79:	48 b9 64 06 80 00 00 	movabs $0x800664,%rcx
  802b80:	00 00 00 
  802b83:	ff d1                	callq  *%rcx
  802b85:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b89:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802b90:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802b95:	c9                   	leaveq 
  802b96:	c3                   	retq   

0000000000802b97 <close>:
  802b97:	55                   	push   %rbp
  802b98:	48 89 e5             	mov    %rsp,%rbp
  802b9b:	48 83 ec 20          	sub    $0x20,%rsp
  802b9f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802ba2:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802ba6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ba9:	48 89 d6             	mov    %rdx,%rsi
  802bac:	89 c7                	mov    %eax,%edi
  802bae:	48 b8 87 29 80 00 00 	movabs $0x802987,%rax
  802bb5:	00 00 00 
  802bb8:	ff d0                	callq  *%rax
  802bba:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802bbd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802bc1:	79 05                	jns    802bc8 <close+0x31>
  802bc3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bc6:	eb 18                	jmp    802be0 <close+0x49>
  802bc8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bcc:	be 01 00 00 00       	mov    $0x1,%esi
  802bd1:	48 89 c7             	mov    %rax,%rdi
  802bd4:	48 b8 17 2a 80 00 00 	movabs $0x802a17,%rax
  802bdb:	00 00 00 
  802bde:	ff d0                	callq  *%rax
  802be0:	c9                   	leaveq 
  802be1:	c3                   	retq   

0000000000802be2 <close_all>:
  802be2:	55                   	push   %rbp
  802be3:	48 89 e5             	mov    %rsp,%rbp
  802be6:	48 83 ec 10          	sub    $0x10,%rsp
  802bea:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802bf1:	eb 15                	jmp    802c08 <close_all+0x26>
  802bf3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bf6:	89 c7                	mov    %eax,%edi
  802bf8:	48 b8 97 2b 80 00 00 	movabs $0x802b97,%rax
  802bff:	00 00 00 
  802c02:	ff d0                	callq  *%rax
  802c04:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802c08:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802c0c:	7e e5                	jle    802bf3 <close_all+0x11>
  802c0e:	c9                   	leaveq 
  802c0f:	c3                   	retq   

0000000000802c10 <dup>:
  802c10:	55                   	push   %rbp
  802c11:	48 89 e5             	mov    %rsp,%rbp
  802c14:	48 83 ec 40          	sub    $0x40,%rsp
  802c18:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802c1b:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802c1e:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802c22:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802c25:	48 89 d6             	mov    %rdx,%rsi
  802c28:	89 c7                	mov    %eax,%edi
  802c2a:	48 b8 87 29 80 00 00 	movabs $0x802987,%rax
  802c31:	00 00 00 
  802c34:	ff d0                	callq  *%rax
  802c36:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c39:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c3d:	79 08                	jns    802c47 <dup+0x37>
  802c3f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c42:	e9 70 01 00 00       	jmpq   802db7 <dup+0x1a7>
  802c47:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802c4a:	89 c7                	mov    %eax,%edi
  802c4c:	48 b8 97 2b 80 00 00 	movabs $0x802b97,%rax
  802c53:	00 00 00 
  802c56:	ff d0                	callq  *%rax
  802c58:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802c5b:	48 98                	cltq   
  802c5d:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802c63:	48 c1 e0 0c          	shl    $0xc,%rax
  802c67:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802c6b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c6f:	48 89 c7             	mov    %rax,%rdi
  802c72:	48 b8 c4 28 80 00 00 	movabs $0x8028c4,%rax
  802c79:	00 00 00 
  802c7c:	ff d0                	callq  *%rax
  802c7e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802c82:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c86:	48 89 c7             	mov    %rax,%rdi
  802c89:	48 b8 c4 28 80 00 00 	movabs $0x8028c4,%rax
  802c90:	00 00 00 
  802c93:	ff d0                	callq  *%rax
  802c95:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802c99:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c9d:	48 c1 e8 15          	shr    $0x15,%rax
  802ca1:	48 89 c2             	mov    %rax,%rdx
  802ca4:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802cab:	01 00 00 
  802cae:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802cb2:	83 e0 01             	and    $0x1,%eax
  802cb5:	48 85 c0             	test   %rax,%rax
  802cb8:	74 73                	je     802d2d <dup+0x11d>
  802cba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802cbe:	48 c1 e8 0c          	shr    $0xc,%rax
  802cc2:	48 89 c2             	mov    %rax,%rdx
  802cc5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802ccc:	01 00 00 
  802ccf:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802cd3:	83 e0 01             	and    $0x1,%eax
  802cd6:	48 85 c0             	test   %rax,%rax
  802cd9:	74 52                	je     802d2d <dup+0x11d>
  802cdb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802cdf:	48 c1 e8 0c          	shr    $0xc,%rax
  802ce3:	48 89 c2             	mov    %rax,%rdx
  802ce6:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802ced:	01 00 00 
  802cf0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802cf4:	25 07 0e 00 00       	and    $0xe07,%eax
  802cf9:	89 c1                	mov    %eax,%ecx
  802cfb:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802cff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d03:	41 89 c8             	mov    %ecx,%r8d
  802d06:	48 89 d1             	mov    %rdx,%rcx
  802d09:	ba 00 00 00 00       	mov    $0x0,%edx
  802d0e:	48 89 c6             	mov    %rax,%rsi
  802d11:	bf 00 00 00 00       	mov    $0x0,%edi
  802d16:	48 b8 98 1b 80 00 00 	movabs $0x801b98,%rax
  802d1d:	00 00 00 
  802d20:	ff d0                	callq  *%rax
  802d22:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d25:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d29:	79 02                	jns    802d2d <dup+0x11d>
  802d2b:	eb 57                	jmp    802d84 <dup+0x174>
  802d2d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802d31:	48 c1 e8 0c          	shr    $0xc,%rax
  802d35:	48 89 c2             	mov    %rax,%rdx
  802d38:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802d3f:	01 00 00 
  802d42:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802d46:	25 07 0e 00 00       	and    $0xe07,%eax
  802d4b:	89 c1                	mov    %eax,%ecx
  802d4d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802d51:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802d55:	41 89 c8             	mov    %ecx,%r8d
  802d58:	48 89 d1             	mov    %rdx,%rcx
  802d5b:	ba 00 00 00 00       	mov    $0x0,%edx
  802d60:	48 89 c6             	mov    %rax,%rsi
  802d63:	bf 00 00 00 00       	mov    $0x0,%edi
  802d68:	48 b8 98 1b 80 00 00 	movabs $0x801b98,%rax
  802d6f:	00 00 00 
  802d72:	ff d0                	callq  *%rax
  802d74:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d77:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d7b:	79 02                	jns    802d7f <dup+0x16f>
  802d7d:	eb 05                	jmp    802d84 <dup+0x174>
  802d7f:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802d82:	eb 33                	jmp    802db7 <dup+0x1a7>
  802d84:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d88:	48 89 c6             	mov    %rax,%rsi
  802d8b:	bf 00 00 00 00       	mov    $0x0,%edi
  802d90:	48 b8 f3 1b 80 00 00 	movabs $0x801bf3,%rax
  802d97:	00 00 00 
  802d9a:	ff d0                	callq  *%rax
  802d9c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802da0:	48 89 c6             	mov    %rax,%rsi
  802da3:	bf 00 00 00 00       	mov    $0x0,%edi
  802da8:	48 b8 f3 1b 80 00 00 	movabs $0x801bf3,%rax
  802daf:	00 00 00 
  802db2:	ff d0                	callq  *%rax
  802db4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802db7:	c9                   	leaveq 
  802db8:	c3                   	retq   

0000000000802db9 <read>:
  802db9:	55                   	push   %rbp
  802dba:	48 89 e5             	mov    %rsp,%rbp
  802dbd:	48 83 ec 40          	sub    $0x40,%rsp
  802dc1:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802dc4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802dc8:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802dcc:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802dd0:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802dd3:	48 89 d6             	mov    %rdx,%rsi
  802dd6:	89 c7                	mov    %eax,%edi
  802dd8:	48 b8 87 29 80 00 00 	movabs $0x802987,%rax
  802ddf:	00 00 00 
  802de2:	ff d0                	callq  *%rax
  802de4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802de7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802deb:	78 24                	js     802e11 <read+0x58>
  802ded:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802df1:	8b 00                	mov    (%rax),%eax
  802df3:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802df7:	48 89 d6             	mov    %rdx,%rsi
  802dfa:	89 c7                	mov    %eax,%edi
  802dfc:	48 b8 e0 2a 80 00 00 	movabs $0x802ae0,%rax
  802e03:	00 00 00 
  802e06:	ff d0                	callq  *%rax
  802e08:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e0b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e0f:	79 05                	jns    802e16 <read+0x5d>
  802e11:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e14:	eb 76                	jmp    802e8c <read+0xd3>
  802e16:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e1a:	8b 40 08             	mov    0x8(%rax),%eax
  802e1d:	83 e0 03             	and    $0x3,%eax
  802e20:	83 f8 01             	cmp    $0x1,%eax
  802e23:	75 3a                	jne    802e5f <read+0xa6>
  802e25:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802e2c:	00 00 00 
  802e2f:	48 8b 00             	mov    (%rax),%rax
  802e32:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802e38:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802e3b:	89 c6                	mov    %eax,%esi
  802e3d:	48 bf b7 52 80 00 00 	movabs $0x8052b7,%rdi
  802e44:	00 00 00 
  802e47:	b8 00 00 00 00       	mov    $0x0,%eax
  802e4c:	48 b9 64 06 80 00 00 	movabs $0x800664,%rcx
  802e53:	00 00 00 
  802e56:	ff d1                	callq  *%rcx
  802e58:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802e5d:	eb 2d                	jmp    802e8c <read+0xd3>
  802e5f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e63:	48 8b 40 10          	mov    0x10(%rax),%rax
  802e67:	48 85 c0             	test   %rax,%rax
  802e6a:	75 07                	jne    802e73 <read+0xba>
  802e6c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802e71:	eb 19                	jmp    802e8c <read+0xd3>
  802e73:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e77:	48 8b 40 10          	mov    0x10(%rax),%rax
  802e7b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802e7f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802e83:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802e87:	48 89 cf             	mov    %rcx,%rdi
  802e8a:	ff d0                	callq  *%rax
  802e8c:	c9                   	leaveq 
  802e8d:	c3                   	retq   

0000000000802e8e <readn>:
  802e8e:	55                   	push   %rbp
  802e8f:	48 89 e5             	mov    %rsp,%rbp
  802e92:	48 83 ec 30          	sub    $0x30,%rsp
  802e96:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802e99:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802e9d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802ea1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802ea8:	eb 49                	jmp    802ef3 <readn+0x65>
  802eaa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ead:	48 98                	cltq   
  802eaf:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802eb3:	48 29 c2             	sub    %rax,%rdx
  802eb6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802eb9:	48 63 c8             	movslq %eax,%rcx
  802ebc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ec0:	48 01 c1             	add    %rax,%rcx
  802ec3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ec6:	48 89 ce             	mov    %rcx,%rsi
  802ec9:	89 c7                	mov    %eax,%edi
  802ecb:	48 b8 b9 2d 80 00 00 	movabs $0x802db9,%rax
  802ed2:	00 00 00 
  802ed5:	ff d0                	callq  *%rax
  802ed7:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802eda:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802ede:	79 05                	jns    802ee5 <readn+0x57>
  802ee0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802ee3:	eb 1c                	jmp    802f01 <readn+0x73>
  802ee5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802ee9:	75 02                	jne    802eed <readn+0x5f>
  802eeb:	eb 11                	jmp    802efe <readn+0x70>
  802eed:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802ef0:	01 45 fc             	add    %eax,-0x4(%rbp)
  802ef3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ef6:	48 98                	cltq   
  802ef8:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802efc:	72 ac                	jb     802eaa <readn+0x1c>
  802efe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f01:	c9                   	leaveq 
  802f02:	c3                   	retq   

0000000000802f03 <write>:
  802f03:	55                   	push   %rbp
  802f04:	48 89 e5             	mov    %rsp,%rbp
  802f07:	48 83 ec 40          	sub    $0x40,%rsp
  802f0b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802f0e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802f12:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802f16:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802f1a:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802f1d:	48 89 d6             	mov    %rdx,%rsi
  802f20:	89 c7                	mov    %eax,%edi
  802f22:	48 b8 87 29 80 00 00 	movabs $0x802987,%rax
  802f29:	00 00 00 
  802f2c:	ff d0                	callq  *%rax
  802f2e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f31:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f35:	78 24                	js     802f5b <write+0x58>
  802f37:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f3b:	8b 00                	mov    (%rax),%eax
  802f3d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802f41:	48 89 d6             	mov    %rdx,%rsi
  802f44:	89 c7                	mov    %eax,%edi
  802f46:	48 b8 e0 2a 80 00 00 	movabs $0x802ae0,%rax
  802f4d:	00 00 00 
  802f50:	ff d0                	callq  *%rax
  802f52:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f55:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f59:	79 05                	jns    802f60 <write+0x5d>
  802f5b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f5e:	eb 75                	jmp    802fd5 <write+0xd2>
  802f60:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f64:	8b 40 08             	mov    0x8(%rax),%eax
  802f67:	83 e0 03             	and    $0x3,%eax
  802f6a:	85 c0                	test   %eax,%eax
  802f6c:	75 3a                	jne    802fa8 <write+0xa5>
  802f6e:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802f75:	00 00 00 
  802f78:	48 8b 00             	mov    (%rax),%rax
  802f7b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802f81:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802f84:	89 c6                	mov    %eax,%esi
  802f86:	48 bf d3 52 80 00 00 	movabs $0x8052d3,%rdi
  802f8d:	00 00 00 
  802f90:	b8 00 00 00 00       	mov    $0x0,%eax
  802f95:	48 b9 64 06 80 00 00 	movabs $0x800664,%rcx
  802f9c:	00 00 00 
  802f9f:	ff d1                	callq  *%rcx
  802fa1:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802fa6:	eb 2d                	jmp    802fd5 <write+0xd2>
  802fa8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fac:	48 8b 40 18          	mov    0x18(%rax),%rax
  802fb0:	48 85 c0             	test   %rax,%rax
  802fb3:	75 07                	jne    802fbc <write+0xb9>
  802fb5:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802fba:	eb 19                	jmp    802fd5 <write+0xd2>
  802fbc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fc0:	48 8b 40 18          	mov    0x18(%rax),%rax
  802fc4:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802fc8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802fcc:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802fd0:	48 89 cf             	mov    %rcx,%rdi
  802fd3:	ff d0                	callq  *%rax
  802fd5:	c9                   	leaveq 
  802fd6:	c3                   	retq   

0000000000802fd7 <seek>:
  802fd7:	55                   	push   %rbp
  802fd8:	48 89 e5             	mov    %rsp,%rbp
  802fdb:	48 83 ec 18          	sub    $0x18,%rsp
  802fdf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802fe2:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802fe5:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802fe9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802fec:	48 89 d6             	mov    %rdx,%rsi
  802fef:	89 c7                	mov    %eax,%edi
  802ff1:	48 b8 87 29 80 00 00 	movabs $0x802987,%rax
  802ff8:	00 00 00 
  802ffb:	ff d0                	callq  *%rax
  802ffd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803000:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803004:	79 05                	jns    80300b <seek+0x34>
  803006:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803009:	eb 0f                	jmp    80301a <seek+0x43>
  80300b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80300f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803012:	89 50 04             	mov    %edx,0x4(%rax)
  803015:	b8 00 00 00 00       	mov    $0x0,%eax
  80301a:	c9                   	leaveq 
  80301b:	c3                   	retq   

000000000080301c <ftruncate>:
  80301c:	55                   	push   %rbp
  80301d:	48 89 e5             	mov    %rsp,%rbp
  803020:	48 83 ec 30          	sub    $0x30,%rsp
  803024:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803027:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80302a:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80302e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803031:	48 89 d6             	mov    %rdx,%rsi
  803034:	89 c7                	mov    %eax,%edi
  803036:	48 b8 87 29 80 00 00 	movabs $0x802987,%rax
  80303d:	00 00 00 
  803040:	ff d0                	callq  *%rax
  803042:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803045:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803049:	78 24                	js     80306f <ftruncate+0x53>
  80304b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80304f:	8b 00                	mov    (%rax),%eax
  803051:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803055:	48 89 d6             	mov    %rdx,%rsi
  803058:	89 c7                	mov    %eax,%edi
  80305a:	48 b8 e0 2a 80 00 00 	movabs $0x802ae0,%rax
  803061:	00 00 00 
  803064:	ff d0                	callq  *%rax
  803066:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803069:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80306d:	79 05                	jns    803074 <ftruncate+0x58>
  80306f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803072:	eb 72                	jmp    8030e6 <ftruncate+0xca>
  803074:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803078:	8b 40 08             	mov    0x8(%rax),%eax
  80307b:	83 e0 03             	and    $0x3,%eax
  80307e:	85 c0                	test   %eax,%eax
  803080:	75 3a                	jne    8030bc <ftruncate+0xa0>
  803082:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803089:	00 00 00 
  80308c:	48 8b 00             	mov    (%rax),%rax
  80308f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803095:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803098:	89 c6                	mov    %eax,%esi
  80309a:	48 bf f0 52 80 00 00 	movabs $0x8052f0,%rdi
  8030a1:	00 00 00 
  8030a4:	b8 00 00 00 00       	mov    $0x0,%eax
  8030a9:	48 b9 64 06 80 00 00 	movabs $0x800664,%rcx
  8030b0:	00 00 00 
  8030b3:	ff d1                	callq  *%rcx
  8030b5:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8030ba:	eb 2a                	jmp    8030e6 <ftruncate+0xca>
  8030bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030c0:	48 8b 40 30          	mov    0x30(%rax),%rax
  8030c4:	48 85 c0             	test   %rax,%rax
  8030c7:	75 07                	jne    8030d0 <ftruncate+0xb4>
  8030c9:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8030ce:	eb 16                	jmp    8030e6 <ftruncate+0xca>
  8030d0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030d4:	48 8b 40 30          	mov    0x30(%rax),%rax
  8030d8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8030dc:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8030df:	89 ce                	mov    %ecx,%esi
  8030e1:	48 89 d7             	mov    %rdx,%rdi
  8030e4:	ff d0                	callq  *%rax
  8030e6:	c9                   	leaveq 
  8030e7:	c3                   	retq   

00000000008030e8 <fstat>:
  8030e8:	55                   	push   %rbp
  8030e9:	48 89 e5             	mov    %rsp,%rbp
  8030ec:	48 83 ec 30          	sub    $0x30,%rsp
  8030f0:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8030f3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8030f7:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8030fb:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8030fe:	48 89 d6             	mov    %rdx,%rsi
  803101:	89 c7                	mov    %eax,%edi
  803103:	48 b8 87 29 80 00 00 	movabs $0x802987,%rax
  80310a:	00 00 00 
  80310d:	ff d0                	callq  *%rax
  80310f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803112:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803116:	78 24                	js     80313c <fstat+0x54>
  803118:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80311c:	8b 00                	mov    (%rax),%eax
  80311e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803122:	48 89 d6             	mov    %rdx,%rsi
  803125:	89 c7                	mov    %eax,%edi
  803127:	48 b8 e0 2a 80 00 00 	movabs $0x802ae0,%rax
  80312e:	00 00 00 
  803131:	ff d0                	callq  *%rax
  803133:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803136:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80313a:	79 05                	jns    803141 <fstat+0x59>
  80313c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80313f:	eb 5e                	jmp    80319f <fstat+0xb7>
  803141:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803145:	48 8b 40 28          	mov    0x28(%rax),%rax
  803149:	48 85 c0             	test   %rax,%rax
  80314c:	75 07                	jne    803155 <fstat+0x6d>
  80314e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803153:	eb 4a                	jmp    80319f <fstat+0xb7>
  803155:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803159:	c6 00 00             	movb   $0x0,(%rax)
  80315c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803160:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  803167:	00 00 00 
  80316a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80316e:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803175:	00 00 00 
  803178:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80317c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803180:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  803187:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80318b:	48 8b 40 28          	mov    0x28(%rax),%rax
  80318f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803193:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  803197:	48 89 ce             	mov    %rcx,%rsi
  80319a:	48 89 d7             	mov    %rdx,%rdi
  80319d:	ff d0                	callq  *%rax
  80319f:	c9                   	leaveq 
  8031a0:	c3                   	retq   

00000000008031a1 <stat>:
  8031a1:	55                   	push   %rbp
  8031a2:	48 89 e5             	mov    %rsp,%rbp
  8031a5:	48 83 ec 20          	sub    $0x20,%rsp
  8031a9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8031ad:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8031b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031b5:	be 00 00 00 00       	mov    $0x0,%esi
  8031ba:	48 89 c7             	mov    %rax,%rdi
  8031bd:	48 b8 8f 32 80 00 00 	movabs $0x80328f,%rax
  8031c4:	00 00 00 
  8031c7:	ff d0                	callq  *%rax
  8031c9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031cc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031d0:	79 05                	jns    8031d7 <stat+0x36>
  8031d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031d5:	eb 2f                	jmp    803206 <stat+0x65>
  8031d7:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8031db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031de:	48 89 d6             	mov    %rdx,%rsi
  8031e1:	89 c7                	mov    %eax,%edi
  8031e3:	48 b8 e8 30 80 00 00 	movabs $0x8030e8,%rax
  8031ea:	00 00 00 
  8031ed:	ff d0                	callq  *%rax
  8031ef:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8031f2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031f5:	89 c7                	mov    %eax,%edi
  8031f7:	48 b8 97 2b 80 00 00 	movabs $0x802b97,%rax
  8031fe:	00 00 00 
  803201:	ff d0                	callq  *%rax
  803203:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803206:	c9                   	leaveq 
  803207:	c3                   	retq   

0000000000803208 <fsipc>:
  803208:	55                   	push   %rbp
  803209:	48 89 e5             	mov    %rsp,%rbp
  80320c:	48 83 ec 10          	sub    $0x10,%rsp
  803210:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803213:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803217:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80321e:	00 00 00 
  803221:	8b 00                	mov    (%rax),%eax
  803223:	85 c0                	test   %eax,%eax
  803225:	75 1d                	jne    803244 <fsipc+0x3c>
  803227:	bf 01 00 00 00       	mov    $0x1,%edi
  80322c:	48 b8 2f 28 80 00 00 	movabs $0x80282f,%rax
  803233:	00 00 00 
  803236:	ff d0                	callq  *%rax
  803238:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  80323f:	00 00 00 
  803242:	89 02                	mov    %eax,(%rdx)
  803244:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80324b:	00 00 00 
  80324e:	8b 00                	mov    (%rax),%eax
  803250:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803253:	b9 07 00 00 00       	mov    $0x7,%ecx
  803258:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  80325f:	00 00 00 
  803262:	89 c7                	mov    %eax,%edi
  803264:	48 b8 fe 25 80 00 00 	movabs $0x8025fe,%rax
  80326b:	00 00 00 
  80326e:	ff d0                	callq  *%rax
  803270:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803274:	ba 00 00 00 00       	mov    $0x0,%edx
  803279:	48 89 c6             	mov    %rax,%rsi
  80327c:	bf 00 00 00 00       	mov    $0x0,%edi
  803281:	48 b8 3d 25 80 00 00 	movabs $0x80253d,%rax
  803288:	00 00 00 
  80328b:	ff d0                	callq  *%rax
  80328d:	c9                   	leaveq 
  80328e:	c3                   	retq   

000000000080328f <open>:
  80328f:	55                   	push   %rbp
  803290:	48 89 e5             	mov    %rsp,%rbp
  803293:	48 83 ec 20          	sub    $0x20,%rsp
  803297:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80329b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80329e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032a2:	48 89 c7             	mov    %rax,%rdi
  8032a5:	48 b8 ad 11 80 00 00 	movabs $0x8011ad,%rax
  8032ac:	00 00 00 
  8032af:	ff d0                	callq  *%rax
  8032b1:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8032b6:	7e 0a                	jle    8032c2 <open+0x33>
  8032b8:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8032bd:	e9 a5 00 00 00       	jmpq   803367 <open+0xd8>
  8032c2:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8032c6:	48 89 c7             	mov    %rax,%rdi
  8032c9:	48 b8 ef 28 80 00 00 	movabs $0x8028ef,%rax
  8032d0:	00 00 00 
  8032d3:	ff d0                	callq  *%rax
  8032d5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032d8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032dc:	79 08                	jns    8032e6 <open+0x57>
  8032de:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032e1:	e9 81 00 00 00       	jmpq   803367 <open+0xd8>
  8032e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032ea:	48 89 c6             	mov    %rax,%rsi
  8032ed:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8032f4:	00 00 00 
  8032f7:	48 b8 19 12 80 00 00 	movabs $0x801219,%rax
  8032fe:	00 00 00 
  803301:	ff d0                	callq  *%rax
  803303:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80330a:	00 00 00 
  80330d:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803310:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  803316:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80331a:	48 89 c6             	mov    %rax,%rsi
  80331d:	bf 01 00 00 00       	mov    $0x1,%edi
  803322:	48 b8 08 32 80 00 00 	movabs $0x803208,%rax
  803329:	00 00 00 
  80332c:	ff d0                	callq  *%rax
  80332e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803331:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803335:	79 1d                	jns    803354 <open+0xc5>
  803337:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80333b:	be 00 00 00 00       	mov    $0x0,%esi
  803340:	48 89 c7             	mov    %rax,%rdi
  803343:	48 b8 17 2a 80 00 00 	movabs $0x802a17,%rax
  80334a:	00 00 00 
  80334d:	ff d0                	callq  *%rax
  80334f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803352:	eb 13                	jmp    803367 <open+0xd8>
  803354:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803358:	48 89 c7             	mov    %rax,%rdi
  80335b:	48 b8 a1 28 80 00 00 	movabs $0x8028a1,%rax
  803362:	00 00 00 
  803365:	ff d0                	callq  *%rax
  803367:	c9                   	leaveq 
  803368:	c3                   	retq   

0000000000803369 <devfile_flush>:
  803369:	55                   	push   %rbp
  80336a:	48 89 e5             	mov    %rsp,%rbp
  80336d:	48 83 ec 10          	sub    $0x10,%rsp
  803371:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803375:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803379:	8b 50 0c             	mov    0xc(%rax),%edx
  80337c:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803383:	00 00 00 
  803386:	89 10                	mov    %edx,(%rax)
  803388:	be 00 00 00 00       	mov    $0x0,%esi
  80338d:	bf 06 00 00 00       	mov    $0x6,%edi
  803392:	48 b8 08 32 80 00 00 	movabs $0x803208,%rax
  803399:	00 00 00 
  80339c:	ff d0                	callq  *%rax
  80339e:	c9                   	leaveq 
  80339f:	c3                   	retq   

00000000008033a0 <devfile_read>:
  8033a0:	55                   	push   %rbp
  8033a1:	48 89 e5             	mov    %rsp,%rbp
  8033a4:	48 83 ec 30          	sub    $0x30,%rsp
  8033a8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8033ac:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8033b0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8033b4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8033b8:	8b 50 0c             	mov    0xc(%rax),%edx
  8033bb:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8033c2:	00 00 00 
  8033c5:	89 10                	mov    %edx,(%rax)
  8033c7:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8033ce:	00 00 00 
  8033d1:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8033d5:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8033d9:	be 00 00 00 00       	mov    $0x0,%esi
  8033de:	bf 03 00 00 00       	mov    $0x3,%edi
  8033e3:	48 b8 08 32 80 00 00 	movabs $0x803208,%rax
  8033ea:	00 00 00 
  8033ed:	ff d0                	callq  *%rax
  8033ef:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033f2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033f6:	79 08                	jns    803400 <devfile_read+0x60>
  8033f8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033fb:	e9 a4 00 00 00       	jmpq   8034a4 <devfile_read+0x104>
  803400:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803403:	48 98                	cltq   
  803405:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803409:	76 35                	jbe    803440 <devfile_read+0xa0>
  80340b:	48 b9 16 53 80 00 00 	movabs $0x805316,%rcx
  803412:	00 00 00 
  803415:	48 ba 1d 53 80 00 00 	movabs $0x80531d,%rdx
  80341c:	00 00 00 
  80341f:	be 89 00 00 00       	mov    $0x89,%esi
  803424:	48 bf 32 53 80 00 00 	movabs $0x805332,%rdi
  80342b:	00 00 00 
  80342e:	b8 00 00 00 00       	mov    $0x0,%eax
  803433:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  80343a:	00 00 00 
  80343d:	41 ff d0             	callq  *%r8
  803440:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  803447:	7e 35                	jle    80347e <devfile_read+0xde>
  803449:	48 b9 40 53 80 00 00 	movabs $0x805340,%rcx
  803450:	00 00 00 
  803453:	48 ba 1d 53 80 00 00 	movabs $0x80531d,%rdx
  80345a:	00 00 00 
  80345d:	be 8a 00 00 00       	mov    $0x8a,%esi
  803462:	48 bf 32 53 80 00 00 	movabs $0x805332,%rdi
  803469:	00 00 00 
  80346c:	b8 00 00 00 00       	mov    $0x0,%eax
  803471:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  803478:	00 00 00 
  80347b:	41 ff d0             	callq  *%r8
  80347e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803481:	48 63 d0             	movslq %eax,%rdx
  803484:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803488:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  80348f:	00 00 00 
  803492:	48 89 c7             	mov    %rax,%rdi
  803495:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  80349c:	00 00 00 
  80349f:	ff d0                	callq  *%rax
  8034a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034a4:	c9                   	leaveq 
  8034a5:	c3                   	retq   

00000000008034a6 <devfile_write>:
  8034a6:	55                   	push   %rbp
  8034a7:	48 89 e5             	mov    %rsp,%rbp
  8034aa:	48 83 ec 40          	sub    $0x40,%rsp
  8034ae:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8034b2:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8034b6:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8034ba:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8034be:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8034c2:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  8034c9:	00 
  8034ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8034ce:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  8034d2:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  8034d7:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  8034db:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8034df:	8b 50 0c             	mov    0xc(%rax),%edx
  8034e2:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8034e9:	00 00 00 
  8034ec:	89 10                	mov    %edx,(%rax)
  8034ee:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8034f5:	00 00 00 
  8034f8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8034fc:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803500:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803504:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803508:	48 89 c6             	mov    %rax,%rsi
  80350b:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  803512:	00 00 00 
  803515:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  80351c:	00 00 00 
  80351f:	ff d0                	callq  *%rax
  803521:	be 00 00 00 00       	mov    $0x0,%esi
  803526:	bf 04 00 00 00       	mov    $0x4,%edi
  80352b:	48 b8 08 32 80 00 00 	movabs $0x803208,%rax
  803532:	00 00 00 
  803535:	ff d0                	callq  *%rax
  803537:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80353a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80353e:	79 05                	jns    803545 <devfile_write+0x9f>
  803540:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803543:	eb 43                	jmp    803588 <devfile_write+0xe2>
  803545:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803548:	48 98                	cltq   
  80354a:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80354e:	76 35                	jbe    803585 <devfile_write+0xdf>
  803550:	48 b9 16 53 80 00 00 	movabs $0x805316,%rcx
  803557:	00 00 00 
  80355a:	48 ba 1d 53 80 00 00 	movabs $0x80531d,%rdx
  803561:	00 00 00 
  803564:	be a8 00 00 00       	mov    $0xa8,%esi
  803569:	48 bf 32 53 80 00 00 	movabs $0x805332,%rdi
  803570:	00 00 00 
  803573:	b8 00 00 00 00       	mov    $0x0,%eax
  803578:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  80357f:	00 00 00 
  803582:	41 ff d0             	callq  *%r8
  803585:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803588:	c9                   	leaveq 
  803589:	c3                   	retq   

000000000080358a <devfile_stat>:
  80358a:	55                   	push   %rbp
  80358b:	48 89 e5             	mov    %rsp,%rbp
  80358e:	48 83 ec 20          	sub    $0x20,%rsp
  803592:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803596:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80359a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80359e:	8b 50 0c             	mov    0xc(%rax),%edx
  8035a1:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8035a8:	00 00 00 
  8035ab:	89 10                	mov    %edx,(%rax)
  8035ad:	be 00 00 00 00       	mov    $0x0,%esi
  8035b2:	bf 05 00 00 00       	mov    $0x5,%edi
  8035b7:	48 b8 08 32 80 00 00 	movabs $0x803208,%rax
  8035be:	00 00 00 
  8035c1:	ff d0                	callq  *%rax
  8035c3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8035c6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8035ca:	79 05                	jns    8035d1 <devfile_stat+0x47>
  8035cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035cf:	eb 56                	jmp    803627 <devfile_stat+0x9d>
  8035d1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8035d5:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8035dc:	00 00 00 
  8035df:	48 89 c7             	mov    %rax,%rdi
  8035e2:	48 b8 19 12 80 00 00 	movabs $0x801219,%rax
  8035e9:	00 00 00 
  8035ec:	ff d0                	callq  *%rax
  8035ee:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8035f5:	00 00 00 
  8035f8:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  8035fe:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803602:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803608:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80360f:	00 00 00 
  803612:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  803618:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80361c:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803622:	b8 00 00 00 00       	mov    $0x0,%eax
  803627:	c9                   	leaveq 
  803628:	c3                   	retq   

0000000000803629 <devfile_trunc>:
  803629:	55                   	push   %rbp
  80362a:	48 89 e5             	mov    %rsp,%rbp
  80362d:	48 83 ec 10          	sub    $0x10,%rsp
  803631:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803635:	89 75 f4             	mov    %esi,-0xc(%rbp)
  803638:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80363c:	8b 50 0c             	mov    0xc(%rax),%edx
  80363f:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803646:	00 00 00 
  803649:	89 10                	mov    %edx,(%rax)
  80364b:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803652:	00 00 00 
  803655:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803658:	89 50 04             	mov    %edx,0x4(%rax)
  80365b:	be 00 00 00 00       	mov    $0x0,%esi
  803660:	bf 02 00 00 00       	mov    $0x2,%edi
  803665:	48 b8 08 32 80 00 00 	movabs $0x803208,%rax
  80366c:	00 00 00 
  80366f:	ff d0                	callq  *%rax
  803671:	c9                   	leaveq 
  803672:	c3                   	retq   

0000000000803673 <remove>:
  803673:	55                   	push   %rbp
  803674:	48 89 e5             	mov    %rsp,%rbp
  803677:	48 83 ec 10          	sub    $0x10,%rsp
  80367b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80367f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803683:	48 89 c7             	mov    %rax,%rdi
  803686:	48 b8 ad 11 80 00 00 	movabs $0x8011ad,%rax
  80368d:	00 00 00 
  803690:	ff d0                	callq  *%rax
  803692:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803697:	7e 07                	jle    8036a0 <remove+0x2d>
  803699:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80369e:	eb 33                	jmp    8036d3 <remove+0x60>
  8036a0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8036a4:	48 89 c6             	mov    %rax,%rsi
  8036a7:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8036ae:	00 00 00 
  8036b1:	48 b8 19 12 80 00 00 	movabs $0x801219,%rax
  8036b8:	00 00 00 
  8036bb:	ff d0                	callq  *%rax
  8036bd:	be 00 00 00 00       	mov    $0x0,%esi
  8036c2:	bf 07 00 00 00       	mov    $0x7,%edi
  8036c7:	48 b8 08 32 80 00 00 	movabs $0x803208,%rax
  8036ce:	00 00 00 
  8036d1:	ff d0                	callq  *%rax
  8036d3:	c9                   	leaveq 
  8036d4:	c3                   	retq   

00000000008036d5 <sync>:
  8036d5:	55                   	push   %rbp
  8036d6:	48 89 e5             	mov    %rsp,%rbp
  8036d9:	be 00 00 00 00       	mov    $0x0,%esi
  8036de:	bf 08 00 00 00       	mov    $0x8,%edi
  8036e3:	48 b8 08 32 80 00 00 	movabs $0x803208,%rax
  8036ea:	00 00 00 
  8036ed:	ff d0                	callq  *%rax
  8036ef:	5d                   	pop    %rbp
  8036f0:	c3                   	retq   

00000000008036f1 <copy>:
  8036f1:	55                   	push   %rbp
  8036f2:	48 89 e5             	mov    %rsp,%rbp
  8036f5:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  8036fc:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  803703:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  80370a:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803711:	be 00 00 00 00       	mov    $0x0,%esi
  803716:	48 89 c7             	mov    %rax,%rdi
  803719:	48 b8 8f 32 80 00 00 	movabs $0x80328f,%rax
  803720:	00 00 00 
  803723:	ff d0                	callq  *%rax
  803725:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803728:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80372c:	79 28                	jns    803756 <copy+0x65>
  80372e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803731:	89 c6                	mov    %eax,%esi
  803733:	48 bf 4c 53 80 00 00 	movabs $0x80534c,%rdi
  80373a:	00 00 00 
  80373d:	b8 00 00 00 00       	mov    $0x0,%eax
  803742:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  803749:	00 00 00 
  80374c:	ff d2                	callq  *%rdx
  80374e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803751:	e9 74 01 00 00       	jmpq   8038ca <copy+0x1d9>
  803756:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  80375d:	be 01 01 00 00       	mov    $0x101,%esi
  803762:	48 89 c7             	mov    %rax,%rdi
  803765:	48 b8 8f 32 80 00 00 	movabs $0x80328f,%rax
  80376c:	00 00 00 
  80376f:	ff d0                	callq  *%rax
  803771:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803774:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803778:	79 39                	jns    8037b3 <copy+0xc2>
  80377a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80377d:	89 c6                	mov    %eax,%esi
  80377f:	48 bf 62 53 80 00 00 	movabs $0x805362,%rdi
  803786:	00 00 00 
  803789:	b8 00 00 00 00       	mov    $0x0,%eax
  80378e:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  803795:	00 00 00 
  803798:	ff d2                	callq  *%rdx
  80379a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80379d:	89 c7                	mov    %eax,%edi
  80379f:	48 b8 97 2b 80 00 00 	movabs $0x802b97,%rax
  8037a6:	00 00 00 
  8037a9:	ff d0                	callq  *%rax
  8037ab:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8037ae:	e9 17 01 00 00       	jmpq   8038ca <copy+0x1d9>
  8037b3:	eb 74                	jmp    803829 <copy+0x138>
  8037b5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8037b8:	48 63 d0             	movslq %eax,%rdx
  8037bb:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8037c2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8037c5:	48 89 ce             	mov    %rcx,%rsi
  8037c8:	89 c7                	mov    %eax,%edi
  8037ca:	48 b8 03 2f 80 00 00 	movabs $0x802f03,%rax
  8037d1:	00 00 00 
  8037d4:	ff d0                	callq  *%rax
  8037d6:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8037d9:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8037dd:	79 4a                	jns    803829 <copy+0x138>
  8037df:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8037e2:	89 c6                	mov    %eax,%esi
  8037e4:	48 bf 7c 53 80 00 00 	movabs $0x80537c,%rdi
  8037eb:	00 00 00 
  8037ee:	b8 00 00 00 00       	mov    $0x0,%eax
  8037f3:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  8037fa:	00 00 00 
  8037fd:	ff d2                	callq  *%rdx
  8037ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803802:	89 c7                	mov    %eax,%edi
  803804:	48 b8 97 2b 80 00 00 	movabs $0x802b97,%rax
  80380b:	00 00 00 
  80380e:	ff d0                	callq  *%rax
  803810:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803813:	89 c7                	mov    %eax,%edi
  803815:	48 b8 97 2b 80 00 00 	movabs $0x802b97,%rax
  80381c:	00 00 00 
  80381f:	ff d0                	callq  *%rax
  803821:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803824:	e9 a1 00 00 00       	jmpq   8038ca <copy+0x1d9>
  803829:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803830:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803833:	ba 00 02 00 00       	mov    $0x200,%edx
  803838:	48 89 ce             	mov    %rcx,%rsi
  80383b:	89 c7                	mov    %eax,%edi
  80383d:	48 b8 b9 2d 80 00 00 	movabs $0x802db9,%rax
  803844:	00 00 00 
  803847:	ff d0                	callq  *%rax
  803849:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80384c:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803850:	0f 8f 5f ff ff ff    	jg     8037b5 <copy+0xc4>
  803856:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80385a:	79 47                	jns    8038a3 <copy+0x1b2>
  80385c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80385f:	89 c6                	mov    %eax,%esi
  803861:	48 bf 8f 53 80 00 00 	movabs $0x80538f,%rdi
  803868:	00 00 00 
  80386b:	b8 00 00 00 00       	mov    $0x0,%eax
  803870:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  803877:	00 00 00 
  80387a:	ff d2                	callq  *%rdx
  80387c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80387f:	89 c7                	mov    %eax,%edi
  803881:	48 b8 97 2b 80 00 00 	movabs $0x802b97,%rax
  803888:	00 00 00 
  80388b:	ff d0                	callq  *%rax
  80388d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803890:	89 c7                	mov    %eax,%edi
  803892:	48 b8 97 2b 80 00 00 	movabs $0x802b97,%rax
  803899:	00 00 00 
  80389c:	ff d0                	callq  *%rax
  80389e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8038a1:	eb 27                	jmp    8038ca <copy+0x1d9>
  8038a3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038a6:	89 c7                	mov    %eax,%edi
  8038a8:	48 b8 97 2b 80 00 00 	movabs $0x802b97,%rax
  8038af:	00 00 00 
  8038b2:	ff d0                	callq  *%rax
  8038b4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8038b7:	89 c7                	mov    %eax,%edi
  8038b9:	48 b8 97 2b 80 00 00 	movabs $0x802b97,%rax
  8038c0:	00 00 00 
  8038c3:	ff d0                	callq  *%rax
  8038c5:	b8 00 00 00 00       	mov    $0x0,%eax
  8038ca:	c9                   	leaveq 
  8038cb:	c3                   	retq   

00000000008038cc <pageref>:
  8038cc:	55                   	push   %rbp
  8038cd:	48 89 e5             	mov    %rsp,%rbp
  8038d0:	48 83 ec 18          	sub    $0x18,%rsp
  8038d4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8038d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038dc:	48 c1 e8 15          	shr    $0x15,%rax
  8038e0:	48 89 c2             	mov    %rax,%rdx
  8038e3:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8038ea:	01 00 00 
  8038ed:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8038f1:	83 e0 01             	and    $0x1,%eax
  8038f4:	48 85 c0             	test   %rax,%rax
  8038f7:	75 07                	jne    803900 <pageref+0x34>
  8038f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8038fe:	eb 53                	jmp    803953 <pageref+0x87>
  803900:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803904:	48 c1 e8 0c          	shr    $0xc,%rax
  803908:	48 89 c2             	mov    %rax,%rdx
  80390b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803912:	01 00 00 
  803915:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803919:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80391d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803921:	83 e0 01             	and    $0x1,%eax
  803924:	48 85 c0             	test   %rax,%rax
  803927:	75 07                	jne    803930 <pageref+0x64>
  803929:	b8 00 00 00 00       	mov    $0x0,%eax
  80392e:	eb 23                	jmp    803953 <pageref+0x87>
  803930:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803934:	48 c1 e8 0c          	shr    $0xc,%rax
  803938:	48 89 c2             	mov    %rax,%rdx
  80393b:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  803942:	00 00 00 
  803945:	48 c1 e2 04          	shl    $0x4,%rdx
  803949:	48 01 d0             	add    %rdx,%rax
  80394c:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  803950:	0f b7 c0             	movzwl %ax,%eax
  803953:	c9                   	leaveq 
  803954:	c3                   	retq   

0000000000803955 <fd2sockid>:
  803955:	55                   	push   %rbp
  803956:	48 89 e5             	mov    %rsp,%rbp
  803959:	48 83 ec 20          	sub    $0x20,%rsp
  80395d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803960:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803964:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803967:	48 89 d6             	mov    %rdx,%rsi
  80396a:	89 c7                	mov    %eax,%edi
  80396c:	48 b8 87 29 80 00 00 	movabs $0x802987,%rax
  803973:	00 00 00 
  803976:	ff d0                	callq  *%rax
  803978:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80397b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80397f:	79 05                	jns    803986 <fd2sockid+0x31>
  803981:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803984:	eb 24                	jmp    8039aa <fd2sockid+0x55>
  803986:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80398a:	8b 10                	mov    (%rax),%edx
  80398c:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  803993:	00 00 00 
  803996:	8b 00                	mov    (%rax),%eax
  803998:	39 c2                	cmp    %eax,%edx
  80399a:	74 07                	je     8039a3 <fd2sockid+0x4e>
  80399c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8039a1:	eb 07                	jmp    8039aa <fd2sockid+0x55>
  8039a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039a7:	8b 40 0c             	mov    0xc(%rax),%eax
  8039aa:	c9                   	leaveq 
  8039ab:	c3                   	retq   

00000000008039ac <alloc_sockfd>:
  8039ac:	55                   	push   %rbp
  8039ad:	48 89 e5             	mov    %rsp,%rbp
  8039b0:	48 83 ec 20          	sub    $0x20,%rsp
  8039b4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8039b7:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8039bb:	48 89 c7             	mov    %rax,%rdi
  8039be:	48 b8 ef 28 80 00 00 	movabs $0x8028ef,%rax
  8039c5:	00 00 00 
  8039c8:	ff d0                	callq  *%rax
  8039ca:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039cd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039d1:	78 26                	js     8039f9 <alloc_sockfd+0x4d>
  8039d3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039d7:	ba 07 04 00 00       	mov    $0x407,%edx
  8039dc:	48 89 c6             	mov    %rax,%rsi
  8039df:	bf 00 00 00 00       	mov    $0x0,%edi
  8039e4:	48 b8 48 1b 80 00 00 	movabs $0x801b48,%rax
  8039eb:	00 00 00 
  8039ee:	ff d0                	callq  *%rax
  8039f0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039f3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039f7:	79 16                	jns    803a0f <alloc_sockfd+0x63>
  8039f9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8039fc:	89 c7                	mov    %eax,%edi
  8039fe:	48 b8 b9 3e 80 00 00 	movabs $0x803eb9,%rax
  803a05:	00 00 00 
  803a08:	ff d0                	callq  *%rax
  803a0a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a0d:	eb 3a                	jmp    803a49 <alloc_sockfd+0x9d>
  803a0f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a13:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  803a1a:	00 00 00 
  803a1d:	8b 12                	mov    (%rdx),%edx
  803a1f:	89 10                	mov    %edx,(%rax)
  803a21:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a25:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803a2c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a30:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803a33:	89 50 0c             	mov    %edx,0xc(%rax)
  803a36:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a3a:	48 89 c7             	mov    %rax,%rdi
  803a3d:	48 b8 a1 28 80 00 00 	movabs $0x8028a1,%rax
  803a44:	00 00 00 
  803a47:	ff d0                	callq  *%rax
  803a49:	c9                   	leaveq 
  803a4a:	c3                   	retq   

0000000000803a4b <accept>:
  803a4b:	55                   	push   %rbp
  803a4c:	48 89 e5             	mov    %rsp,%rbp
  803a4f:	48 83 ec 30          	sub    $0x30,%rsp
  803a53:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a56:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803a5a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803a5e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a61:	89 c7                	mov    %eax,%edi
  803a63:	48 b8 55 39 80 00 00 	movabs $0x803955,%rax
  803a6a:	00 00 00 
  803a6d:	ff d0                	callq  *%rax
  803a6f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a72:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a76:	79 05                	jns    803a7d <accept+0x32>
  803a78:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a7b:	eb 3b                	jmp    803ab8 <accept+0x6d>
  803a7d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803a81:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803a85:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a88:	48 89 ce             	mov    %rcx,%rsi
  803a8b:	89 c7                	mov    %eax,%edi
  803a8d:	48 b8 96 3d 80 00 00 	movabs $0x803d96,%rax
  803a94:	00 00 00 
  803a97:	ff d0                	callq  *%rax
  803a99:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a9c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803aa0:	79 05                	jns    803aa7 <accept+0x5c>
  803aa2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803aa5:	eb 11                	jmp    803ab8 <accept+0x6d>
  803aa7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803aaa:	89 c7                	mov    %eax,%edi
  803aac:	48 b8 ac 39 80 00 00 	movabs $0x8039ac,%rax
  803ab3:	00 00 00 
  803ab6:	ff d0                	callq  *%rax
  803ab8:	c9                   	leaveq 
  803ab9:	c3                   	retq   

0000000000803aba <bind>:
  803aba:	55                   	push   %rbp
  803abb:	48 89 e5             	mov    %rsp,%rbp
  803abe:	48 83 ec 20          	sub    $0x20,%rsp
  803ac2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ac5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803ac9:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803acc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803acf:	89 c7                	mov    %eax,%edi
  803ad1:	48 b8 55 39 80 00 00 	movabs $0x803955,%rax
  803ad8:	00 00 00 
  803adb:	ff d0                	callq  *%rax
  803add:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ae0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ae4:	79 05                	jns    803aeb <bind+0x31>
  803ae6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ae9:	eb 1b                	jmp    803b06 <bind+0x4c>
  803aeb:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803aee:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803af2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803af5:	48 89 ce             	mov    %rcx,%rsi
  803af8:	89 c7                	mov    %eax,%edi
  803afa:	48 b8 15 3e 80 00 00 	movabs $0x803e15,%rax
  803b01:	00 00 00 
  803b04:	ff d0                	callq  *%rax
  803b06:	c9                   	leaveq 
  803b07:	c3                   	retq   

0000000000803b08 <shutdown>:
  803b08:	55                   	push   %rbp
  803b09:	48 89 e5             	mov    %rsp,%rbp
  803b0c:	48 83 ec 20          	sub    $0x20,%rsp
  803b10:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b13:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803b16:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b19:	89 c7                	mov    %eax,%edi
  803b1b:	48 b8 55 39 80 00 00 	movabs $0x803955,%rax
  803b22:	00 00 00 
  803b25:	ff d0                	callq  *%rax
  803b27:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b2a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b2e:	79 05                	jns    803b35 <shutdown+0x2d>
  803b30:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b33:	eb 16                	jmp    803b4b <shutdown+0x43>
  803b35:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803b38:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b3b:	89 d6                	mov    %edx,%esi
  803b3d:	89 c7                	mov    %eax,%edi
  803b3f:	48 b8 79 3e 80 00 00 	movabs $0x803e79,%rax
  803b46:	00 00 00 
  803b49:	ff d0                	callq  *%rax
  803b4b:	c9                   	leaveq 
  803b4c:	c3                   	retq   

0000000000803b4d <devsock_close>:
  803b4d:	55                   	push   %rbp
  803b4e:	48 89 e5             	mov    %rsp,%rbp
  803b51:	48 83 ec 10          	sub    $0x10,%rsp
  803b55:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803b59:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b5d:	48 89 c7             	mov    %rax,%rdi
  803b60:	48 b8 cc 38 80 00 00 	movabs $0x8038cc,%rax
  803b67:	00 00 00 
  803b6a:	ff d0                	callq  *%rax
  803b6c:	83 f8 01             	cmp    $0x1,%eax
  803b6f:	75 17                	jne    803b88 <devsock_close+0x3b>
  803b71:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b75:	8b 40 0c             	mov    0xc(%rax),%eax
  803b78:	89 c7                	mov    %eax,%edi
  803b7a:	48 b8 b9 3e 80 00 00 	movabs $0x803eb9,%rax
  803b81:	00 00 00 
  803b84:	ff d0                	callq  *%rax
  803b86:	eb 05                	jmp    803b8d <devsock_close+0x40>
  803b88:	b8 00 00 00 00       	mov    $0x0,%eax
  803b8d:	c9                   	leaveq 
  803b8e:	c3                   	retq   

0000000000803b8f <connect>:
  803b8f:	55                   	push   %rbp
  803b90:	48 89 e5             	mov    %rsp,%rbp
  803b93:	48 83 ec 20          	sub    $0x20,%rsp
  803b97:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b9a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803b9e:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803ba1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ba4:	89 c7                	mov    %eax,%edi
  803ba6:	48 b8 55 39 80 00 00 	movabs $0x803955,%rax
  803bad:	00 00 00 
  803bb0:	ff d0                	callq  *%rax
  803bb2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bb5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803bb9:	79 05                	jns    803bc0 <connect+0x31>
  803bbb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bbe:	eb 1b                	jmp    803bdb <connect+0x4c>
  803bc0:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803bc3:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803bc7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bca:	48 89 ce             	mov    %rcx,%rsi
  803bcd:	89 c7                	mov    %eax,%edi
  803bcf:	48 b8 e6 3e 80 00 00 	movabs $0x803ee6,%rax
  803bd6:	00 00 00 
  803bd9:	ff d0                	callq  *%rax
  803bdb:	c9                   	leaveq 
  803bdc:	c3                   	retq   

0000000000803bdd <listen>:
  803bdd:	55                   	push   %rbp
  803bde:	48 89 e5             	mov    %rsp,%rbp
  803be1:	48 83 ec 20          	sub    $0x20,%rsp
  803be5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803be8:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803beb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803bee:	89 c7                	mov    %eax,%edi
  803bf0:	48 b8 55 39 80 00 00 	movabs $0x803955,%rax
  803bf7:	00 00 00 
  803bfa:	ff d0                	callq  *%rax
  803bfc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bff:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c03:	79 05                	jns    803c0a <listen+0x2d>
  803c05:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c08:	eb 16                	jmp    803c20 <listen+0x43>
  803c0a:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803c0d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c10:	89 d6                	mov    %edx,%esi
  803c12:	89 c7                	mov    %eax,%edi
  803c14:	48 b8 4a 3f 80 00 00 	movabs $0x803f4a,%rax
  803c1b:	00 00 00 
  803c1e:	ff d0                	callq  *%rax
  803c20:	c9                   	leaveq 
  803c21:	c3                   	retq   

0000000000803c22 <devsock_read>:
  803c22:	55                   	push   %rbp
  803c23:	48 89 e5             	mov    %rsp,%rbp
  803c26:	48 83 ec 20          	sub    $0x20,%rsp
  803c2a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803c2e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803c32:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803c36:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803c3a:	89 c2                	mov    %eax,%edx
  803c3c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c40:	8b 40 0c             	mov    0xc(%rax),%eax
  803c43:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803c47:	b9 00 00 00 00       	mov    $0x0,%ecx
  803c4c:	89 c7                	mov    %eax,%edi
  803c4e:	48 b8 8a 3f 80 00 00 	movabs $0x803f8a,%rax
  803c55:	00 00 00 
  803c58:	ff d0                	callq  *%rax
  803c5a:	c9                   	leaveq 
  803c5b:	c3                   	retq   

0000000000803c5c <devsock_write>:
  803c5c:	55                   	push   %rbp
  803c5d:	48 89 e5             	mov    %rsp,%rbp
  803c60:	48 83 ec 20          	sub    $0x20,%rsp
  803c64:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803c68:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803c6c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803c70:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803c74:	89 c2                	mov    %eax,%edx
  803c76:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c7a:	8b 40 0c             	mov    0xc(%rax),%eax
  803c7d:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803c81:	b9 00 00 00 00       	mov    $0x0,%ecx
  803c86:	89 c7                	mov    %eax,%edi
  803c88:	48 b8 56 40 80 00 00 	movabs $0x804056,%rax
  803c8f:	00 00 00 
  803c92:	ff d0                	callq  *%rax
  803c94:	c9                   	leaveq 
  803c95:	c3                   	retq   

0000000000803c96 <devsock_stat>:
  803c96:	55                   	push   %rbp
  803c97:	48 89 e5             	mov    %rsp,%rbp
  803c9a:	48 83 ec 10          	sub    $0x10,%rsp
  803c9e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803ca2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803ca6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803caa:	48 be aa 53 80 00 00 	movabs $0x8053aa,%rsi
  803cb1:	00 00 00 
  803cb4:	48 89 c7             	mov    %rax,%rdi
  803cb7:	48 b8 19 12 80 00 00 	movabs $0x801219,%rax
  803cbe:	00 00 00 
  803cc1:	ff d0                	callq  *%rax
  803cc3:	b8 00 00 00 00       	mov    $0x0,%eax
  803cc8:	c9                   	leaveq 
  803cc9:	c3                   	retq   

0000000000803cca <socket>:
  803cca:	55                   	push   %rbp
  803ccb:	48 89 e5             	mov    %rsp,%rbp
  803cce:	48 83 ec 20          	sub    $0x20,%rsp
  803cd2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803cd5:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803cd8:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803cdb:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803cde:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803ce1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ce4:	89 ce                	mov    %ecx,%esi
  803ce6:	89 c7                	mov    %eax,%edi
  803ce8:	48 b8 0e 41 80 00 00 	movabs $0x80410e,%rax
  803cef:	00 00 00 
  803cf2:	ff d0                	callq  *%rax
  803cf4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803cf7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803cfb:	79 05                	jns    803d02 <socket+0x38>
  803cfd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d00:	eb 11                	jmp    803d13 <socket+0x49>
  803d02:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d05:	89 c7                	mov    %eax,%edi
  803d07:	48 b8 ac 39 80 00 00 	movabs $0x8039ac,%rax
  803d0e:	00 00 00 
  803d11:	ff d0                	callq  *%rax
  803d13:	c9                   	leaveq 
  803d14:	c3                   	retq   

0000000000803d15 <nsipc>:
  803d15:	55                   	push   %rbp
  803d16:	48 89 e5             	mov    %rsp,%rbp
  803d19:	48 83 ec 10          	sub    $0x10,%rsp
  803d1d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d20:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803d27:	00 00 00 
  803d2a:	8b 00                	mov    (%rax),%eax
  803d2c:	85 c0                	test   %eax,%eax
  803d2e:	75 1d                	jne    803d4d <nsipc+0x38>
  803d30:	bf 02 00 00 00       	mov    $0x2,%edi
  803d35:	48 b8 2f 28 80 00 00 	movabs $0x80282f,%rax
  803d3c:	00 00 00 
  803d3f:	ff d0                	callq  *%rax
  803d41:	48 ba 04 80 80 00 00 	movabs $0x808004,%rdx
  803d48:	00 00 00 
  803d4b:	89 02                	mov    %eax,(%rdx)
  803d4d:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803d54:	00 00 00 
  803d57:	8b 00                	mov    (%rax),%eax
  803d59:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803d5c:	b9 07 00 00 00       	mov    $0x7,%ecx
  803d61:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803d68:	00 00 00 
  803d6b:	89 c7                	mov    %eax,%edi
  803d6d:	48 b8 fe 25 80 00 00 	movabs $0x8025fe,%rax
  803d74:	00 00 00 
  803d77:	ff d0                	callq  *%rax
  803d79:	ba 00 00 00 00       	mov    $0x0,%edx
  803d7e:	be 00 00 00 00       	mov    $0x0,%esi
  803d83:	bf 00 00 00 00       	mov    $0x0,%edi
  803d88:	48 b8 3d 25 80 00 00 	movabs $0x80253d,%rax
  803d8f:	00 00 00 
  803d92:	ff d0                	callq  *%rax
  803d94:	c9                   	leaveq 
  803d95:	c3                   	retq   

0000000000803d96 <nsipc_accept>:
  803d96:	55                   	push   %rbp
  803d97:	48 89 e5             	mov    %rsp,%rbp
  803d9a:	48 83 ec 30          	sub    $0x30,%rsp
  803d9e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803da1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803da5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803da9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803db0:	00 00 00 
  803db3:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803db6:	89 10                	mov    %edx,(%rax)
  803db8:	bf 01 00 00 00       	mov    $0x1,%edi
  803dbd:	48 b8 15 3d 80 00 00 	movabs $0x803d15,%rax
  803dc4:	00 00 00 
  803dc7:	ff d0                	callq  *%rax
  803dc9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803dcc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803dd0:	78 3e                	js     803e10 <nsipc_accept+0x7a>
  803dd2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803dd9:	00 00 00 
  803ddc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803de0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803de4:	8b 40 10             	mov    0x10(%rax),%eax
  803de7:	89 c2                	mov    %eax,%edx
  803de9:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803ded:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803df1:	48 89 ce             	mov    %rcx,%rsi
  803df4:	48 89 c7             	mov    %rax,%rdi
  803df7:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  803dfe:	00 00 00 
  803e01:	ff d0                	callq  *%rax
  803e03:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e07:	8b 50 10             	mov    0x10(%rax),%edx
  803e0a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e0e:	89 10                	mov    %edx,(%rax)
  803e10:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e13:	c9                   	leaveq 
  803e14:	c3                   	retq   

0000000000803e15 <nsipc_bind>:
  803e15:	55                   	push   %rbp
  803e16:	48 89 e5             	mov    %rsp,%rbp
  803e19:	48 83 ec 10          	sub    $0x10,%rsp
  803e1d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e20:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803e24:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803e27:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e2e:	00 00 00 
  803e31:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803e34:	89 10                	mov    %edx,(%rax)
  803e36:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e39:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e3d:	48 89 c6             	mov    %rax,%rsi
  803e40:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803e47:	00 00 00 
  803e4a:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  803e51:	00 00 00 
  803e54:	ff d0                	callq  *%rax
  803e56:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e5d:	00 00 00 
  803e60:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e63:	89 50 14             	mov    %edx,0x14(%rax)
  803e66:	bf 02 00 00 00       	mov    $0x2,%edi
  803e6b:	48 b8 15 3d 80 00 00 	movabs $0x803d15,%rax
  803e72:	00 00 00 
  803e75:	ff d0                	callq  *%rax
  803e77:	c9                   	leaveq 
  803e78:	c3                   	retq   

0000000000803e79 <nsipc_shutdown>:
  803e79:	55                   	push   %rbp
  803e7a:	48 89 e5             	mov    %rsp,%rbp
  803e7d:	48 83 ec 10          	sub    $0x10,%rsp
  803e81:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e84:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803e87:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e8e:	00 00 00 
  803e91:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803e94:	89 10                	mov    %edx,(%rax)
  803e96:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e9d:	00 00 00 
  803ea0:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ea3:	89 50 04             	mov    %edx,0x4(%rax)
  803ea6:	bf 03 00 00 00       	mov    $0x3,%edi
  803eab:	48 b8 15 3d 80 00 00 	movabs $0x803d15,%rax
  803eb2:	00 00 00 
  803eb5:	ff d0                	callq  *%rax
  803eb7:	c9                   	leaveq 
  803eb8:	c3                   	retq   

0000000000803eb9 <nsipc_close>:
  803eb9:	55                   	push   %rbp
  803eba:	48 89 e5             	mov    %rsp,%rbp
  803ebd:	48 83 ec 10          	sub    $0x10,%rsp
  803ec1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ec4:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ecb:	00 00 00 
  803ece:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ed1:	89 10                	mov    %edx,(%rax)
  803ed3:	bf 04 00 00 00       	mov    $0x4,%edi
  803ed8:	48 b8 15 3d 80 00 00 	movabs $0x803d15,%rax
  803edf:	00 00 00 
  803ee2:	ff d0                	callq  *%rax
  803ee4:	c9                   	leaveq 
  803ee5:	c3                   	retq   

0000000000803ee6 <nsipc_connect>:
  803ee6:	55                   	push   %rbp
  803ee7:	48 89 e5             	mov    %rsp,%rbp
  803eea:	48 83 ec 10          	sub    $0x10,%rsp
  803eee:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ef1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803ef5:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803ef8:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803eff:	00 00 00 
  803f02:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803f05:	89 10                	mov    %edx,(%rax)
  803f07:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803f0a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f0e:	48 89 c6             	mov    %rax,%rsi
  803f11:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803f18:	00 00 00 
  803f1b:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  803f22:	00 00 00 
  803f25:	ff d0                	callq  *%rax
  803f27:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f2e:	00 00 00 
  803f31:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803f34:	89 50 14             	mov    %edx,0x14(%rax)
  803f37:	bf 05 00 00 00       	mov    $0x5,%edi
  803f3c:	48 b8 15 3d 80 00 00 	movabs $0x803d15,%rax
  803f43:	00 00 00 
  803f46:	ff d0                	callq  *%rax
  803f48:	c9                   	leaveq 
  803f49:	c3                   	retq   

0000000000803f4a <nsipc_listen>:
  803f4a:	55                   	push   %rbp
  803f4b:	48 89 e5             	mov    %rsp,%rbp
  803f4e:	48 83 ec 10          	sub    $0x10,%rsp
  803f52:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f55:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803f58:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f5f:	00 00 00 
  803f62:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803f65:	89 10                	mov    %edx,(%rax)
  803f67:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f6e:	00 00 00 
  803f71:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803f74:	89 50 04             	mov    %edx,0x4(%rax)
  803f77:	bf 06 00 00 00       	mov    $0x6,%edi
  803f7c:	48 b8 15 3d 80 00 00 	movabs $0x803d15,%rax
  803f83:	00 00 00 
  803f86:	ff d0                	callq  *%rax
  803f88:	c9                   	leaveq 
  803f89:	c3                   	retq   

0000000000803f8a <nsipc_recv>:
  803f8a:	55                   	push   %rbp
  803f8b:	48 89 e5             	mov    %rsp,%rbp
  803f8e:	48 83 ec 30          	sub    $0x30,%rsp
  803f92:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f95:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803f99:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803f9c:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803f9f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fa6:	00 00 00 
  803fa9:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803fac:	89 10                	mov    %edx,(%rax)
  803fae:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fb5:	00 00 00 
  803fb8:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803fbb:	89 50 04             	mov    %edx,0x4(%rax)
  803fbe:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fc5:	00 00 00 
  803fc8:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803fcb:	89 50 08             	mov    %edx,0x8(%rax)
  803fce:	bf 07 00 00 00       	mov    $0x7,%edi
  803fd3:	48 b8 15 3d 80 00 00 	movabs $0x803d15,%rax
  803fda:	00 00 00 
  803fdd:	ff d0                	callq  *%rax
  803fdf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803fe2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803fe6:	78 69                	js     804051 <nsipc_recv+0xc7>
  803fe8:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803fef:	7f 08                	jg     803ff9 <nsipc_recv+0x6f>
  803ff1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ff4:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803ff7:	7e 35                	jle    80402e <nsipc_recv+0xa4>
  803ff9:	48 b9 b1 53 80 00 00 	movabs $0x8053b1,%rcx
  804000:	00 00 00 
  804003:	48 ba c6 53 80 00 00 	movabs $0x8053c6,%rdx
  80400a:	00 00 00 
  80400d:	be 62 00 00 00       	mov    $0x62,%esi
  804012:	48 bf db 53 80 00 00 	movabs $0x8053db,%rdi
  804019:	00 00 00 
  80401c:	b8 00 00 00 00       	mov    $0x0,%eax
  804021:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  804028:	00 00 00 
  80402b:	41 ff d0             	callq  *%r8
  80402e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804031:	48 63 d0             	movslq %eax,%rdx
  804034:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804038:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  80403f:	00 00 00 
  804042:	48 89 c7             	mov    %rax,%rdi
  804045:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  80404c:	00 00 00 
  80404f:	ff d0                	callq  *%rax
  804051:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804054:	c9                   	leaveq 
  804055:	c3                   	retq   

0000000000804056 <nsipc_send>:
  804056:	55                   	push   %rbp
  804057:	48 89 e5             	mov    %rsp,%rbp
  80405a:	48 83 ec 20          	sub    $0x20,%rsp
  80405e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804061:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804065:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804068:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  80406b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804072:	00 00 00 
  804075:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804078:	89 10                	mov    %edx,(%rax)
  80407a:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  804081:	7e 35                	jle    8040b8 <nsipc_send+0x62>
  804083:	48 b9 ea 53 80 00 00 	movabs $0x8053ea,%rcx
  80408a:	00 00 00 
  80408d:	48 ba c6 53 80 00 00 	movabs $0x8053c6,%rdx
  804094:	00 00 00 
  804097:	be 6d 00 00 00       	mov    $0x6d,%esi
  80409c:	48 bf db 53 80 00 00 	movabs $0x8053db,%rdi
  8040a3:	00 00 00 
  8040a6:	b8 00 00 00 00       	mov    $0x0,%eax
  8040ab:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  8040b2:	00 00 00 
  8040b5:	41 ff d0             	callq  *%r8
  8040b8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8040bb:	48 63 d0             	movslq %eax,%rdx
  8040be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040c2:	48 89 c6             	mov    %rax,%rsi
  8040c5:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  8040cc:	00 00 00 
  8040cf:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  8040d6:	00 00 00 
  8040d9:	ff d0                	callq  *%rax
  8040db:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040e2:	00 00 00 
  8040e5:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8040e8:	89 50 04             	mov    %edx,0x4(%rax)
  8040eb:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040f2:	00 00 00 
  8040f5:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8040f8:	89 50 08             	mov    %edx,0x8(%rax)
  8040fb:	bf 08 00 00 00       	mov    $0x8,%edi
  804100:	48 b8 15 3d 80 00 00 	movabs $0x803d15,%rax
  804107:	00 00 00 
  80410a:	ff d0                	callq  *%rax
  80410c:	c9                   	leaveq 
  80410d:	c3                   	retq   

000000000080410e <nsipc_socket>:
  80410e:	55                   	push   %rbp
  80410f:	48 89 e5             	mov    %rsp,%rbp
  804112:	48 83 ec 10          	sub    $0x10,%rsp
  804116:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804119:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80411c:	89 55 f4             	mov    %edx,-0xc(%rbp)
  80411f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804126:	00 00 00 
  804129:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80412c:	89 10                	mov    %edx,(%rax)
  80412e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804135:	00 00 00 
  804138:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80413b:	89 50 04             	mov    %edx,0x4(%rax)
  80413e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804145:	00 00 00 
  804148:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80414b:	89 50 08             	mov    %edx,0x8(%rax)
  80414e:	bf 09 00 00 00       	mov    $0x9,%edi
  804153:	48 b8 15 3d 80 00 00 	movabs $0x803d15,%rax
  80415a:	00 00 00 
  80415d:	ff d0                	callq  *%rax
  80415f:	c9                   	leaveq 
  804160:	c3                   	retq   

0000000000804161 <pipe>:
  804161:	55                   	push   %rbp
  804162:	48 89 e5             	mov    %rsp,%rbp
  804165:	53                   	push   %rbx
  804166:	48 83 ec 38          	sub    $0x38,%rsp
  80416a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  80416e:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  804172:	48 89 c7             	mov    %rax,%rdi
  804175:	48 b8 ef 28 80 00 00 	movabs $0x8028ef,%rax
  80417c:	00 00 00 
  80417f:	ff d0                	callq  *%rax
  804181:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804184:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804188:	0f 88 bf 01 00 00    	js     80434d <pipe+0x1ec>
  80418e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804192:	ba 07 04 00 00       	mov    $0x407,%edx
  804197:	48 89 c6             	mov    %rax,%rsi
  80419a:	bf 00 00 00 00       	mov    $0x0,%edi
  80419f:	48 b8 48 1b 80 00 00 	movabs $0x801b48,%rax
  8041a6:	00 00 00 
  8041a9:	ff d0                	callq  *%rax
  8041ab:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8041ae:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8041b2:	0f 88 95 01 00 00    	js     80434d <pipe+0x1ec>
  8041b8:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8041bc:	48 89 c7             	mov    %rax,%rdi
  8041bf:	48 b8 ef 28 80 00 00 	movabs $0x8028ef,%rax
  8041c6:	00 00 00 
  8041c9:	ff d0                	callq  *%rax
  8041cb:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8041ce:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8041d2:	0f 88 5d 01 00 00    	js     804335 <pipe+0x1d4>
  8041d8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8041dc:	ba 07 04 00 00       	mov    $0x407,%edx
  8041e1:	48 89 c6             	mov    %rax,%rsi
  8041e4:	bf 00 00 00 00       	mov    $0x0,%edi
  8041e9:	48 b8 48 1b 80 00 00 	movabs $0x801b48,%rax
  8041f0:	00 00 00 
  8041f3:	ff d0                	callq  *%rax
  8041f5:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8041f8:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8041fc:	0f 88 33 01 00 00    	js     804335 <pipe+0x1d4>
  804202:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804206:	48 89 c7             	mov    %rax,%rdi
  804209:	48 b8 c4 28 80 00 00 	movabs $0x8028c4,%rax
  804210:	00 00 00 
  804213:	ff d0                	callq  *%rax
  804215:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804219:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80421d:	ba 07 04 00 00       	mov    $0x407,%edx
  804222:	48 89 c6             	mov    %rax,%rsi
  804225:	bf 00 00 00 00       	mov    $0x0,%edi
  80422a:	48 b8 48 1b 80 00 00 	movabs $0x801b48,%rax
  804231:	00 00 00 
  804234:	ff d0                	callq  *%rax
  804236:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804239:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80423d:	79 05                	jns    804244 <pipe+0xe3>
  80423f:	e9 d9 00 00 00       	jmpq   80431d <pipe+0x1bc>
  804244:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804248:	48 89 c7             	mov    %rax,%rdi
  80424b:	48 b8 c4 28 80 00 00 	movabs $0x8028c4,%rax
  804252:	00 00 00 
  804255:	ff d0                	callq  *%rax
  804257:	48 89 c2             	mov    %rax,%rdx
  80425a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80425e:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  804264:	48 89 d1             	mov    %rdx,%rcx
  804267:	ba 00 00 00 00       	mov    $0x0,%edx
  80426c:	48 89 c6             	mov    %rax,%rsi
  80426f:	bf 00 00 00 00       	mov    $0x0,%edi
  804274:	48 b8 98 1b 80 00 00 	movabs $0x801b98,%rax
  80427b:	00 00 00 
  80427e:	ff d0                	callq  *%rax
  804280:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804283:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804287:	79 1b                	jns    8042a4 <pipe+0x143>
  804289:	90                   	nop
  80428a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80428e:	48 89 c6             	mov    %rax,%rsi
  804291:	bf 00 00 00 00       	mov    $0x0,%edi
  804296:	48 b8 f3 1b 80 00 00 	movabs $0x801bf3,%rax
  80429d:	00 00 00 
  8042a0:	ff d0                	callq  *%rax
  8042a2:	eb 79                	jmp    80431d <pipe+0x1bc>
  8042a4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042a8:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  8042af:	00 00 00 
  8042b2:	8b 12                	mov    (%rdx),%edx
  8042b4:	89 10                	mov    %edx,(%rax)
  8042b6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042ba:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  8042c1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8042c5:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  8042cc:	00 00 00 
  8042cf:	8b 12                	mov    (%rdx),%edx
  8042d1:	89 10                	mov    %edx,(%rax)
  8042d3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8042d7:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  8042de:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042e2:	48 89 c7             	mov    %rax,%rdi
  8042e5:	48 b8 a1 28 80 00 00 	movabs $0x8028a1,%rax
  8042ec:	00 00 00 
  8042ef:	ff d0                	callq  *%rax
  8042f1:	89 c2                	mov    %eax,%edx
  8042f3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8042f7:	89 10                	mov    %edx,(%rax)
  8042f9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8042fd:	48 8d 58 04          	lea    0x4(%rax),%rbx
  804301:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804305:	48 89 c7             	mov    %rax,%rdi
  804308:	48 b8 a1 28 80 00 00 	movabs $0x8028a1,%rax
  80430f:	00 00 00 
  804312:	ff d0                	callq  *%rax
  804314:	89 03                	mov    %eax,(%rbx)
  804316:	b8 00 00 00 00       	mov    $0x0,%eax
  80431b:	eb 33                	jmp    804350 <pipe+0x1ef>
  80431d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804321:	48 89 c6             	mov    %rax,%rsi
  804324:	bf 00 00 00 00       	mov    $0x0,%edi
  804329:	48 b8 f3 1b 80 00 00 	movabs $0x801bf3,%rax
  804330:	00 00 00 
  804333:	ff d0                	callq  *%rax
  804335:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804339:	48 89 c6             	mov    %rax,%rsi
  80433c:	bf 00 00 00 00       	mov    $0x0,%edi
  804341:	48 b8 f3 1b 80 00 00 	movabs $0x801bf3,%rax
  804348:	00 00 00 
  80434b:	ff d0                	callq  *%rax
  80434d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804350:	48 83 c4 38          	add    $0x38,%rsp
  804354:	5b                   	pop    %rbx
  804355:	5d                   	pop    %rbp
  804356:	c3                   	retq   

0000000000804357 <_pipeisclosed>:
  804357:	55                   	push   %rbp
  804358:	48 89 e5             	mov    %rsp,%rbp
  80435b:	53                   	push   %rbx
  80435c:	48 83 ec 28          	sub    $0x28,%rsp
  804360:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804364:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804368:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80436f:	00 00 00 
  804372:	48 8b 00             	mov    (%rax),%rax
  804375:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80437b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80437e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804382:	48 89 c7             	mov    %rax,%rdi
  804385:	48 b8 cc 38 80 00 00 	movabs $0x8038cc,%rax
  80438c:	00 00 00 
  80438f:	ff d0                	callq  *%rax
  804391:	89 c3                	mov    %eax,%ebx
  804393:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804397:	48 89 c7             	mov    %rax,%rdi
  80439a:	48 b8 cc 38 80 00 00 	movabs $0x8038cc,%rax
  8043a1:	00 00 00 
  8043a4:	ff d0                	callq  *%rax
  8043a6:	39 c3                	cmp    %eax,%ebx
  8043a8:	0f 94 c0             	sete   %al
  8043ab:	0f b6 c0             	movzbl %al,%eax
  8043ae:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8043b1:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8043b8:	00 00 00 
  8043bb:	48 8b 00             	mov    (%rax),%rax
  8043be:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8043c4:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8043c7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8043ca:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8043cd:	75 05                	jne    8043d4 <_pipeisclosed+0x7d>
  8043cf:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8043d2:	eb 4f                	jmp    804423 <_pipeisclosed+0xcc>
  8043d4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8043d7:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8043da:	74 42                	je     80441e <_pipeisclosed+0xc7>
  8043dc:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  8043e0:	75 3c                	jne    80441e <_pipeisclosed+0xc7>
  8043e2:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8043e9:	00 00 00 
  8043ec:	48 8b 00             	mov    (%rax),%rax
  8043ef:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  8043f5:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8043f8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8043fb:	89 c6                	mov    %eax,%esi
  8043fd:	48 bf fb 53 80 00 00 	movabs $0x8053fb,%rdi
  804404:	00 00 00 
  804407:	b8 00 00 00 00       	mov    $0x0,%eax
  80440c:	49 b8 64 06 80 00 00 	movabs $0x800664,%r8
  804413:	00 00 00 
  804416:	41 ff d0             	callq  *%r8
  804419:	e9 4a ff ff ff       	jmpq   804368 <_pipeisclosed+0x11>
  80441e:	e9 45 ff ff ff       	jmpq   804368 <_pipeisclosed+0x11>
  804423:	48 83 c4 28          	add    $0x28,%rsp
  804427:	5b                   	pop    %rbx
  804428:	5d                   	pop    %rbp
  804429:	c3                   	retq   

000000000080442a <pipeisclosed>:
  80442a:	55                   	push   %rbp
  80442b:	48 89 e5             	mov    %rsp,%rbp
  80442e:	48 83 ec 30          	sub    $0x30,%rsp
  804432:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804435:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  804439:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80443c:	48 89 d6             	mov    %rdx,%rsi
  80443f:	89 c7                	mov    %eax,%edi
  804441:	48 b8 87 29 80 00 00 	movabs $0x802987,%rax
  804448:	00 00 00 
  80444b:	ff d0                	callq  *%rax
  80444d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804450:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804454:	79 05                	jns    80445b <pipeisclosed+0x31>
  804456:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804459:	eb 31                	jmp    80448c <pipeisclosed+0x62>
  80445b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80445f:	48 89 c7             	mov    %rax,%rdi
  804462:	48 b8 c4 28 80 00 00 	movabs $0x8028c4,%rax
  804469:	00 00 00 
  80446c:	ff d0                	callq  *%rax
  80446e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804472:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804476:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80447a:	48 89 d6             	mov    %rdx,%rsi
  80447d:	48 89 c7             	mov    %rax,%rdi
  804480:	48 b8 57 43 80 00 00 	movabs $0x804357,%rax
  804487:	00 00 00 
  80448a:	ff d0                	callq  *%rax
  80448c:	c9                   	leaveq 
  80448d:	c3                   	retq   

000000000080448e <devpipe_read>:
  80448e:	55                   	push   %rbp
  80448f:	48 89 e5             	mov    %rsp,%rbp
  804492:	48 83 ec 40          	sub    $0x40,%rsp
  804496:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80449a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80449e:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8044a2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8044a6:	48 89 c7             	mov    %rax,%rdi
  8044a9:	48 b8 c4 28 80 00 00 	movabs $0x8028c4,%rax
  8044b0:	00 00 00 
  8044b3:	ff d0                	callq  *%rax
  8044b5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8044b9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8044bd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8044c1:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8044c8:	00 
  8044c9:	e9 92 00 00 00       	jmpq   804560 <devpipe_read+0xd2>
  8044ce:	eb 41                	jmp    804511 <devpipe_read+0x83>
  8044d0:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  8044d5:	74 09                	je     8044e0 <devpipe_read+0x52>
  8044d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044db:	e9 92 00 00 00       	jmpq   804572 <devpipe_read+0xe4>
  8044e0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8044e4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8044e8:	48 89 d6             	mov    %rdx,%rsi
  8044eb:	48 89 c7             	mov    %rax,%rdi
  8044ee:	48 b8 57 43 80 00 00 	movabs $0x804357,%rax
  8044f5:	00 00 00 
  8044f8:	ff d0                	callq  *%rax
  8044fa:	85 c0                	test   %eax,%eax
  8044fc:	74 07                	je     804505 <devpipe_read+0x77>
  8044fe:	b8 00 00 00 00       	mov    $0x0,%eax
  804503:	eb 6d                	jmp    804572 <devpipe_read+0xe4>
  804505:	48 b8 0a 1b 80 00 00 	movabs $0x801b0a,%rax
  80450c:	00 00 00 
  80450f:	ff d0                	callq  *%rax
  804511:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804515:	8b 10                	mov    (%rax),%edx
  804517:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80451b:	8b 40 04             	mov    0x4(%rax),%eax
  80451e:	39 c2                	cmp    %eax,%edx
  804520:	74 ae                	je     8044d0 <devpipe_read+0x42>
  804522:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804526:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80452a:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  80452e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804532:	8b 00                	mov    (%rax),%eax
  804534:	99                   	cltd   
  804535:	c1 ea 1b             	shr    $0x1b,%edx
  804538:	01 d0                	add    %edx,%eax
  80453a:	83 e0 1f             	and    $0x1f,%eax
  80453d:	29 d0                	sub    %edx,%eax
  80453f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804543:	48 98                	cltq   
  804545:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  80454a:	88 01                	mov    %al,(%rcx)
  80454c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804550:	8b 00                	mov    (%rax),%eax
  804552:	8d 50 01             	lea    0x1(%rax),%edx
  804555:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804559:	89 10                	mov    %edx,(%rax)
  80455b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804560:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804564:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804568:	0f 82 60 ff ff ff    	jb     8044ce <devpipe_read+0x40>
  80456e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804572:	c9                   	leaveq 
  804573:	c3                   	retq   

0000000000804574 <devpipe_write>:
  804574:	55                   	push   %rbp
  804575:	48 89 e5             	mov    %rsp,%rbp
  804578:	48 83 ec 40          	sub    $0x40,%rsp
  80457c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804580:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804584:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804588:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80458c:	48 89 c7             	mov    %rax,%rdi
  80458f:	48 b8 c4 28 80 00 00 	movabs $0x8028c4,%rax
  804596:	00 00 00 
  804599:	ff d0                	callq  *%rax
  80459b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80459f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8045a3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8045a7:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8045ae:	00 
  8045af:	e9 8e 00 00 00       	jmpq   804642 <devpipe_write+0xce>
  8045b4:	eb 31                	jmp    8045e7 <devpipe_write+0x73>
  8045b6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8045ba:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8045be:	48 89 d6             	mov    %rdx,%rsi
  8045c1:	48 89 c7             	mov    %rax,%rdi
  8045c4:	48 b8 57 43 80 00 00 	movabs $0x804357,%rax
  8045cb:	00 00 00 
  8045ce:	ff d0                	callq  *%rax
  8045d0:	85 c0                	test   %eax,%eax
  8045d2:	74 07                	je     8045db <devpipe_write+0x67>
  8045d4:	b8 00 00 00 00       	mov    $0x0,%eax
  8045d9:	eb 79                	jmp    804654 <devpipe_write+0xe0>
  8045db:	48 b8 0a 1b 80 00 00 	movabs $0x801b0a,%rax
  8045e2:	00 00 00 
  8045e5:	ff d0                	callq  *%rax
  8045e7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045eb:	8b 40 04             	mov    0x4(%rax),%eax
  8045ee:	48 63 d0             	movslq %eax,%rdx
  8045f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045f5:	8b 00                	mov    (%rax),%eax
  8045f7:	48 98                	cltq   
  8045f9:	48 83 c0 20          	add    $0x20,%rax
  8045fd:	48 39 c2             	cmp    %rax,%rdx
  804600:	73 b4                	jae    8045b6 <devpipe_write+0x42>
  804602:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804606:	8b 40 04             	mov    0x4(%rax),%eax
  804609:	99                   	cltd   
  80460a:	c1 ea 1b             	shr    $0x1b,%edx
  80460d:	01 d0                	add    %edx,%eax
  80460f:	83 e0 1f             	and    $0x1f,%eax
  804612:	29 d0                	sub    %edx,%eax
  804614:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804618:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80461c:	48 01 ca             	add    %rcx,%rdx
  80461f:	0f b6 0a             	movzbl (%rdx),%ecx
  804622:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804626:	48 98                	cltq   
  804628:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80462c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804630:	8b 40 04             	mov    0x4(%rax),%eax
  804633:	8d 50 01             	lea    0x1(%rax),%edx
  804636:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80463a:	89 50 04             	mov    %edx,0x4(%rax)
  80463d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804642:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804646:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80464a:	0f 82 64 ff ff ff    	jb     8045b4 <devpipe_write+0x40>
  804650:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804654:	c9                   	leaveq 
  804655:	c3                   	retq   

0000000000804656 <devpipe_stat>:
  804656:	55                   	push   %rbp
  804657:	48 89 e5             	mov    %rsp,%rbp
  80465a:	48 83 ec 20          	sub    $0x20,%rsp
  80465e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804662:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804666:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80466a:	48 89 c7             	mov    %rax,%rdi
  80466d:	48 b8 c4 28 80 00 00 	movabs $0x8028c4,%rax
  804674:	00 00 00 
  804677:	ff d0                	callq  *%rax
  804679:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80467d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804681:	48 be 0e 54 80 00 00 	movabs $0x80540e,%rsi
  804688:	00 00 00 
  80468b:	48 89 c7             	mov    %rax,%rdi
  80468e:	48 b8 19 12 80 00 00 	movabs $0x801219,%rax
  804695:	00 00 00 
  804698:	ff d0                	callq  *%rax
  80469a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80469e:	8b 50 04             	mov    0x4(%rax),%edx
  8046a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8046a5:	8b 00                	mov    (%rax),%eax
  8046a7:	29 c2                	sub    %eax,%edx
  8046a9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8046ad:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8046b3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8046b7:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8046be:	00 00 00 
  8046c1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8046c5:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  8046cc:	00 00 00 
  8046cf:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  8046d6:	b8 00 00 00 00       	mov    $0x0,%eax
  8046db:	c9                   	leaveq 
  8046dc:	c3                   	retq   

00000000008046dd <devpipe_close>:
  8046dd:	55                   	push   %rbp
  8046de:	48 89 e5             	mov    %rsp,%rbp
  8046e1:	48 83 ec 10          	sub    $0x10,%rsp
  8046e5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8046e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8046ed:	48 89 c6             	mov    %rax,%rsi
  8046f0:	bf 00 00 00 00       	mov    $0x0,%edi
  8046f5:	48 b8 f3 1b 80 00 00 	movabs $0x801bf3,%rax
  8046fc:	00 00 00 
  8046ff:	ff d0                	callq  *%rax
  804701:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804705:	48 89 c7             	mov    %rax,%rdi
  804708:	48 b8 c4 28 80 00 00 	movabs $0x8028c4,%rax
  80470f:	00 00 00 
  804712:	ff d0                	callq  *%rax
  804714:	48 89 c6             	mov    %rax,%rsi
  804717:	bf 00 00 00 00       	mov    $0x0,%edi
  80471c:	48 b8 f3 1b 80 00 00 	movabs $0x801bf3,%rax
  804723:	00 00 00 
  804726:	ff d0                	callq  *%rax
  804728:	c9                   	leaveq 
  804729:	c3                   	retq   

000000000080472a <cputchar>:
  80472a:	55                   	push   %rbp
  80472b:	48 89 e5             	mov    %rsp,%rbp
  80472e:	48 83 ec 20          	sub    $0x20,%rsp
  804732:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804735:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804738:	88 45 ff             	mov    %al,-0x1(%rbp)
  80473b:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  80473f:	be 01 00 00 00       	mov    $0x1,%esi
  804744:	48 89 c7             	mov    %rax,%rdi
  804747:	48 b8 00 1a 80 00 00 	movabs $0x801a00,%rax
  80474e:	00 00 00 
  804751:	ff d0                	callq  *%rax
  804753:	c9                   	leaveq 
  804754:	c3                   	retq   

0000000000804755 <getchar>:
  804755:	55                   	push   %rbp
  804756:	48 89 e5             	mov    %rsp,%rbp
  804759:	48 83 ec 10          	sub    $0x10,%rsp
  80475d:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804761:	ba 01 00 00 00       	mov    $0x1,%edx
  804766:	48 89 c6             	mov    %rax,%rsi
  804769:	bf 00 00 00 00       	mov    $0x0,%edi
  80476e:	48 b8 b9 2d 80 00 00 	movabs $0x802db9,%rax
  804775:	00 00 00 
  804778:	ff d0                	callq  *%rax
  80477a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80477d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804781:	79 05                	jns    804788 <getchar+0x33>
  804783:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804786:	eb 14                	jmp    80479c <getchar+0x47>
  804788:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80478c:	7f 07                	jg     804795 <getchar+0x40>
  80478e:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804793:	eb 07                	jmp    80479c <getchar+0x47>
  804795:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  804799:	0f b6 c0             	movzbl %al,%eax
  80479c:	c9                   	leaveq 
  80479d:	c3                   	retq   

000000000080479e <iscons>:
  80479e:	55                   	push   %rbp
  80479f:	48 89 e5             	mov    %rsp,%rbp
  8047a2:	48 83 ec 20          	sub    $0x20,%rsp
  8047a6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8047a9:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8047ad:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8047b0:	48 89 d6             	mov    %rdx,%rsi
  8047b3:	89 c7                	mov    %eax,%edi
  8047b5:	48 b8 87 29 80 00 00 	movabs $0x802987,%rax
  8047bc:	00 00 00 
  8047bf:	ff d0                	callq  *%rax
  8047c1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8047c4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8047c8:	79 05                	jns    8047cf <iscons+0x31>
  8047ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047cd:	eb 1a                	jmp    8047e9 <iscons+0x4b>
  8047cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8047d3:	8b 10                	mov    (%rax),%edx
  8047d5:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  8047dc:	00 00 00 
  8047df:	8b 00                	mov    (%rax),%eax
  8047e1:	39 c2                	cmp    %eax,%edx
  8047e3:	0f 94 c0             	sete   %al
  8047e6:	0f b6 c0             	movzbl %al,%eax
  8047e9:	c9                   	leaveq 
  8047ea:	c3                   	retq   

00000000008047eb <opencons>:
  8047eb:	55                   	push   %rbp
  8047ec:	48 89 e5             	mov    %rsp,%rbp
  8047ef:	48 83 ec 10          	sub    $0x10,%rsp
  8047f3:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8047f7:	48 89 c7             	mov    %rax,%rdi
  8047fa:	48 b8 ef 28 80 00 00 	movabs $0x8028ef,%rax
  804801:	00 00 00 
  804804:	ff d0                	callq  *%rax
  804806:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804809:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80480d:	79 05                	jns    804814 <opencons+0x29>
  80480f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804812:	eb 5b                	jmp    80486f <opencons+0x84>
  804814:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804818:	ba 07 04 00 00       	mov    $0x407,%edx
  80481d:	48 89 c6             	mov    %rax,%rsi
  804820:	bf 00 00 00 00       	mov    $0x0,%edi
  804825:	48 b8 48 1b 80 00 00 	movabs $0x801b48,%rax
  80482c:	00 00 00 
  80482f:	ff d0                	callq  *%rax
  804831:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804834:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804838:	79 05                	jns    80483f <opencons+0x54>
  80483a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80483d:	eb 30                	jmp    80486f <opencons+0x84>
  80483f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804843:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  80484a:	00 00 00 
  80484d:	8b 12                	mov    (%rdx),%edx
  80484f:	89 10                	mov    %edx,(%rax)
  804851:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804855:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80485c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804860:	48 89 c7             	mov    %rax,%rdi
  804863:	48 b8 a1 28 80 00 00 	movabs $0x8028a1,%rax
  80486a:	00 00 00 
  80486d:	ff d0                	callq  *%rax
  80486f:	c9                   	leaveq 
  804870:	c3                   	retq   

0000000000804871 <devcons_read>:
  804871:	55                   	push   %rbp
  804872:	48 89 e5             	mov    %rsp,%rbp
  804875:	48 83 ec 30          	sub    $0x30,%rsp
  804879:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80487d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804881:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804885:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80488a:	75 07                	jne    804893 <devcons_read+0x22>
  80488c:	b8 00 00 00 00       	mov    $0x0,%eax
  804891:	eb 4b                	jmp    8048de <devcons_read+0x6d>
  804893:	eb 0c                	jmp    8048a1 <devcons_read+0x30>
  804895:	48 b8 0a 1b 80 00 00 	movabs $0x801b0a,%rax
  80489c:	00 00 00 
  80489f:	ff d0                	callq  *%rax
  8048a1:	48 b8 4a 1a 80 00 00 	movabs $0x801a4a,%rax
  8048a8:	00 00 00 
  8048ab:	ff d0                	callq  *%rax
  8048ad:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8048b0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8048b4:	74 df                	je     804895 <devcons_read+0x24>
  8048b6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8048ba:	79 05                	jns    8048c1 <devcons_read+0x50>
  8048bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048bf:	eb 1d                	jmp    8048de <devcons_read+0x6d>
  8048c1:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  8048c5:	75 07                	jne    8048ce <devcons_read+0x5d>
  8048c7:	b8 00 00 00 00       	mov    $0x0,%eax
  8048cc:	eb 10                	jmp    8048de <devcons_read+0x6d>
  8048ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048d1:	89 c2                	mov    %eax,%edx
  8048d3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8048d7:	88 10                	mov    %dl,(%rax)
  8048d9:	b8 01 00 00 00       	mov    $0x1,%eax
  8048de:	c9                   	leaveq 
  8048df:	c3                   	retq   

00000000008048e0 <devcons_write>:
  8048e0:	55                   	push   %rbp
  8048e1:	48 89 e5             	mov    %rsp,%rbp
  8048e4:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8048eb:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  8048f2:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  8048f9:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804900:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804907:	eb 76                	jmp    80497f <devcons_write+0x9f>
  804909:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804910:	89 c2                	mov    %eax,%edx
  804912:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804915:	29 c2                	sub    %eax,%edx
  804917:	89 d0                	mov    %edx,%eax
  804919:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80491c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80491f:	83 f8 7f             	cmp    $0x7f,%eax
  804922:	76 07                	jbe    80492b <devcons_write+0x4b>
  804924:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  80492b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80492e:	48 63 d0             	movslq %eax,%rdx
  804931:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804934:	48 63 c8             	movslq %eax,%rcx
  804937:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  80493e:	48 01 c1             	add    %rax,%rcx
  804941:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804948:	48 89 ce             	mov    %rcx,%rsi
  80494b:	48 89 c7             	mov    %rax,%rdi
  80494e:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  804955:	00 00 00 
  804958:	ff d0                	callq  *%rax
  80495a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80495d:	48 63 d0             	movslq %eax,%rdx
  804960:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804967:	48 89 d6             	mov    %rdx,%rsi
  80496a:	48 89 c7             	mov    %rax,%rdi
  80496d:	48 b8 00 1a 80 00 00 	movabs $0x801a00,%rax
  804974:	00 00 00 
  804977:	ff d0                	callq  *%rax
  804979:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80497c:	01 45 fc             	add    %eax,-0x4(%rbp)
  80497f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804982:	48 98                	cltq   
  804984:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  80498b:	0f 82 78 ff ff ff    	jb     804909 <devcons_write+0x29>
  804991:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804994:	c9                   	leaveq 
  804995:	c3                   	retq   

0000000000804996 <devcons_close>:
  804996:	55                   	push   %rbp
  804997:	48 89 e5             	mov    %rsp,%rbp
  80499a:	48 83 ec 08          	sub    $0x8,%rsp
  80499e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8049a2:	b8 00 00 00 00       	mov    $0x0,%eax
  8049a7:	c9                   	leaveq 
  8049a8:	c3                   	retq   

00000000008049a9 <devcons_stat>:
  8049a9:	55                   	push   %rbp
  8049aa:	48 89 e5             	mov    %rsp,%rbp
  8049ad:	48 83 ec 10          	sub    $0x10,%rsp
  8049b1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8049b5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8049b9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8049bd:	48 be 1a 54 80 00 00 	movabs $0x80541a,%rsi
  8049c4:	00 00 00 
  8049c7:	48 89 c7             	mov    %rax,%rdi
  8049ca:	48 b8 19 12 80 00 00 	movabs $0x801219,%rax
  8049d1:	00 00 00 
  8049d4:	ff d0                	callq  *%rax
  8049d6:	b8 00 00 00 00       	mov    $0x0,%eax
  8049db:	c9                   	leaveq 
  8049dc:	c3                   	retq   

00000000008049dd <set_pgfault_handler>:
  8049dd:	55                   	push   %rbp
  8049de:	48 89 e5             	mov    %rsp,%rbp
  8049e1:	48 83 ec 20          	sub    $0x20,%rsp
  8049e5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8049e9:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8049f0:	00 00 00 
  8049f3:	48 8b 00             	mov    (%rax),%rax
  8049f6:	48 85 c0             	test   %rax,%rax
  8049f9:	75 6f                	jne    804a6a <set_pgfault_handler+0x8d>
  8049fb:	ba 07 00 00 00       	mov    $0x7,%edx
  804a00:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  804a05:	bf 00 00 00 00       	mov    $0x0,%edi
  804a0a:	48 b8 48 1b 80 00 00 	movabs $0x801b48,%rax
  804a11:	00 00 00 
  804a14:	ff d0                	callq  *%rax
  804a16:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804a19:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804a1d:	79 30                	jns    804a4f <set_pgfault_handler+0x72>
  804a1f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a22:	89 c1                	mov    %eax,%ecx
  804a24:	48 ba 28 54 80 00 00 	movabs $0x805428,%rdx
  804a2b:	00 00 00 
  804a2e:	be 22 00 00 00       	mov    $0x22,%esi
  804a33:	48 bf 47 54 80 00 00 	movabs $0x805447,%rdi
  804a3a:	00 00 00 
  804a3d:	b8 00 00 00 00       	mov    $0x0,%eax
  804a42:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  804a49:	00 00 00 
  804a4c:	41 ff d0             	callq  *%r8
  804a4f:	48 be 7d 4a 80 00 00 	movabs $0x804a7d,%rsi
  804a56:	00 00 00 
  804a59:	bf 00 00 00 00       	mov    $0x0,%edi
  804a5e:	48 b8 d2 1c 80 00 00 	movabs $0x801cd2,%rax
  804a65:	00 00 00 
  804a68:	ff d0                	callq  *%rax
  804a6a:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804a71:	00 00 00 
  804a74:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804a78:	48 89 10             	mov    %rdx,(%rax)
  804a7b:	c9                   	leaveq 
  804a7c:	c3                   	retq   

0000000000804a7d <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  804a7d:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  804a80:	48 a1 00 c0 80 00 00 	movabs 0x80c000,%rax
  804a87:	00 00 00 
call *%rax
  804a8a:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  804a8c:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  804a93:	00 08 
    movq 152(%rsp), %rax
  804a95:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  804a9c:	00 
    movq 136(%rsp), %rbx
  804a9d:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  804aa4:	00 
movq %rbx, (%rax)
  804aa5:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  804aa8:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  804aac:	4c 8b 3c 24          	mov    (%rsp),%r15
  804ab0:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  804ab5:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  804aba:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  804abf:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  804ac4:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  804ac9:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  804ace:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  804ad3:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  804ad8:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  804add:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  804ae2:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  804ae7:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  804aec:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  804af1:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  804af6:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  804afa:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  804afe:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  804aff:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  804b04:	c3                   	retq   
