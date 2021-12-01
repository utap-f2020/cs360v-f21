
vmm/guest/obj/net/testinput:     file format elf64-x86-64


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
  80003c:	e8 0a 0a 00 00       	callq  800a4b <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <announce>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 30          	sub    $0x30,%rsp
  80004b:	c6 45 e0 52          	movb   $0x52,-0x20(%rbp)
  80004f:	c6 45 e1 54          	movb   $0x54,-0x1f(%rbp)
  800053:	c6 45 e2 00          	movb   $0x0,-0x1e(%rbp)
  800057:	c6 45 e3 12          	movb   $0x12,-0x1d(%rbp)
  80005b:	c6 45 e4 34          	movb   $0x34,-0x1c(%rbp)
  80005f:	c6 45 e5 56          	movb   $0x56,-0x1b(%rbp)
  800063:	48 bf 80 56 80 00 00 	movabs $0x805680,%rdi
  80006a:	00 00 00 
  80006d:	48 b8 cb 51 80 00 00 	movabs $0x8051cb,%rax
  800074:	00 00 00 
  800077:	ff d0                	callq  *%rax
  800079:	89 45 dc             	mov    %eax,-0x24(%rbp)
  80007c:	48 bf 8a 56 80 00 00 	movabs $0x80568a,%rdi
  800083:	00 00 00 
  800086:	48 b8 cb 51 80 00 00 	movabs $0x8051cb,%rax
  80008d:	00 00 00 
  800090:	ff d0                	callq  *%rax
  800092:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800095:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80009c:	00 00 00 
  80009f:	48 8b 00             	mov    (%rax),%rax
  8000a2:	ba 07 00 00 00       	mov    $0x7,%edx
  8000a7:	48 89 c6             	mov    %rax,%rsi
  8000aa:	bf 00 00 00 00       	mov    $0x0,%edi
  8000af:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  8000b6:	00 00 00 
  8000b9:	ff d0                	callq  *%rax
  8000bb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8000be:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8000c2:	79 30                	jns    8000f4 <announce+0xb1>
  8000c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000c7:	89 c1                	mov    %eax,%ecx
  8000c9:	48 ba 93 56 80 00 00 	movabs $0x805693,%rdx
  8000d0:	00 00 00 
  8000d3:	be 1a 00 00 00       	mov    $0x1a,%esi
  8000d8:	48 bf a4 56 80 00 00 	movabs $0x8056a4,%rdi
  8000df:	00 00 00 
  8000e2:	b8 00 00 00 00       	mov    $0x0,%eax
  8000e7:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  8000ee:	00 00 00 
  8000f1:	41 ff d0             	callq  *%r8
  8000f4:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8000fb:	00 00 00 
  8000fe:	48 8b 00             	mov    (%rax),%rax
  800101:	48 83 c0 04          	add    $0x4,%rax
  800105:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800109:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  800110:	00 00 00 
  800113:	48 8b 00             	mov    (%rax),%rax
  800116:	c7 00 2a 00 00 00    	movl   $0x2a,(%rax)
  80011c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800120:	ba 06 00 00 00       	mov    $0x6,%edx
  800125:	be ff 00 00 00       	mov    $0xff,%esi
  80012a:	48 89 c7             	mov    %rax,%rdi
  80012d:	48 b8 78 1b 80 00 00 	movabs $0x801b78,%rax
  800134:	00 00 00 
  800137:	ff d0                	callq  *%rax
  800139:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80013d:	48 8d 48 06          	lea    0x6(%rax),%rcx
  800141:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  800145:	ba 06 00 00 00       	mov    $0x6,%edx
  80014a:	48 89 c6             	mov    %rax,%rsi
  80014d:	48 89 cf             	mov    %rcx,%rdi
  800150:	48 b8 1a 1d 80 00 00 	movabs $0x801d1a,%rax
  800157:	00 00 00 
  80015a:	ff d0                	callq  *%rax
  80015c:	bf 06 08 00 00       	mov    $0x806,%edi
  800161:	48 b8 da 55 80 00 00 	movabs $0x8055da,%rax
  800168:	00 00 00 
  80016b:	ff d0                	callq  *%rax
  80016d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800171:	66 89 42 0c          	mov    %ax,0xc(%rdx)
  800175:	bf 01 00 00 00       	mov    $0x1,%edi
  80017a:	48 b8 da 55 80 00 00 	movabs $0x8055da,%rax
  800181:	00 00 00 
  800184:	ff d0                	callq  *%rax
  800186:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80018a:	66 89 42 0e          	mov    %ax,0xe(%rdx)
  80018e:	bf 00 08 00 00       	mov    $0x800,%edi
  800193:	48 b8 da 55 80 00 00 	movabs $0x8055da,%rax
  80019a:	00 00 00 
  80019d:	ff d0                	callq  *%rax
  80019f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8001a3:	66 89 42 10          	mov    %ax,0x10(%rdx)
  8001a7:	bf 04 06 00 00       	mov    $0x604,%edi
  8001ac:	48 b8 da 55 80 00 00 	movabs $0x8055da,%rax
  8001b3:	00 00 00 
  8001b6:	ff d0                	callq  *%rax
  8001b8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8001bc:	66 89 42 12          	mov    %ax,0x12(%rdx)
  8001c0:	bf 01 00 00 00       	mov    $0x1,%edi
  8001c5:	48 b8 da 55 80 00 00 	movabs $0x8055da,%rax
  8001cc:	00 00 00 
  8001cf:	ff d0                	callq  *%rax
  8001d1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8001d5:	66 89 42 14          	mov    %ax,0x14(%rdx)
  8001d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8001dd:	48 8d 48 16          	lea    0x16(%rax),%rcx
  8001e1:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  8001e5:	ba 06 00 00 00       	mov    $0x6,%edx
  8001ea:	48 89 c6             	mov    %rax,%rsi
  8001ed:	48 89 cf             	mov    %rcx,%rdi
  8001f0:	48 b8 1a 1d 80 00 00 	movabs $0x801d1a,%rax
  8001f7:	00 00 00 
  8001fa:	ff d0                	callq  *%rax
  8001fc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800200:	48 8d 48 1c          	lea    0x1c(%rax),%rcx
  800204:	48 8d 45 dc          	lea    -0x24(%rbp),%rax
  800208:	ba 04 00 00 00       	mov    $0x4,%edx
  80020d:	48 89 c6             	mov    %rax,%rsi
  800210:	48 89 cf             	mov    %rcx,%rdi
  800213:	48 b8 1a 1d 80 00 00 	movabs $0x801d1a,%rax
  80021a:	00 00 00 
  80021d:	ff d0                	callq  *%rax
  80021f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800223:	48 83 c0 20          	add    $0x20,%rax
  800227:	ba 06 00 00 00       	mov    $0x6,%edx
  80022c:	be 00 00 00 00       	mov    $0x0,%esi
  800231:	48 89 c7             	mov    %rax,%rdi
  800234:	48 b8 78 1b 80 00 00 	movabs $0x801b78,%rax
  80023b:	00 00 00 
  80023e:	ff d0                	callq  *%rax
  800240:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800244:	48 8d 48 26          	lea    0x26(%rax),%rcx
  800248:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  80024c:	ba 04 00 00 00       	mov    $0x4,%edx
  800251:	48 89 c6             	mov    %rax,%rsi
  800254:	48 89 cf             	mov    %rcx,%rdi
  800257:	48 b8 1a 1d 80 00 00 	movabs $0x801d1a,%rax
  80025e:	00 00 00 
  800261:	ff d0                	callq  *%rax
  800263:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80026a:	00 00 00 
  80026d:	48 8b 10             	mov    (%rax),%rdx
  800270:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  800277:	00 00 00 
  80027a:	8b 00                	mov    (%rax),%eax
  80027c:	b9 07 00 00 00       	mov    $0x7,%ecx
  800281:	be 0b 00 00 00       	mov    $0xb,%esi
  800286:	89 c7                	mov    %eax,%edi
  800288:	48 b8 c4 2c 80 00 00 	movabs $0x802cc4,%rax
  80028f:	00 00 00 
  800292:	ff d0                	callq  *%rax
  800294:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80029b:	00 00 00 
  80029e:	48 8b 00             	mov    (%rax),%rax
  8002a1:	48 89 c6             	mov    %rax,%rsi
  8002a4:	bf 00 00 00 00       	mov    $0x0,%edi
  8002a9:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  8002b0:	00 00 00 
  8002b3:	ff d0                	callq  *%rax
  8002b5:	c9                   	leaveq 
  8002b6:	c3                   	retq   

00000000008002b7 <hexdump>:
  8002b7:	55                   	push   %rbp
  8002b8:	48 89 e5             	mov    %rsp,%rbp
  8002bb:	48 81 ec 90 00 00 00 	sub    $0x90,%rsp
  8002c2:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
  8002c6:	48 89 75 80          	mov    %rsi,-0x80(%rbp)
  8002ca:	89 95 7c ff ff ff    	mov    %edx,-0x84(%rbp)
  8002d0:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  8002d4:	48 83 c0 50          	add    $0x50,%rax
  8002d8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8002dc:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8002e3:	00 
  8002e4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8002eb:	e9 41 01 00 00       	jmpq   800431 <hexdump+0x17a>
  8002f0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002f3:	83 e0 0f             	and    $0xf,%eax
  8002f6:	85 c0                	test   %eax,%eax
  8002f8:	75 4d                	jne    800347 <hexdump+0x90>
  8002fa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8002fe:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  800302:	48 29 c2             	sub    %rax,%rdx
  800305:	48 89 d0             	mov    %rdx,%rax
  800308:	89 c6                	mov    %eax,%esi
  80030a:	8b 4d fc             	mov    -0x4(%rbp),%ecx
  80030d:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
  800311:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  800315:	41 89 c8             	mov    %ecx,%r8d
  800318:	48 89 d1             	mov    %rdx,%rcx
  80031b:	48 ba b7 56 80 00 00 	movabs $0x8056b7,%rdx
  800322:	00 00 00 
  800325:	48 89 c7             	mov    %rax,%rdi
  800328:	b8 00 00 00 00       	mov    $0x0,%eax
  80032d:	49 b9 92 17 80 00 00 	movabs $0x801792,%r9
  800334:	00 00 00 
  800337:	41 ff d1             	callq  *%r9
  80033a:	48 98                	cltq   
  80033c:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  800340:	48 01 d0             	add    %rdx,%rax
  800343:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800347:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80034a:	48 63 d0             	movslq %eax,%rdx
  80034d:	48 8b 45 80          	mov    -0x80(%rbp),%rax
  800351:	48 01 d0             	add    %rdx,%rax
  800354:	0f b6 00             	movzbl (%rax),%eax
  800357:	0f b6 d0             	movzbl %al,%edx
  80035a:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80035e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800362:	48 29 c1             	sub    %rax,%rcx
  800365:	48 89 c8             	mov    %rcx,%rax
  800368:	89 c6                	mov    %eax,%esi
  80036a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80036e:	89 d1                	mov    %edx,%ecx
  800370:	48 ba c1 56 80 00 00 	movabs $0x8056c1,%rdx
  800377:	00 00 00 
  80037a:	48 89 c7             	mov    %rax,%rdi
  80037d:	b8 00 00 00 00       	mov    $0x0,%eax
  800382:	49 b8 92 17 80 00 00 	movabs $0x801792,%r8
  800389:	00 00 00 
  80038c:	41 ff d0             	callq  *%r8
  80038f:	48 98                	cltq   
  800391:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  800395:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800398:	99                   	cltd   
  800399:	c1 ea 1c             	shr    $0x1c,%edx
  80039c:	01 d0                	add    %edx,%eax
  80039e:	83 e0 0f             	and    $0xf,%eax
  8003a1:	29 d0                	sub    %edx,%eax
  8003a3:	83 f8 0f             	cmp    $0xf,%eax
  8003a6:	74 0e                	je     8003b6 <hexdump+0xff>
  8003a8:	8b 85 7c ff ff ff    	mov    -0x84(%rbp),%eax
  8003ae:	83 e8 01             	sub    $0x1,%eax
  8003b1:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  8003b4:	75 33                	jne    8003e9 <hexdump+0x132>
  8003b6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003ba:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  8003be:	48 89 d1             	mov    %rdx,%rcx
  8003c1:	48 29 c1             	sub    %rax,%rcx
  8003c4:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  8003c8:	48 89 c2             	mov    %rax,%rdx
  8003cb:	48 89 ce             	mov    %rcx,%rsi
  8003ce:	48 bf c6 56 80 00 00 	movabs $0x8056c6,%rdi
  8003d5:	00 00 00 
  8003d8:	b8 00 00 00 00       	mov    $0x0,%eax
  8003dd:	48 b9 2a 0d 80 00 00 	movabs $0x800d2a,%rcx
  8003e4:	00 00 00 
  8003e7:	ff d1                	callq  *%rcx
  8003e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003ec:	99                   	cltd   
  8003ed:	c1 ea 1f             	shr    $0x1f,%edx
  8003f0:	01 d0                	add    %edx,%eax
  8003f2:	83 e0 01             	and    $0x1,%eax
  8003f5:	29 d0                	sub    %edx,%eax
  8003f7:	83 f8 01             	cmp    $0x1,%eax
  8003fa:	75 0f                	jne    80040b <hexdump+0x154>
  8003fc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800400:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800404:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  800408:	c6 00 20             	movb   $0x20,(%rax)
  80040b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80040e:	99                   	cltd   
  80040f:	c1 ea 1c             	shr    $0x1c,%edx
  800412:	01 d0                	add    %edx,%eax
  800414:	83 e0 0f             	and    $0xf,%eax
  800417:	29 d0                	sub    %edx,%eax
  800419:	83 f8 07             	cmp    $0x7,%eax
  80041c:	75 0f                	jne    80042d <hexdump+0x176>
  80041e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800422:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800426:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  80042a:	c6 00 20             	movb   $0x20,(%rax)
  80042d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800431:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800434:	3b 85 7c ff ff ff    	cmp    -0x84(%rbp),%eax
  80043a:	0f 8c b0 fe ff ff    	jl     8002f0 <hexdump+0x39>
  800440:	c9                   	leaveq 
  800441:	c3                   	retq   

0000000000800442 <umain>:
  800442:	55                   	push   %rbp
  800443:	48 89 e5             	mov    %rsp,%rbp
  800446:	53                   	push   %rbx
  800447:	48 83 ec 38          	sub    $0x38,%rsp
  80044b:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80044e:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  800452:	48 b8 92 21 80 00 00 	movabs $0x802192,%rax
  800459:	00 00 00 
  80045c:	ff d0                	callq  *%rax
  80045e:	89 45 e8             	mov    %eax,-0x18(%rbp)
  800461:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%rbp)
  800468:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80046f:	00 00 00 
  800472:	48 bb cc 56 80 00 00 	movabs $0x8056cc,%rbx
  800479:	00 00 00 
  80047c:	48 89 18             	mov    %rbx,(%rax)
  80047f:	48 b8 8e 29 80 00 00 	movabs $0x80298e,%rax
  800486:	00 00 00 
  800489:	ff d0                	callq  *%rax
  80048b:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  800492:	00 00 00 
  800495:	89 02                	mov    %eax,(%rdx)
  800497:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80049e:	00 00 00 
  8004a1:	8b 00                	mov    (%rax),%eax
  8004a3:	85 c0                	test   %eax,%eax
  8004a5:	79 2a                	jns    8004d1 <umain+0x8f>
  8004a7:	48 ba d6 56 80 00 00 	movabs $0x8056d6,%rdx
  8004ae:	00 00 00 
  8004b1:	be 4e 00 00 00       	mov    $0x4e,%esi
  8004b6:	48 bf a4 56 80 00 00 	movabs $0x8056a4,%rdi
  8004bd:	00 00 00 
  8004c0:	b8 00 00 00 00       	mov    $0x0,%eax
  8004c5:	48 b9 f1 0a 80 00 00 	movabs $0x800af1,%rcx
  8004cc:	00 00 00 
  8004cf:	ff d1                	callq  *%rcx
  8004d1:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8004d8:	00 00 00 
  8004db:	8b 00                	mov    (%rax),%eax
  8004dd:	85 c0                	test   %eax,%eax
  8004df:	75 16                	jne    8004f7 <umain+0xb5>
  8004e1:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8004e4:	89 c7                	mov    %eax,%edi
  8004e6:	48 b8 34 09 80 00 00 	movabs $0x800934,%rax
  8004ed:	00 00 00 
  8004f0:	ff d0                	callq  *%rax
  8004f2:	e9 fb 01 00 00       	jmpq   8006f2 <umain+0x2b0>
  8004f7:	48 b8 8e 29 80 00 00 	movabs $0x80298e,%rax
  8004fe:	00 00 00 
  800501:	ff d0                	callq  *%rax
  800503:	48 ba 04 90 80 00 00 	movabs $0x809004,%rdx
  80050a:	00 00 00 
  80050d:	89 02                	mov    %eax,(%rdx)
  80050f:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  800516:	00 00 00 
  800519:	8b 00                	mov    (%rax),%eax
  80051b:	85 c0                	test   %eax,%eax
  80051d:	79 2a                	jns    800549 <umain+0x107>
  80051f:	48 ba d6 56 80 00 00 	movabs $0x8056d6,%rdx
  800526:	00 00 00 
  800529:	be 56 00 00 00       	mov    $0x56,%esi
  80052e:	48 bf a4 56 80 00 00 	movabs $0x8056a4,%rdi
  800535:	00 00 00 
  800538:	b8 00 00 00 00       	mov    $0x0,%eax
  80053d:	48 b9 f1 0a 80 00 00 	movabs $0x800af1,%rcx
  800544:	00 00 00 
  800547:	ff d1                	callq  *%rcx
  800549:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  800550:	00 00 00 
  800553:	8b 00                	mov    (%rax),%eax
  800555:	85 c0                	test   %eax,%eax
  800557:	75 16                	jne    80056f <umain+0x12d>
  800559:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80055c:	89 c7                	mov    %eax,%edi
  80055e:	48 b8 1a 08 80 00 00 	movabs $0x80081a,%rax
  800565:	00 00 00 
  800568:	ff d0                	callq  *%rax
  80056a:	e9 83 01 00 00       	jmpq   8006f2 <umain+0x2b0>
  80056f:	48 bf e4 56 80 00 00 	movabs $0x8056e4,%rdi
  800576:	00 00 00 
  800579:	b8 00 00 00 00       	mov    $0x0,%eax
  80057e:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  800585:	00 00 00 
  800588:	ff d2                	callq  *%rdx
  80058a:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800591:	00 00 00 
  800594:	ff d0                	callq  *%rax
  800596:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80059d:	00 00 00 
  8005a0:	48 8b 08             	mov    (%rax),%rcx
  8005a3:	48 8d 55 dc          	lea    -0x24(%rbp),%rdx
  8005a7:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  8005ab:	48 89 ce             	mov    %rcx,%rsi
  8005ae:	48 89 c7             	mov    %rax,%rdi
  8005b1:	48 b8 03 2c 80 00 00 	movabs $0x802c03,%rax
  8005b8:	00 00 00 
  8005bb:	ff d0                	callq  *%rax
  8005bd:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8005c0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8005c4:	79 30                	jns    8005f6 <umain+0x1b4>
  8005c6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8005c9:	89 c1                	mov    %eax,%ecx
  8005cb:	48 ba 01 57 80 00 00 	movabs $0x805701,%rdx
  8005d2:	00 00 00 
  8005d5:	be 65 00 00 00       	mov    $0x65,%esi
  8005da:	48 bf a4 56 80 00 00 	movabs $0x8056a4,%rdi
  8005e1:	00 00 00 
  8005e4:	b8 00 00 00 00       	mov    $0x0,%eax
  8005e9:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  8005f0:	00 00 00 
  8005f3:	41 ff d0             	callq  *%r8
  8005f6:	8b 55 e0             	mov    -0x20(%rbp),%edx
  8005f9:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  800600:	00 00 00 
  800603:	8b 00                	mov    (%rax),%eax
  800605:	39 c2                	cmp    %eax,%edx
  800607:	74 30                	je     800639 <umain+0x1f7>
  800609:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80060c:	89 c1                	mov    %eax,%ecx
  80060e:	48 ba 10 57 80 00 00 	movabs $0x805710,%rdx
  800615:	00 00 00 
  800618:	be 67 00 00 00       	mov    $0x67,%esi
  80061d:	48 bf a4 56 80 00 00 	movabs $0x8056a4,%rdi
  800624:	00 00 00 
  800627:	b8 00 00 00 00       	mov    $0x0,%eax
  80062c:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  800633:	00 00 00 
  800636:	41 ff d0             	callq  *%r8
  800639:	83 7d e4 0a          	cmpl   $0xa,-0x1c(%rbp)
  80063d:	74 30                	je     80066f <umain+0x22d>
  80063f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800642:	89 c1                	mov    %eax,%ecx
  800644:	48 ba 35 57 80 00 00 	movabs $0x805735,%rdx
  80064b:	00 00 00 
  80064e:	be 69 00 00 00       	mov    $0x69,%esi
  800653:	48 bf a4 56 80 00 00 	movabs $0x8056a4,%rdi
  80065a:	00 00 00 
  80065d:	b8 00 00 00 00       	mov    $0x0,%eax
  800662:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  800669:	00 00 00 
  80066c:	41 ff d0             	callq  *%r8
  80066f:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  800676:	00 00 00 
  800679:	48 8b 00             	mov    (%rax),%rax
  80067c:	8b 00                	mov    (%rax),%eax
  80067e:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  800685:	00 00 00 
  800688:	48 8b 12             	mov    (%rdx),%rdx
  80068b:	48 8d 4a 04          	lea    0x4(%rdx),%rcx
  80068f:	89 c2                	mov    %eax,%edx
  800691:	48 89 ce             	mov    %rcx,%rsi
  800694:	48 bf 47 57 80 00 00 	movabs $0x805747,%rdi
  80069b:	00 00 00 
  80069e:	48 b8 b7 02 80 00 00 	movabs $0x8002b7,%rax
  8006a5:	00 00 00 
  8006a8:	ff d0                	callq  *%rax
  8006aa:	48 bf 4f 57 80 00 00 	movabs $0x80574f,%rdi
  8006b1:	00 00 00 
  8006b4:	b8 00 00 00 00       	mov    $0x0,%eax
  8006b9:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  8006c0:	00 00 00 
  8006c3:	ff d2                	callq  *%rdx
  8006c5:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8006c9:	74 1b                	je     8006e6 <umain+0x2a4>
  8006cb:	48 bf 51 57 80 00 00 	movabs $0x805751,%rdi
  8006d2:	00 00 00 
  8006d5:	b8 00 00 00 00       	mov    $0x0,%eax
  8006da:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  8006e1:	00 00 00 
  8006e4:	ff d2                	callq  *%rdx
  8006e6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  8006ed:	e9 a4 fe ff ff       	jmpq   800596 <umain+0x154>
  8006f2:	48 83 c4 38          	add    $0x38,%rsp
  8006f6:	5b                   	pop    %rbx
  8006f7:	5d                   	pop    %rbp
  8006f8:	c3                   	retq   

00000000008006f9 <timer>:
  8006f9:	55                   	push   %rbp
  8006fa:	48 89 e5             	mov    %rsp,%rbp
  8006fd:	53                   	push   %rbx
  8006fe:	48 83 ec 28          	sub    $0x28,%rsp
  800702:	89 7d dc             	mov    %edi,-0x24(%rbp)
  800705:	89 75 d8             	mov    %esi,-0x28(%rbp)
  800708:	48 b8 7b 24 80 00 00 	movabs $0x80247b,%rax
  80070f:	00 00 00 
  800712:	ff d0                	callq  *%rax
  800714:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800717:	01 d0                	add    %edx,%eax
  800719:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80071c:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800723:	00 00 00 
  800726:	48 bb 70 57 80 00 00 	movabs $0x805770,%rbx
  80072d:	00 00 00 
  800730:	48 89 18             	mov    %rbx,(%rax)
  800733:	eb 0c                	jmp    800741 <timer+0x48>
  800735:	48 b8 d0 21 80 00 00 	movabs $0x8021d0,%rax
  80073c:	00 00 00 
  80073f:	ff d0                	callq  *%rax
  800741:	48 b8 7b 24 80 00 00 	movabs $0x80247b,%rax
  800748:	00 00 00 
  80074b:	ff d0                	callq  *%rax
  80074d:	89 45 e8             	mov    %eax,-0x18(%rbp)
  800750:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800753:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  800756:	73 06                	jae    80075e <timer+0x65>
  800758:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80075c:	79 d7                	jns    800735 <timer+0x3c>
  80075e:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  800762:	79 30                	jns    800794 <timer+0x9b>
  800764:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800767:	89 c1                	mov    %eax,%ecx
  800769:	48 ba 79 57 80 00 00 	movabs $0x805779,%rdx
  800770:	00 00 00 
  800773:	be 10 00 00 00       	mov    $0x10,%esi
  800778:	48 bf 8b 57 80 00 00 	movabs $0x80578b,%rdi
  80077f:	00 00 00 
  800782:	b8 00 00 00 00       	mov    $0x0,%eax
  800787:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  80078e:	00 00 00 
  800791:	41 ff d0             	callq  *%r8
  800794:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800797:	b9 00 00 00 00       	mov    $0x0,%ecx
  80079c:	ba 00 00 00 00       	mov    $0x0,%edx
  8007a1:	be 0c 00 00 00       	mov    $0xc,%esi
  8007a6:	89 c7                	mov    %eax,%edi
  8007a8:	48 b8 c4 2c 80 00 00 	movabs $0x802cc4,%rax
  8007af:	00 00 00 
  8007b2:	ff d0                	callq  *%rax
  8007b4:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  8007b8:	ba 00 00 00 00       	mov    $0x0,%edx
  8007bd:	be 00 00 00 00       	mov    $0x0,%esi
  8007c2:	48 89 c7             	mov    %rax,%rdi
  8007c5:	48 b8 03 2c 80 00 00 	movabs $0x802c03,%rax
  8007cc:	00 00 00 
  8007cf:	ff d0                	callq  *%rax
  8007d1:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8007d4:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8007d7:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8007da:	39 c2                	cmp    %eax,%edx
  8007dc:	74 22                	je     800800 <timer+0x107>
  8007de:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8007e1:	89 c6                	mov    %eax,%esi
  8007e3:	48 bf a0 57 80 00 00 	movabs $0x8057a0,%rdi
  8007ea:	00 00 00 
  8007ed:	b8 00 00 00 00       	mov    $0x0,%eax
  8007f2:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  8007f9:	00 00 00 
  8007fc:	ff d2                	callq  *%rdx
  8007fe:	eb b4                	jmp    8007b4 <timer+0xbb>
  800800:	48 b8 7b 24 80 00 00 	movabs $0x80247b,%rax
  800807:	00 00 00 
  80080a:	ff d0                	callq  *%rax
  80080c:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80080f:	01 d0                	add    %edx,%eax
  800811:	89 45 ec             	mov    %eax,-0x14(%rbp)
  800814:	90                   	nop
  800815:	e9 27 ff ff ff       	jmpq   800741 <timer+0x48>

000000000080081a <input>:
  80081a:	55                   	push   %rbp
  80081b:	48 89 e5             	mov    %rsp,%rbp
  80081e:	53                   	push   %rbx
  80081f:	48 83 ec 28          	sub    $0x28,%rsp
  800823:	89 7d dc             	mov    %edi,-0x24(%rbp)
  800826:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80082d:	00 00 00 
  800830:	48 bb db 57 80 00 00 	movabs $0x8057db,%rbx
  800837:	00 00 00 
  80083a:	48 89 18             	mov    %rbx,(%rax)
  80083d:	ba 07 00 00 00       	mov    $0x7,%edx
  800842:	48 be 00 c0 80 00 00 	movabs $0x80c000,%rsi
  800849:	00 00 00 
  80084c:	bf 00 00 00 00       	mov    $0x0,%edi
  800851:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  800858:	00 00 00 
  80085b:	ff d0                	callq  *%rax
  80085d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  800860:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  800864:	79 30                	jns    800896 <input+0x7c>
  800866:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800869:	89 c1                	mov    %eax,%ecx
  80086b:	48 ba e4 57 80 00 00 	movabs $0x8057e4,%rdx
  800872:	00 00 00 
  800875:	be 0e 00 00 00       	mov    $0xe,%esi
  80087a:	48 bf f7 57 80 00 00 	movabs $0x8057f7,%rdi
  800881:	00 00 00 
  800884:	b8 00 00 00 00       	mov    $0x0,%eax
  800889:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  800890:	00 00 00 
  800893:	41 ff d0             	callq  *%r8
  800896:	be ee 05 00 00       	mov    $0x5ee,%esi
  80089b:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  8008a2:	00 00 00 
  8008a5:	48 b8 01 25 80 00 00 	movabs $0x802501,%rax
  8008ac:	00 00 00 
  8008af:	ff d0                	callq  *%rax
  8008b1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8008b4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8008b8:	75 0e                	jne    8008c8 <input+0xae>
  8008ba:	48 b8 d0 21 80 00 00 	movabs $0x8021d0,%rax
  8008c1:	00 00 00 
  8008c4:	ff d0                	callq  *%rax
  8008c6:	eb 67                	jmp    80092f <input+0x115>
  8008c8:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8008cc:	79 22                	jns    8008f0 <input+0xd6>
  8008ce:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8008d1:	89 c6                	mov    %eax,%esi
  8008d3:	48 bf 06 58 80 00 00 	movabs $0x805806,%rdi
  8008da:	00 00 00 
  8008dd:	b8 00 00 00 00       	mov    $0x0,%eax
  8008e2:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  8008e9:	00 00 00 
  8008ec:	ff d2                	callq  *%rdx
  8008ee:	eb 3f                	jmp    80092f <input+0x115>
  8008f0:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8008f4:	7e 39                	jle    80092f <input+0x115>
  8008f6:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8008fd:	00 00 00 
  800900:	8b 55 ec             	mov    -0x14(%rbp),%edx
  800903:	89 10                	mov    %edx,(%rax)
  800905:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800908:	b9 05 00 00 00       	mov    $0x5,%ecx
  80090d:	48 ba 00 c0 80 00 00 	movabs $0x80c000,%rdx
  800914:	00 00 00 
  800917:	be 0a 00 00 00       	mov    $0xa,%esi
  80091c:	89 c7                	mov    %eax,%edi
  80091e:	48 b8 c4 2c 80 00 00 	movabs $0x802cc4,%rax
  800925:	00 00 00 
  800928:	ff d0                	callq  *%rax
  80092a:	e9 0e ff ff ff       	jmpq   80083d <input+0x23>
  80092f:	e9 09 ff ff ff       	jmpq   80083d <input+0x23>

0000000000800934 <output>:
  800934:	55                   	push   %rbp
  800935:	48 89 e5             	mov    %rsp,%rbp
  800938:	53                   	push   %rbx
  800939:	48 83 ec 28          	sub    $0x28,%rsp
  80093d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  800940:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800947:	00 00 00 
  80094a:	48 bb 28 58 80 00 00 	movabs $0x805828,%rbx
  800951:	00 00 00 
  800954:	48 89 18             	mov    %rbx,(%rax)
  800957:	48 8d 45 e4          	lea    -0x1c(%rbp),%rax
  80095b:	ba 00 00 00 00       	mov    $0x0,%edx
  800960:	48 be 00 c0 80 00 00 	movabs $0x80c000,%rsi
  800967:	00 00 00 
  80096a:	48 89 c7             	mov    %rax,%rdi
  80096d:	48 b8 03 2c 80 00 00 	movabs $0x802c03,%rax
  800974:	00 00 00 
  800977:	ff d0                	callq  *%rax
  800979:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80097c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80097f:	3b 45 dc             	cmp    -0x24(%rbp),%eax
  800982:	74 35                	je     8009b9 <output+0x85>
  800984:	48 b9 32 58 80 00 00 	movabs $0x805832,%rcx
  80098b:	00 00 00 
  80098e:	48 ba 43 58 80 00 00 	movabs $0x805843,%rdx
  800995:	00 00 00 
  800998:	be 11 00 00 00       	mov    $0x11,%esi
  80099d:	48 bf 58 58 80 00 00 	movabs $0x805858,%rdi
  8009a4:	00 00 00 
  8009a7:	b8 00 00 00 00       	mov    $0x0,%eax
  8009ac:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  8009b3:	00 00 00 
  8009b6:	41 ff d0             	callq  *%r8
  8009b9:	83 7d ec 0b          	cmpl   $0xb,-0x14(%rbp)
  8009bd:	74 35                	je     8009f4 <output+0xc0>
  8009bf:	48 b9 68 58 80 00 00 	movabs $0x805868,%rcx
  8009c6:	00 00 00 
  8009c9:	48 ba 43 58 80 00 00 	movabs $0x805843,%rdx
  8009d0:	00 00 00 
  8009d3:	be 12 00 00 00       	mov    $0x12,%esi
  8009d8:	48 bf 58 58 80 00 00 	movabs $0x805858,%rdi
  8009df:	00 00 00 
  8009e2:	b8 00 00 00 00       	mov    $0x0,%eax
  8009e7:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  8009ee:	00 00 00 
  8009f1:	41 ff d0             	callq  *%r8
  8009f4:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8009fb:	00 00 00 
  8009fe:	8b 00                	mov    (%rax),%eax
  800a00:	89 c6                	mov    %eax,%esi
  800a02:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  800a09:	00 00 00 
  800a0c:	48 b8 b9 24 80 00 00 	movabs $0x8024b9,%rax
  800a13:	00 00 00 
  800a16:	ff d0                	callq  *%rax
  800a18:	89 45 e8             	mov    %eax,-0x18(%rbp)
  800a1b:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  800a1f:	79 25                	jns    800a46 <output+0x112>
  800a21:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800a24:	89 c6                	mov    %eax,%esi
  800a26:	48 bf 80 58 80 00 00 	movabs $0x805880,%rdi
  800a2d:	00 00 00 
  800a30:	b8 00 00 00 00       	mov    $0x0,%eax
  800a35:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  800a3c:	00 00 00 
  800a3f:	ff d2                	callq  *%rdx
  800a41:	e9 11 ff ff ff       	jmpq   800957 <output+0x23>
  800a46:	e9 0c ff ff ff       	jmpq   800957 <output+0x23>

0000000000800a4b <libmain>:
  800a4b:	55                   	push   %rbp
  800a4c:	48 89 e5             	mov    %rsp,%rbp
  800a4f:	48 83 ec 10          	sub    $0x10,%rsp
  800a53:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800a56:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800a5a:	48 b8 92 21 80 00 00 	movabs $0x802192,%rax
  800a61:	00 00 00 
  800a64:	ff d0                	callq  *%rax
  800a66:	25 ff 03 00 00       	and    $0x3ff,%eax
  800a6b:	48 98                	cltq   
  800a6d:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800a74:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800a7b:	00 00 00 
  800a7e:	48 01 c2             	add    %rax,%rdx
  800a81:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  800a88:	00 00 00 
  800a8b:	48 89 10             	mov    %rdx,(%rax)
  800a8e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800a92:	7e 14                	jle    800aa8 <libmain+0x5d>
  800a94:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800a98:	48 8b 10             	mov    (%rax),%rdx
  800a9b:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800aa2:	00 00 00 
  800aa5:	48 89 10             	mov    %rdx,(%rax)
  800aa8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800aac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800aaf:	48 89 d6             	mov    %rdx,%rsi
  800ab2:	89 c7                	mov    %eax,%edi
  800ab4:	48 b8 42 04 80 00 00 	movabs $0x800442,%rax
  800abb:	00 00 00 
  800abe:	ff d0                	callq  *%rax
  800ac0:	48 b8 ce 0a 80 00 00 	movabs $0x800ace,%rax
  800ac7:	00 00 00 
  800aca:	ff d0                	callq  *%rax
  800acc:	c9                   	leaveq 
  800acd:	c3                   	retq   

0000000000800ace <exit>:
  800ace:	55                   	push   %rbp
  800acf:	48 89 e5             	mov    %rsp,%rbp
  800ad2:	48 b8 a8 32 80 00 00 	movabs $0x8032a8,%rax
  800ad9:	00 00 00 
  800adc:	ff d0                	callq  *%rax
  800ade:	bf 00 00 00 00       	mov    $0x0,%edi
  800ae3:	48 b8 4e 21 80 00 00 	movabs $0x80214e,%rax
  800aea:	00 00 00 
  800aed:	ff d0                	callq  *%rax
  800aef:	5d                   	pop    %rbp
  800af0:	c3                   	retq   

0000000000800af1 <_panic>:
  800af1:	55                   	push   %rbp
  800af2:	48 89 e5             	mov    %rsp,%rbp
  800af5:	53                   	push   %rbx
  800af6:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  800afd:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800b04:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800b0a:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800b11:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800b18:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800b1f:	84 c0                	test   %al,%al
  800b21:	74 23                	je     800b46 <_panic+0x55>
  800b23:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800b2a:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800b2e:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800b32:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800b36:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800b3a:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800b3e:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800b42:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800b46:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800b4d:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800b54:	00 00 00 
  800b57:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  800b5e:	00 00 00 
  800b61:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800b65:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  800b6c:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800b73:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800b7a:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800b81:	00 00 00 
  800b84:	48 8b 18             	mov    (%rax),%rbx
  800b87:	48 b8 92 21 80 00 00 	movabs $0x802192,%rax
  800b8e:	00 00 00 
  800b91:	ff d0                	callq  *%rax
  800b93:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  800b99:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800ba0:	41 89 c8             	mov    %ecx,%r8d
  800ba3:	48 89 d1             	mov    %rdx,%rcx
  800ba6:	48 89 da             	mov    %rbx,%rdx
  800ba9:	89 c6                	mov    %eax,%esi
  800bab:	48 bf b0 58 80 00 00 	movabs $0x8058b0,%rdi
  800bb2:	00 00 00 
  800bb5:	b8 00 00 00 00       	mov    $0x0,%eax
  800bba:	49 b9 2a 0d 80 00 00 	movabs $0x800d2a,%r9
  800bc1:	00 00 00 
  800bc4:	41 ff d1             	callq  *%r9
  800bc7:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800bce:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800bd5:	48 89 d6             	mov    %rdx,%rsi
  800bd8:	48 89 c7             	mov    %rax,%rdi
  800bdb:	48 b8 7e 0c 80 00 00 	movabs $0x800c7e,%rax
  800be2:	00 00 00 
  800be5:	ff d0                	callq  *%rax
  800be7:	48 bf d3 58 80 00 00 	movabs $0x8058d3,%rdi
  800bee:	00 00 00 
  800bf1:	b8 00 00 00 00       	mov    $0x0,%eax
  800bf6:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  800bfd:	00 00 00 
  800c00:	ff d2                	callq  *%rdx
  800c02:	cc                   	int3   
  800c03:	eb fd                	jmp    800c02 <_panic+0x111>

0000000000800c05 <putch>:
  800c05:	55                   	push   %rbp
  800c06:	48 89 e5             	mov    %rsp,%rbp
  800c09:	48 83 ec 10          	sub    $0x10,%rsp
  800c0d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800c10:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800c14:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c18:	8b 00                	mov    (%rax),%eax
  800c1a:	8d 48 01             	lea    0x1(%rax),%ecx
  800c1d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800c21:	89 0a                	mov    %ecx,(%rdx)
  800c23:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800c26:	89 d1                	mov    %edx,%ecx
  800c28:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800c2c:	48 98                	cltq   
  800c2e:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800c32:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c36:	8b 00                	mov    (%rax),%eax
  800c38:	3d ff 00 00 00       	cmp    $0xff,%eax
  800c3d:	75 2c                	jne    800c6b <putch+0x66>
  800c3f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c43:	8b 00                	mov    (%rax),%eax
  800c45:	48 98                	cltq   
  800c47:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800c4b:	48 83 c2 08          	add    $0x8,%rdx
  800c4f:	48 89 c6             	mov    %rax,%rsi
  800c52:	48 89 d7             	mov    %rdx,%rdi
  800c55:	48 b8 c6 20 80 00 00 	movabs $0x8020c6,%rax
  800c5c:	00 00 00 
  800c5f:	ff d0                	callq  *%rax
  800c61:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c65:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800c6b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c6f:	8b 40 04             	mov    0x4(%rax),%eax
  800c72:	8d 50 01             	lea    0x1(%rax),%edx
  800c75:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c79:	89 50 04             	mov    %edx,0x4(%rax)
  800c7c:	c9                   	leaveq 
  800c7d:	c3                   	retq   

0000000000800c7e <vcprintf>:
  800c7e:	55                   	push   %rbp
  800c7f:	48 89 e5             	mov    %rsp,%rbp
  800c82:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800c89:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800c90:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800c97:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800c9e:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800ca5:	48 8b 0a             	mov    (%rdx),%rcx
  800ca8:	48 89 08             	mov    %rcx,(%rax)
  800cab:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800caf:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800cb3:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800cb7:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800cbb:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800cc2:	00 00 00 
  800cc5:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800ccc:	00 00 00 
  800ccf:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800cd6:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800cdd:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800ce4:	48 89 c6             	mov    %rax,%rsi
  800ce7:	48 bf 05 0c 80 00 00 	movabs $0x800c05,%rdi
  800cee:	00 00 00 
  800cf1:	48 b8 dd 10 80 00 00 	movabs $0x8010dd,%rax
  800cf8:	00 00 00 
  800cfb:	ff d0                	callq  *%rax
  800cfd:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800d03:	48 98                	cltq   
  800d05:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800d0c:	48 83 c2 08          	add    $0x8,%rdx
  800d10:	48 89 c6             	mov    %rax,%rsi
  800d13:	48 89 d7             	mov    %rdx,%rdi
  800d16:	48 b8 c6 20 80 00 00 	movabs $0x8020c6,%rax
  800d1d:	00 00 00 
  800d20:	ff d0                	callq  *%rax
  800d22:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800d28:	c9                   	leaveq 
  800d29:	c3                   	retq   

0000000000800d2a <cprintf>:
  800d2a:	55                   	push   %rbp
  800d2b:	48 89 e5             	mov    %rsp,%rbp
  800d2e:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800d35:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800d3c:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800d43:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800d4a:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800d51:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800d58:	84 c0                	test   %al,%al
  800d5a:	74 20                	je     800d7c <cprintf+0x52>
  800d5c:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800d60:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800d64:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800d68:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800d6c:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800d70:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800d74:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800d78:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800d7c:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800d83:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800d8a:	00 00 00 
  800d8d:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800d94:	00 00 00 
  800d97:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800d9b:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800da2:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800da9:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800db0:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800db7:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800dbe:	48 8b 0a             	mov    (%rdx),%rcx
  800dc1:	48 89 08             	mov    %rcx,(%rax)
  800dc4:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800dc8:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800dcc:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800dd0:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800dd4:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800ddb:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800de2:	48 89 d6             	mov    %rdx,%rsi
  800de5:	48 89 c7             	mov    %rax,%rdi
  800de8:	48 b8 7e 0c 80 00 00 	movabs $0x800c7e,%rax
  800def:	00 00 00 
  800df2:	ff d0                	callq  *%rax
  800df4:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800dfa:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800e00:	c9                   	leaveq 
  800e01:	c3                   	retq   

0000000000800e02 <printnum>:
  800e02:	55                   	push   %rbp
  800e03:	48 89 e5             	mov    %rsp,%rbp
  800e06:	53                   	push   %rbx
  800e07:	48 83 ec 38          	sub    $0x38,%rsp
  800e0b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800e0f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800e13:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800e17:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  800e1a:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  800e1e:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  800e22:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  800e25:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800e29:	77 3b                	ja     800e66 <printnum+0x64>
  800e2b:	8b 45 d0             	mov    -0x30(%rbp),%eax
  800e2e:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  800e32:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  800e35:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800e39:	ba 00 00 00 00       	mov    $0x0,%edx
  800e3e:	48 f7 f3             	div    %rbx
  800e41:	48 89 c2             	mov    %rax,%rdx
  800e44:	8b 7d cc             	mov    -0x34(%rbp),%edi
  800e47:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800e4a:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  800e4e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e52:	41 89 f9             	mov    %edi,%r9d
  800e55:	48 89 c7             	mov    %rax,%rdi
  800e58:	48 b8 02 0e 80 00 00 	movabs $0x800e02,%rax
  800e5f:	00 00 00 
  800e62:	ff d0                	callq  *%rax
  800e64:	eb 1e                	jmp    800e84 <printnum+0x82>
  800e66:	eb 12                	jmp    800e7a <printnum+0x78>
  800e68:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800e6c:	8b 55 cc             	mov    -0x34(%rbp),%edx
  800e6f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e73:	48 89 ce             	mov    %rcx,%rsi
  800e76:	89 d7                	mov    %edx,%edi
  800e78:	ff d0                	callq  *%rax
  800e7a:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  800e7e:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  800e82:	7f e4                	jg     800e68 <printnum+0x66>
  800e84:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800e87:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800e8b:	ba 00 00 00 00       	mov    $0x0,%edx
  800e90:	48 f7 f1             	div    %rcx
  800e93:	48 89 d0             	mov    %rdx,%rax
  800e96:	48 ba d0 5a 80 00 00 	movabs $0x805ad0,%rdx
  800e9d:	00 00 00 
  800ea0:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  800ea4:	0f be d0             	movsbl %al,%edx
  800ea7:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800eab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800eaf:	48 89 ce             	mov    %rcx,%rsi
  800eb2:	89 d7                	mov    %edx,%edi
  800eb4:	ff d0                	callq  *%rax
  800eb6:	48 83 c4 38          	add    $0x38,%rsp
  800eba:	5b                   	pop    %rbx
  800ebb:	5d                   	pop    %rbp
  800ebc:	c3                   	retq   

0000000000800ebd <getuint>:
  800ebd:	55                   	push   %rbp
  800ebe:	48 89 e5             	mov    %rsp,%rbp
  800ec1:	48 83 ec 1c          	sub    $0x1c,%rsp
  800ec5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800ec9:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800ecc:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800ed0:	7e 52                	jle    800f24 <getuint+0x67>
  800ed2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ed6:	8b 00                	mov    (%rax),%eax
  800ed8:	83 f8 30             	cmp    $0x30,%eax
  800edb:	73 24                	jae    800f01 <getuint+0x44>
  800edd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ee1:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800ee5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ee9:	8b 00                	mov    (%rax),%eax
  800eeb:	89 c0                	mov    %eax,%eax
  800eed:	48 01 d0             	add    %rdx,%rax
  800ef0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ef4:	8b 12                	mov    (%rdx),%edx
  800ef6:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800ef9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800efd:	89 0a                	mov    %ecx,(%rdx)
  800eff:	eb 17                	jmp    800f18 <getuint+0x5b>
  800f01:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f05:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800f09:	48 89 d0             	mov    %rdx,%rax
  800f0c:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800f10:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f14:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800f18:	48 8b 00             	mov    (%rax),%rax
  800f1b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800f1f:	e9 a3 00 00 00       	jmpq   800fc7 <getuint+0x10a>
  800f24:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800f28:	74 4f                	je     800f79 <getuint+0xbc>
  800f2a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f2e:	8b 00                	mov    (%rax),%eax
  800f30:	83 f8 30             	cmp    $0x30,%eax
  800f33:	73 24                	jae    800f59 <getuint+0x9c>
  800f35:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f39:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800f3d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f41:	8b 00                	mov    (%rax),%eax
  800f43:	89 c0                	mov    %eax,%eax
  800f45:	48 01 d0             	add    %rdx,%rax
  800f48:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f4c:	8b 12                	mov    (%rdx),%edx
  800f4e:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800f51:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f55:	89 0a                	mov    %ecx,(%rdx)
  800f57:	eb 17                	jmp    800f70 <getuint+0xb3>
  800f59:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f5d:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800f61:	48 89 d0             	mov    %rdx,%rax
  800f64:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800f68:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f6c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800f70:	48 8b 00             	mov    (%rax),%rax
  800f73:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800f77:	eb 4e                	jmp    800fc7 <getuint+0x10a>
  800f79:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f7d:	8b 00                	mov    (%rax),%eax
  800f7f:	83 f8 30             	cmp    $0x30,%eax
  800f82:	73 24                	jae    800fa8 <getuint+0xeb>
  800f84:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f88:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800f8c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f90:	8b 00                	mov    (%rax),%eax
  800f92:	89 c0                	mov    %eax,%eax
  800f94:	48 01 d0             	add    %rdx,%rax
  800f97:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f9b:	8b 12                	mov    (%rdx),%edx
  800f9d:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800fa0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800fa4:	89 0a                	mov    %ecx,(%rdx)
  800fa6:	eb 17                	jmp    800fbf <getuint+0x102>
  800fa8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fac:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800fb0:	48 89 d0             	mov    %rdx,%rax
  800fb3:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800fb7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800fbb:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800fbf:	8b 00                	mov    (%rax),%eax
  800fc1:	89 c0                	mov    %eax,%eax
  800fc3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800fc7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800fcb:	c9                   	leaveq 
  800fcc:	c3                   	retq   

0000000000800fcd <getint>:
  800fcd:	55                   	push   %rbp
  800fce:	48 89 e5             	mov    %rsp,%rbp
  800fd1:	48 83 ec 1c          	sub    $0x1c,%rsp
  800fd5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800fd9:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800fdc:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800fe0:	7e 52                	jle    801034 <getint+0x67>
  800fe2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fe6:	8b 00                	mov    (%rax),%eax
  800fe8:	83 f8 30             	cmp    $0x30,%eax
  800feb:	73 24                	jae    801011 <getint+0x44>
  800fed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ff1:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800ff5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ff9:	8b 00                	mov    (%rax),%eax
  800ffb:	89 c0                	mov    %eax,%eax
  800ffd:	48 01 d0             	add    %rdx,%rax
  801000:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801004:	8b 12                	mov    (%rdx),%edx
  801006:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801009:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80100d:	89 0a                	mov    %ecx,(%rdx)
  80100f:	eb 17                	jmp    801028 <getint+0x5b>
  801011:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801015:	48 8b 50 08          	mov    0x8(%rax),%rdx
  801019:	48 89 d0             	mov    %rdx,%rax
  80101c:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  801020:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801024:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801028:	48 8b 00             	mov    (%rax),%rax
  80102b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80102f:	e9 a3 00 00 00       	jmpq   8010d7 <getint+0x10a>
  801034:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  801038:	74 4f                	je     801089 <getint+0xbc>
  80103a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80103e:	8b 00                	mov    (%rax),%eax
  801040:	83 f8 30             	cmp    $0x30,%eax
  801043:	73 24                	jae    801069 <getint+0x9c>
  801045:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801049:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80104d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801051:	8b 00                	mov    (%rax),%eax
  801053:	89 c0                	mov    %eax,%eax
  801055:	48 01 d0             	add    %rdx,%rax
  801058:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80105c:	8b 12                	mov    (%rdx),%edx
  80105e:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801061:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801065:	89 0a                	mov    %ecx,(%rdx)
  801067:	eb 17                	jmp    801080 <getint+0xb3>
  801069:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80106d:	48 8b 50 08          	mov    0x8(%rax),%rdx
  801071:	48 89 d0             	mov    %rdx,%rax
  801074:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  801078:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80107c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801080:	48 8b 00             	mov    (%rax),%rax
  801083:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801087:	eb 4e                	jmp    8010d7 <getint+0x10a>
  801089:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80108d:	8b 00                	mov    (%rax),%eax
  80108f:	83 f8 30             	cmp    $0x30,%eax
  801092:	73 24                	jae    8010b8 <getint+0xeb>
  801094:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801098:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80109c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010a0:	8b 00                	mov    (%rax),%eax
  8010a2:	89 c0                	mov    %eax,%eax
  8010a4:	48 01 d0             	add    %rdx,%rax
  8010a7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010ab:	8b 12                	mov    (%rdx),%edx
  8010ad:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8010b0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010b4:	89 0a                	mov    %ecx,(%rdx)
  8010b6:	eb 17                	jmp    8010cf <getint+0x102>
  8010b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010bc:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8010c0:	48 89 d0             	mov    %rdx,%rax
  8010c3:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8010c7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010cb:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8010cf:	8b 00                	mov    (%rax),%eax
  8010d1:	48 98                	cltq   
  8010d3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8010d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010db:	c9                   	leaveq 
  8010dc:	c3                   	retq   

00000000008010dd <vprintfmt>:
  8010dd:	55                   	push   %rbp
  8010de:	48 89 e5             	mov    %rsp,%rbp
  8010e1:	41 54                	push   %r12
  8010e3:	53                   	push   %rbx
  8010e4:	48 83 ec 60          	sub    $0x60,%rsp
  8010e8:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8010ec:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8010f0:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8010f4:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8010f8:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8010fc:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  801100:	48 8b 0a             	mov    (%rdx),%rcx
  801103:	48 89 08             	mov    %rcx,(%rax)
  801106:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80110a:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80110e:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801112:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801116:	eb 17                	jmp    80112f <vprintfmt+0x52>
  801118:	85 db                	test   %ebx,%ebx
  80111a:	0f 84 cc 04 00 00    	je     8015ec <vprintfmt+0x50f>
  801120:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801124:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801128:	48 89 d6             	mov    %rdx,%rsi
  80112b:	89 df                	mov    %ebx,%edi
  80112d:	ff d0                	callq  *%rax
  80112f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801133:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801137:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80113b:	0f b6 00             	movzbl (%rax),%eax
  80113e:	0f b6 d8             	movzbl %al,%ebx
  801141:	83 fb 25             	cmp    $0x25,%ebx
  801144:	75 d2                	jne    801118 <vprintfmt+0x3b>
  801146:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  80114a:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  801151:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  801158:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80115f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  801166:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80116a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80116e:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  801172:	0f b6 00             	movzbl (%rax),%eax
  801175:	0f b6 d8             	movzbl %al,%ebx
  801178:	8d 43 dd             	lea    -0x23(%rbx),%eax
  80117b:	83 f8 55             	cmp    $0x55,%eax
  80117e:	0f 87 34 04 00 00    	ja     8015b8 <vprintfmt+0x4db>
  801184:	89 c0                	mov    %eax,%eax
  801186:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80118d:	00 
  80118e:	48 b8 f8 5a 80 00 00 	movabs $0x805af8,%rax
  801195:	00 00 00 
  801198:	48 01 d0             	add    %rdx,%rax
  80119b:	48 8b 00             	mov    (%rax),%rax
  80119e:	ff e0                	jmpq   *%rax
  8011a0:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8011a4:	eb c0                	jmp    801166 <vprintfmt+0x89>
  8011a6:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8011aa:	eb ba                	jmp    801166 <vprintfmt+0x89>
  8011ac:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8011b3:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8011b6:	89 d0                	mov    %edx,%eax
  8011b8:	c1 e0 02             	shl    $0x2,%eax
  8011bb:	01 d0                	add    %edx,%eax
  8011bd:	01 c0                	add    %eax,%eax
  8011bf:	01 d8                	add    %ebx,%eax
  8011c1:	83 e8 30             	sub    $0x30,%eax
  8011c4:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8011c7:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8011cb:	0f b6 00             	movzbl (%rax),%eax
  8011ce:	0f be d8             	movsbl %al,%ebx
  8011d1:	83 fb 2f             	cmp    $0x2f,%ebx
  8011d4:	7e 0c                	jle    8011e2 <vprintfmt+0x105>
  8011d6:	83 fb 39             	cmp    $0x39,%ebx
  8011d9:	7f 07                	jg     8011e2 <vprintfmt+0x105>
  8011db:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  8011e0:	eb d1                	jmp    8011b3 <vprintfmt+0xd6>
  8011e2:	eb 58                	jmp    80123c <vprintfmt+0x15f>
  8011e4:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8011e7:	83 f8 30             	cmp    $0x30,%eax
  8011ea:	73 17                	jae    801203 <vprintfmt+0x126>
  8011ec:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8011f0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8011f3:	89 c0                	mov    %eax,%eax
  8011f5:	48 01 d0             	add    %rdx,%rax
  8011f8:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8011fb:	83 c2 08             	add    $0x8,%edx
  8011fe:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801201:	eb 0f                	jmp    801212 <vprintfmt+0x135>
  801203:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  801207:	48 89 d0             	mov    %rdx,%rax
  80120a:	48 83 c2 08          	add    $0x8,%rdx
  80120e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801212:	8b 00                	mov    (%rax),%eax
  801214:	89 45 d8             	mov    %eax,-0x28(%rbp)
  801217:	eb 23                	jmp    80123c <vprintfmt+0x15f>
  801219:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80121d:	79 0c                	jns    80122b <vprintfmt+0x14e>
  80121f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  801226:	e9 3b ff ff ff       	jmpq   801166 <vprintfmt+0x89>
  80122b:	e9 36 ff ff ff       	jmpq   801166 <vprintfmt+0x89>
  801230:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  801237:	e9 2a ff ff ff       	jmpq   801166 <vprintfmt+0x89>
  80123c:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801240:	79 12                	jns    801254 <vprintfmt+0x177>
  801242:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801245:	89 45 dc             	mov    %eax,-0x24(%rbp)
  801248:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  80124f:	e9 12 ff ff ff       	jmpq   801166 <vprintfmt+0x89>
  801254:	e9 0d ff ff ff       	jmpq   801166 <vprintfmt+0x89>
  801259:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  80125d:	e9 04 ff ff ff       	jmpq   801166 <vprintfmt+0x89>
  801262:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801265:	83 f8 30             	cmp    $0x30,%eax
  801268:	73 17                	jae    801281 <vprintfmt+0x1a4>
  80126a:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80126e:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801271:	89 c0                	mov    %eax,%eax
  801273:	48 01 d0             	add    %rdx,%rax
  801276:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801279:	83 c2 08             	add    $0x8,%edx
  80127c:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80127f:	eb 0f                	jmp    801290 <vprintfmt+0x1b3>
  801281:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  801285:	48 89 d0             	mov    %rdx,%rax
  801288:	48 83 c2 08          	add    $0x8,%rdx
  80128c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801290:	8b 10                	mov    (%rax),%edx
  801292:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  801296:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80129a:	48 89 ce             	mov    %rcx,%rsi
  80129d:	89 d7                	mov    %edx,%edi
  80129f:	ff d0                	callq  *%rax
  8012a1:	e9 40 03 00 00       	jmpq   8015e6 <vprintfmt+0x509>
  8012a6:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8012a9:	83 f8 30             	cmp    $0x30,%eax
  8012ac:	73 17                	jae    8012c5 <vprintfmt+0x1e8>
  8012ae:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8012b2:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8012b5:	89 c0                	mov    %eax,%eax
  8012b7:	48 01 d0             	add    %rdx,%rax
  8012ba:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8012bd:	83 c2 08             	add    $0x8,%edx
  8012c0:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8012c3:	eb 0f                	jmp    8012d4 <vprintfmt+0x1f7>
  8012c5:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8012c9:	48 89 d0             	mov    %rdx,%rax
  8012cc:	48 83 c2 08          	add    $0x8,%rdx
  8012d0:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8012d4:	8b 18                	mov    (%rax),%ebx
  8012d6:	85 db                	test   %ebx,%ebx
  8012d8:	79 02                	jns    8012dc <vprintfmt+0x1ff>
  8012da:	f7 db                	neg    %ebx
  8012dc:	83 fb 15             	cmp    $0x15,%ebx
  8012df:	7f 16                	jg     8012f7 <vprintfmt+0x21a>
  8012e1:	48 b8 20 5a 80 00 00 	movabs $0x805a20,%rax
  8012e8:	00 00 00 
  8012eb:	48 63 d3             	movslq %ebx,%rdx
  8012ee:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  8012f2:	4d 85 e4             	test   %r12,%r12
  8012f5:	75 2e                	jne    801325 <vprintfmt+0x248>
  8012f7:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8012fb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8012ff:	89 d9                	mov    %ebx,%ecx
  801301:	48 ba e1 5a 80 00 00 	movabs $0x805ae1,%rdx
  801308:	00 00 00 
  80130b:	48 89 c7             	mov    %rax,%rdi
  80130e:	b8 00 00 00 00       	mov    $0x0,%eax
  801313:	49 b8 f5 15 80 00 00 	movabs $0x8015f5,%r8
  80131a:	00 00 00 
  80131d:	41 ff d0             	callq  *%r8
  801320:	e9 c1 02 00 00       	jmpq   8015e6 <vprintfmt+0x509>
  801325:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801329:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80132d:	4c 89 e1             	mov    %r12,%rcx
  801330:	48 ba ea 5a 80 00 00 	movabs $0x805aea,%rdx
  801337:	00 00 00 
  80133a:	48 89 c7             	mov    %rax,%rdi
  80133d:	b8 00 00 00 00       	mov    $0x0,%eax
  801342:	49 b8 f5 15 80 00 00 	movabs $0x8015f5,%r8
  801349:	00 00 00 
  80134c:	41 ff d0             	callq  *%r8
  80134f:	e9 92 02 00 00       	jmpq   8015e6 <vprintfmt+0x509>
  801354:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801357:	83 f8 30             	cmp    $0x30,%eax
  80135a:	73 17                	jae    801373 <vprintfmt+0x296>
  80135c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801360:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801363:	89 c0                	mov    %eax,%eax
  801365:	48 01 d0             	add    %rdx,%rax
  801368:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80136b:	83 c2 08             	add    $0x8,%edx
  80136e:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801371:	eb 0f                	jmp    801382 <vprintfmt+0x2a5>
  801373:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  801377:	48 89 d0             	mov    %rdx,%rax
  80137a:	48 83 c2 08          	add    $0x8,%rdx
  80137e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801382:	4c 8b 20             	mov    (%rax),%r12
  801385:	4d 85 e4             	test   %r12,%r12
  801388:	75 0a                	jne    801394 <vprintfmt+0x2b7>
  80138a:	49 bc ed 5a 80 00 00 	movabs $0x805aed,%r12
  801391:	00 00 00 
  801394:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801398:	7e 3f                	jle    8013d9 <vprintfmt+0x2fc>
  80139a:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  80139e:	74 39                	je     8013d9 <vprintfmt+0x2fc>
  8013a0:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8013a3:	48 98                	cltq   
  8013a5:	48 89 c6             	mov    %rax,%rsi
  8013a8:	4c 89 e7             	mov    %r12,%rdi
  8013ab:	48 b8 a1 18 80 00 00 	movabs $0x8018a1,%rax
  8013b2:	00 00 00 
  8013b5:	ff d0                	callq  *%rax
  8013b7:	29 45 dc             	sub    %eax,-0x24(%rbp)
  8013ba:	eb 17                	jmp    8013d3 <vprintfmt+0x2f6>
  8013bc:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  8013c0:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8013c4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8013c8:	48 89 ce             	mov    %rcx,%rsi
  8013cb:	89 d7                	mov    %edx,%edi
  8013cd:	ff d0                	callq  *%rax
  8013cf:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8013d3:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8013d7:	7f e3                	jg     8013bc <vprintfmt+0x2df>
  8013d9:	eb 37                	jmp    801412 <vprintfmt+0x335>
  8013db:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  8013df:	74 1e                	je     8013ff <vprintfmt+0x322>
  8013e1:	83 fb 1f             	cmp    $0x1f,%ebx
  8013e4:	7e 05                	jle    8013eb <vprintfmt+0x30e>
  8013e6:	83 fb 7e             	cmp    $0x7e,%ebx
  8013e9:	7e 14                	jle    8013ff <vprintfmt+0x322>
  8013eb:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8013ef:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8013f3:	48 89 d6             	mov    %rdx,%rsi
  8013f6:	bf 3f 00 00 00       	mov    $0x3f,%edi
  8013fb:	ff d0                	callq  *%rax
  8013fd:	eb 0f                	jmp    80140e <vprintfmt+0x331>
  8013ff:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801403:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801407:	48 89 d6             	mov    %rdx,%rsi
  80140a:	89 df                	mov    %ebx,%edi
  80140c:	ff d0                	callq  *%rax
  80140e:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801412:	4c 89 e0             	mov    %r12,%rax
  801415:	4c 8d 60 01          	lea    0x1(%rax),%r12
  801419:	0f b6 00             	movzbl (%rax),%eax
  80141c:	0f be d8             	movsbl %al,%ebx
  80141f:	85 db                	test   %ebx,%ebx
  801421:	74 10                	je     801433 <vprintfmt+0x356>
  801423:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801427:	78 b2                	js     8013db <vprintfmt+0x2fe>
  801429:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  80142d:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801431:	79 a8                	jns    8013db <vprintfmt+0x2fe>
  801433:	eb 16                	jmp    80144b <vprintfmt+0x36e>
  801435:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801439:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80143d:	48 89 d6             	mov    %rdx,%rsi
  801440:	bf 20 00 00 00       	mov    $0x20,%edi
  801445:	ff d0                	callq  *%rax
  801447:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  80144b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80144f:	7f e4                	jg     801435 <vprintfmt+0x358>
  801451:	e9 90 01 00 00       	jmpq   8015e6 <vprintfmt+0x509>
  801456:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80145a:	be 03 00 00 00       	mov    $0x3,%esi
  80145f:	48 89 c7             	mov    %rax,%rdi
  801462:	48 b8 cd 0f 80 00 00 	movabs $0x800fcd,%rax
  801469:	00 00 00 
  80146c:	ff d0                	callq  *%rax
  80146e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801472:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801476:	48 85 c0             	test   %rax,%rax
  801479:	79 1d                	jns    801498 <vprintfmt+0x3bb>
  80147b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80147f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801483:	48 89 d6             	mov    %rdx,%rsi
  801486:	bf 2d 00 00 00       	mov    $0x2d,%edi
  80148b:	ff d0                	callq  *%rax
  80148d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801491:	48 f7 d8             	neg    %rax
  801494:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801498:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  80149f:	e9 d5 00 00 00       	jmpq   801579 <vprintfmt+0x49c>
  8014a4:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8014a8:	be 03 00 00 00       	mov    $0x3,%esi
  8014ad:	48 89 c7             	mov    %rax,%rdi
  8014b0:	48 b8 bd 0e 80 00 00 	movabs $0x800ebd,%rax
  8014b7:	00 00 00 
  8014ba:	ff d0                	callq  *%rax
  8014bc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8014c0:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  8014c7:	e9 ad 00 00 00       	jmpq   801579 <vprintfmt+0x49c>
  8014cc:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8014d0:	be 03 00 00 00       	mov    $0x3,%esi
  8014d5:	48 89 c7             	mov    %rax,%rdi
  8014d8:	48 b8 bd 0e 80 00 00 	movabs $0x800ebd,%rax
  8014df:	00 00 00 
  8014e2:	ff d0                	callq  *%rax
  8014e4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8014e8:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  8014ef:	e9 85 00 00 00       	jmpq   801579 <vprintfmt+0x49c>
  8014f4:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8014f8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8014fc:	48 89 d6             	mov    %rdx,%rsi
  8014ff:	bf 30 00 00 00       	mov    $0x30,%edi
  801504:	ff d0                	callq  *%rax
  801506:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80150a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80150e:	48 89 d6             	mov    %rdx,%rsi
  801511:	bf 78 00 00 00       	mov    $0x78,%edi
  801516:	ff d0                	callq  *%rax
  801518:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80151b:	83 f8 30             	cmp    $0x30,%eax
  80151e:	73 17                	jae    801537 <vprintfmt+0x45a>
  801520:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801524:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801527:	89 c0                	mov    %eax,%eax
  801529:	48 01 d0             	add    %rdx,%rax
  80152c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80152f:	83 c2 08             	add    $0x8,%edx
  801532:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801535:	eb 0f                	jmp    801546 <vprintfmt+0x469>
  801537:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80153b:	48 89 d0             	mov    %rdx,%rax
  80153e:	48 83 c2 08          	add    $0x8,%rdx
  801542:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801546:	48 8b 00             	mov    (%rax),%rax
  801549:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80154d:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801554:	eb 23                	jmp    801579 <vprintfmt+0x49c>
  801556:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80155a:	be 03 00 00 00       	mov    $0x3,%esi
  80155f:	48 89 c7             	mov    %rax,%rdi
  801562:	48 b8 bd 0e 80 00 00 	movabs $0x800ebd,%rax
  801569:	00 00 00 
  80156c:	ff d0                	callq  *%rax
  80156e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801572:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801579:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  80157e:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  801581:	8b 7d dc             	mov    -0x24(%rbp),%edi
  801584:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801588:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  80158c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801590:	45 89 c1             	mov    %r8d,%r9d
  801593:	41 89 f8             	mov    %edi,%r8d
  801596:	48 89 c7             	mov    %rax,%rdi
  801599:	48 b8 02 0e 80 00 00 	movabs $0x800e02,%rax
  8015a0:	00 00 00 
  8015a3:	ff d0                	callq  *%rax
  8015a5:	eb 3f                	jmp    8015e6 <vprintfmt+0x509>
  8015a7:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8015ab:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8015af:	48 89 d6             	mov    %rdx,%rsi
  8015b2:	89 df                	mov    %ebx,%edi
  8015b4:	ff d0                	callq  *%rax
  8015b6:	eb 2e                	jmp    8015e6 <vprintfmt+0x509>
  8015b8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8015bc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8015c0:	48 89 d6             	mov    %rdx,%rsi
  8015c3:	bf 25 00 00 00       	mov    $0x25,%edi
  8015c8:	ff d0                	callq  *%rax
  8015ca:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  8015cf:	eb 05                	jmp    8015d6 <vprintfmt+0x4f9>
  8015d1:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  8015d6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8015da:	48 83 e8 01          	sub    $0x1,%rax
  8015de:	0f b6 00             	movzbl (%rax),%eax
  8015e1:	3c 25                	cmp    $0x25,%al
  8015e3:	75 ec                	jne    8015d1 <vprintfmt+0x4f4>
  8015e5:	90                   	nop
  8015e6:	90                   	nop
  8015e7:	e9 43 fb ff ff       	jmpq   80112f <vprintfmt+0x52>
  8015ec:	48 83 c4 60          	add    $0x60,%rsp
  8015f0:	5b                   	pop    %rbx
  8015f1:	41 5c                	pop    %r12
  8015f3:	5d                   	pop    %rbp
  8015f4:	c3                   	retq   

00000000008015f5 <printfmt>:
  8015f5:	55                   	push   %rbp
  8015f6:	48 89 e5             	mov    %rsp,%rbp
  8015f9:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  801600:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  801607:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  80160e:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801615:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80161c:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801623:	84 c0                	test   %al,%al
  801625:	74 20                	je     801647 <printfmt+0x52>
  801627:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80162b:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80162f:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801633:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801637:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80163b:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80163f:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801643:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801647:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  80164e:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  801655:	00 00 00 
  801658:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  80165f:	00 00 00 
  801662:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801666:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80166d:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801674:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  80167b:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  801682:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  801689:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  801690:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  801697:	48 89 c7             	mov    %rax,%rdi
  80169a:	48 b8 dd 10 80 00 00 	movabs $0x8010dd,%rax
  8016a1:	00 00 00 
  8016a4:	ff d0                	callq  *%rax
  8016a6:	c9                   	leaveq 
  8016a7:	c3                   	retq   

00000000008016a8 <sprintputch>:
  8016a8:	55                   	push   %rbp
  8016a9:	48 89 e5             	mov    %rsp,%rbp
  8016ac:	48 83 ec 10          	sub    $0x10,%rsp
  8016b0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8016b3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8016b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016bb:	8b 40 10             	mov    0x10(%rax),%eax
  8016be:	8d 50 01             	lea    0x1(%rax),%edx
  8016c1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016c5:	89 50 10             	mov    %edx,0x10(%rax)
  8016c8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016cc:	48 8b 10             	mov    (%rax),%rdx
  8016cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016d3:	48 8b 40 08          	mov    0x8(%rax),%rax
  8016d7:	48 39 c2             	cmp    %rax,%rdx
  8016da:	73 17                	jae    8016f3 <sprintputch+0x4b>
  8016dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016e0:	48 8b 00             	mov    (%rax),%rax
  8016e3:	48 8d 48 01          	lea    0x1(%rax),%rcx
  8016e7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8016eb:	48 89 0a             	mov    %rcx,(%rdx)
  8016ee:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8016f1:	88 10                	mov    %dl,(%rax)
  8016f3:	c9                   	leaveq 
  8016f4:	c3                   	retq   

00000000008016f5 <vsnprintf>:
  8016f5:	55                   	push   %rbp
  8016f6:	48 89 e5             	mov    %rsp,%rbp
  8016f9:	48 83 ec 50          	sub    $0x50,%rsp
  8016fd:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  801701:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  801704:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  801708:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  80170c:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  801710:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  801714:	48 8b 0a             	mov    (%rdx),%rcx
  801717:	48 89 08             	mov    %rcx,(%rax)
  80171a:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80171e:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801722:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801726:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80172a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80172e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  801732:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801735:	48 98                	cltq   
  801737:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80173b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80173f:	48 01 d0             	add    %rdx,%rax
  801742:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801746:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80174d:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  801752:	74 06                	je     80175a <vsnprintf+0x65>
  801754:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801758:	7f 07                	jg     801761 <vsnprintf+0x6c>
  80175a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80175f:	eb 2f                	jmp    801790 <vsnprintf+0x9b>
  801761:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801765:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801769:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80176d:	48 89 c6             	mov    %rax,%rsi
  801770:	48 bf a8 16 80 00 00 	movabs $0x8016a8,%rdi
  801777:	00 00 00 
  80177a:	48 b8 dd 10 80 00 00 	movabs $0x8010dd,%rax
  801781:	00 00 00 
  801784:	ff d0                	callq  *%rax
  801786:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80178a:	c6 00 00             	movb   $0x0,(%rax)
  80178d:	8b 45 e0             	mov    -0x20(%rbp),%eax
  801790:	c9                   	leaveq 
  801791:	c3                   	retq   

0000000000801792 <snprintf>:
  801792:	55                   	push   %rbp
  801793:	48 89 e5             	mov    %rsp,%rbp
  801796:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  80179d:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8017a4:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  8017aa:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8017b1:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8017b8:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8017bf:	84 c0                	test   %al,%al
  8017c1:	74 20                	je     8017e3 <snprintf+0x51>
  8017c3:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8017c7:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8017cb:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8017cf:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8017d3:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8017d7:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8017db:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8017df:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8017e3:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  8017ea:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  8017f1:	00 00 00 
  8017f4:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8017fb:	00 00 00 
  8017fe:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801802:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801809:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801810:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801817:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80181e:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801825:	48 8b 0a             	mov    (%rdx),%rcx
  801828:	48 89 08             	mov    %rcx,(%rax)
  80182b:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80182f:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801833:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801837:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80183b:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  801842:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801849:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80184f:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801856:	48 89 c7             	mov    %rax,%rdi
  801859:	48 b8 f5 16 80 00 00 	movabs $0x8016f5,%rax
  801860:	00 00 00 
  801863:	ff d0                	callq  *%rax
  801865:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80186b:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801871:	c9                   	leaveq 
  801872:	c3                   	retq   

0000000000801873 <strlen>:
  801873:	55                   	push   %rbp
  801874:	48 89 e5             	mov    %rsp,%rbp
  801877:	48 83 ec 18          	sub    $0x18,%rsp
  80187b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80187f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801886:	eb 09                	jmp    801891 <strlen+0x1e>
  801888:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80188c:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801891:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801895:	0f b6 00             	movzbl (%rax),%eax
  801898:	84 c0                	test   %al,%al
  80189a:	75 ec                	jne    801888 <strlen+0x15>
  80189c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80189f:	c9                   	leaveq 
  8018a0:	c3                   	retq   

00000000008018a1 <strnlen>:
  8018a1:	55                   	push   %rbp
  8018a2:	48 89 e5             	mov    %rsp,%rbp
  8018a5:	48 83 ec 20          	sub    $0x20,%rsp
  8018a9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8018ad:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8018b1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8018b8:	eb 0e                	jmp    8018c8 <strnlen+0x27>
  8018ba:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8018be:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8018c3:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  8018c8:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8018cd:	74 0b                	je     8018da <strnlen+0x39>
  8018cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018d3:	0f b6 00             	movzbl (%rax),%eax
  8018d6:	84 c0                	test   %al,%al
  8018d8:	75 e0                	jne    8018ba <strnlen+0x19>
  8018da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018dd:	c9                   	leaveq 
  8018de:	c3                   	retq   

00000000008018df <strcpy>:
  8018df:	55                   	push   %rbp
  8018e0:	48 89 e5             	mov    %rsp,%rbp
  8018e3:	48 83 ec 20          	sub    $0x20,%rsp
  8018e7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8018eb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8018ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018f3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8018f7:	90                   	nop
  8018f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018fc:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801900:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801904:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801908:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80190c:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801910:	0f b6 12             	movzbl (%rdx),%edx
  801913:	88 10                	mov    %dl,(%rax)
  801915:	0f b6 00             	movzbl (%rax),%eax
  801918:	84 c0                	test   %al,%al
  80191a:	75 dc                	jne    8018f8 <strcpy+0x19>
  80191c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801920:	c9                   	leaveq 
  801921:	c3                   	retq   

0000000000801922 <strcat>:
  801922:	55                   	push   %rbp
  801923:	48 89 e5             	mov    %rsp,%rbp
  801926:	48 83 ec 20          	sub    $0x20,%rsp
  80192a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80192e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801932:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801936:	48 89 c7             	mov    %rax,%rdi
  801939:	48 b8 73 18 80 00 00 	movabs $0x801873,%rax
  801940:	00 00 00 
  801943:	ff d0                	callq  *%rax
  801945:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801948:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80194b:	48 63 d0             	movslq %eax,%rdx
  80194e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801952:	48 01 c2             	add    %rax,%rdx
  801955:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801959:	48 89 c6             	mov    %rax,%rsi
  80195c:	48 89 d7             	mov    %rdx,%rdi
  80195f:	48 b8 df 18 80 00 00 	movabs $0x8018df,%rax
  801966:	00 00 00 
  801969:	ff d0                	callq  *%rax
  80196b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80196f:	c9                   	leaveq 
  801970:	c3                   	retq   

0000000000801971 <strncpy>:
  801971:	55                   	push   %rbp
  801972:	48 89 e5             	mov    %rsp,%rbp
  801975:	48 83 ec 28          	sub    $0x28,%rsp
  801979:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80197d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801981:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801985:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801989:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80198d:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801994:	00 
  801995:	eb 2a                	jmp    8019c1 <strncpy+0x50>
  801997:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80199b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80199f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8019a3:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8019a7:	0f b6 12             	movzbl (%rdx),%edx
  8019aa:	88 10                	mov    %dl,(%rax)
  8019ac:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8019b0:	0f b6 00             	movzbl (%rax),%eax
  8019b3:	84 c0                	test   %al,%al
  8019b5:	74 05                	je     8019bc <strncpy+0x4b>
  8019b7:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  8019bc:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8019c1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8019c5:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8019c9:	72 cc                	jb     801997 <strncpy+0x26>
  8019cb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8019cf:	c9                   	leaveq 
  8019d0:	c3                   	retq   

00000000008019d1 <strlcpy>:
  8019d1:	55                   	push   %rbp
  8019d2:	48 89 e5             	mov    %rsp,%rbp
  8019d5:	48 83 ec 28          	sub    $0x28,%rsp
  8019d9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8019dd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8019e1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8019e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019e9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8019ed:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8019f2:	74 3d                	je     801a31 <strlcpy+0x60>
  8019f4:	eb 1d                	jmp    801a13 <strlcpy+0x42>
  8019f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019fa:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8019fe:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801a02:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801a06:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801a0a:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801a0e:	0f b6 12             	movzbl (%rdx),%edx
  801a11:	88 10                	mov    %dl,(%rax)
  801a13:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801a18:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801a1d:	74 0b                	je     801a2a <strlcpy+0x59>
  801a1f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801a23:	0f b6 00             	movzbl (%rax),%eax
  801a26:	84 c0                	test   %al,%al
  801a28:	75 cc                	jne    8019f6 <strlcpy+0x25>
  801a2a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a2e:	c6 00 00             	movb   $0x0,(%rax)
  801a31:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801a35:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a39:	48 29 c2             	sub    %rax,%rdx
  801a3c:	48 89 d0             	mov    %rdx,%rax
  801a3f:	c9                   	leaveq 
  801a40:	c3                   	retq   

0000000000801a41 <strcmp>:
  801a41:	55                   	push   %rbp
  801a42:	48 89 e5             	mov    %rsp,%rbp
  801a45:	48 83 ec 10          	sub    $0x10,%rsp
  801a49:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801a4d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a51:	eb 0a                	jmp    801a5d <strcmp+0x1c>
  801a53:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801a58:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801a5d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a61:	0f b6 00             	movzbl (%rax),%eax
  801a64:	84 c0                	test   %al,%al
  801a66:	74 12                	je     801a7a <strcmp+0x39>
  801a68:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a6c:	0f b6 10             	movzbl (%rax),%edx
  801a6f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a73:	0f b6 00             	movzbl (%rax),%eax
  801a76:	38 c2                	cmp    %al,%dl
  801a78:	74 d9                	je     801a53 <strcmp+0x12>
  801a7a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a7e:	0f b6 00             	movzbl (%rax),%eax
  801a81:	0f b6 d0             	movzbl %al,%edx
  801a84:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a88:	0f b6 00             	movzbl (%rax),%eax
  801a8b:	0f b6 c0             	movzbl %al,%eax
  801a8e:	29 c2                	sub    %eax,%edx
  801a90:	89 d0                	mov    %edx,%eax
  801a92:	c9                   	leaveq 
  801a93:	c3                   	retq   

0000000000801a94 <strncmp>:
  801a94:	55                   	push   %rbp
  801a95:	48 89 e5             	mov    %rsp,%rbp
  801a98:	48 83 ec 18          	sub    $0x18,%rsp
  801a9c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801aa0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801aa4:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801aa8:	eb 0f                	jmp    801ab9 <strncmp+0x25>
  801aaa:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801aaf:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801ab4:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801ab9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801abe:	74 1d                	je     801add <strncmp+0x49>
  801ac0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ac4:	0f b6 00             	movzbl (%rax),%eax
  801ac7:	84 c0                	test   %al,%al
  801ac9:	74 12                	je     801add <strncmp+0x49>
  801acb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801acf:	0f b6 10             	movzbl (%rax),%edx
  801ad2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ad6:	0f b6 00             	movzbl (%rax),%eax
  801ad9:	38 c2                	cmp    %al,%dl
  801adb:	74 cd                	je     801aaa <strncmp+0x16>
  801add:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801ae2:	75 07                	jne    801aeb <strncmp+0x57>
  801ae4:	b8 00 00 00 00       	mov    $0x0,%eax
  801ae9:	eb 18                	jmp    801b03 <strncmp+0x6f>
  801aeb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801aef:	0f b6 00             	movzbl (%rax),%eax
  801af2:	0f b6 d0             	movzbl %al,%edx
  801af5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801af9:	0f b6 00             	movzbl (%rax),%eax
  801afc:	0f b6 c0             	movzbl %al,%eax
  801aff:	29 c2                	sub    %eax,%edx
  801b01:	89 d0                	mov    %edx,%eax
  801b03:	c9                   	leaveq 
  801b04:	c3                   	retq   

0000000000801b05 <strchr>:
  801b05:	55                   	push   %rbp
  801b06:	48 89 e5             	mov    %rsp,%rbp
  801b09:	48 83 ec 0c          	sub    $0xc,%rsp
  801b0d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b11:	89 f0                	mov    %esi,%eax
  801b13:	88 45 f4             	mov    %al,-0xc(%rbp)
  801b16:	eb 17                	jmp    801b2f <strchr+0x2a>
  801b18:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b1c:	0f b6 00             	movzbl (%rax),%eax
  801b1f:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801b22:	75 06                	jne    801b2a <strchr+0x25>
  801b24:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b28:	eb 15                	jmp    801b3f <strchr+0x3a>
  801b2a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801b2f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b33:	0f b6 00             	movzbl (%rax),%eax
  801b36:	84 c0                	test   %al,%al
  801b38:	75 de                	jne    801b18 <strchr+0x13>
  801b3a:	b8 00 00 00 00       	mov    $0x0,%eax
  801b3f:	c9                   	leaveq 
  801b40:	c3                   	retq   

0000000000801b41 <strfind>:
  801b41:	55                   	push   %rbp
  801b42:	48 89 e5             	mov    %rsp,%rbp
  801b45:	48 83 ec 0c          	sub    $0xc,%rsp
  801b49:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b4d:	89 f0                	mov    %esi,%eax
  801b4f:	88 45 f4             	mov    %al,-0xc(%rbp)
  801b52:	eb 13                	jmp    801b67 <strfind+0x26>
  801b54:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b58:	0f b6 00             	movzbl (%rax),%eax
  801b5b:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801b5e:	75 02                	jne    801b62 <strfind+0x21>
  801b60:	eb 10                	jmp    801b72 <strfind+0x31>
  801b62:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801b67:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b6b:	0f b6 00             	movzbl (%rax),%eax
  801b6e:	84 c0                	test   %al,%al
  801b70:	75 e2                	jne    801b54 <strfind+0x13>
  801b72:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b76:	c9                   	leaveq 
  801b77:	c3                   	retq   

0000000000801b78 <memset>:
  801b78:	55                   	push   %rbp
  801b79:	48 89 e5             	mov    %rsp,%rbp
  801b7c:	48 83 ec 18          	sub    $0x18,%rsp
  801b80:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b84:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801b87:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801b8b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801b90:	75 06                	jne    801b98 <memset+0x20>
  801b92:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b96:	eb 69                	jmp    801c01 <memset+0x89>
  801b98:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b9c:	83 e0 03             	and    $0x3,%eax
  801b9f:	48 85 c0             	test   %rax,%rax
  801ba2:	75 48                	jne    801bec <memset+0x74>
  801ba4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ba8:	83 e0 03             	and    $0x3,%eax
  801bab:	48 85 c0             	test   %rax,%rax
  801bae:	75 3c                	jne    801bec <memset+0x74>
  801bb0:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801bb7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801bba:	c1 e0 18             	shl    $0x18,%eax
  801bbd:	89 c2                	mov    %eax,%edx
  801bbf:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801bc2:	c1 e0 10             	shl    $0x10,%eax
  801bc5:	09 c2                	or     %eax,%edx
  801bc7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801bca:	c1 e0 08             	shl    $0x8,%eax
  801bcd:	09 d0                	or     %edx,%eax
  801bcf:	09 45 f4             	or     %eax,-0xc(%rbp)
  801bd2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801bd6:	48 c1 e8 02          	shr    $0x2,%rax
  801bda:	48 89 c1             	mov    %rax,%rcx
  801bdd:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801be1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801be4:	48 89 d7             	mov    %rdx,%rdi
  801be7:	fc                   	cld    
  801be8:	f3 ab                	rep stos %eax,%es:(%rdi)
  801bea:	eb 11                	jmp    801bfd <memset+0x85>
  801bec:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801bf0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801bf3:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801bf7:	48 89 d7             	mov    %rdx,%rdi
  801bfa:	fc                   	cld    
  801bfb:	f3 aa                	rep stos %al,%es:(%rdi)
  801bfd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c01:	c9                   	leaveq 
  801c02:	c3                   	retq   

0000000000801c03 <memmove>:
  801c03:	55                   	push   %rbp
  801c04:	48 89 e5             	mov    %rsp,%rbp
  801c07:	48 83 ec 28          	sub    $0x28,%rsp
  801c0b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801c0f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801c13:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801c17:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801c1b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801c1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c23:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801c27:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c2b:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801c2f:	0f 83 88 00 00 00    	jae    801cbd <memmove+0xba>
  801c35:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c39:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801c3d:	48 01 d0             	add    %rdx,%rax
  801c40:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801c44:	76 77                	jbe    801cbd <memmove+0xba>
  801c46:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c4a:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801c4e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c52:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801c56:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c5a:	83 e0 03             	and    $0x3,%eax
  801c5d:	48 85 c0             	test   %rax,%rax
  801c60:	75 3b                	jne    801c9d <memmove+0x9a>
  801c62:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801c66:	83 e0 03             	and    $0x3,%eax
  801c69:	48 85 c0             	test   %rax,%rax
  801c6c:	75 2f                	jne    801c9d <memmove+0x9a>
  801c6e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c72:	83 e0 03             	and    $0x3,%eax
  801c75:	48 85 c0             	test   %rax,%rax
  801c78:	75 23                	jne    801c9d <memmove+0x9a>
  801c7a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801c7e:	48 83 e8 04          	sub    $0x4,%rax
  801c82:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801c86:	48 83 ea 04          	sub    $0x4,%rdx
  801c8a:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801c8e:	48 c1 e9 02          	shr    $0x2,%rcx
  801c92:	48 89 c7             	mov    %rax,%rdi
  801c95:	48 89 d6             	mov    %rdx,%rsi
  801c98:	fd                   	std    
  801c99:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801c9b:	eb 1d                	jmp    801cba <memmove+0xb7>
  801c9d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ca1:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801ca5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ca9:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801cad:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801cb1:	48 89 d7             	mov    %rdx,%rdi
  801cb4:	48 89 c1             	mov    %rax,%rcx
  801cb7:	fd                   	std    
  801cb8:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801cba:	fc                   	cld    
  801cbb:	eb 57                	jmp    801d14 <memmove+0x111>
  801cbd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cc1:	83 e0 03             	and    $0x3,%eax
  801cc4:	48 85 c0             	test   %rax,%rax
  801cc7:	75 36                	jne    801cff <memmove+0xfc>
  801cc9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ccd:	83 e0 03             	and    $0x3,%eax
  801cd0:	48 85 c0             	test   %rax,%rax
  801cd3:	75 2a                	jne    801cff <memmove+0xfc>
  801cd5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801cd9:	83 e0 03             	and    $0x3,%eax
  801cdc:	48 85 c0             	test   %rax,%rax
  801cdf:	75 1e                	jne    801cff <memmove+0xfc>
  801ce1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ce5:	48 c1 e8 02          	shr    $0x2,%rax
  801ce9:	48 89 c1             	mov    %rax,%rcx
  801cec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801cf0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801cf4:	48 89 c7             	mov    %rax,%rdi
  801cf7:	48 89 d6             	mov    %rdx,%rsi
  801cfa:	fc                   	cld    
  801cfb:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801cfd:	eb 15                	jmp    801d14 <memmove+0x111>
  801cff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d03:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801d07:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801d0b:	48 89 c7             	mov    %rax,%rdi
  801d0e:	48 89 d6             	mov    %rdx,%rsi
  801d11:	fc                   	cld    
  801d12:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801d14:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d18:	c9                   	leaveq 
  801d19:	c3                   	retq   

0000000000801d1a <memcpy>:
  801d1a:	55                   	push   %rbp
  801d1b:	48 89 e5             	mov    %rsp,%rbp
  801d1e:	48 83 ec 18          	sub    $0x18,%rsp
  801d22:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d26:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d2a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801d2e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801d32:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801d36:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d3a:	48 89 ce             	mov    %rcx,%rsi
  801d3d:	48 89 c7             	mov    %rax,%rdi
  801d40:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  801d47:	00 00 00 
  801d4a:	ff d0                	callq  *%rax
  801d4c:	c9                   	leaveq 
  801d4d:	c3                   	retq   

0000000000801d4e <memcmp>:
  801d4e:	55                   	push   %rbp
  801d4f:	48 89 e5             	mov    %rsp,%rbp
  801d52:	48 83 ec 28          	sub    $0x28,%rsp
  801d56:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801d5a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801d5e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801d62:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d66:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801d6a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801d6e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801d72:	eb 36                	jmp    801daa <memcmp+0x5c>
  801d74:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d78:	0f b6 10             	movzbl (%rax),%edx
  801d7b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d7f:	0f b6 00             	movzbl (%rax),%eax
  801d82:	38 c2                	cmp    %al,%dl
  801d84:	74 1a                	je     801da0 <memcmp+0x52>
  801d86:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d8a:	0f b6 00             	movzbl (%rax),%eax
  801d8d:	0f b6 d0             	movzbl %al,%edx
  801d90:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d94:	0f b6 00             	movzbl (%rax),%eax
  801d97:	0f b6 c0             	movzbl %al,%eax
  801d9a:	29 c2                	sub    %eax,%edx
  801d9c:	89 d0                	mov    %edx,%eax
  801d9e:	eb 20                	jmp    801dc0 <memcmp+0x72>
  801da0:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801da5:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801daa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801dae:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801db2:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801db6:	48 85 c0             	test   %rax,%rax
  801db9:	75 b9                	jne    801d74 <memcmp+0x26>
  801dbb:	b8 00 00 00 00       	mov    $0x0,%eax
  801dc0:	c9                   	leaveq 
  801dc1:	c3                   	retq   

0000000000801dc2 <memfind>:
  801dc2:	55                   	push   %rbp
  801dc3:	48 89 e5             	mov    %rsp,%rbp
  801dc6:	48 83 ec 28          	sub    $0x28,%rsp
  801dca:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801dce:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801dd1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801dd5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801dd9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801ddd:	48 01 d0             	add    %rdx,%rax
  801de0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801de4:	eb 15                	jmp    801dfb <memfind+0x39>
  801de6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801dea:	0f b6 10             	movzbl (%rax),%edx
  801ded:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801df0:	38 c2                	cmp    %al,%dl
  801df2:	75 02                	jne    801df6 <memfind+0x34>
  801df4:	eb 0f                	jmp    801e05 <memfind+0x43>
  801df6:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801dfb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801dff:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801e03:	72 e1                	jb     801de6 <memfind+0x24>
  801e05:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e09:	c9                   	leaveq 
  801e0a:	c3                   	retq   

0000000000801e0b <strtol>:
  801e0b:	55                   	push   %rbp
  801e0c:	48 89 e5             	mov    %rsp,%rbp
  801e0f:	48 83 ec 34          	sub    $0x34,%rsp
  801e13:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801e17:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801e1b:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801e1e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801e25:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801e2c:	00 
  801e2d:	eb 05                	jmp    801e34 <strtol+0x29>
  801e2f:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801e34:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e38:	0f b6 00             	movzbl (%rax),%eax
  801e3b:	3c 20                	cmp    $0x20,%al
  801e3d:	74 f0                	je     801e2f <strtol+0x24>
  801e3f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e43:	0f b6 00             	movzbl (%rax),%eax
  801e46:	3c 09                	cmp    $0x9,%al
  801e48:	74 e5                	je     801e2f <strtol+0x24>
  801e4a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e4e:	0f b6 00             	movzbl (%rax),%eax
  801e51:	3c 2b                	cmp    $0x2b,%al
  801e53:	75 07                	jne    801e5c <strtol+0x51>
  801e55:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801e5a:	eb 17                	jmp    801e73 <strtol+0x68>
  801e5c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e60:	0f b6 00             	movzbl (%rax),%eax
  801e63:	3c 2d                	cmp    $0x2d,%al
  801e65:	75 0c                	jne    801e73 <strtol+0x68>
  801e67:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801e6c:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801e73:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801e77:	74 06                	je     801e7f <strtol+0x74>
  801e79:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801e7d:	75 28                	jne    801ea7 <strtol+0x9c>
  801e7f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e83:	0f b6 00             	movzbl (%rax),%eax
  801e86:	3c 30                	cmp    $0x30,%al
  801e88:	75 1d                	jne    801ea7 <strtol+0x9c>
  801e8a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e8e:	48 83 c0 01          	add    $0x1,%rax
  801e92:	0f b6 00             	movzbl (%rax),%eax
  801e95:	3c 78                	cmp    $0x78,%al
  801e97:	75 0e                	jne    801ea7 <strtol+0x9c>
  801e99:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801e9e:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801ea5:	eb 2c                	jmp    801ed3 <strtol+0xc8>
  801ea7:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801eab:	75 19                	jne    801ec6 <strtol+0xbb>
  801ead:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801eb1:	0f b6 00             	movzbl (%rax),%eax
  801eb4:	3c 30                	cmp    $0x30,%al
  801eb6:	75 0e                	jne    801ec6 <strtol+0xbb>
  801eb8:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801ebd:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801ec4:	eb 0d                	jmp    801ed3 <strtol+0xc8>
  801ec6:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801eca:	75 07                	jne    801ed3 <strtol+0xc8>
  801ecc:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801ed3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ed7:	0f b6 00             	movzbl (%rax),%eax
  801eda:	3c 2f                	cmp    $0x2f,%al
  801edc:	7e 1d                	jle    801efb <strtol+0xf0>
  801ede:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ee2:	0f b6 00             	movzbl (%rax),%eax
  801ee5:	3c 39                	cmp    $0x39,%al
  801ee7:	7f 12                	jg     801efb <strtol+0xf0>
  801ee9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801eed:	0f b6 00             	movzbl (%rax),%eax
  801ef0:	0f be c0             	movsbl %al,%eax
  801ef3:	83 e8 30             	sub    $0x30,%eax
  801ef6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801ef9:	eb 4e                	jmp    801f49 <strtol+0x13e>
  801efb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801eff:	0f b6 00             	movzbl (%rax),%eax
  801f02:	3c 60                	cmp    $0x60,%al
  801f04:	7e 1d                	jle    801f23 <strtol+0x118>
  801f06:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f0a:	0f b6 00             	movzbl (%rax),%eax
  801f0d:	3c 7a                	cmp    $0x7a,%al
  801f0f:	7f 12                	jg     801f23 <strtol+0x118>
  801f11:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f15:	0f b6 00             	movzbl (%rax),%eax
  801f18:	0f be c0             	movsbl %al,%eax
  801f1b:	83 e8 57             	sub    $0x57,%eax
  801f1e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801f21:	eb 26                	jmp    801f49 <strtol+0x13e>
  801f23:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f27:	0f b6 00             	movzbl (%rax),%eax
  801f2a:	3c 40                	cmp    $0x40,%al
  801f2c:	7e 48                	jle    801f76 <strtol+0x16b>
  801f2e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f32:	0f b6 00             	movzbl (%rax),%eax
  801f35:	3c 5a                	cmp    $0x5a,%al
  801f37:	7f 3d                	jg     801f76 <strtol+0x16b>
  801f39:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f3d:	0f b6 00             	movzbl (%rax),%eax
  801f40:	0f be c0             	movsbl %al,%eax
  801f43:	83 e8 37             	sub    $0x37,%eax
  801f46:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801f49:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801f4c:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801f4f:	7c 02                	jl     801f53 <strtol+0x148>
  801f51:	eb 23                	jmp    801f76 <strtol+0x16b>
  801f53:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801f58:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801f5b:	48 98                	cltq   
  801f5d:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801f62:	48 89 c2             	mov    %rax,%rdx
  801f65:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801f68:	48 98                	cltq   
  801f6a:	48 01 d0             	add    %rdx,%rax
  801f6d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801f71:	e9 5d ff ff ff       	jmpq   801ed3 <strtol+0xc8>
  801f76:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801f7b:	74 0b                	je     801f88 <strtol+0x17d>
  801f7d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801f81:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801f85:	48 89 10             	mov    %rdx,(%rax)
  801f88:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801f8c:	74 09                	je     801f97 <strtol+0x18c>
  801f8e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f92:	48 f7 d8             	neg    %rax
  801f95:	eb 04                	jmp    801f9b <strtol+0x190>
  801f97:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f9b:	c9                   	leaveq 
  801f9c:	c3                   	retq   

0000000000801f9d <strstr>:
  801f9d:	55                   	push   %rbp
  801f9e:	48 89 e5             	mov    %rsp,%rbp
  801fa1:	48 83 ec 30          	sub    $0x30,%rsp
  801fa5:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801fa9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801fad:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801fb1:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801fb5:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801fb9:	0f b6 00             	movzbl (%rax),%eax
  801fbc:	88 45 ff             	mov    %al,-0x1(%rbp)
  801fbf:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801fc3:	75 06                	jne    801fcb <strstr+0x2e>
  801fc5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fc9:	eb 6b                	jmp    802036 <strstr+0x99>
  801fcb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801fcf:	48 89 c7             	mov    %rax,%rdi
  801fd2:	48 b8 73 18 80 00 00 	movabs $0x801873,%rax
  801fd9:	00 00 00 
  801fdc:	ff d0                	callq  *%rax
  801fde:	48 98                	cltq   
  801fe0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801fe4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fe8:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801fec:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801ff0:	0f b6 00             	movzbl (%rax),%eax
  801ff3:	88 45 ef             	mov    %al,-0x11(%rbp)
  801ff6:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801ffa:	75 07                	jne    802003 <strstr+0x66>
  801ffc:	b8 00 00 00 00       	mov    $0x0,%eax
  802001:	eb 33                	jmp    802036 <strstr+0x99>
  802003:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  802007:	3a 45 ff             	cmp    -0x1(%rbp),%al
  80200a:	75 d8                	jne    801fe4 <strstr+0x47>
  80200c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802010:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802014:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802018:	48 89 ce             	mov    %rcx,%rsi
  80201b:	48 89 c7             	mov    %rax,%rdi
  80201e:	48 b8 94 1a 80 00 00 	movabs $0x801a94,%rax
  802025:	00 00 00 
  802028:	ff d0                	callq  *%rax
  80202a:	85 c0                	test   %eax,%eax
  80202c:	75 b6                	jne    801fe4 <strstr+0x47>
  80202e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802032:	48 83 e8 01          	sub    $0x1,%rax
  802036:	c9                   	leaveq 
  802037:	c3                   	retq   

0000000000802038 <syscall>:
  802038:	55                   	push   %rbp
  802039:	48 89 e5             	mov    %rsp,%rbp
  80203c:	53                   	push   %rbx
  80203d:	48 83 ec 48          	sub    $0x48,%rsp
  802041:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802044:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802047:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80204b:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80204f:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  802053:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  802057:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80205a:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80205e:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  802062:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  802066:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  80206a:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80206e:	4c 89 c3             	mov    %r8,%rbx
  802071:	cd 30                	int    $0x30
  802073:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802077:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  80207b:	74 3e                	je     8020bb <syscall+0x83>
  80207d:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802082:	7e 37                	jle    8020bb <syscall+0x83>
  802084:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802088:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80208b:	49 89 d0             	mov    %rdx,%r8
  80208e:	89 c1                	mov    %eax,%ecx
  802090:	48 ba a8 5d 80 00 00 	movabs $0x805da8,%rdx
  802097:	00 00 00 
  80209a:	be 24 00 00 00       	mov    $0x24,%esi
  80209f:	48 bf c5 5d 80 00 00 	movabs $0x805dc5,%rdi
  8020a6:	00 00 00 
  8020a9:	b8 00 00 00 00       	mov    $0x0,%eax
  8020ae:	49 b9 f1 0a 80 00 00 	movabs $0x800af1,%r9
  8020b5:	00 00 00 
  8020b8:	41 ff d1             	callq  *%r9
  8020bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020bf:	48 83 c4 48          	add    $0x48,%rsp
  8020c3:	5b                   	pop    %rbx
  8020c4:	5d                   	pop    %rbp
  8020c5:	c3                   	retq   

00000000008020c6 <sys_cputs>:
  8020c6:	55                   	push   %rbp
  8020c7:	48 89 e5             	mov    %rsp,%rbp
  8020ca:	48 83 ec 20          	sub    $0x20,%rsp
  8020ce:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8020d2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8020d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8020da:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8020de:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8020e5:	00 
  8020e6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8020ec:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8020f2:	48 89 d1             	mov    %rdx,%rcx
  8020f5:	48 89 c2             	mov    %rax,%rdx
  8020f8:	be 00 00 00 00       	mov    $0x0,%esi
  8020fd:	bf 00 00 00 00       	mov    $0x0,%edi
  802102:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802109:	00 00 00 
  80210c:	ff d0                	callq  *%rax
  80210e:	c9                   	leaveq 
  80210f:	c3                   	retq   

0000000000802110 <sys_cgetc>:
  802110:	55                   	push   %rbp
  802111:	48 89 e5             	mov    %rsp,%rbp
  802114:	48 83 ec 10          	sub    $0x10,%rsp
  802118:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80211f:	00 
  802120:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802126:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80212c:	b9 00 00 00 00       	mov    $0x0,%ecx
  802131:	ba 00 00 00 00       	mov    $0x0,%edx
  802136:	be 00 00 00 00       	mov    $0x0,%esi
  80213b:	bf 01 00 00 00       	mov    $0x1,%edi
  802140:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802147:	00 00 00 
  80214a:	ff d0                	callq  *%rax
  80214c:	c9                   	leaveq 
  80214d:	c3                   	retq   

000000000080214e <sys_env_destroy>:
  80214e:	55                   	push   %rbp
  80214f:	48 89 e5             	mov    %rsp,%rbp
  802152:	48 83 ec 10          	sub    $0x10,%rsp
  802156:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802159:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80215c:	48 98                	cltq   
  80215e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802165:	00 
  802166:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80216c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802172:	b9 00 00 00 00       	mov    $0x0,%ecx
  802177:	48 89 c2             	mov    %rax,%rdx
  80217a:	be 01 00 00 00       	mov    $0x1,%esi
  80217f:	bf 03 00 00 00       	mov    $0x3,%edi
  802184:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  80218b:	00 00 00 
  80218e:	ff d0                	callq  *%rax
  802190:	c9                   	leaveq 
  802191:	c3                   	retq   

0000000000802192 <sys_getenvid>:
  802192:	55                   	push   %rbp
  802193:	48 89 e5             	mov    %rsp,%rbp
  802196:	48 83 ec 10          	sub    $0x10,%rsp
  80219a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8021a1:	00 
  8021a2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8021a8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8021ae:	b9 00 00 00 00       	mov    $0x0,%ecx
  8021b3:	ba 00 00 00 00       	mov    $0x0,%edx
  8021b8:	be 00 00 00 00       	mov    $0x0,%esi
  8021bd:	bf 02 00 00 00       	mov    $0x2,%edi
  8021c2:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  8021c9:	00 00 00 
  8021cc:	ff d0                	callq  *%rax
  8021ce:	c9                   	leaveq 
  8021cf:	c3                   	retq   

00000000008021d0 <sys_yield>:
  8021d0:	55                   	push   %rbp
  8021d1:	48 89 e5             	mov    %rsp,%rbp
  8021d4:	48 83 ec 10          	sub    $0x10,%rsp
  8021d8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8021df:	00 
  8021e0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8021e6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8021ec:	b9 00 00 00 00       	mov    $0x0,%ecx
  8021f1:	ba 00 00 00 00       	mov    $0x0,%edx
  8021f6:	be 00 00 00 00       	mov    $0x0,%esi
  8021fb:	bf 0b 00 00 00       	mov    $0xb,%edi
  802200:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802207:	00 00 00 
  80220a:	ff d0                	callq  *%rax
  80220c:	c9                   	leaveq 
  80220d:	c3                   	retq   

000000000080220e <sys_page_alloc>:
  80220e:	55                   	push   %rbp
  80220f:	48 89 e5             	mov    %rsp,%rbp
  802212:	48 83 ec 20          	sub    $0x20,%rsp
  802216:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802219:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80221d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  802220:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802223:	48 63 c8             	movslq %eax,%rcx
  802226:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80222a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80222d:	48 98                	cltq   
  80222f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802236:	00 
  802237:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80223d:	49 89 c8             	mov    %rcx,%r8
  802240:	48 89 d1             	mov    %rdx,%rcx
  802243:	48 89 c2             	mov    %rax,%rdx
  802246:	be 01 00 00 00       	mov    $0x1,%esi
  80224b:	bf 04 00 00 00       	mov    $0x4,%edi
  802250:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802257:	00 00 00 
  80225a:	ff d0                	callq  *%rax
  80225c:	c9                   	leaveq 
  80225d:	c3                   	retq   

000000000080225e <sys_page_map>:
  80225e:	55                   	push   %rbp
  80225f:	48 89 e5             	mov    %rsp,%rbp
  802262:	48 83 ec 30          	sub    $0x30,%rsp
  802266:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802269:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80226d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  802270:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  802274:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802278:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80227b:	48 63 c8             	movslq %eax,%rcx
  80227e:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  802282:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802285:	48 63 f0             	movslq %eax,%rsi
  802288:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80228c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80228f:	48 98                	cltq   
  802291:	48 89 0c 24          	mov    %rcx,(%rsp)
  802295:	49 89 f9             	mov    %rdi,%r9
  802298:	49 89 f0             	mov    %rsi,%r8
  80229b:	48 89 d1             	mov    %rdx,%rcx
  80229e:	48 89 c2             	mov    %rax,%rdx
  8022a1:	be 01 00 00 00       	mov    $0x1,%esi
  8022a6:	bf 05 00 00 00       	mov    $0x5,%edi
  8022ab:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  8022b2:	00 00 00 
  8022b5:	ff d0                	callq  *%rax
  8022b7:	c9                   	leaveq 
  8022b8:	c3                   	retq   

00000000008022b9 <sys_page_unmap>:
  8022b9:	55                   	push   %rbp
  8022ba:	48 89 e5             	mov    %rsp,%rbp
  8022bd:	48 83 ec 20          	sub    $0x20,%rsp
  8022c1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8022c4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8022c8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8022cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022cf:	48 98                	cltq   
  8022d1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8022d8:	00 
  8022d9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8022df:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8022e5:	48 89 d1             	mov    %rdx,%rcx
  8022e8:	48 89 c2             	mov    %rax,%rdx
  8022eb:	be 01 00 00 00       	mov    $0x1,%esi
  8022f0:	bf 06 00 00 00       	mov    $0x6,%edi
  8022f5:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  8022fc:	00 00 00 
  8022ff:	ff d0                	callq  *%rax
  802301:	c9                   	leaveq 
  802302:	c3                   	retq   

0000000000802303 <sys_env_set_status>:
  802303:	55                   	push   %rbp
  802304:	48 89 e5             	mov    %rsp,%rbp
  802307:	48 83 ec 10          	sub    $0x10,%rsp
  80230b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80230e:	89 75 f8             	mov    %esi,-0x8(%rbp)
  802311:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802314:	48 63 d0             	movslq %eax,%rdx
  802317:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80231a:	48 98                	cltq   
  80231c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802323:	00 
  802324:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80232a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802330:	48 89 d1             	mov    %rdx,%rcx
  802333:	48 89 c2             	mov    %rax,%rdx
  802336:	be 01 00 00 00       	mov    $0x1,%esi
  80233b:	bf 08 00 00 00       	mov    $0x8,%edi
  802340:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802347:	00 00 00 
  80234a:	ff d0                	callq  *%rax
  80234c:	c9                   	leaveq 
  80234d:	c3                   	retq   

000000000080234e <sys_env_set_trapframe>:
  80234e:	55                   	push   %rbp
  80234f:	48 89 e5             	mov    %rsp,%rbp
  802352:	48 83 ec 20          	sub    $0x20,%rsp
  802356:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802359:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80235d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802361:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802364:	48 98                	cltq   
  802366:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80236d:	00 
  80236e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802374:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80237a:	48 89 d1             	mov    %rdx,%rcx
  80237d:	48 89 c2             	mov    %rax,%rdx
  802380:	be 01 00 00 00       	mov    $0x1,%esi
  802385:	bf 09 00 00 00       	mov    $0x9,%edi
  80238a:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802391:	00 00 00 
  802394:	ff d0                	callq  *%rax
  802396:	c9                   	leaveq 
  802397:	c3                   	retq   

0000000000802398 <sys_env_set_pgfault_upcall>:
  802398:	55                   	push   %rbp
  802399:	48 89 e5             	mov    %rsp,%rbp
  80239c:	48 83 ec 20          	sub    $0x20,%rsp
  8023a0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8023a3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8023a7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8023ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023ae:	48 98                	cltq   
  8023b0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8023b7:	00 
  8023b8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8023be:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8023c4:	48 89 d1             	mov    %rdx,%rcx
  8023c7:	48 89 c2             	mov    %rax,%rdx
  8023ca:	be 01 00 00 00       	mov    $0x1,%esi
  8023cf:	bf 0a 00 00 00       	mov    $0xa,%edi
  8023d4:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  8023db:	00 00 00 
  8023de:	ff d0                	callq  *%rax
  8023e0:	c9                   	leaveq 
  8023e1:	c3                   	retq   

00000000008023e2 <sys_ipc_try_send>:
  8023e2:	55                   	push   %rbp
  8023e3:	48 89 e5             	mov    %rsp,%rbp
  8023e6:	48 83 ec 20          	sub    $0x20,%rsp
  8023ea:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8023ed:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8023f1:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8023f5:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  8023f8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8023fb:	48 63 f0             	movslq %eax,%rsi
  8023fe:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802402:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802405:	48 98                	cltq   
  802407:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80240b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802412:	00 
  802413:	49 89 f1             	mov    %rsi,%r9
  802416:	49 89 c8             	mov    %rcx,%r8
  802419:	48 89 d1             	mov    %rdx,%rcx
  80241c:	48 89 c2             	mov    %rax,%rdx
  80241f:	be 00 00 00 00       	mov    $0x0,%esi
  802424:	bf 0c 00 00 00       	mov    $0xc,%edi
  802429:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802430:	00 00 00 
  802433:	ff d0                	callq  *%rax
  802435:	c9                   	leaveq 
  802436:	c3                   	retq   

0000000000802437 <sys_ipc_recv>:
  802437:	55                   	push   %rbp
  802438:	48 89 e5             	mov    %rsp,%rbp
  80243b:	48 83 ec 10          	sub    $0x10,%rsp
  80243f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802443:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802447:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80244e:	00 
  80244f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802455:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80245b:	b9 00 00 00 00       	mov    $0x0,%ecx
  802460:	48 89 c2             	mov    %rax,%rdx
  802463:	be 01 00 00 00       	mov    $0x1,%esi
  802468:	bf 0d 00 00 00       	mov    $0xd,%edi
  80246d:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802474:	00 00 00 
  802477:	ff d0                	callq  *%rax
  802479:	c9                   	leaveq 
  80247a:	c3                   	retq   

000000000080247b <sys_time_msec>:
  80247b:	55                   	push   %rbp
  80247c:	48 89 e5             	mov    %rsp,%rbp
  80247f:	48 83 ec 10          	sub    $0x10,%rsp
  802483:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80248a:	00 
  80248b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802491:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802497:	b9 00 00 00 00       	mov    $0x0,%ecx
  80249c:	ba 00 00 00 00       	mov    $0x0,%edx
  8024a1:	be 00 00 00 00       	mov    $0x0,%esi
  8024a6:	bf 0e 00 00 00       	mov    $0xe,%edi
  8024ab:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  8024b2:	00 00 00 
  8024b5:	ff d0                	callq  *%rax
  8024b7:	c9                   	leaveq 
  8024b8:	c3                   	retq   

00000000008024b9 <sys_net_transmit>:
  8024b9:	55                   	push   %rbp
  8024ba:	48 89 e5             	mov    %rsp,%rbp
  8024bd:	48 83 ec 20          	sub    $0x20,%rsp
  8024c1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8024c5:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8024c8:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8024cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8024cf:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8024d6:	00 
  8024d7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8024dd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8024e3:	48 89 d1             	mov    %rdx,%rcx
  8024e6:	48 89 c2             	mov    %rax,%rdx
  8024e9:	be 00 00 00 00       	mov    $0x0,%esi
  8024ee:	bf 0f 00 00 00       	mov    $0xf,%edi
  8024f3:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  8024fa:	00 00 00 
  8024fd:	ff d0                	callq  *%rax
  8024ff:	c9                   	leaveq 
  802500:	c3                   	retq   

0000000000802501 <sys_net_receive>:
  802501:	55                   	push   %rbp
  802502:	48 89 e5             	mov    %rsp,%rbp
  802505:	48 83 ec 20          	sub    $0x20,%rsp
  802509:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80250d:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802510:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802513:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802517:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80251e:	00 
  80251f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802525:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80252b:	48 89 d1             	mov    %rdx,%rcx
  80252e:	48 89 c2             	mov    %rax,%rdx
  802531:	be 00 00 00 00       	mov    $0x0,%esi
  802536:	bf 10 00 00 00       	mov    $0x10,%edi
  80253b:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802542:	00 00 00 
  802545:	ff d0                	callq  *%rax
  802547:	c9                   	leaveq 
  802548:	c3                   	retq   

0000000000802549 <sys_ept_map>:
  802549:	55                   	push   %rbp
  80254a:	48 89 e5             	mov    %rsp,%rbp
  80254d:	48 83 ec 30          	sub    $0x30,%rsp
  802551:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802554:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802558:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80255b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  80255f:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802563:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802566:	48 63 c8             	movslq %eax,%rcx
  802569:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  80256d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802570:	48 63 f0             	movslq %eax,%rsi
  802573:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802577:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80257a:	48 98                	cltq   
  80257c:	48 89 0c 24          	mov    %rcx,(%rsp)
  802580:	49 89 f9             	mov    %rdi,%r9
  802583:	49 89 f0             	mov    %rsi,%r8
  802586:	48 89 d1             	mov    %rdx,%rcx
  802589:	48 89 c2             	mov    %rax,%rdx
  80258c:	be 00 00 00 00       	mov    $0x0,%esi
  802591:	bf 11 00 00 00       	mov    $0x11,%edi
  802596:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  80259d:	00 00 00 
  8025a0:	ff d0                	callq  *%rax
  8025a2:	c9                   	leaveq 
  8025a3:	c3                   	retq   

00000000008025a4 <sys_env_mkguest>:
  8025a4:	55                   	push   %rbp
  8025a5:	48 89 e5             	mov    %rsp,%rbp
  8025a8:	48 83 ec 20          	sub    $0x20,%rsp
  8025ac:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8025b0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8025b4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8025b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8025bc:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8025c3:	00 
  8025c4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8025ca:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8025d0:	48 89 d1             	mov    %rdx,%rcx
  8025d3:	48 89 c2             	mov    %rax,%rdx
  8025d6:	be 00 00 00 00       	mov    $0x0,%esi
  8025db:	bf 12 00 00 00       	mov    $0x12,%edi
  8025e0:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  8025e7:	00 00 00 
  8025ea:	ff d0                	callq  *%rax
  8025ec:	c9                   	leaveq 
  8025ed:	c3                   	retq   

00000000008025ee <pgfault>:
  8025ee:	55                   	push   %rbp
  8025ef:	48 89 e5             	mov    %rsp,%rbp
  8025f2:	48 83 ec 30          	sub    $0x30,%rsp
  8025f6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8025fa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8025fe:	48 8b 00             	mov    (%rax),%rax
  802601:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802605:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802609:	48 8b 40 08          	mov    0x8(%rax),%rax
  80260d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802610:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802613:	83 e0 02             	and    $0x2,%eax
  802616:	85 c0                	test   %eax,%eax
  802618:	75 40                	jne    80265a <pgfault+0x6c>
  80261a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80261e:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  802625:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802629:	49 89 d0             	mov    %rdx,%r8
  80262c:	48 89 c1             	mov    %rax,%rcx
  80262f:	48 ba d8 5d 80 00 00 	movabs $0x805dd8,%rdx
  802636:	00 00 00 
  802639:	be 1f 00 00 00       	mov    $0x1f,%esi
  80263e:	48 bf f1 5d 80 00 00 	movabs $0x805df1,%rdi
  802645:	00 00 00 
  802648:	b8 00 00 00 00       	mov    $0x0,%eax
  80264d:	49 b9 f1 0a 80 00 00 	movabs $0x800af1,%r9
  802654:	00 00 00 
  802657:	41 ff d1             	callq  *%r9
  80265a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80265e:	48 c1 e8 0c          	shr    $0xc,%rax
  802662:	48 89 c2             	mov    %rax,%rdx
  802665:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80266c:	01 00 00 
  80266f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802673:	25 07 08 00 00       	and    $0x807,%eax
  802678:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  80267e:	74 4e                	je     8026ce <pgfault+0xe0>
  802680:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802684:	48 c1 e8 0c          	shr    $0xc,%rax
  802688:	48 89 c2             	mov    %rax,%rdx
  80268b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802692:	01 00 00 
  802695:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802699:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80269d:	49 89 d0             	mov    %rdx,%r8
  8026a0:	48 89 c1             	mov    %rax,%rcx
  8026a3:	48 ba 00 5e 80 00 00 	movabs $0x805e00,%rdx
  8026aa:	00 00 00 
  8026ad:	be 22 00 00 00       	mov    $0x22,%esi
  8026b2:	48 bf f1 5d 80 00 00 	movabs $0x805df1,%rdi
  8026b9:	00 00 00 
  8026bc:	b8 00 00 00 00       	mov    $0x0,%eax
  8026c1:	49 b9 f1 0a 80 00 00 	movabs $0x800af1,%r9
  8026c8:	00 00 00 
  8026cb:	41 ff d1             	callq  *%r9
  8026ce:	ba 07 00 00 00       	mov    $0x7,%edx
  8026d3:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8026d8:	bf 00 00 00 00       	mov    $0x0,%edi
  8026dd:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  8026e4:	00 00 00 
  8026e7:	ff d0                	callq  *%rax
  8026e9:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8026ec:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8026f0:	79 30                	jns    802722 <pgfault+0x134>
  8026f2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8026f5:	89 c1                	mov    %eax,%ecx
  8026f7:	48 ba 2b 5e 80 00 00 	movabs $0x805e2b,%rdx
  8026fe:	00 00 00 
  802701:	be 30 00 00 00       	mov    $0x30,%esi
  802706:	48 bf f1 5d 80 00 00 	movabs $0x805df1,%rdi
  80270d:	00 00 00 
  802710:	b8 00 00 00 00       	mov    $0x0,%eax
  802715:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  80271c:	00 00 00 
  80271f:	41 ff d0             	callq  *%r8
  802722:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802726:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80272a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80272e:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802734:	ba 00 10 00 00       	mov    $0x1000,%edx
  802739:	48 89 c6             	mov    %rax,%rsi
  80273c:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  802741:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  802748:	00 00 00 
  80274b:	ff d0                	callq  *%rax
  80274d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802751:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802755:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802759:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  80275f:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  802765:	48 89 c1             	mov    %rax,%rcx
  802768:	ba 00 00 00 00       	mov    $0x0,%edx
  80276d:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802772:	bf 00 00 00 00       	mov    $0x0,%edi
  802777:	48 b8 5e 22 80 00 00 	movabs $0x80225e,%rax
  80277e:	00 00 00 
  802781:	ff d0                	callq  *%rax
  802783:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802786:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80278a:	79 30                	jns    8027bc <pgfault+0x1ce>
  80278c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80278f:	89 c1                	mov    %eax,%ecx
  802791:	48 ba 3e 5e 80 00 00 	movabs $0x805e3e,%rdx
  802798:	00 00 00 
  80279b:	be 35 00 00 00       	mov    $0x35,%esi
  8027a0:	48 bf f1 5d 80 00 00 	movabs $0x805df1,%rdi
  8027a7:	00 00 00 
  8027aa:	b8 00 00 00 00       	mov    $0x0,%eax
  8027af:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  8027b6:	00 00 00 
  8027b9:	41 ff d0             	callq  *%r8
  8027bc:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8027c1:	bf 00 00 00 00       	mov    $0x0,%edi
  8027c6:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  8027cd:	00 00 00 
  8027d0:	ff d0                	callq  *%rax
  8027d2:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8027d5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8027d9:	79 30                	jns    80280b <pgfault+0x21d>
  8027db:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8027de:	89 c1                	mov    %eax,%ecx
  8027e0:	48 ba 4f 5e 80 00 00 	movabs $0x805e4f,%rdx
  8027e7:	00 00 00 
  8027ea:	be 39 00 00 00       	mov    $0x39,%esi
  8027ef:	48 bf f1 5d 80 00 00 	movabs $0x805df1,%rdi
  8027f6:	00 00 00 
  8027f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8027fe:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  802805:	00 00 00 
  802808:	41 ff d0             	callq  *%r8
  80280b:	c9                   	leaveq 
  80280c:	c3                   	retq   

000000000080280d <duppage>:
  80280d:	55                   	push   %rbp
  80280e:	48 89 e5             	mov    %rsp,%rbp
  802811:	48 83 ec 30          	sub    $0x30,%rsp
  802815:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802818:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80281b:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80281e:	c1 e0 0c             	shl    $0xc,%eax
  802821:	89 c0                	mov    %eax,%eax
  802823:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802827:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80282e:	01 00 00 
  802831:	8b 55 d8             	mov    -0x28(%rbp),%edx
  802834:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802838:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80283c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802840:	25 02 08 00 00       	and    $0x802,%eax
  802845:	48 85 c0             	test   %rax,%rax
  802848:	74 0e                	je     802858 <duppage+0x4b>
  80284a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80284e:	25 00 04 00 00       	and    $0x400,%eax
  802853:	48 85 c0             	test   %rax,%rax
  802856:	74 70                	je     8028c8 <duppage+0xbb>
  802858:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80285c:	25 07 0e 00 00       	and    $0xe07,%eax
  802861:	89 c6                	mov    %eax,%esi
  802863:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  802867:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80286a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80286e:	41 89 f0             	mov    %esi,%r8d
  802871:	48 89 c6             	mov    %rax,%rsi
  802874:	bf 00 00 00 00       	mov    $0x0,%edi
  802879:	48 b8 5e 22 80 00 00 	movabs $0x80225e,%rax
  802880:	00 00 00 
  802883:	ff d0                	callq  *%rax
  802885:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802888:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80288c:	79 30                	jns    8028be <duppage+0xb1>
  80288e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802891:	89 c1                	mov    %eax,%ecx
  802893:	48 ba 3e 5e 80 00 00 	movabs $0x805e3e,%rdx
  80289a:	00 00 00 
  80289d:	be 63 00 00 00       	mov    $0x63,%esi
  8028a2:	48 bf f1 5d 80 00 00 	movabs $0x805df1,%rdi
  8028a9:	00 00 00 
  8028ac:	b8 00 00 00 00       	mov    $0x0,%eax
  8028b1:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  8028b8:	00 00 00 
  8028bb:	41 ff d0             	callq  *%r8
  8028be:	b8 00 00 00 00       	mov    $0x0,%eax
  8028c3:	e9 c4 00 00 00       	jmpq   80298c <duppage+0x17f>
  8028c8:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8028cc:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8028cf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8028d3:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8028d9:	48 89 c6             	mov    %rax,%rsi
  8028dc:	bf 00 00 00 00       	mov    $0x0,%edi
  8028e1:	48 b8 5e 22 80 00 00 	movabs $0x80225e,%rax
  8028e8:	00 00 00 
  8028eb:	ff d0                	callq  *%rax
  8028ed:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8028f0:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8028f4:	79 30                	jns    802926 <duppage+0x119>
  8028f6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8028f9:	89 c1                	mov    %eax,%ecx
  8028fb:	48 ba 3e 5e 80 00 00 	movabs $0x805e3e,%rdx
  802902:	00 00 00 
  802905:	be 7e 00 00 00       	mov    $0x7e,%esi
  80290a:	48 bf f1 5d 80 00 00 	movabs $0x805df1,%rdi
  802911:	00 00 00 
  802914:	b8 00 00 00 00       	mov    $0x0,%eax
  802919:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  802920:	00 00 00 
  802923:	41 ff d0             	callq  *%r8
  802926:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80292a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80292e:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  802934:	48 89 d1             	mov    %rdx,%rcx
  802937:	ba 00 00 00 00       	mov    $0x0,%edx
  80293c:	48 89 c6             	mov    %rax,%rsi
  80293f:	bf 00 00 00 00       	mov    $0x0,%edi
  802944:	48 b8 5e 22 80 00 00 	movabs $0x80225e,%rax
  80294b:	00 00 00 
  80294e:	ff d0                	callq  *%rax
  802950:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802953:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802957:	79 30                	jns    802989 <duppage+0x17c>
  802959:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80295c:	89 c1                	mov    %eax,%ecx
  80295e:	48 ba 3e 5e 80 00 00 	movabs $0x805e3e,%rdx
  802965:	00 00 00 
  802968:	be 80 00 00 00       	mov    $0x80,%esi
  80296d:	48 bf f1 5d 80 00 00 	movabs $0x805df1,%rdi
  802974:	00 00 00 
  802977:	b8 00 00 00 00       	mov    $0x0,%eax
  80297c:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  802983:	00 00 00 
  802986:	41 ff d0             	callq  *%r8
  802989:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80298c:	c9                   	leaveq 
  80298d:	c3                   	retq   

000000000080298e <fork>:
  80298e:	55                   	push   %rbp
  80298f:	48 89 e5             	mov    %rsp,%rbp
  802992:	48 83 ec 20          	sub    $0x20,%rsp
  802996:	48 bf ee 25 80 00 00 	movabs $0x8025ee,%rdi
  80299d:	00 00 00 
  8029a0:	48 b8 1a 50 80 00 00 	movabs $0x80501a,%rax
  8029a7:	00 00 00 
  8029aa:	ff d0                	callq  *%rax
  8029ac:	b8 07 00 00 00       	mov    $0x7,%eax
  8029b1:	cd 30                	int    $0x30
  8029b3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8029b6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8029b9:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8029bc:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8029c0:	79 08                	jns    8029ca <fork+0x3c>
  8029c2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8029c5:	e9 09 02 00 00       	jmpq   802bd3 <fork+0x245>
  8029ca:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8029ce:	75 3e                	jne    802a0e <fork+0x80>
  8029d0:	48 b8 92 21 80 00 00 	movabs $0x802192,%rax
  8029d7:	00 00 00 
  8029da:	ff d0                	callq  *%rax
  8029dc:	25 ff 03 00 00       	and    $0x3ff,%eax
  8029e1:	48 98                	cltq   
  8029e3:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8029ea:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8029f1:	00 00 00 
  8029f4:	48 01 c2             	add    %rax,%rdx
  8029f7:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  8029fe:	00 00 00 
  802a01:	48 89 10             	mov    %rdx,(%rax)
  802a04:	b8 00 00 00 00       	mov    $0x0,%eax
  802a09:	e9 c5 01 00 00       	jmpq   802bd3 <fork+0x245>
  802a0e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802a15:	e9 a4 00 00 00       	jmpq   802abe <fork+0x130>
  802a1a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a1d:	c1 f8 12             	sar    $0x12,%eax
  802a20:	89 c2                	mov    %eax,%edx
  802a22:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  802a29:	01 00 00 
  802a2c:	48 63 d2             	movslq %edx,%rdx
  802a2f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a33:	83 e0 01             	and    $0x1,%eax
  802a36:	48 85 c0             	test   %rax,%rax
  802a39:	74 21                	je     802a5c <fork+0xce>
  802a3b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a3e:	c1 f8 09             	sar    $0x9,%eax
  802a41:	89 c2                	mov    %eax,%edx
  802a43:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802a4a:	01 00 00 
  802a4d:	48 63 d2             	movslq %edx,%rdx
  802a50:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a54:	83 e0 01             	and    $0x1,%eax
  802a57:	48 85 c0             	test   %rax,%rax
  802a5a:	75 09                	jne    802a65 <fork+0xd7>
  802a5c:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  802a63:	eb 59                	jmp    802abe <fork+0x130>
  802a65:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a68:	05 00 02 00 00       	add    $0x200,%eax
  802a6d:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802a70:	eb 44                	jmp    802ab6 <fork+0x128>
  802a72:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802a79:	01 00 00 
  802a7c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802a7f:	48 63 d2             	movslq %edx,%rdx
  802a82:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a86:	83 e0 05             	and    $0x5,%eax
  802a89:	48 83 f8 05          	cmp    $0x5,%rax
  802a8d:	74 02                	je     802a91 <fork+0x103>
  802a8f:	eb 21                	jmp    802ab2 <fork+0x124>
  802a91:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  802a98:	75 02                	jne    802a9c <fork+0x10e>
  802a9a:	eb 16                	jmp    802ab2 <fork+0x124>
  802a9c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802a9f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802aa2:	89 d6                	mov    %edx,%esi
  802aa4:	89 c7                	mov    %eax,%edi
  802aa6:	48 b8 0d 28 80 00 00 	movabs $0x80280d,%rax
  802aad:	00 00 00 
  802ab0:	ff d0                	callq  *%rax
  802ab2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802ab6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ab9:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  802abc:	7c b4                	jl     802a72 <fork+0xe4>
  802abe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ac1:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  802ac6:	0f 86 4e ff ff ff    	jbe    802a1a <fork+0x8c>
  802acc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802acf:	ba 07 00 00 00       	mov    $0x7,%edx
  802ad4:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  802ad9:	89 c7                	mov    %eax,%edi
  802adb:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  802ae2:	00 00 00 
  802ae5:	ff d0                	callq  *%rax
  802ae7:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802aea:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802aee:	79 30                	jns    802b20 <fork+0x192>
  802af0:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802af3:	89 c1                	mov    %eax,%ecx
  802af5:	48 ba 68 5e 80 00 00 	movabs $0x805e68,%rdx
  802afc:	00 00 00 
  802aff:	be bc 00 00 00       	mov    $0xbc,%esi
  802b04:	48 bf f1 5d 80 00 00 	movabs $0x805df1,%rdi
  802b0b:	00 00 00 
  802b0e:	b8 00 00 00 00       	mov    $0x0,%eax
  802b13:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  802b1a:	00 00 00 
  802b1d:	41 ff d0             	callq  *%r8
  802b20:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802b27:	00 00 00 
  802b2a:	48 8b 00             	mov    (%rax),%rax
  802b2d:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  802b34:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802b37:	48 89 d6             	mov    %rdx,%rsi
  802b3a:	89 c7                	mov    %eax,%edi
  802b3c:	48 b8 98 23 80 00 00 	movabs $0x802398,%rax
  802b43:	00 00 00 
  802b46:	ff d0                	callq  *%rax
  802b48:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802b4b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802b4f:	79 30                	jns    802b81 <fork+0x1f3>
  802b51:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802b54:	89 c1                	mov    %eax,%ecx
  802b56:	48 ba 88 5e 80 00 00 	movabs $0x805e88,%rdx
  802b5d:	00 00 00 
  802b60:	be c0 00 00 00       	mov    $0xc0,%esi
  802b65:	48 bf f1 5d 80 00 00 	movabs $0x805df1,%rdi
  802b6c:	00 00 00 
  802b6f:	b8 00 00 00 00       	mov    $0x0,%eax
  802b74:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  802b7b:	00 00 00 
  802b7e:	41 ff d0             	callq  *%r8
  802b81:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802b84:	be 02 00 00 00       	mov    $0x2,%esi
  802b89:	89 c7                	mov    %eax,%edi
  802b8b:	48 b8 03 23 80 00 00 	movabs $0x802303,%rax
  802b92:	00 00 00 
  802b95:	ff d0                	callq  *%rax
  802b97:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802b9a:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802b9e:	79 30                	jns    802bd0 <fork+0x242>
  802ba0:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802ba3:	89 c1                	mov    %eax,%ecx
  802ba5:	48 ba a7 5e 80 00 00 	movabs $0x805ea7,%rdx
  802bac:	00 00 00 
  802baf:	be c5 00 00 00       	mov    $0xc5,%esi
  802bb4:	48 bf f1 5d 80 00 00 	movabs $0x805df1,%rdi
  802bbb:	00 00 00 
  802bbe:	b8 00 00 00 00       	mov    $0x0,%eax
  802bc3:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  802bca:	00 00 00 
  802bcd:	41 ff d0             	callq  *%r8
  802bd0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802bd3:	c9                   	leaveq 
  802bd4:	c3                   	retq   

0000000000802bd5 <sfork>:
  802bd5:	55                   	push   %rbp
  802bd6:	48 89 e5             	mov    %rsp,%rbp
  802bd9:	48 ba be 5e 80 00 00 	movabs $0x805ebe,%rdx
  802be0:	00 00 00 
  802be3:	be d2 00 00 00       	mov    $0xd2,%esi
  802be8:	48 bf f1 5d 80 00 00 	movabs $0x805df1,%rdi
  802bef:	00 00 00 
  802bf2:	b8 00 00 00 00       	mov    $0x0,%eax
  802bf7:	48 b9 f1 0a 80 00 00 	movabs $0x800af1,%rcx
  802bfe:	00 00 00 
  802c01:	ff d1                	callq  *%rcx

0000000000802c03 <ipc_recv>:
  802c03:	55                   	push   %rbp
  802c04:	48 89 e5             	mov    %rsp,%rbp
  802c07:	48 83 ec 30          	sub    $0x30,%rsp
  802c0b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802c0f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802c13:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802c17:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802c1c:	75 0e                	jne    802c2c <ipc_recv+0x29>
  802c1e:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802c25:	00 00 00 
  802c28:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802c2c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c30:	48 89 c7             	mov    %rax,%rdi
  802c33:	48 b8 37 24 80 00 00 	movabs $0x802437,%rax
  802c3a:	00 00 00 
  802c3d:	ff d0                	callq  *%rax
  802c3f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c42:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c46:	79 27                	jns    802c6f <ipc_recv+0x6c>
  802c48:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802c4d:	74 0a                	je     802c59 <ipc_recv+0x56>
  802c4f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c53:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  802c59:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802c5e:	74 0a                	je     802c6a <ipc_recv+0x67>
  802c60:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c64:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  802c6a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c6d:	eb 53                	jmp    802cc2 <ipc_recv+0xbf>
  802c6f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802c74:	74 19                	je     802c8f <ipc_recv+0x8c>
  802c76:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802c7d:	00 00 00 
  802c80:	48 8b 00             	mov    (%rax),%rax
  802c83:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  802c89:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c8d:	89 10                	mov    %edx,(%rax)
  802c8f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802c94:	74 19                	je     802caf <ipc_recv+0xac>
  802c96:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802c9d:	00 00 00 
  802ca0:	48 8b 00             	mov    (%rax),%rax
  802ca3:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  802ca9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802cad:	89 10                	mov    %edx,(%rax)
  802caf:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802cb6:	00 00 00 
  802cb9:	48 8b 00             	mov    (%rax),%rax
  802cbc:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  802cc2:	c9                   	leaveq 
  802cc3:	c3                   	retq   

0000000000802cc4 <ipc_send>:
  802cc4:	55                   	push   %rbp
  802cc5:	48 89 e5             	mov    %rsp,%rbp
  802cc8:	48 83 ec 30          	sub    $0x30,%rsp
  802ccc:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802ccf:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802cd2:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  802cd6:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  802cd9:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802cde:	75 10                	jne    802cf0 <ipc_send+0x2c>
  802ce0:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802ce7:	00 00 00 
  802cea:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802cee:	eb 0e                	jmp    802cfe <ipc_send+0x3a>
  802cf0:	eb 0c                	jmp    802cfe <ipc_send+0x3a>
  802cf2:	48 b8 d0 21 80 00 00 	movabs $0x8021d0,%rax
  802cf9:	00 00 00 
  802cfc:	ff d0                	callq  *%rax
  802cfe:	8b 75 e8             	mov    -0x18(%rbp),%esi
  802d01:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  802d04:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802d08:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802d0b:	89 c7                	mov    %eax,%edi
  802d0d:	48 b8 e2 23 80 00 00 	movabs $0x8023e2,%rax
  802d14:	00 00 00 
  802d17:	ff d0                	callq  *%rax
  802d19:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d1c:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  802d20:	74 d0                	je     802cf2 <ipc_send+0x2e>
  802d22:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d26:	79 30                	jns    802d58 <ipc_send+0x94>
  802d28:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d2b:	89 c1                	mov    %eax,%ecx
  802d2d:	48 ba d4 5e 80 00 00 	movabs $0x805ed4,%rdx
  802d34:	00 00 00 
  802d37:	be 44 00 00 00       	mov    $0x44,%esi
  802d3c:	48 bf ea 5e 80 00 00 	movabs $0x805eea,%rdi
  802d43:	00 00 00 
  802d46:	b8 00 00 00 00       	mov    $0x0,%eax
  802d4b:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  802d52:	00 00 00 
  802d55:	41 ff d0             	callq  *%r8
  802d58:	c9                   	leaveq 
  802d59:	c3                   	retq   

0000000000802d5a <ipc_host_recv>:
  802d5a:	55                   	push   %rbp
  802d5b:	48 89 e5             	mov    %rsp,%rbp
  802d5e:	53                   	push   %rbx
  802d5f:	48 83 ec 28          	sub    $0x28,%rsp
  802d63:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802d67:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  802d6e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
  802d75:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802d7a:	75 0e                	jne    802d8a <ipc_host_recv+0x30>
  802d7c:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802d83:	00 00 00 
  802d86:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  802d8a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802d8e:	ba 07 00 00 00       	mov    $0x7,%edx
  802d93:	48 89 c6             	mov    %rax,%rsi
  802d96:	bf 00 00 00 00       	mov    $0x0,%edi
  802d9b:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  802da2:	00 00 00 
  802da5:	ff d0                	callq  *%rax
  802da7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802dab:	48 c1 e8 0c          	shr    $0xc,%rax
  802daf:	48 89 c2             	mov    %rax,%rdx
  802db2:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802db9:	01 00 00 
  802dbc:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802dc0:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802dc6:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802dca:	b8 03 00 00 00       	mov    $0x3,%eax
  802dcf:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802dd3:	48 89 d3             	mov    %rdx,%rbx
  802dd6:	0f 01 c1             	vmcall 
  802dd9:	89 f2                	mov    %esi,%edx
  802ddb:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802dde:	89 55 e8             	mov    %edx,-0x18(%rbp)
  802de1:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802de5:	79 05                	jns    802dec <ipc_host_recv+0x92>
  802de7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802dea:	eb 03                	jmp    802def <ipc_host_recv+0x95>
  802dec:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802def:	48 83 c4 28          	add    $0x28,%rsp
  802df3:	5b                   	pop    %rbx
  802df4:	5d                   	pop    %rbp
  802df5:	c3                   	retq   

0000000000802df6 <ipc_host_send>:
  802df6:	55                   	push   %rbp
  802df7:	48 89 e5             	mov    %rsp,%rbp
  802dfa:	53                   	push   %rbx
  802dfb:	48 83 ec 38          	sub    $0x38,%rsp
  802dff:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802e02:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802e05:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  802e09:	89 4d cc             	mov    %ecx,-0x34(%rbp)
  802e0c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  802e13:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  802e18:	75 0e                	jne    802e28 <ipc_host_send+0x32>
  802e1a:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802e21:	00 00 00 
  802e24:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  802e28:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802e2c:	48 c1 e8 0c          	shr    $0xc,%rax
  802e30:	48 89 c2             	mov    %rax,%rdx
  802e33:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802e3a:	01 00 00 
  802e3d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802e41:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802e47:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802e4b:	b8 02 00 00 00       	mov    $0x2,%eax
  802e50:	8b 7d dc             	mov    -0x24(%rbp),%edi
  802e53:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802e56:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802e5a:	8b 75 cc             	mov    -0x34(%rbp),%esi
  802e5d:	89 fb                	mov    %edi,%ebx
  802e5f:	0f 01 c1             	vmcall 
  802e62:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802e65:	eb 26                	jmp    802e8d <ipc_host_send+0x97>
  802e67:	48 b8 d0 21 80 00 00 	movabs $0x8021d0,%rax
  802e6e:	00 00 00 
  802e71:	ff d0                	callq  *%rax
  802e73:	b8 02 00 00 00       	mov    $0x2,%eax
  802e78:	8b 7d dc             	mov    -0x24(%rbp),%edi
  802e7b:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802e7e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802e82:	8b 75 cc             	mov    -0x34(%rbp),%esi
  802e85:	89 fb                	mov    %edi,%ebx
  802e87:	0f 01 c1             	vmcall 
  802e8a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802e8d:	83 7d ec f8          	cmpl   $0xfffffff8,-0x14(%rbp)
  802e91:	74 d4                	je     802e67 <ipc_host_send+0x71>
  802e93:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802e97:	79 55                	jns    802eee <ipc_host_send+0xf8>
  802e99:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e9c:	89 c2                	mov    %eax,%edx
  802e9e:	be 81 00 00 00       	mov    $0x81,%esi
  802ea3:	48 bf f7 5e 80 00 00 	movabs $0x805ef7,%rdi
  802eaa:	00 00 00 
  802ead:	b8 00 00 00 00       	mov    $0x0,%eax
  802eb2:	48 b9 2a 0d 80 00 00 	movabs $0x800d2a,%rcx
  802eb9:	00 00 00 
  802ebc:	ff d1                	callq  *%rcx
  802ebe:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ec1:	89 c1                	mov    %eax,%ecx
  802ec3:	48 ba d4 5e 80 00 00 	movabs $0x805ed4,%rdx
  802eca:	00 00 00 
  802ecd:	be 82 00 00 00       	mov    $0x82,%esi
  802ed2:	48 bf ea 5e 80 00 00 	movabs $0x805eea,%rdi
  802ed9:	00 00 00 
  802edc:	b8 00 00 00 00       	mov    $0x0,%eax
  802ee1:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  802ee8:	00 00 00 
  802eeb:	41 ff d0             	callq  *%r8
  802eee:	48 83 c4 38          	add    $0x38,%rsp
  802ef2:	5b                   	pop    %rbx
  802ef3:	5d                   	pop    %rbp
  802ef4:	c3                   	retq   

0000000000802ef5 <ipc_find_env>:
  802ef5:	55                   	push   %rbp
  802ef6:	48 89 e5             	mov    %rsp,%rbp
  802ef9:	48 83 ec 14          	sub    $0x14,%rsp
  802efd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802f00:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802f07:	eb 4e                	jmp    802f57 <ipc_find_env+0x62>
  802f09:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802f10:	00 00 00 
  802f13:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f16:	48 98                	cltq   
  802f18:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802f1f:	48 01 d0             	add    %rdx,%rax
  802f22:	48 05 d0 00 00 00    	add    $0xd0,%rax
  802f28:	8b 00                	mov    (%rax),%eax
  802f2a:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802f2d:	75 24                	jne    802f53 <ipc_find_env+0x5e>
  802f2f:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802f36:	00 00 00 
  802f39:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f3c:	48 98                	cltq   
  802f3e:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802f45:	48 01 d0             	add    %rdx,%rax
  802f48:	48 05 c0 00 00 00    	add    $0xc0,%rax
  802f4e:	8b 40 08             	mov    0x8(%rax),%eax
  802f51:	eb 12                	jmp    802f65 <ipc_find_env+0x70>
  802f53:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802f57:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  802f5e:	7e a9                	jle    802f09 <ipc_find_env+0x14>
  802f60:	b8 00 00 00 00       	mov    $0x0,%eax
  802f65:	c9                   	leaveq 
  802f66:	c3                   	retq   

0000000000802f67 <fd2num>:
  802f67:	55                   	push   %rbp
  802f68:	48 89 e5             	mov    %rsp,%rbp
  802f6b:	48 83 ec 08          	sub    $0x8,%rsp
  802f6f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802f73:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802f77:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802f7e:	ff ff ff 
  802f81:	48 01 d0             	add    %rdx,%rax
  802f84:	48 c1 e8 0c          	shr    $0xc,%rax
  802f88:	c9                   	leaveq 
  802f89:	c3                   	retq   

0000000000802f8a <fd2data>:
  802f8a:	55                   	push   %rbp
  802f8b:	48 89 e5             	mov    %rsp,%rbp
  802f8e:	48 83 ec 08          	sub    $0x8,%rsp
  802f92:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802f96:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f9a:	48 89 c7             	mov    %rax,%rdi
  802f9d:	48 b8 67 2f 80 00 00 	movabs $0x802f67,%rax
  802fa4:	00 00 00 
  802fa7:	ff d0                	callq  *%rax
  802fa9:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802faf:	48 c1 e0 0c          	shl    $0xc,%rax
  802fb3:	c9                   	leaveq 
  802fb4:	c3                   	retq   

0000000000802fb5 <fd_alloc>:
  802fb5:	55                   	push   %rbp
  802fb6:	48 89 e5             	mov    %rsp,%rbp
  802fb9:	48 83 ec 18          	sub    $0x18,%rsp
  802fbd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802fc1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802fc8:	eb 6b                	jmp    803035 <fd_alloc+0x80>
  802fca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fcd:	48 98                	cltq   
  802fcf:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802fd5:	48 c1 e0 0c          	shl    $0xc,%rax
  802fd9:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802fdd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fe1:	48 c1 e8 15          	shr    $0x15,%rax
  802fe5:	48 89 c2             	mov    %rax,%rdx
  802fe8:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802fef:	01 00 00 
  802ff2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802ff6:	83 e0 01             	and    $0x1,%eax
  802ff9:	48 85 c0             	test   %rax,%rax
  802ffc:	74 21                	je     80301f <fd_alloc+0x6a>
  802ffe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803002:	48 c1 e8 0c          	shr    $0xc,%rax
  803006:	48 89 c2             	mov    %rax,%rdx
  803009:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803010:	01 00 00 
  803013:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803017:	83 e0 01             	and    $0x1,%eax
  80301a:	48 85 c0             	test   %rax,%rax
  80301d:	75 12                	jne    803031 <fd_alloc+0x7c>
  80301f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803023:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803027:	48 89 10             	mov    %rdx,(%rax)
  80302a:	b8 00 00 00 00       	mov    $0x0,%eax
  80302f:	eb 1a                	jmp    80304b <fd_alloc+0x96>
  803031:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803035:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  803039:	7e 8f                	jle    802fca <fd_alloc+0x15>
  80303b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80303f:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  803046:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  80304b:	c9                   	leaveq 
  80304c:	c3                   	retq   

000000000080304d <fd_lookup>:
  80304d:	55                   	push   %rbp
  80304e:	48 89 e5             	mov    %rsp,%rbp
  803051:	48 83 ec 20          	sub    $0x20,%rsp
  803055:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803058:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80305c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803060:	78 06                	js     803068 <fd_lookup+0x1b>
  803062:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  803066:	7e 07                	jle    80306f <fd_lookup+0x22>
  803068:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80306d:	eb 6c                	jmp    8030db <fd_lookup+0x8e>
  80306f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803072:	48 98                	cltq   
  803074:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80307a:	48 c1 e0 0c          	shl    $0xc,%rax
  80307e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803082:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803086:	48 c1 e8 15          	shr    $0x15,%rax
  80308a:	48 89 c2             	mov    %rax,%rdx
  80308d:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  803094:	01 00 00 
  803097:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80309b:	83 e0 01             	and    $0x1,%eax
  80309e:	48 85 c0             	test   %rax,%rax
  8030a1:	74 21                	je     8030c4 <fd_lookup+0x77>
  8030a3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8030a7:	48 c1 e8 0c          	shr    $0xc,%rax
  8030ab:	48 89 c2             	mov    %rax,%rdx
  8030ae:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8030b5:	01 00 00 
  8030b8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8030bc:	83 e0 01             	and    $0x1,%eax
  8030bf:	48 85 c0             	test   %rax,%rax
  8030c2:	75 07                	jne    8030cb <fd_lookup+0x7e>
  8030c4:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8030c9:	eb 10                	jmp    8030db <fd_lookup+0x8e>
  8030cb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8030cf:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8030d3:	48 89 10             	mov    %rdx,(%rax)
  8030d6:	b8 00 00 00 00       	mov    $0x0,%eax
  8030db:	c9                   	leaveq 
  8030dc:	c3                   	retq   

00000000008030dd <fd_close>:
  8030dd:	55                   	push   %rbp
  8030de:	48 89 e5             	mov    %rsp,%rbp
  8030e1:	48 83 ec 30          	sub    $0x30,%rsp
  8030e5:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8030e9:	89 f0                	mov    %esi,%eax
  8030eb:	88 45 d4             	mov    %al,-0x2c(%rbp)
  8030ee:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8030f2:	48 89 c7             	mov    %rax,%rdi
  8030f5:	48 b8 67 2f 80 00 00 	movabs $0x802f67,%rax
  8030fc:	00 00 00 
  8030ff:	ff d0                	callq  *%rax
  803101:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803105:	48 89 d6             	mov    %rdx,%rsi
  803108:	89 c7                	mov    %eax,%edi
  80310a:	48 b8 4d 30 80 00 00 	movabs $0x80304d,%rax
  803111:	00 00 00 
  803114:	ff d0                	callq  *%rax
  803116:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803119:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80311d:	78 0a                	js     803129 <fd_close+0x4c>
  80311f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803123:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  803127:	74 12                	je     80313b <fd_close+0x5e>
  803129:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  80312d:	74 05                	je     803134 <fd_close+0x57>
  80312f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803132:	eb 05                	jmp    803139 <fd_close+0x5c>
  803134:	b8 00 00 00 00       	mov    $0x0,%eax
  803139:	eb 69                	jmp    8031a4 <fd_close+0xc7>
  80313b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80313f:	8b 00                	mov    (%rax),%eax
  803141:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803145:	48 89 d6             	mov    %rdx,%rsi
  803148:	89 c7                	mov    %eax,%edi
  80314a:	48 b8 a6 31 80 00 00 	movabs $0x8031a6,%rax
  803151:	00 00 00 
  803154:	ff d0                	callq  *%rax
  803156:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803159:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80315d:	78 2a                	js     803189 <fd_close+0xac>
  80315f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803163:	48 8b 40 20          	mov    0x20(%rax),%rax
  803167:	48 85 c0             	test   %rax,%rax
  80316a:	74 16                	je     803182 <fd_close+0xa5>
  80316c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803170:	48 8b 40 20          	mov    0x20(%rax),%rax
  803174:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803178:	48 89 d7             	mov    %rdx,%rdi
  80317b:	ff d0                	callq  *%rax
  80317d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803180:	eb 07                	jmp    803189 <fd_close+0xac>
  803182:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803189:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80318d:	48 89 c6             	mov    %rax,%rsi
  803190:	bf 00 00 00 00       	mov    $0x0,%edi
  803195:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  80319c:	00 00 00 
  80319f:	ff d0                	callq  *%rax
  8031a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031a4:	c9                   	leaveq 
  8031a5:	c3                   	retq   

00000000008031a6 <dev_lookup>:
  8031a6:	55                   	push   %rbp
  8031a7:	48 89 e5             	mov    %rsp,%rbp
  8031aa:	48 83 ec 20          	sub    $0x20,%rsp
  8031ae:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8031b1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8031b5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8031bc:	eb 41                	jmp    8031ff <dev_lookup+0x59>
  8031be:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  8031c5:	00 00 00 
  8031c8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8031cb:	48 63 d2             	movslq %edx,%rdx
  8031ce:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8031d2:	8b 00                	mov    (%rax),%eax
  8031d4:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8031d7:	75 22                	jne    8031fb <dev_lookup+0x55>
  8031d9:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  8031e0:	00 00 00 
  8031e3:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8031e6:	48 63 d2             	movslq %edx,%rdx
  8031e9:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8031ed:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8031f1:	48 89 10             	mov    %rdx,(%rax)
  8031f4:	b8 00 00 00 00       	mov    $0x0,%eax
  8031f9:	eb 60                	jmp    80325b <dev_lookup+0xb5>
  8031fb:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8031ff:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  803206:	00 00 00 
  803209:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80320c:	48 63 d2             	movslq %edx,%rdx
  80320f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803213:	48 85 c0             	test   %rax,%rax
  803216:	75 a6                	jne    8031be <dev_lookup+0x18>
  803218:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  80321f:	00 00 00 
  803222:	48 8b 00             	mov    (%rax),%rax
  803225:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80322b:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80322e:	89 c6                	mov    %eax,%esi
  803230:	48 bf 18 5f 80 00 00 	movabs $0x805f18,%rdi
  803237:	00 00 00 
  80323a:	b8 00 00 00 00       	mov    $0x0,%eax
  80323f:	48 b9 2a 0d 80 00 00 	movabs $0x800d2a,%rcx
  803246:	00 00 00 
  803249:	ff d1                	callq  *%rcx
  80324b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80324f:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  803256:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80325b:	c9                   	leaveq 
  80325c:	c3                   	retq   

000000000080325d <close>:
  80325d:	55                   	push   %rbp
  80325e:	48 89 e5             	mov    %rsp,%rbp
  803261:	48 83 ec 20          	sub    $0x20,%rsp
  803265:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803268:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80326c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80326f:	48 89 d6             	mov    %rdx,%rsi
  803272:	89 c7                	mov    %eax,%edi
  803274:	48 b8 4d 30 80 00 00 	movabs $0x80304d,%rax
  80327b:	00 00 00 
  80327e:	ff d0                	callq  *%rax
  803280:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803283:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803287:	79 05                	jns    80328e <close+0x31>
  803289:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80328c:	eb 18                	jmp    8032a6 <close+0x49>
  80328e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803292:	be 01 00 00 00       	mov    $0x1,%esi
  803297:	48 89 c7             	mov    %rax,%rdi
  80329a:	48 b8 dd 30 80 00 00 	movabs $0x8030dd,%rax
  8032a1:	00 00 00 
  8032a4:	ff d0                	callq  *%rax
  8032a6:	c9                   	leaveq 
  8032a7:	c3                   	retq   

00000000008032a8 <close_all>:
  8032a8:	55                   	push   %rbp
  8032a9:	48 89 e5             	mov    %rsp,%rbp
  8032ac:	48 83 ec 10          	sub    $0x10,%rsp
  8032b0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8032b7:	eb 15                	jmp    8032ce <close_all+0x26>
  8032b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032bc:	89 c7                	mov    %eax,%edi
  8032be:	48 b8 5d 32 80 00 00 	movabs $0x80325d,%rax
  8032c5:	00 00 00 
  8032c8:	ff d0                	callq  *%rax
  8032ca:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8032ce:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8032d2:	7e e5                	jle    8032b9 <close_all+0x11>
  8032d4:	c9                   	leaveq 
  8032d5:	c3                   	retq   

00000000008032d6 <dup>:
  8032d6:	55                   	push   %rbp
  8032d7:	48 89 e5             	mov    %rsp,%rbp
  8032da:	48 83 ec 40          	sub    $0x40,%rsp
  8032de:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8032e1:	89 75 c8             	mov    %esi,-0x38(%rbp)
  8032e4:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  8032e8:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8032eb:	48 89 d6             	mov    %rdx,%rsi
  8032ee:	89 c7                	mov    %eax,%edi
  8032f0:	48 b8 4d 30 80 00 00 	movabs $0x80304d,%rax
  8032f7:	00 00 00 
  8032fa:	ff d0                	callq  *%rax
  8032fc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032ff:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803303:	79 08                	jns    80330d <dup+0x37>
  803305:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803308:	e9 70 01 00 00       	jmpq   80347d <dup+0x1a7>
  80330d:	8b 45 c8             	mov    -0x38(%rbp),%eax
  803310:	89 c7                	mov    %eax,%edi
  803312:	48 b8 5d 32 80 00 00 	movabs $0x80325d,%rax
  803319:	00 00 00 
  80331c:	ff d0                	callq  *%rax
  80331e:	8b 45 c8             	mov    -0x38(%rbp),%eax
  803321:	48 98                	cltq   
  803323:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  803329:	48 c1 e0 0c          	shl    $0xc,%rax
  80332d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803331:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803335:	48 89 c7             	mov    %rax,%rdi
  803338:	48 b8 8a 2f 80 00 00 	movabs $0x802f8a,%rax
  80333f:	00 00 00 
  803342:	ff d0                	callq  *%rax
  803344:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803348:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80334c:	48 89 c7             	mov    %rax,%rdi
  80334f:	48 b8 8a 2f 80 00 00 	movabs $0x802f8a,%rax
  803356:	00 00 00 
  803359:	ff d0                	callq  *%rax
  80335b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80335f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803363:	48 c1 e8 15          	shr    $0x15,%rax
  803367:	48 89 c2             	mov    %rax,%rdx
  80336a:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  803371:	01 00 00 
  803374:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803378:	83 e0 01             	and    $0x1,%eax
  80337b:	48 85 c0             	test   %rax,%rax
  80337e:	74 73                	je     8033f3 <dup+0x11d>
  803380:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803384:	48 c1 e8 0c          	shr    $0xc,%rax
  803388:	48 89 c2             	mov    %rax,%rdx
  80338b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803392:	01 00 00 
  803395:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803399:	83 e0 01             	and    $0x1,%eax
  80339c:	48 85 c0             	test   %rax,%rax
  80339f:	74 52                	je     8033f3 <dup+0x11d>
  8033a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8033a5:	48 c1 e8 0c          	shr    $0xc,%rax
  8033a9:	48 89 c2             	mov    %rax,%rdx
  8033ac:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8033b3:	01 00 00 
  8033b6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8033ba:	25 07 0e 00 00       	and    $0xe07,%eax
  8033bf:	89 c1                	mov    %eax,%ecx
  8033c1:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8033c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8033c9:	41 89 c8             	mov    %ecx,%r8d
  8033cc:	48 89 d1             	mov    %rdx,%rcx
  8033cf:	ba 00 00 00 00       	mov    $0x0,%edx
  8033d4:	48 89 c6             	mov    %rax,%rsi
  8033d7:	bf 00 00 00 00       	mov    $0x0,%edi
  8033dc:	48 b8 5e 22 80 00 00 	movabs $0x80225e,%rax
  8033e3:	00 00 00 
  8033e6:	ff d0                	callq  *%rax
  8033e8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033eb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033ef:	79 02                	jns    8033f3 <dup+0x11d>
  8033f1:	eb 57                	jmp    80344a <dup+0x174>
  8033f3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8033f7:	48 c1 e8 0c          	shr    $0xc,%rax
  8033fb:	48 89 c2             	mov    %rax,%rdx
  8033fe:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803405:	01 00 00 
  803408:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80340c:	25 07 0e 00 00       	and    $0xe07,%eax
  803411:	89 c1                	mov    %eax,%ecx
  803413:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803417:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80341b:	41 89 c8             	mov    %ecx,%r8d
  80341e:	48 89 d1             	mov    %rdx,%rcx
  803421:	ba 00 00 00 00       	mov    $0x0,%edx
  803426:	48 89 c6             	mov    %rax,%rsi
  803429:	bf 00 00 00 00       	mov    $0x0,%edi
  80342e:	48 b8 5e 22 80 00 00 	movabs $0x80225e,%rax
  803435:	00 00 00 
  803438:	ff d0                	callq  *%rax
  80343a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80343d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803441:	79 02                	jns    803445 <dup+0x16f>
  803443:	eb 05                	jmp    80344a <dup+0x174>
  803445:	8b 45 c8             	mov    -0x38(%rbp),%eax
  803448:	eb 33                	jmp    80347d <dup+0x1a7>
  80344a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80344e:	48 89 c6             	mov    %rax,%rsi
  803451:	bf 00 00 00 00       	mov    $0x0,%edi
  803456:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  80345d:	00 00 00 
  803460:	ff d0                	callq  *%rax
  803462:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803466:	48 89 c6             	mov    %rax,%rsi
  803469:	bf 00 00 00 00       	mov    $0x0,%edi
  80346e:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  803475:	00 00 00 
  803478:	ff d0                	callq  *%rax
  80347a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80347d:	c9                   	leaveq 
  80347e:	c3                   	retq   

000000000080347f <read>:
  80347f:	55                   	push   %rbp
  803480:	48 89 e5             	mov    %rsp,%rbp
  803483:	48 83 ec 40          	sub    $0x40,%rsp
  803487:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80348a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80348e:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803492:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803496:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803499:	48 89 d6             	mov    %rdx,%rsi
  80349c:	89 c7                	mov    %eax,%edi
  80349e:	48 b8 4d 30 80 00 00 	movabs $0x80304d,%rax
  8034a5:	00 00 00 
  8034a8:	ff d0                	callq  *%rax
  8034aa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034ad:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034b1:	78 24                	js     8034d7 <read+0x58>
  8034b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034b7:	8b 00                	mov    (%rax),%eax
  8034b9:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8034bd:	48 89 d6             	mov    %rdx,%rsi
  8034c0:	89 c7                	mov    %eax,%edi
  8034c2:	48 b8 a6 31 80 00 00 	movabs $0x8031a6,%rax
  8034c9:	00 00 00 
  8034cc:	ff d0                	callq  *%rax
  8034ce:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034d1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034d5:	79 05                	jns    8034dc <read+0x5d>
  8034d7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034da:	eb 76                	jmp    803552 <read+0xd3>
  8034dc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034e0:	8b 40 08             	mov    0x8(%rax),%eax
  8034e3:	83 e0 03             	and    $0x3,%eax
  8034e6:	83 f8 01             	cmp    $0x1,%eax
  8034e9:	75 3a                	jne    803525 <read+0xa6>
  8034eb:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  8034f2:	00 00 00 
  8034f5:	48 8b 00             	mov    (%rax),%rax
  8034f8:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8034fe:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803501:	89 c6                	mov    %eax,%esi
  803503:	48 bf 37 5f 80 00 00 	movabs $0x805f37,%rdi
  80350a:	00 00 00 
  80350d:	b8 00 00 00 00       	mov    $0x0,%eax
  803512:	48 b9 2a 0d 80 00 00 	movabs $0x800d2a,%rcx
  803519:	00 00 00 
  80351c:	ff d1                	callq  *%rcx
  80351e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803523:	eb 2d                	jmp    803552 <read+0xd3>
  803525:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803529:	48 8b 40 10          	mov    0x10(%rax),%rax
  80352d:	48 85 c0             	test   %rax,%rax
  803530:	75 07                	jne    803539 <read+0xba>
  803532:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803537:	eb 19                	jmp    803552 <read+0xd3>
  803539:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80353d:	48 8b 40 10          	mov    0x10(%rax),%rax
  803541:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803545:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803549:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80354d:	48 89 cf             	mov    %rcx,%rdi
  803550:	ff d0                	callq  *%rax
  803552:	c9                   	leaveq 
  803553:	c3                   	retq   

0000000000803554 <readn>:
  803554:	55                   	push   %rbp
  803555:	48 89 e5             	mov    %rsp,%rbp
  803558:	48 83 ec 30          	sub    $0x30,%rsp
  80355c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80355f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803563:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803567:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80356e:	eb 49                	jmp    8035b9 <readn+0x65>
  803570:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803573:	48 98                	cltq   
  803575:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803579:	48 29 c2             	sub    %rax,%rdx
  80357c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80357f:	48 63 c8             	movslq %eax,%rcx
  803582:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803586:	48 01 c1             	add    %rax,%rcx
  803589:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80358c:	48 89 ce             	mov    %rcx,%rsi
  80358f:	89 c7                	mov    %eax,%edi
  803591:	48 b8 7f 34 80 00 00 	movabs $0x80347f,%rax
  803598:	00 00 00 
  80359b:	ff d0                	callq  *%rax
  80359d:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8035a0:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8035a4:	79 05                	jns    8035ab <readn+0x57>
  8035a6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035a9:	eb 1c                	jmp    8035c7 <readn+0x73>
  8035ab:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8035af:	75 02                	jne    8035b3 <readn+0x5f>
  8035b1:	eb 11                	jmp    8035c4 <readn+0x70>
  8035b3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035b6:	01 45 fc             	add    %eax,-0x4(%rbp)
  8035b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035bc:	48 98                	cltq   
  8035be:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8035c2:	72 ac                	jb     803570 <readn+0x1c>
  8035c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035c7:	c9                   	leaveq 
  8035c8:	c3                   	retq   

00000000008035c9 <write>:
  8035c9:	55                   	push   %rbp
  8035ca:	48 89 e5             	mov    %rsp,%rbp
  8035cd:	48 83 ec 40          	sub    $0x40,%rsp
  8035d1:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8035d4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8035d8:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8035dc:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8035e0:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8035e3:	48 89 d6             	mov    %rdx,%rsi
  8035e6:	89 c7                	mov    %eax,%edi
  8035e8:	48 b8 4d 30 80 00 00 	movabs $0x80304d,%rax
  8035ef:	00 00 00 
  8035f2:	ff d0                	callq  *%rax
  8035f4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8035f7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8035fb:	78 24                	js     803621 <write+0x58>
  8035fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803601:	8b 00                	mov    (%rax),%eax
  803603:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803607:	48 89 d6             	mov    %rdx,%rsi
  80360a:	89 c7                	mov    %eax,%edi
  80360c:	48 b8 a6 31 80 00 00 	movabs $0x8031a6,%rax
  803613:	00 00 00 
  803616:	ff d0                	callq  *%rax
  803618:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80361b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80361f:	79 05                	jns    803626 <write+0x5d>
  803621:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803624:	eb 75                	jmp    80369b <write+0xd2>
  803626:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80362a:	8b 40 08             	mov    0x8(%rax),%eax
  80362d:	83 e0 03             	and    $0x3,%eax
  803630:	85 c0                	test   %eax,%eax
  803632:	75 3a                	jne    80366e <write+0xa5>
  803634:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  80363b:	00 00 00 
  80363e:	48 8b 00             	mov    (%rax),%rax
  803641:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803647:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80364a:	89 c6                	mov    %eax,%esi
  80364c:	48 bf 53 5f 80 00 00 	movabs $0x805f53,%rdi
  803653:	00 00 00 
  803656:	b8 00 00 00 00       	mov    $0x0,%eax
  80365b:	48 b9 2a 0d 80 00 00 	movabs $0x800d2a,%rcx
  803662:	00 00 00 
  803665:	ff d1                	callq  *%rcx
  803667:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80366c:	eb 2d                	jmp    80369b <write+0xd2>
  80366e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803672:	48 8b 40 18          	mov    0x18(%rax),%rax
  803676:	48 85 c0             	test   %rax,%rax
  803679:	75 07                	jne    803682 <write+0xb9>
  80367b:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803680:	eb 19                	jmp    80369b <write+0xd2>
  803682:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803686:	48 8b 40 18          	mov    0x18(%rax),%rax
  80368a:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80368e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803692:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  803696:	48 89 cf             	mov    %rcx,%rdi
  803699:	ff d0                	callq  *%rax
  80369b:	c9                   	leaveq 
  80369c:	c3                   	retq   

000000000080369d <seek>:
  80369d:	55                   	push   %rbp
  80369e:	48 89 e5             	mov    %rsp,%rbp
  8036a1:	48 83 ec 18          	sub    $0x18,%rsp
  8036a5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8036a8:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8036ab:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8036af:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036b2:	48 89 d6             	mov    %rdx,%rsi
  8036b5:	89 c7                	mov    %eax,%edi
  8036b7:	48 b8 4d 30 80 00 00 	movabs $0x80304d,%rax
  8036be:	00 00 00 
  8036c1:	ff d0                	callq  *%rax
  8036c3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036c6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036ca:	79 05                	jns    8036d1 <seek+0x34>
  8036cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036cf:	eb 0f                	jmp    8036e0 <seek+0x43>
  8036d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036d5:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8036d8:	89 50 04             	mov    %edx,0x4(%rax)
  8036db:	b8 00 00 00 00       	mov    $0x0,%eax
  8036e0:	c9                   	leaveq 
  8036e1:	c3                   	retq   

00000000008036e2 <ftruncate>:
  8036e2:	55                   	push   %rbp
  8036e3:	48 89 e5             	mov    %rsp,%rbp
  8036e6:	48 83 ec 30          	sub    $0x30,%rsp
  8036ea:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8036ed:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8036f0:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8036f4:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8036f7:	48 89 d6             	mov    %rdx,%rsi
  8036fa:	89 c7                	mov    %eax,%edi
  8036fc:	48 b8 4d 30 80 00 00 	movabs $0x80304d,%rax
  803703:	00 00 00 
  803706:	ff d0                	callq  *%rax
  803708:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80370b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80370f:	78 24                	js     803735 <ftruncate+0x53>
  803711:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803715:	8b 00                	mov    (%rax),%eax
  803717:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80371b:	48 89 d6             	mov    %rdx,%rsi
  80371e:	89 c7                	mov    %eax,%edi
  803720:	48 b8 a6 31 80 00 00 	movabs $0x8031a6,%rax
  803727:	00 00 00 
  80372a:	ff d0                	callq  *%rax
  80372c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80372f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803733:	79 05                	jns    80373a <ftruncate+0x58>
  803735:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803738:	eb 72                	jmp    8037ac <ftruncate+0xca>
  80373a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80373e:	8b 40 08             	mov    0x8(%rax),%eax
  803741:	83 e0 03             	and    $0x3,%eax
  803744:	85 c0                	test   %eax,%eax
  803746:	75 3a                	jne    803782 <ftruncate+0xa0>
  803748:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  80374f:	00 00 00 
  803752:	48 8b 00             	mov    (%rax),%rax
  803755:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80375b:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80375e:	89 c6                	mov    %eax,%esi
  803760:	48 bf 70 5f 80 00 00 	movabs $0x805f70,%rdi
  803767:	00 00 00 
  80376a:	b8 00 00 00 00       	mov    $0x0,%eax
  80376f:	48 b9 2a 0d 80 00 00 	movabs $0x800d2a,%rcx
  803776:	00 00 00 
  803779:	ff d1                	callq  *%rcx
  80377b:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803780:	eb 2a                	jmp    8037ac <ftruncate+0xca>
  803782:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803786:	48 8b 40 30          	mov    0x30(%rax),%rax
  80378a:	48 85 c0             	test   %rax,%rax
  80378d:	75 07                	jne    803796 <ftruncate+0xb4>
  80378f:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803794:	eb 16                	jmp    8037ac <ftruncate+0xca>
  803796:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80379a:	48 8b 40 30          	mov    0x30(%rax),%rax
  80379e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8037a2:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8037a5:	89 ce                	mov    %ecx,%esi
  8037a7:	48 89 d7             	mov    %rdx,%rdi
  8037aa:	ff d0                	callq  *%rax
  8037ac:	c9                   	leaveq 
  8037ad:	c3                   	retq   

00000000008037ae <fstat>:
  8037ae:	55                   	push   %rbp
  8037af:	48 89 e5             	mov    %rsp,%rbp
  8037b2:	48 83 ec 30          	sub    $0x30,%rsp
  8037b6:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8037b9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8037bd:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8037c1:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8037c4:	48 89 d6             	mov    %rdx,%rsi
  8037c7:	89 c7                	mov    %eax,%edi
  8037c9:	48 b8 4d 30 80 00 00 	movabs $0x80304d,%rax
  8037d0:	00 00 00 
  8037d3:	ff d0                	callq  *%rax
  8037d5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037d8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037dc:	78 24                	js     803802 <fstat+0x54>
  8037de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037e2:	8b 00                	mov    (%rax),%eax
  8037e4:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8037e8:	48 89 d6             	mov    %rdx,%rsi
  8037eb:	89 c7                	mov    %eax,%edi
  8037ed:	48 b8 a6 31 80 00 00 	movabs $0x8031a6,%rax
  8037f4:	00 00 00 
  8037f7:	ff d0                	callq  *%rax
  8037f9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037fc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803800:	79 05                	jns    803807 <fstat+0x59>
  803802:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803805:	eb 5e                	jmp    803865 <fstat+0xb7>
  803807:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80380b:	48 8b 40 28          	mov    0x28(%rax),%rax
  80380f:	48 85 c0             	test   %rax,%rax
  803812:	75 07                	jne    80381b <fstat+0x6d>
  803814:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803819:	eb 4a                	jmp    803865 <fstat+0xb7>
  80381b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80381f:	c6 00 00             	movb   $0x0,(%rax)
  803822:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803826:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  80382d:	00 00 00 
  803830:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803834:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80383b:	00 00 00 
  80383e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803842:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803846:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  80384d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803851:	48 8b 40 28          	mov    0x28(%rax),%rax
  803855:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803859:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  80385d:	48 89 ce             	mov    %rcx,%rsi
  803860:	48 89 d7             	mov    %rdx,%rdi
  803863:	ff d0                	callq  *%rax
  803865:	c9                   	leaveq 
  803866:	c3                   	retq   

0000000000803867 <stat>:
  803867:	55                   	push   %rbp
  803868:	48 89 e5             	mov    %rsp,%rbp
  80386b:	48 83 ec 20          	sub    $0x20,%rsp
  80386f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803873:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803877:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80387b:	be 00 00 00 00       	mov    $0x0,%esi
  803880:	48 89 c7             	mov    %rax,%rdi
  803883:	48 b8 55 39 80 00 00 	movabs $0x803955,%rax
  80388a:	00 00 00 
  80388d:	ff d0                	callq  *%rax
  80388f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803892:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803896:	79 05                	jns    80389d <stat+0x36>
  803898:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80389b:	eb 2f                	jmp    8038cc <stat+0x65>
  80389d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8038a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038a4:	48 89 d6             	mov    %rdx,%rsi
  8038a7:	89 c7                	mov    %eax,%edi
  8038a9:	48 b8 ae 37 80 00 00 	movabs $0x8037ae,%rax
  8038b0:	00 00 00 
  8038b3:	ff d0                	callq  *%rax
  8038b5:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8038b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038bb:	89 c7                	mov    %eax,%edi
  8038bd:	48 b8 5d 32 80 00 00 	movabs $0x80325d,%rax
  8038c4:	00 00 00 
  8038c7:	ff d0                	callq  *%rax
  8038c9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8038cc:	c9                   	leaveq 
  8038cd:	c3                   	retq   

00000000008038ce <fsipc>:
  8038ce:	55                   	push   %rbp
  8038cf:	48 89 e5             	mov    %rsp,%rbp
  8038d2:	48 83 ec 10          	sub    $0x10,%rsp
  8038d6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8038d9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8038dd:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8038e4:	00 00 00 
  8038e7:	8b 00                	mov    (%rax),%eax
  8038e9:	85 c0                	test   %eax,%eax
  8038eb:	75 1d                	jne    80390a <fsipc+0x3c>
  8038ed:	bf 01 00 00 00       	mov    $0x1,%edi
  8038f2:	48 b8 f5 2e 80 00 00 	movabs $0x802ef5,%rax
  8038f9:	00 00 00 
  8038fc:	ff d0                	callq  *%rax
  8038fe:	48 ba 08 90 80 00 00 	movabs $0x809008,%rdx
  803905:	00 00 00 
  803908:	89 02                	mov    %eax,(%rdx)
  80390a:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  803911:	00 00 00 
  803914:	8b 00                	mov    (%rax),%eax
  803916:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803919:	b9 07 00 00 00       	mov    $0x7,%ecx
  80391e:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  803925:	00 00 00 
  803928:	89 c7                	mov    %eax,%edi
  80392a:	48 b8 c4 2c 80 00 00 	movabs $0x802cc4,%rax
  803931:	00 00 00 
  803934:	ff d0                	callq  *%rax
  803936:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80393a:	ba 00 00 00 00       	mov    $0x0,%edx
  80393f:	48 89 c6             	mov    %rax,%rsi
  803942:	bf 00 00 00 00       	mov    $0x0,%edi
  803947:	48 b8 03 2c 80 00 00 	movabs $0x802c03,%rax
  80394e:	00 00 00 
  803951:	ff d0                	callq  *%rax
  803953:	c9                   	leaveq 
  803954:	c3                   	retq   

0000000000803955 <open>:
  803955:	55                   	push   %rbp
  803956:	48 89 e5             	mov    %rsp,%rbp
  803959:	48 83 ec 20          	sub    $0x20,%rsp
  80395d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803961:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  803964:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803968:	48 89 c7             	mov    %rax,%rdi
  80396b:	48 b8 73 18 80 00 00 	movabs $0x801873,%rax
  803972:	00 00 00 
  803975:	ff d0                	callq  *%rax
  803977:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  80397c:	7e 0a                	jle    803988 <open+0x33>
  80397e:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803983:	e9 a5 00 00 00       	jmpq   803a2d <open+0xd8>
  803988:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80398c:	48 89 c7             	mov    %rax,%rdi
  80398f:	48 b8 b5 2f 80 00 00 	movabs $0x802fb5,%rax
  803996:	00 00 00 
  803999:	ff d0                	callq  *%rax
  80399b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80399e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039a2:	79 08                	jns    8039ac <open+0x57>
  8039a4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039a7:	e9 81 00 00 00       	jmpq   803a2d <open+0xd8>
  8039ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039b0:	48 89 c6             	mov    %rax,%rsi
  8039b3:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  8039ba:	00 00 00 
  8039bd:	48 b8 df 18 80 00 00 	movabs $0x8018df,%rax
  8039c4:	00 00 00 
  8039c7:	ff d0                	callq  *%rax
  8039c9:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8039d0:	00 00 00 
  8039d3:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8039d6:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  8039dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039e0:	48 89 c6             	mov    %rax,%rsi
  8039e3:	bf 01 00 00 00       	mov    $0x1,%edi
  8039e8:	48 b8 ce 38 80 00 00 	movabs $0x8038ce,%rax
  8039ef:	00 00 00 
  8039f2:	ff d0                	callq  *%rax
  8039f4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039f7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039fb:	79 1d                	jns    803a1a <open+0xc5>
  8039fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a01:	be 00 00 00 00       	mov    $0x0,%esi
  803a06:	48 89 c7             	mov    %rax,%rdi
  803a09:	48 b8 dd 30 80 00 00 	movabs $0x8030dd,%rax
  803a10:	00 00 00 
  803a13:	ff d0                	callq  *%rax
  803a15:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a18:	eb 13                	jmp    803a2d <open+0xd8>
  803a1a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a1e:	48 89 c7             	mov    %rax,%rdi
  803a21:	48 b8 67 2f 80 00 00 	movabs $0x802f67,%rax
  803a28:	00 00 00 
  803a2b:	ff d0                	callq  *%rax
  803a2d:	c9                   	leaveq 
  803a2e:	c3                   	retq   

0000000000803a2f <devfile_flush>:
  803a2f:	55                   	push   %rbp
  803a30:	48 89 e5             	mov    %rsp,%rbp
  803a33:	48 83 ec 10          	sub    $0x10,%rsp
  803a37:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803a3b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a3f:	8b 50 0c             	mov    0xc(%rax),%edx
  803a42:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a49:	00 00 00 
  803a4c:	89 10                	mov    %edx,(%rax)
  803a4e:	be 00 00 00 00       	mov    $0x0,%esi
  803a53:	bf 06 00 00 00       	mov    $0x6,%edi
  803a58:	48 b8 ce 38 80 00 00 	movabs $0x8038ce,%rax
  803a5f:	00 00 00 
  803a62:	ff d0                	callq  *%rax
  803a64:	c9                   	leaveq 
  803a65:	c3                   	retq   

0000000000803a66 <devfile_read>:
  803a66:	55                   	push   %rbp
  803a67:	48 89 e5             	mov    %rsp,%rbp
  803a6a:	48 83 ec 30          	sub    $0x30,%rsp
  803a6e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803a72:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803a76:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803a7a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a7e:	8b 50 0c             	mov    0xc(%rax),%edx
  803a81:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a88:	00 00 00 
  803a8b:	89 10                	mov    %edx,(%rax)
  803a8d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a94:	00 00 00 
  803a97:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803a9b:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803a9f:	be 00 00 00 00       	mov    $0x0,%esi
  803aa4:	bf 03 00 00 00       	mov    $0x3,%edi
  803aa9:	48 b8 ce 38 80 00 00 	movabs $0x8038ce,%rax
  803ab0:	00 00 00 
  803ab3:	ff d0                	callq  *%rax
  803ab5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ab8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803abc:	79 08                	jns    803ac6 <devfile_read+0x60>
  803abe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ac1:	e9 a4 00 00 00       	jmpq   803b6a <devfile_read+0x104>
  803ac6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ac9:	48 98                	cltq   
  803acb:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803acf:	76 35                	jbe    803b06 <devfile_read+0xa0>
  803ad1:	48 b9 96 5f 80 00 00 	movabs $0x805f96,%rcx
  803ad8:	00 00 00 
  803adb:	48 ba 9d 5f 80 00 00 	movabs $0x805f9d,%rdx
  803ae2:	00 00 00 
  803ae5:	be 89 00 00 00       	mov    $0x89,%esi
  803aea:	48 bf b2 5f 80 00 00 	movabs $0x805fb2,%rdi
  803af1:	00 00 00 
  803af4:	b8 00 00 00 00       	mov    $0x0,%eax
  803af9:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  803b00:	00 00 00 
  803b03:	41 ff d0             	callq  *%r8
  803b06:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  803b0d:	7e 35                	jle    803b44 <devfile_read+0xde>
  803b0f:	48 b9 c0 5f 80 00 00 	movabs $0x805fc0,%rcx
  803b16:	00 00 00 
  803b19:	48 ba 9d 5f 80 00 00 	movabs $0x805f9d,%rdx
  803b20:	00 00 00 
  803b23:	be 8a 00 00 00       	mov    $0x8a,%esi
  803b28:	48 bf b2 5f 80 00 00 	movabs $0x805fb2,%rdi
  803b2f:	00 00 00 
  803b32:	b8 00 00 00 00       	mov    $0x0,%eax
  803b37:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  803b3e:	00 00 00 
  803b41:	41 ff d0             	callq  *%r8
  803b44:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b47:	48 63 d0             	movslq %eax,%rdx
  803b4a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b4e:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803b55:	00 00 00 
  803b58:	48 89 c7             	mov    %rax,%rdi
  803b5b:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  803b62:	00 00 00 
  803b65:	ff d0                	callq  *%rax
  803b67:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b6a:	c9                   	leaveq 
  803b6b:	c3                   	retq   

0000000000803b6c <devfile_write>:
  803b6c:	55                   	push   %rbp
  803b6d:	48 89 e5             	mov    %rsp,%rbp
  803b70:	48 83 ec 40          	sub    $0x40,%rsp
  803b74:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803b78:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803b7c:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803b80:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803b84:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803b88:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  803b8f:	00 
  803b90:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b94:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  803b98:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  803b9d:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  803ba1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ba5:	8b 50 0c             	mov    0xc(%rax),%edx
  803ba8:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803baf:	00 00 00 
  803bb2:	89 10                	mov    %edx,(%rax)
  803bb4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803bbb:	00 00 00 
  803bbe:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803bc2:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803bc6:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803bca:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803bce:	48 89 c6             	mov    %rax,%rsi
  803bd1:	48 bf 10 a0 80 00 00 	movabs $0x80a010,%rdi
  803bd8:	00 00 00 
  803bdb:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  803be2:	00 00 00 
  803be5:	ff d0                	callq  *%rax
  803be7:	be 00 00 00 00       	mov    $0x0,%esi
  803bec:	bf 04 00 00 00       	mov    $0x4,%edi
  803bf1:	48 b8 ce 38 80 00 00 	movabs $0x8038ce,%rax
  803bf8:	00 00 00 
  803bfb:	ff d0                	callq  *%rax
  803bfd:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803c00:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803c04:	79 05                	jns    803c0b <devfile_write+0x9f>
  803c06:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c09:	eb 43                	jmp    803c4e <devfile_write+0xe2>
  803c0b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c0e:	48 98                	cltq   
  803c10:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803c14:	76 35                	jbe    803c4b <devfile_write+0xdf>
  803c16:	48 b9 96 5f 80 00 00 	movabs $0x805f96,%rcx
  803c1d:	00 00 00 
  803c20:	48 ba 9d 5f 80 00 00 	movabs $0x805f9d,%rdx
  803c27:	00 00 00 
  803c2a:	be a8 00 00 00       	mov    $0xa8,%esi
  803c2f:	48 bf b2 5f 80 00 00 	movabs $0x805fb2,%rdi
  803c36:	00 00 00 
  803c39:	b8 00 00 00 00       	mov    $0x0,%eax
  803c3e:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  803c45:	00 00 00 
  803c48:	41 ff d0             	callq  *%r8
  803c4b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c4e:	c9                   	leaveq 
  803c4f:	c3                   	retq   

0000000000803c50 <devfile_stat>:
  803c50:	55                   	push   %rbp
  803c51:	48 89 e5             	mov    %rsp,%rbp
  803c54:	48 83 ec 20          	sub    $0x20,%rsp
  803c58:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803c5c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c60:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803c64:	8b 50 0c             	mov    0xc(%rax),%edx
  803c67:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803c6e:	00 00 00 
  803c71:	89 10                	mov    %edx,(%rax)
  803c73:	be 00 00 00 00       	mov    $0x0,%esi
  803c78:	bf 05 00 00 00       	mov    $0x5,%edi
  803c7d:	48 b8 ce 38 80 00 00 	movabs $0x8038ce,%rax
  803c84:	00 00 00 
  803c87:	ff d0                	callq  *%rax
  803c89:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c8c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c90:	79 05                	jns    803c97 <devfile_stat+0x47>
  803c92:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c95:	eb 56                	jmp    803ced <devfile_stat+0x9d>
  803c97:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c9b:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803ca2:	00 00 00 
  803ca5:	48 89 c7             	mov    %rax,%rdi
  803ca8:	48 b8 df 18 80 00 00 	movabs $0x8018df,%rax
  803caf:	00 00 00 
  803cb2:	ff d0                	callq  *%rax
  803cb4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803cbb:	00 00 00 
  803cbe:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  803cc4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803cc8:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803cce:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803cd5:	00 00 00 
  803cd8:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  803cde:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ce2:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803ce8:	b8 00 00 00 00       	mov    $0x0,%eax
  803ced:	c9                   	leaveq 
  803cee:	c3                   	retq   

0000000000803cef <devfile_trunc>:
  803cef:	55                   	push   %rbp
  803cf0:	48 89 e5             	mov    %rsp,%rbp
  803cf3:	48 83 ec 10          	sub    $0x10,%rsp
  803cf7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803cfb:	89 75 f4             	mov    %esi,-0xc(%rbp)
  803cfe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d02:	8b 50 0c             	mov    0xc(%rax),%edx
  803d05:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803d0c:	00 00 00 
  803d0f:	89 10                	mov    %edx,(%rax)
  803d11:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803d18:	00 00 00 
  803d1b:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803d1e:	89 50 04             	mov    %edx,0x4(%rax)
  803d21:	be 00 00 00 00       	mov    $0x0,%esi
  803d26:	bf 02 00 00 00       	mov    $0x2,%edi
  803d2b:	48 b8 ce 38 80 00 00 	movabs $0x8038ce,%rax
  803d32:	00 00 00 
  803d35:	ff d0                	callq  *%rax
  803d37:	c9                   	leaveq 
  803d38:	c3                   	retq   

0000000000803d39 <remove>:
  803d39:	55                   	push   %rbp
  803d3a:	48 89 e5             	mov    %rsp,%rbp
  803d3d:	48 83 ec 10          	sub    $0x10,%rsp
  803d41:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803d45:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d49:	48 89 c7             	mov    %rax,%rdi
  803d4c:	48 b8 73 18 80 00 00 	movabs $0x801873,%rax
  803d53:	00 00 00 
  803d56:	ff d0                	callq  *%rax
  803d58:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803d5d:	7e 07                	jle    803d66 <remove+0x2d>
  803d5f:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803d64:	eb 33                	jmp    803d99 <remove+0x60>
  803d66:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d6a:	48 89 c6             	mov    %rax,%rsi
  803d6d:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  803d74:	00 00 00 
  803d77:	48 b8 df 18 80 00 00 	movabs $0x8018df,%rax
  803d7e:	00 00 00 
  803d81:	ff d0                	callq  *%rax
  803d83:	be 00 00 00 00       	mov    $0x0,%esi
  803d88:	bf 07 00 00 00       	mov    $0x7,%edi
  803d8d:	48 b8 ce 38 80 00 00 	movabs $0x8038ce,%rax
  803d94:	00 00 00 
  803d97:	ff d0                	callq  *%rax
  803d99:	c9                   	leaveq 
  803d9a:	c3                   	retq   

0000000000803d9b <sync>:
  803d9b:	55                   	push   %rbp
  803d9c:	48 89 e5             	mov    %rsp,%rbp
  803d9f:	be 00 00 00 00       	mov    $0x0,%esi
  803da4:	bf 08 00 00 00       	mov    $0x8,%edi
  803da9:	48 b8 ce 38 80 00 00 	movabs $0x8038ce,%rax
  803db0:	00 00 00 
  803db3:	ff d0                	callq  *%rax
  803db5:	5d                   	pop    %rbp
  803db6:	c3                   	retq   

0000000000803db7 <copy>:
  803db7:	55                   	push   %rbp
  803db8:	48 89 e5             	mov    %rsp,%rbp
  803dbb:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  803dc2:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  803dc9:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  803dd0:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803dd7:	be 00 00 00 00       	mov    $0x0,%esi
  803ddc:	48 89 c7             	mov    %rax,%rdi
  803ddf:	48 b8 55 39 80 00 00 	movabs $0x803955,%rax
  803de6:	00 00 00 
  803de9:	ff d0                	callq  *%rax
  803deb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803dee:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803df2:	79 28                	jns    803e1c <copy+0x65>
  803df4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803df7:	89 c6                	mov    %eax,%esi
  803df9:	48 bf cc 5f 80 00 00 	movabs $0x805fcc,%rdi
  803e00:	00 00 00 
  803e03:	b8 00 00 00 00       	mov    $0x0,%eax
  803e08:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  803e0f:	00 00 00 
  803e12:	ff d2                	callq  *%rdx
  803e14:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e17:	e9 74 01 00 00       	jmpq   803f90 <copy+0x1d9>
  803e1c:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  803e23:	be 01 01 00 00       	mov    $0x101,%esi
  803e28:	48 89 c7             	mov    %rax,%rdi
  803e2b:	48 b8 55 39 80 00 00 	movabs $0x803955,%rax
  803e32:	00 00 00 
  803e35:	ff d0                	callq  *%rax
  803e37:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803e3a:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803e3e:	79 39                	jns    803e79 <copy+0xc2>
  803e40:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803e43:	89 c6                	mov    %eax,%esi
  803e45:	48 bf e2 5f 80 00 00 	movabs $0x805fe2,%rdi
  803e4c:	00 00 00 
  803e4f:	b8 00 00 00 00       	mov    $0x0,%eax
  803e54:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  803e5b:	00 00 00 
  803e5e:	ff d2                	callq  *%rdx
  803e60:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e63:	89 c7                	mov    %eax,%edi
  803e65:	48 b8 5d 32 80 00 00 	movabs $0x80325d,%rax
  803e6c:	00 00 00 
  803e6f:	ff d0                	callq  *%rax
  803e71:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803e74:	e9 17 01 00 00       	jmpq   803f90 <copy+0x1d9>
  803e79:	eb 74                	jmp    803eef <copy+0x138>
  803e7b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803e7e:	48 63 d0             	movslq %eax,%rdx
  803e81:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803e88:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803e8b:	48 89 ce             	mov    %rcx,%rsi
  803e8e:	89 c7                	mov    %eax,%edi
  803e90:	48 b8 c9 35 80 00 00 	movabs $0x8035c9,%rax
  803e97:	00 00 00 
  803e9a:	ff d0                	callq  *%rax
  803e9c:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803e9f:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803ea3:	79 4a                	jns    803eef <copy+0x138>
  803ea5:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803ea8:	89 c6                	mov    %eax,%esi
  803eaa:	48 bf fc 5f 80 00 00 	movabs $0x805ffc,%rdi
  803eb1:	00 00 00 
  803eb4:	b8 00 00 00 00       	mov    $0x0,%eax
  803eb9:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  803ec0:	00 00 00 
  803ec3:	ff d2                	callq  *%rdx
  803ec5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ec8:	89 c7                	mov    %eax,%edi
  803eca:	48 b8 5d 32 80 00 00 	movabs $0x80325d,%rax
  803ed1:	00 00 00 
  803ed4:	ff d0                	callq  *%rax
  803ed6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803ed9:	89 c7                	mov    %eax,%edi
  803edb:	48 b8 5d 32 80 00 00 	movabs $0x80325d,%rax
  803ee2:	00 00 00 
  803ee5:	ff d0                	callq  *%rax
  803ee7:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803eea:	e9 a1 00 00 00       	jmpq   803f90 <copy+0x1d9>
  803eef:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803ef6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ef9:	ba 00 02 00 00       	mov    $0x200,%edx
  803efe:	48 89 ce             	mov    %rcx,%rsi
  803f01:	89 c7                	mov    %eax,%edi
  803f03:	48 b8 7f 34 80 00 00 	movabs $0x80347f,%rax
  803f0a:	00 00 00 
  803f0d:	ff d0                	callq  *%rax
  803f0f:	89 45 f4             	mov    %eax,-0xc(%rbp)
  803f12:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803f16:	0f 8f 5f ff ff ff    	jg     803e7b <copy+0xc4>
  803f1c:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803f20:	79 47                	jns    803f69 <copy+0x1b2>
  803f22:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803f25:	89 c6                	mov    %eax,%esi
  803f27:	48 bf 0f 60 80 00 00 	movabs $0x80600f,%rdi
  803f2e:	00 00 00 
  803f31:	b8 00 00 00 00       	mov    $0x0,%eax
  803f36:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  803f3d:	00 00 00 
  803f40:	ff d2                	callq  *%rdx
  803f42:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f45:	89 c7                	mov    %eax,%edi
  803f47:	48 b8 5d 32 80 00 00 	movabs $0x80325d,%rax
  803f4e:	00 00 00 
  803f51:	ff d0                	callq  *%rax
  803f53:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803f56:	89 c7                	mov    %eax,%edi
  803f58:	48 b8 5d 32 80 00 00 	movabs $0x80325d,%rax
  803f5f:	00 00 00 
  803f62:	ff d0                	callq  *%rax
  803f64:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803f67:	eb 27                	jmp    803f90 <copy+0x1d9>
  803f69:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f6c:	89 c7                	mov    %eax,%edi
  803f6e:	48 b8 5d 32 80 00 00 	movabs $0x80325d,%rax
  803f75:	00 00 00 
  803f78:	ff d0                	callq  *%rax
  803f7a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803f7d:	89 c7                	mov    %eax,%edi
  803f7f:	48 b8 5d 32 80 00 00 	movabs $0x80325d,%rax
  803f86:	00 00 00 
  803f89:	ff d0                	callq  *%rax
  803f8b:	b8 00 00 00 00       	mov    $0x0,%eax
  803f90:	c9                   	leaveq 
  803f91:	c3                   	retq   

0000000000803f92 <fd2sockid>:
  803f92:	55                   	push   %rbp
  803f93:	48 89 e5             	mov    %rsp,%rbp
  803f96:	48 83 ec 20          	sub    $0x20,%rsp
  803f9a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f9d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803fa1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803fa4:	48 89 d6             	mov    %rdx,%rsi
  803fa7:	89 c7                	mov    %eax,%edi
  803fa9:	48 b8 4d 30 80 00 00 	movabs $0x80304d,%rax
  803fb0:	00 00 00 
  803fb3:	ff d0                	callq  *%rax
  803fb5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803fb8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803fbc:	79 05                	jns    803fc3 <fd2sockid+0x31>
  803fbe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fc1:	eb 24                	jmp    803fe7 <fd2sockid+0x55>
  803fc3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fc7:	8b 10                	mov    (%rax),%edx
  803fc9:	48 b8 a0 80 80 00 00 	movabs $0x8080a0,%rax
  803fd0:	00 00 00 
  803fd3:	8b 00                	mov    (%rax),%eax
  803fd5:	39 c2                	cmp    %eax,%edx
  803fd7:	74 07                	je     803fe0 <fd2sockid+0x4e>
  803fd9:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803fde:	eb 07                	jmp    803fe7 <fd2sockid+0x55>
  803fe0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fe4:	8b 40 0c             	mov    0xc(%rax),%eax
  803fe7:	c9                   	leaveq 
  803fe8:	c3                   	retq   

0000000000803fe9 <alloc_sockfd>:
  803fe9:	55                   	push   %rbp
  803fea:	48 89 e5             	mov    %rsp,%rbp
  803fed:	48 83 ec 20          	sub    $0x20,%rsp
  803ff1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ff4:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803ff8:	48 89 c7             	mov    %rax,%rdi
  803ffb:	48 b8 b5 2f 80 00 00 	movabs $0x802fb5,%rax
  804002:	00 00 00 
  804005:	ff d0                	callq  *%rax
  804007:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80400a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80400e:	78 26                	js     804036 <alloc_sockfd+0x4d>
  804010:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804014:	ba 07 04 00 00       	mov    $0x407,%edx
  804019:	48 89 c6             	mov    %rax,%rsi
  80401c:	bf 00 00 00 00       	mov    $0x0,%edi
  804021:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  804028:	00 00 00 
  80402b:	ff d0                	callq  *%rax
  80402d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804030:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804034:	79 16                	jns    80404c <alloc_sockfd+0x63>
  804036:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804039:	89 c7                	mov    %eax,%edi
  80403b:	48 b8 f6 44 80 00 00 	movabs $0x8044f6,%rax
  804042:	00 00 00 
  804045:	ff d0                	callq  *%rax
  804047:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80404a:	eb 3a                	jmp    804086 <alloc_sockfd+0x9d>
  80404c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804050:	48 ba a0 80 80 00 00 	movabs $0x8080a0,%rdx
  804057:	00 00 00 
  80405a:	8b 12                	mov    (%rdx),%edx
  80405c:	89 10                	mov    %edx,(%rax)
  80405e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804062:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804069:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80406d:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804070:	89 50 0c             	mov    %edx,0xc(%rax)
  804073:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804077:	48 89 c7             	mov    %rax,%rdi
  80407a:	48 b8 67 2f 80 00 00 	movabs $0x802f67,%rax
  804081:	00 00 00 
  804084:	ff d0                	callq  *%rax
  804086:	c9                   	leaveq 
  804087:	c3                   	retq   

0000000000804088 <accept>:
  804088:	55                   	push   %rbp
  804089:	48 89 e5             	mov    %rsp,%rbp
  80408c:	48 83 ec 30          	sub    $0x30,%rsp
  804090:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804093:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804097:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80409b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80409e:	89 c7                	mov    %eax,%edi
  8040a0:	48 b8 92 3f 80 00 00 	movabs $0x803f92,%rax
  8040a7:	00 00 00 
  8040aa:	ff d0                	callq  *%rax
  8040ac:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040af:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040b3:	79 05                	jns    8040ba <accept+0x32>
  8040b5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040b8:	eb 3b                	jmp    8040f5 <accept+0x6d>
  8040ba:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8040be:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8040c2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040c5:	48 89 ce             	mov    %rcx,%rsi
  8040c8:	89 c7                	mov    %eax,%edi
  8040ca:	48 b8 d3 43 80 00 00 	movabs $0x8043d3,%rax
  8040d1:	00 00 00 
  8040d4:	ff d0                	callq  *%rax
  8040d6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040d9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040dd:	79 05                	jns    8040e4 <accept+0x5c>
  8040df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040e2:	eb 11                	jmp    8040f5 <accept+0x6d>
  8040e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040e7:	89 c7                	mov    %eax,%edi
  8040e9:	48 b8 e9 3f 80 00 00 	movabs $0x803fe9,%rax
  8040f0:	00 00 00 
  8040f3:	ff d0                	callq  *%rax
  8040f5:	c9                   	leaveq 
  8040f6:	c3                   	retq   

00000000008040f7 <bind>:
  8040f7:	55                   	push   %rbp
  8040f8:	48 89 e5             	mov    %rsp,%rbp
  8040fb:	48 83 ec 20          	sub    $0x20,%rsp
  8040ff:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804102:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804106:	89 55 e8             	mov    %edx,-0x18(%rbp)
  804109:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80410c:	89 c7                	mov    %eax,%edi
  80410e:	48 b8 92 3f 80 00 00 	movabs $0x803f92,%rax
  804115:	00 00 00 
  804118:	ff d0                	callq  *%rax
  80411a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80411d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804121:	79 05                	jns    804128 <bind+0x31>
  804123:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804126:	eb 1b                	jmp    804143 <bind+0x4c>
  804128:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80412b:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80412f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804132:	48 89 ce             	mov    %rcx,%rsi
  804135:	89 c7                	mov    %eax,%edi
  804137:	48 b8 52 44 80 00 00 	movabs $0x804452,%rax
  80413e:	00 00 00 
  804141:	ff d0                	callq  *%rax
  804143:	c9                   	leaveq 
  804144:	c3                   	retq   

0000000000804145 <shutdown>:
  804145:	55                   	push   %rbp
  804146:	48 89 e5             	mov    %rsp,%rbp
  804149:	48 83 ec 20          	sub    $0x20,%rsp
  80414d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804150:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804153:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804156:	89 c7                	mov    %eax,%edi
  804158:	48 b8 92 3f 80 00 00 	movabs $0x803f92,%rax
  80415f:	00 00 00 
  804162:	ff d0                	callq  *%rax
  804164:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804167:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80416b:	79 05                	jns    804172 <shutdown+0x2d>
  80416d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804170:	eb 16                	jmp    804188 <shutdown+0x43>
  804172:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804175:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804178:	89 d6                	mov    %edx,%esi
  80417a:	89 c7                	mov    %eax,%edi
  80417c:	48 b8 b6 44 80 00 00 	movabs $0x8044b6,%rax
  804183:	00 00 00 
  804186:	ff d0                	callq  *%rax
  804188:	c9                   	leaveq 
  804189:	c3                   	retq   

000000000080418a <devsock_close>:
  80418a:	55                   	push   %rbp
  80418b:	48 89 e5             	mov    %rsp,%rbp
  80418e:	48 83 ec 10          	sub    $0x10,%rsp
  804192:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804196:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80419a:	48 89 c7             	mov    %rax,%rdi
  80419d:	48 b8 42 51 80 00 00 	movabs $0x805142,%rax
  8041a4:	00 00 00 
  8041a7:	ff d0                	callq  *%rax
  8041a9:	83 f8 01             	cmp    $0x1,%eax
  8041ac:	75 17                	jne    8041c5 <devsock_close+0x3b>
  8041ae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041b2:	8b 40 0c             	mov    0xc(%rax),%eax
  8041b5:	89 c7                	mov    %eax,%edi
  8041b7:	48 b8 f6 44 80 00 00 	movabs $0x8044f6,%rax
  8041be:	00 00 00 
  8041c1:	ff d0                	callq  *%rax
  8041c3:	eb 05                	jmp    8041ca <devsock_close+0x40>
  8041c5:	b8 00 00 00 00       	mov    $0x0,%eax
  8041ca:	c9                   	leaveq 
  8041cb:	c3                   	retq   

00000000008041cc <connect>:
  8041cc:	55                   	push   %rbp
  8041cd:	48 89 e5             	mov    %rsp,%rbp
  8041d0:	48 83 ec 20          	sub    $0x20,%rsp
  8041d4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8041d7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8041db:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8041de:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8041e1:	89 c7                	mov    %eax,%edi
  8041e3:	48 b8 92 3f 80 00 00 	movabs $0x803f92,%rax
  8041ea:	00 00 00 
  8041ed:	ff d0                	callq  *%rax
  8041ef:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8041f2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8041f6:	79 05                	jns    8041fd <connect+0x31>
  8041f8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041fb:	eb 1b                	jmp    804218 <connect+0x4c>
  8041fd:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804200:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  804204:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804207:	48 89 ce             	mov    %rcx,%rsi
  80420a:	89 c7                	mov    %eax,%edi
  80420c:	48 b8 23 45 80 00 00 	movabs $0x804523,%rax
  804213:	00 00 00 
  804216:	ff d0                	callq  *%rax
  804218:	c9                   	leaveq 
  804219:	c3                   	retq   

000000000080421a <listen>:
  80421a:	55                   	push   %rbp
  80421b:	48 89 e5             	mov    %rsp,%rbp
  80421e:	48 83 ec 20          	sub    $0x20,%rsp
  804222:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804225:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804228:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80422b:	89 c7                	mov    %eax,%edi
  80422d:	48 b8 92 3f 80 00 00 	movabs $0x803f92,%rax
  804234:	00 00 00 
  804237:	ff d0                	callq  *%rax
  804239:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80423c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804240:	79 05                	jns    804247 <listen+0x2d>
  804242:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804245:	eb 16                	jmp    80425d <listen+0x43>
  804247:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80424a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80424d:	89 d6                	mov    %edx,%esi
  80424f:	89 c7                	mov    %eax,%edi
  804251:	48 b8 87 45 80 00 00 	movabs $0x804587,%rax
  804258:	00 00 00 
  80425b:	ff d0                	callq  *%rax
  80425d:	c9                   	leaveq 
  80425e:	c3                   	retq   

000000000080425f <devsock_read>:
  80425f:	55                   	push   %rbp
  804260:	48 89 e5             	mov    %rsp,%rbp
  804263:	48 83 ec 20          	sub    $0x20,%rsp
  804267:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80426b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80426f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  804273:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804277:	89 c2                	mov    %eax,%edx
  804279:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80427d:	8b 40 0c             	mov    0xc(%rax),%eax
  804280:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  804284:	b9 00 00 00 00       	mov    $0x0,%ecx
  804289:	89 c7                	mov    %eax,%edi
  80428b:	48 b8 c7 45 80 00 00 	movabs $0x8045c7,%rax
  804292:	00 00 00 
  804295:	ff d0                	callq  *%rax
  804297:	c9                   	leaveq 
  804298:	c3                   	retq   

0000000000804299 <devsock_write>:
  804299:	55                   	push   %rbp
  80429a:	48 89 e5             	mov    %rsp,%rbp
  80429d:	48 83 ec 20          	sub    $0x20,%rsp
  8042a1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8042a5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8042a9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8042ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8042b1:	89 c2                	mov    %eax,%edx
  8042b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042b7:	8b 40 0c             	mov    0xc(%rax),%eax
  8042ba:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8042be:	b9 00 00 00 00       	mov    $0x0,%ecx
  8042c3:	89 c7                	mov    %eax,%edi
  8042c5:	48 b8 93 46 80 00 00 	movabs $0x804693,%rax
  8042cc:	00 00 00 
  8042cf:	ff d0                	callq  *%rax
  8042d1:	c9                   	leaveq 
  8042d2:	c3                   	retq   

00000000008042d3 <devsock_stat>:
  8042d3:	55                   	push   %rbp
  8042d4:	48 89 e5             	mov    %rsp,%rbp
  8042d7:	48 83 ec 10          	sub    $0x10,%rsp
  8042db:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8042df:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8042e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042e7:	48 be 2a 60 80 00 00 	movabs $0x80602a,%rsi
  8042ee:	00 00 00 
  8042f1:	48 89 c7             	mov    %rax,%rdi
  8042f4:	48 b8 df 18 80 00 00 	movabs $0x8018df,%rax
  8042fb:	00 00 00 
  8042fe:	ff d0                	callq  *%rax
  804300:	b8 00 00 00 00       	mov    $0x0,%eax
  804305:	c9                   	leaveq 
  804306:	c3                   	retq   

0000000000804307 <socket>:
  804307:	55                   	push   %rbp
  804308:	48 89 e5             	mov    %rsp,%rbp
  80430b:	48 83 ec 20          	sub    $0x20,%rsp
  80430f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804312:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804315:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  804318:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80431b:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80431e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804321:	89 ce                	mov    %ecx,%esi
  804323:	89 c7                	mov    %eax,%edi
  804325:	48 b8 4b 47 80 00 00 	movabs $0x80474b,%rax
  80432c:	00 00 00 
  80432f:	ff d0                	callq  *%rax
  804331:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804334:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804338:	79 05                	jns    80433f <socket+0x38>
  80433a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80433d:	eb 11                	jmp    804350 <socket+0x49>
  80433f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804342:	89 c7                	mov    %eax,%edi
  804344:	48 b8 e9 3f 80 00 00 	movabs $0x803fe9,%rax
  80434b:	00 00 00 
  80434e:	ff d0                	callq  *%rax
  804350:	c9                   	leaveq 
  804351:	c3                   	retq   

0000000000804352 <nsipc>:
  804352:	55                   	push   %rbp
  804353:	48 89 e5             	mov    %rsp,%rbp
  804356:	48 83 ec 10          	sub    $0x10,%rsp
  80435a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80435d:	48 b8 0c 90 80 00 00 	movabs $0x80900c,%rax
  804364:	00 00 00 
  804367:	8b 00                	mov    (%rax),%eax
  804369:	85 c0                	test   %eax,%eax
  80436b:	75 1d                	jne    80438a <nsipc+0x38>
  80436d:	bf 02 00 00 00       	mov    $0x2,%edi
  804372:	48 b8 f5 2e 80 00 00 	movabs $0x802ef5,%rax
  804379:	00 00 00 
  80437c:	ff d0                	callq  *%rax
  80437e:	48 ba 0c 90 80 00 00 	movabs $0x80900c,%rdx
  804385:	00 00 00 
  804388:	89 02                	mov    %eax,(%rdx)
  80438a:	48 b8 0c 90 80 00 00 	movabs $0x80900c,%rax
  804391:	00 00 00 
  804394:	8b 00                	mov    (%rax),%eax
  804396:	8b 75 fc             	mov    -0x4(%rbp),%esi
  804399:	b9 07 00 00 00       	mov    $0x7,%ecx
  80439e:	48 ba 00 c0 80 00 00 	movabs $0x80c000,%rdx
  8043a5:	00 00 00 
  8043a8:	89 c7                	mov    %eax,%edi
  8043aa:	48 b8 c4 2c 80 00 00 	movabs $0x802cc4,%rax
  8043b1:	00 00 00 
  8043b4:	ff d0                	callq  *%rax
  8043b6:	ba 00 00 00 00       	mov    $0x0,%edx
  8043bb:	be 00 00 00 00       	mov    $0x0,%esi
  8043c0:	bf 00 00 00 00       	mov    $0x0,%edi
  8043c5:	48 b8 03 2c 80 00 00 	movabs $0x802c03,%rax
  8043cc:	00 00 00 
  8043cf:	ff d0                	callq  *%rax
  8043d1:	c9                   	leaveq 
  8043d2:	c3                   	retq   

00000000008043d3 <nsipc_accept>:
  8043d3:	55                   	push   %rbp
  8043d4:	48 89 e5             	mov    %rsp,%rbp
  8043d7:	48 83 ec 30          	sub    $0x30,%rsp
  8043db:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8043de:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8043e2:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8043e6:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8043ed:	00 00 00 
  8043f0:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8043f3:	89 10                	mov    %edx,(%rax)
  8043f5:	bf 01 00 00 00       	mov    $0x1,%edi
  8043fa:	48 b8 52 43 80 00 00 	movabs $0x804352,%rax
  804401:	00 00 00 
  804404:	ff d0                	callq  *%rax
  804406:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804409:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80440d:	78 3e                	js     80444d <nsipc_accept+0x7a>
  80440f:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804416:	00 00 00 
  804419:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80441d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804421:	8b 40 10             	mov    0x10(%rax),%eax
  804424:	89 c2                	mov    %eax,%edx
  804426:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80442a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80442e:	48 89 ce             	mov    %rcx,%rsi
  804431:	48 89 c7             	mov    %rax,%rdi
  804434:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  80443b:	00 00 00 
  80443e:	ff d0                	callq  *%rax
  804440:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804444:	8b 50 10             	mov    0x10(%rax),%edx
  804447:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80444b:	89 10                	mov    %edx,(%rax)
  80444d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804450:	c9                   	leaveq 
  804451:	c3                   	retq   

0000000000804452 <nsipc_bind>:
  804452:	55                   	push   %rbp
  804453:	48 89 e5             	mov    %rsp,%rbp
  804456:	48 83 ec 10          	sub    $0x10,%rsp
  80445a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80445d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804461:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804464:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80446b:	00 00 00 
  80446e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804471:	89 10                	mov    %edx,(%rax)
  804473:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804476:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80447a:	48 89 c6             	mov    %rax,%rsi
  80447d:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  804484:	00 00 00 
  804487:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  80448e:	00 00 00 
  804491:	ff d0                	callq  *%rax
  804493:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80449a:	00 00 00 
  80449d:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8044a0:	89 50 14             	mov    %edx,0x14(%rax)
  8044a3:	bf 02 00 00 00       	mov    $0x2,%edi
  8044a8:	48 b8 52 43 80 00 00 	movabs $0x804352,%rax
  8044af:	00 00 00 
  8044b2:	ff d0                	callq  *%rax
  8044b4:	c9                   	leaveq 
  8044b5:	c3                   	retq   

00000000008044b6 <nsipc_shutdown>:
  8044b6:	55                   	push   %rbp
  8044b7:	48 89 e5             	mov    %rsp,%rbp
  8044ba:	48 83 ec 10          	sub    $0x10,%rsp
  8044be:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8044c1:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8044c4:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8044cb:	00 00 00 
  8044ce:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8044d1:	89 10                	mov    %edx,(%rax)
  8044d3:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8044da:	00 00 00 
  8044dd:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8044e0:	89 50 04             	mov    %edx,0x4(%rax)
  8044e3:	bf 03 00 00 00       	mov    $0x3,%edi
  8044e8:	48 b8 52 43 80 00 00 	movabs $0x804352,%rax
  8044ef:	00 00 00 
  8044f2:	ff d0                	callq  *%rax
  8044f4:	c9                   	leaveq 
  8044f5:	c3                   	retq   

00000000008044f6 <nsipc_close>:
  8044f6:	55                   	push   %rbp
  8044f7:	48 89 e5             	mov    %rsp,%rbp
  8044fa:	48 83 ec 10          	sub    $0x10,%rsp
  8044fe:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804501:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804508:	00 00 00 
  80450b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80450e:	89 10                	mov    %edx,(%rax)
  804510:	bf 04 00 00 00       	mov    $0x4,%edi
  804515:	48 b8 52 43 80 00 00 	movabs $0x804352,%rax
  80451c:	00 00 00 
  80451f:	ff d0                	callq  *%rax
  804521:	c9                   	leaveq 
  804522:	c3                   	retq   

0000000000804523 <nsipc_connect>:
  804523:	55                   	push   %rbp
  804524:	48 89 e5             	mov    %rsp,%rbp
  804527:	48 83 ec 10          	sub    $0x10,%rsp
  80452b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80452e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804532:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804535:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80453c:	00 00 00 
  80453f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804542:	89 10                	mov    %edx,(%rax)
  804544:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804547:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80454b:	48 89 c6             	mov    %rax,%rsi
  80454e:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  804555:	00 00 00 
  804558:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  80455f:	00 00 00 
  804562:	ff d0                	callq  *%rax
  804564:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80456b:	00 00 00 
  80456e:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804571:	89 50 14             	mov    %edx,0x14(%rax)
  804574:	bf 05 00 00 00       	mov    $0x5,%edi
  804579:	48 b8 52 43 80 00 00 	movabs $0x804352,%rax
  804580:	00 00 00 
  804583:	ff d0                	callq  *%rax
  804585:	c9                   	leaveq 
  804586:	c3                   	retq   

0000000000804587 <nsipc_listen>:
  804587:	55                   	push   %rbp
  804588:	48 89 e5             	mov    %rsp,%rbp
  80458b:	48 83 ec 10          	sub    $0x10,%rsp
  80458f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804592:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804595:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80459c:	00 00 00 
  80459f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8045a2:	89 10                	mov    %edx,(%rax)
  8045a4:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8045ab:	00 00 00 
  8045ae:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8045b1:	89 50 04             	mov    %edx,0x4(%rax)
  8045b4:	bf 06 00 00 00       	mov    $0x6,%edi
  8045b9:	48 b8 52 43 80 00 00 	movabs $0x804352,%rax
  8045c0:	00 00 00 
  8045c3:	ff d0                	callq  *%rax
  8045c5:	c9                   	leaveq 
  8045c6:	c3                   	retq   

00000000008045c7 <nsipc_recv>:
  8045c7:	55                   	push   %rbp
  8045c8:	48 89 e5             	mov    %rsp,%rbp
  8045cb:	48 83 ec 30          	sub    $0x30,%rsp
  8045cf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8045d2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8045d6:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8045d9:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8045dc:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8045e3:	00 00 00 
  8045e6:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8045e9:	89 10                	mov    %edx,(%rax)
  8045eb:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8045f2:	00 00 00 
  8045f5:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8045f8:	89 50 04             	mov    %edx,0x4(%rax)
  8045fb:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804602:	00 00 00 
  804605:	8b 55 dc             	mov    -0x24(%rbp),%edx
  804608:	89 50 08             	mov    %edx,0x8(%rax)
  80460b:	bf 07 00 00 00       	mov    $0x7,%edi
  804610:	48 b8 52 43 80 00 00 	movabs $0x804352,%rax
  804617:	00 00 00 
  80461a:	ff d0                	callq  *%rax
  80461c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80461f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804623:	78 69                	js     80468e <nsipc_recv+0xc7>
  804625:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  80462c:	7f 08                	jg     804636 <nsipc_recv+0x6f>
  80462e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804631:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  804634:	7e 35                	jle    80466b <nsipc_recv+0xa4>
  804636:	48 b9 31 60 80 00 00 	movabs $0x806031,%rcx
  80463d:	00 00 00 
  804640:	48 ba 46 60 80 00 00 	movabs $0x806046,%rdx
  804647:	00 00 00 
  80464a:	be 62 00 00 00       	mov    $0x62,%esi
  80464f:	48 bf 5b 60 80 00 00 	movabs $0x80605b,%rdi
  804656:	00 00 00 
  804659:	b8 00 00 00 00       	mov    $0x0,%eax
  80465e:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  804665:	00 00 00 
  804668:	41 ff d0             	callq  *%r8
  80466b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80466e:	48 63 d0             	movslq %eax,%rdx
  804671:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804675:	48 be 00 c0 80 00 00 	movabs $0x80c000,%rsi
  80467c:	00 00 00 
  80467f:	48 89 c7             	mov    %rax,%rdi
  804682:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  804689:	00 00 00 
  80468c:	ff d0                	callq  *%rax
  80468e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804691:	c9                   	leaveq 
  804692:	c3                   	retq   

0000000000804693 <nsipc_send>:
  804693:	55                   	push   %rbp
  804694:	48 89 e5             	mov    %rsp,%rbp
  804697:	48 83 ec 20          	sub    $0x20,%rsp
  80469b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80469e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8046a2:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8046a5:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8046a8:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8046af:	00 00 00 
  8046b2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8046b5:	89 10                	mov    %edx,(%rax)
  8046b7:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  8046be:	7e 35                	jle    8046f5 <nsipc_send+0x62>
  8046c0:	48 b9 6a 60 80 00 00 	movabs $0x80606a,%rcx
  8046c7:	00 00 00 
  8046ca:	48 ba 46 60 80 00 00 	movabs $0x806046,%rdx
  8046d1:	00 00 00 
  8046d4:	be 6d 00 00 00       	mov    $0x6d,%esi
  8046d9:	48 bf 5b 60 80 00 00 	movabs $0x80605b,%rdi
  8046e0:	00 00 00 
  8046e3:	b8 00 00 00 00       	mov    $0x0,%eax
  8046e8:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  8046ef:	00 00 00 
  8046f2:	41 ff d0             	callq  *%r8
  8046f5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8046f8:	48 63 d0             	movslq %eax,%rdx
  8046fb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046ff:	48 89 c6             	mov    %rax,%rsi
  804702:	48 bf 0c c0 80 00 00 	movabs $0x80c00c,%rdi
  804709:	00 00 00 
  80470c:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  804713:	00 00 00 
  804716:	ff d0                	callq  *%rax
  804718:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80471f:	00 00 00 
  804722:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804725:	89 50 04             	mov    %edx,0x4(%rax)
  804728:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80472f:	00 00 00 
  804732:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804735:	89 50 08             	mov    %edx,0x8(%rax)
  804738:	bf 08 00 00 00       	mov    $0x8,%edi
  80473d:	48 b8 52 43 80 00 00 	movabs $0x804352,%rax
  804744:	00 00 00 
  804747:	ff d0                	callq  *%rax
  804749:	c9                   	leaveq 
  80474a:	c3                   	retq   

000000000080474b <nsipc_socket>:
  80474b:	55                   	push   %rbp
  80474c:	48 89 e5             	mov    %rsp,%rbp
  80474f:	48 83 ec 10          	sub    $0x10,%rsp
  804753:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804756:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804759:	89 55 f4             	mov    %edx,-0xc(%rbp)
  80475c:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804763:	00 00 00 
  804766:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804769:	89 10                	mov    %edx,(%rax)
  80476b:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804772:	00 00 00 
  804775:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804778:	89 50 04             	mov    %edx,0x4(%rax)
  80477b:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804782:	00 00 00 
  804785:	8b 55 f4             	mov    -0xc(%rbp),%edx
  804788:	89 50 08             	mov    %edx,0x8(%rax)
  80478b:	bf 09 00 00 00       	mov    $0x9,%edi
  804790:	48 b8 52 43 80 00 00 	movabs $0x804352,%rax
  804797:	00 00 00 
  80479a:	ff d0                	callq  *%rax
  80479c:	c9                   	leaveq 
  80479d:	c3                   	retq   

000000000080479e <pipe>:
  80479e:	55                   	push   %rbp
  80479f:	48 89 e5             	mov    %rsp,%rbp
  8047a2:	53                   	push   %rbx
  8047a3:	48 83 ec 38          	sub    $0x38,%rsp
  8047a7:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8047ab:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  8047af:	48 89 c7             	mov    %rax,%rdi
  8047b2:	48 b8 b5 2f 80 00 00 	movabs $0x802fb5,%rax
  8047b9:	00 00 00 
  8047bc:	ff d0                	callq  *%rax
  8047be:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8047c1:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8047c5:	0f 88 bf 01 00 00    	js     80498a <pipe+0x1ec>
  8047cb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8047cf:	ba 07 04 00 00       	mov    $0x407,%edx
  8047d4:	48 89 c6             	mov    %rax,%rsi
  8047d7:	bf 00 00 00 00       	mov    $0x0,%edi
  8047dc:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  8047e3:	00 00 00 
  8047e6:	ff d0                	callq  *%rax
  8047e8:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8047eb:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8047ef:	0f 88 95 01 00 00    	js     80498a <pipe+0x1ec>
  8047f5:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8047f9:	48 89 c7             	mov    %rax,%rdi
  8047fc:	48 b8 b5 2f 80 00 00 	movabs $0x802fb5,%rax
  804803:	00 00 00 
  804806:	ff d0                	callq  *%rax
  804808:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80480b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80480f:	0f 88 5d 01 00 00    	js     804972 <pipe+0x1d4>
  804815:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804819:	ba 07 04 00 00       	mov    $0x407,%edx
  80481e:	48 89 c6             	mov    %rax,%rsi
  804821:	bf 00 00 00 00       	mov    $0x0,%edi
  804826:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  80482d:	00 00 00 
  804830:	ff d0                	callq  *%rax
  804832:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804835:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804839:	0f 88 33 01 00 00    	js     804972 <pipe+0x1d4>
  80483f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804843:	48 89 c7             	mov    %rax,%rdi
  804846:	48 b8 8a 2f 80 00 00 	movabs $0x802f8a,%rax
  80484d:	00 00 00 
  804850:	ff d0                	callq  *%rax
  804852:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804856:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80485a:	ba 07 04 00 00       	mov    $0x407,%edx
  80485f:	48 89 c6             	mov    %rax,%rsi
  804862:	bf 00 00 00 00       	mov    $0x0,%edi
  804867:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  80486e:	00 00 00 
  804871:	ff d0                	callq  *%rax
  804873:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804876:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80487a:	79 05                	jns    804881 <pipe+0xe3>
  80487c:	e9 d9 00 00 00       	jmpq   80495a <pipe+0x1bc>
  804881:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804885:	48 89 c7             	mov    %rax,%rdi
  804888:	48 b8 8a 2f 80 00 00 	movabs $0x802f8a,%rax
  80488f:	00 00 00 
  804892:	ff d0                	callq  *%rax
  804894:	48 89 c2             	mov    %rax,%rdx
  804897:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80489b:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  8048a1:	48 89 d1             	mov    %rdx,%rcx
  8048a4:	ba 00 00 00 00       	mov    $0x0,%edx
  8048a9:	48 89 c6             	mov    %rax,%rsi
  8048ac:	bf 00 00 00 00       	mov    $0x0,%edi
  8048b1:	48 b8 5e 22 80 00 00 	movabs $0x80225e,%rax
  8048b8:	00 00 00 
  8048bb:	ff d0                	callq  *%rax
  8048bd:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8048c0:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8048c4:	79 1b                	jns    8048e1 <pipe+0x143>
  8048c6:	90                   	nop
  8048c7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8048cb:	48 89 c6             	mov    %rax,%rsi
  8048ce:	bf 00 00 00 00       	mov    $0x0,%edi
  8048d3:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  8048da:	00 00 00 
  8048dd:	ff d0                	callq  *%rax
  8048df:	eb 79                	jmp    80495a <pipe+0x1bc>
  8048e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8048e5:	48 ba e0 80 80 00 00 	movabs $0x8080e0,%rdx
  8048ec:	00 00 00 
  8048ef:	8b 12                	mov    (%rdx),%edx
  8048f1:	89 10                	mov    %edx,(%rax)
  8048f3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8048f7:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  8048fe:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804902:	48 ba e0 80 80 00 00 	movabs $0x8080e0,%rdx
  804909:	00 00 00 
  80490c:	8b 12                	mov    (%rdx),%edx
  80490e:	89 10                	mov    %edx,(%rax)
  804910:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804914:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  80491b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80491f:	48 89 c7             	mov    %rax,%rdi
  804922:	48 b8 67 2f 80 00 00 	movabs $0x802f67,%rax
  804929:	00 00 00 
  80492c:	ff d0                	callq  *%rax
  80492e:	89 c2                	mov    %eax,%edx
  804930:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804934:	89 10                	mov    %edx,(%rax)
  804936:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80493a:	48 8d 58 04          	lea    0x4(%rax),%rbx
  80493e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804942:	48 89 c7             	mov    %rax,%rdi
  804945:	48 b8 67 2f 80 00 00 	movabs $0x802f67,%rax
  80494c:	00 00 00 
  80494f:	ff d0                	callq  *%rax
  804951:	89 03                	mov    %eax,(%rbx)
  804953:	b8 00 00 00 00       	mov    $0x0,%eax
  804958:	eb 33                	jmp    80498d <pipe+0x1ef>
  80495a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80495e:	48 89 c6             	mov    %rax,%rsi
  804961:	bf 00 00 00 00       	mov    $0x0,%edi
  804966:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  80496d:	00 00 00 
  804970:	ff d0                	callq  *%rax
  804972:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804976:	48 89 c6             	mov    %rax,%rsi
  804979:	bf 00 00 00 00       	mov    $0x0,%edi
  80497e:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  804985:	00 00 00 
  804988:	ff d0                	callq  *%rax
  80498a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80498d:	48 83 c4 38          	add    $0x38,%rsp
  804991:	5b                   	pop    %rbx
  804992:	5d                   	pop    %rbp
  804993:	c3                   	retq   

0000000000804994 <_pipeisclosed>:
  804994:	55                   	push   %rbp
  804995:	48 89 e5             	mov    %rsp,%rbp
  804998:	53                   	push   %rbx
  804999:	48 83 ec 28          	sub    $0x28,%rsp
  80499d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8049a1:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8049a5:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  8049ac:	00 00 00 
  8049af:	48 8b 00             	mov    (%rax),%rax
  8049b2:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8049b8:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8049bb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8049bf:	48 89 c7             	mov    %rax,%rdi
  8049c2:	48 b8 42 51 80 00 00 	movabs $0x805142,%rax
  8049c9:	00 00 00 
  8049cc:	ff d0                	callq  *%rax
  8049ce:	89 c3                	mov    %eax,%ebx
  8049d0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8049d4:	48 89 c7             	mov    %rax,%rdi
  8049d7:	48 b8 42 51 80 00 00 	movabs $0x805142,%rax
  8049de:	00 00 00 
  8049e1:	ff d0                	callq  *%rax
  8049e3:	39 c3                	cmp    %eax,%ebx
  8049e5:	0f 94 c0             	sete   %al
  8049e8:	0f b6 c0             	movzbl %al,%eax
  8049eb:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8049ee:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  8049f5:	00 00 00 
  8049f8:	48 8b 00             	mov    (%rax),%rax
  8049fb:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804a01:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804a04:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804a07:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804a0a:	75 05                	jne    804a11 <_pipeisclosed+0x7d>
  804a0c:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804a0f:	eb 4f                	jmp    804a60 <_pipeisclosed+0xcc>
  804a11:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804a14:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804a17:	74 42                	je     804a5b <_pipeisclosed+0xc7>
  804a19:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  804a1d:	75 3c                	jne    804a5b <_pipeisclosed+0xc7>
  804a1f:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  804a26:	00 00 00 
  804a29:	48 8b 00             	mov    (%rax),%rax
  804a2c:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  804a32:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  804a35:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804a38:	89 c6                	mov    %eax,%esi
  804a3a:	48 bf 7b 60 80 00 00 	movabs $0x80607b,%rdi
  804a41:	00 00 00 
  804a44:	b8 00 00 00 00       	mov    $0x0,%eax
  804a49:	49 b8 2a 0d 80 00 00 	movabs $0x800d2a,%r8
  804a50:	00 00 00 
  804a53:	41 ff d0             	callq  *%r8
  804a56:	e9 4a ff ff ff       	jmpq   8049a5 <_pipeisclosed+0x11>
  804a5b:	e9 45 ff ff ff       	jmpq   8049a5 <_pipeisclosed+0x11>
  804a60:	48 83 c4 28          	add    $0x28,%rsp
  804a64:	5b                   	pop    %rbx
  804a65:	5d                   	pop    %rbp
  804a66:	c3                   	retq   

0000000000804a67 <pipeisclosed>:
  804a67:	55                   	push   %rbp
  804a68:	48 89 e5             	mov    %rsp,%rbp
  804a6b:	48 83 ec 30          	sub    $0x30,%rsp
  804a6f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804a72:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  804a76:	8b 45 dc             	mov    -0x24(%rbp),%eax
  804a79:	48 89 d6             	mov    %rdx,%rsi
  804a7c:	89 c7                	mov    %eax,%edi
  804a7e:	48 b8 4d 30 80 00 00 	movabs $0x80304d,%rax
  804a85:	00 00 00 
  804a88:	ff d0                	callq  *%rax
  804a8a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804a8d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804a91:	79 05                	jns    804a98 <pipeisclosed+0x31>
  804a93:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a96:	eb 31                	jmp    804ac9 <pipeisclosed+0x62>
  804a98:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804a9c:	48 89 c7             	mov    %rax,%rdi
  804a9f:	48 b8 8a 2f 80 00 00 	movabs $0x802f8a,%rax
  804aa6:	00 00 00 
  804aa9:	ff d0                	callq  *%rax
  804aab:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804aaf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804ab3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804ab7:	48 89 d6             	mov    %rdx,%rsi
  804aba:	48 89 c7             	mov    %rax,%rdi
  804abd:	48 b8 94 49 80 00 00 	movabs $0x804994,%rax
  804ac4:	00 00 00 
  804ac7:	ff d0                	callq  *%rax
  804ac9:	c9                   	leaveq 
  804aca:	c3                   	retq   

0000000000804acb <devpipe_read>:
  804acb:	55                   	push   %rbp
  804acc:	48 89 e5             	mov    %rsp,%rbp
  804acf:	48 83 ec 40          	sub    $0x40,%rsp
  804ad3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804ad7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804adb:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804adf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804ae3:	48 89 c7             	mov    %rax,%rdi
  804ae6:	48 b8 8a 2f 80 00 00 	movabs $0x802f8a,%rax
  804aed:	00 00 00 
  804af0:	ff d0                	callq  *%rax
  804af2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804af6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804afa:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804afe:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804b05:	00 
  804b06:	e9 92 00 00 00       	jmpq   804b9d <devpipe_read+0xd2>
  804b0b:	eb 41                	jmp    804b4e <devpipe_read+0x83>
  804b0d:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  804b12:	74 09                	je     804b1d <devpipe_read+0x52>
  804b14:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b18:	e9 92 00 00 00       	jmpq   804baf <devpipe_read+0xe4>
  804b1d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804b21:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804b25:	48 89 d6             	mov    %rdx,%rsi
  804b28:	48 89 c7             	mov    %rax,%rdi
  804b2b:	48 b8 94 49 80 00 00 	movabs $0x804994,%rax
  804b32:	00 00 00 
  804b35:	ff d0                	callq  *%rax
  804b37:	85 c0                	test   %eax,%eax
  804b39:	74 07                	je     804b42 <devpipe_read+0x77>
  804b3b:	b8 00 00 00 00       	mov    $0x0,%eax
  804b40:	eb 6d                	jmp    804baf <devpipe_read+0xe4>
  804b42:	48 b8 d0 21 80 00 00 	movabs $0x8021d0,%rax
  804b49:	00 00 00 
  804b4c:	ff d0                	callq  *%rax
  804b4e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b52:	8b 10                	mov    (%rax),%edx
  804b54:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b58:	8b 40 04             	mov    0x4(%rax),%eax
  804b5b:	39 c2                	cmp    %eax,%edx
  804b5d:	74 ae                	je     804b0d <devpipe_read+0x42>
  804b5f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b63:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804b67:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  804b6b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b6f:	8b 00                	mov    (%rax),%eax
  804b71:	99                   	cltd   
  804b72:	c1 ea 1b             	shr    $0x1b,%edx
  804b75:	01 d0                	add    %edx,%eax
  804b77:	83 e0 1f             	and    $0x1f,%eax
  804b7a:	29 d0                	sub    %edx,%eax
  804b7c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804b80:	48 98                	cltq   
  804b82:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  804b87:	88 01                	mov    %al,(%rcx)
  804b89:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b8d:	8b 00                	mov    (%rax),%eax
  804b8f:	8d 50 01             	lea    0x1(%rax),%edx
  804b92:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b96:	89 10                	mov    %edx,(%rax)
  804b98:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804b9d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804ba1:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804ba5:	0f 82 60 ff ff ff    	jb     804b0b <devpipe_read+0x40>
  804bab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804baf:	c9                   	leaveq 
  804bb0:	c3                   	retq   

0000000000804bb1 <devpipe_write>:
  804bb1:	55                   	push   %rbp
  804bb2:	48 89 e5             	mov    %rsp,%rbp
  804bb5:	48 83 ec 40          	sub    $0x40,%rsp
  804bb9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804bbd:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804bc1:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804bc5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804bc9:	48 89 c7             	mov    %rax,%rdi
  804bcc:	48 b8 8a 2f 80 00 00 	movabs $0x802f8a,%rax
  804bd3:	00 00 00 
  804bd6:	ff d0                	callq  *%rax
  804bd8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804bdc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804be0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804be4:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804beb:	00 
  804bec:	e9 8e 00 00 00       	jmpq   804c7f <devpipe_write+0xce>
  804bf1:	eb 31                	jmp    804c24 <devpipe_write+0x73>
  804bf3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804bf7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804bfb:	48 89 d6             	mov    %rdx,%rsi
  804bfe:	48 89 c7             	mov    %rax,%rdi
  804c01:	48 b8 94 49 80 00 00 	movabs $0x804994,%rax
  804c08:	00 00 00 
  804c0b:	ff d0                	callq  *%rax
  804c0d:	85 c0                	test   %eax,%eax
  804c0f:	74 07                	je     804c18 <devpipe_write+0x67>
  804c11:	b8 00 00 00 00       	mov    $0x0,%eax
  804c16:	eb 79                	jmp    804c91 <devpipe_write+0xe0>
  804c18:	48 b8 d0 21 80 00 00 	movabs $0x8021d0,%rax
  804c1f:	00 00 00 
  804c22:	ff d0                	callq  *%rax
  804c24:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804c28:	8b 40 04             	mov    0x4(%rax),%eax
  804c2b:	48 63 d0             	movslq %eax,%rdx
  804c2e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804c32:	8b 00                	mov    (%rax),%eax
  804c34:	48 98                	cltq   
  804c36:	48 83 c0 20          	add    $0x20,%rax
  804c3a:	48 39 c2             	cmp    %rax,%rdx
  804c3d:	73 b4                	jae    804bf3 <devpipe_write+0x42>
  804c3f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804c43:	8b 40 04             	mov    0x4(%rax),%eax
  804c46:	99                   	cltd   
  804c47:	c1 ea 1b             	shr    $0x1b,%edx
  804c4a:	01 d0                	add    %edx,%eax
  804c4c:	83 e0 1f             	and    $0x1f,%eax
  804c4f:	29 d0                	sub    %edx,%eax
  804c51:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804c55:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  804c59:	48 01 ca             	add    %rcx,%rdx
  804c5c:	0f b6 0a             	movzbl (%rdx),%ecx
  804c5f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804c63:	48 98                	cltq   
  804c65:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  804c69:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804c6d:	8b 40 04             	mov    0x4(%rax),%eax
  804c70:	8d 50 01             	lea    0x1(%rax),%edx
  804c73:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804c77:	89 50 04             	mov    %edx,0x4(%rax)
  804c7a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804c7f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c83:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804c87:	0f 82 64 ff ff ff    	jb     804bf1 <devpipe_write+0x40>
  804c8d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c91:	c9                   	leaveq 
  804c92:	c3                   	retq   

0000000000804c93 <devpipe_stat>:
  804c93:	55                   	push   %rbp
  804c94:	48 89 e5             	mov    %rsp,%rbp
  804c97:	48 83 ec 20          	sub    $0x20,%rsp
  804c9b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804c9f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804ca3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804ca7:	48 89 c7             	mov    %rax,%rdi
  804caa:	48 b8 8a 2f 80 00 00 	movabs $0x802f8a,%rax
  804cb1:	00 00 00 
  804cb4:	ff d0                	callq  *%rax
  804cb6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804cba:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804cbe:	48 be 8e 60 80 00 00 	movabs $0x80608e,%rsi
  804cc5:	00 00 00 
  804cc8:	48 89 c7             	mov    %rax,%rdi
  804ccb:	48 b8 df 18 80 00 00 	movabs $0x8018df,%rax
  804cd2:	00 00 00 
  804cd5:	ff d0                	callq  *%rax
  804cd7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804cdb:	8b 50 04             	mov    0x4(%rax),%edx
  804cde:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804ce2:	8b 00                	mov    (%rax),%eax
  804ce4:	29 c2                	sub    %eax,%edx
  804ce6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804cea:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804cf0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804cf4:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804cfb:	00 00 00 
  804cfe:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804d02:	48 b9 e0 80 80 00 00 	movabs $0x8080e0,%rcx
  804d09:	00 00 00 
  804d0c:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804d13:	b8 00 00 00 00       	mov    $0x0,%eax
  804d18:	c9                   	leaveq 
  804d19:	c3                   	retq   

0000000000804d1a <devpipe_close>:
  804d1a:	55                   	push   %rbp
  804d1b:	48 89 e5             	mov    %rsp,%rbp
  804d1e:	48 83 ec 10          	sub    $0x10,%rsp
  804d22:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804d26:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804d2a:	48 89 c6             	mov    %rax,%rsi
  804d2d:	bf 00 00 00 00       	mov    $0x0,%edi
  804d32:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  804d39:	00 00 00 
  804d3c:	ff d0                	callq  *%rax
  804d3e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804d42:	48 89 c7             	mov    %rax,%rdi
  804d45:	48 b8 8a 2f 80 00 00 	movabs $0x802f8a,%rax
  804d4c:	00 00 00 
  804d4f:	ff d0                	callq  *%rax
  804d51:	48 89 c6             	mov    %rax,%rsi
  804d54:	bf 00 00 00 00       	mov    $0x0,%edi
  804d59:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  804d60:	00 00 00 
  804d63:	ff d0                	callq  *%rax
  804d65:	c9                   	leaveq 
  804d66:	c3                   	retq   

0000000000804d67 <cputchar>:
  804d67:	55                   	push   %rbp
  804d68:	48 89 e5             	mov    %rsp,%rbp
  804d6b:	48 83 ec 20          	sub    $0x20,%rsp
  804d6f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804d72:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804d75:	88 45 ff             	mov    %al,-0x1(%rbp)
  804d78:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804d7c:	be 01 00 00 00       	mov    $0x1,%esi
  804d81:	48 89 c7             	mov    %rax,%rdi
  804d84:	48 b8 c6 20 80 00 00 	movabs $0x8020c6,%rax
  804d8b:	00 00 00 
  804d8e:	ff d0                	callq  *%rax
  804d90:	c9                   	leaveq 
  804d91:	c3                   	retq   

0000000000804d92 <getchar>:
  804d92:	55                   	push   %rbp
  804d93:	48 89 e5             	mov    %rsp,%rbp
  804d96:	48 83 ec 10          	sub    $0x10,%rsp
  804d9a:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804d9e:	ba 01 00 00 00       	mov    $0x1,%edx
  804da3:	48 89 c6             	mov    %rax,%rsi
  804da6:	bf 00 00 00 00       	mov    $0x0,%edi
  804dab:	48 b8 7f 34 80 00 00 	movabs $0x80347f,%rax
  804db2:	00 00 00 
  804db5:	ff d0                	callq  *%rax
  804db7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804dba:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804dbe:	79 05                	jns    804dc5 <getchar+0x33>
  804dc0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804dc3:	eb 14                	jmp    804dd9 <getchar+0x47>
  804dc5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804dc9:	7f 07                	jg     804dd2 <getchar+0x40>
  804dcb:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804dd0:	eb 07                	jmp    804dd9 <getchar+0x47>
  804dd2:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  804dd6:	0f b6 c0             	movzbl %al,%eax
  804dd9:	c9                   	leaveq 
  804dda:	c3                   	retq   

0000000000804ddb <iscons>:
  804ddb:	55                   	push   %rbp
  804ddc:	48 89 e5             	mov    %rsp,%rbp
  804ddf:	48 83 ec 20          	sub    $0x20,%rsp
  804de3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804de6:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804dea:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804ded:	48 89 d6             	mov    %rdx,%rsi
  804df0:	89 c7                	mov    %eax,%edi
  804df2:	48 b8 4d 30 80 00 00 	movabs $0x80304d,%rax
  804df9:	00 00 00 
  804dfc:	ff d0                	callq  *%rax
  804dfe:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804e01:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804e05:	79 05                	jns    804e0c <iscons+0x31>
  804e07:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804e0a:	eb 1a                	jmp    804e26 <iscons+0x4b>
  804e0c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804e10:	8b 10                	mov    (%rax),%edx
  804e12:	48 b8 20 81 80 00 00 	movabs $0x808120,%rax
  804e19:	00 00 00 
  804e1c:	8b 00                	mov    (%rax),%eax
  804e1e:	39 c2                	cmp    %eax,%edx
  804e20:	0f 94 c0             	sete   %al
  804e23:	0f b6 c0             	movzbl %al,%eax
  804e26:	c9                   	leaveq 
  804e27:	c3                   	retq   

0000000000804e28 <opencons>:
  804e28:	55                   	push   %rbp
  804e29:	48 89 e5             	mov    %rsp,%rbp
  804e2c:	48 83 ec 10          	sub    $0x10,%rsp
  804e30:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804e34:	48 89 c7             	mov    %rax,%rdi
  804e37:	48 b8 b5 2f 80 00 00 	movabs $0x802fb5,%rax
  804e3e:	00 00 00 
  804e41:	ff d0                	callq  *%rax
  804e43:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804e46:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804e4a:	79 05                	jns    804e51 <opencons+0x29>
  804e4c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804e4f:	eb 5b                	jmp    804eac <opencons+0x84>
  804e51:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804e55:	ba 07 04 00 00       	mov    $0x407,%edx
  804e5a:	48 89 c6             	mov    %rax,%rsi
  804e5d:	bf 00 00 00 00       	mov    $0x0,%edi
  804e62:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  804e69:	00 00 00 
  804e6c:	ff d0                	callq  *%rax
  804e6e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804e71:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804e75:	79 05                	jns    804e7c <opencons+0x54>
  804e77:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804e7a:	eb 30                	jmp    804eac <opencons+0x84>
  804e7c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804e80:	48 ba 20 81 80 00 00 	movabs $0x808120,%rdx
  804e87:	00 00 00 
  804e8a:	8b 12                	mov    (%rdx),%edx
  804e8c:	89 10                	mov    %edx,(%rax)
  804e8e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804e92:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804e99:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804e9d:	48 89 c7             	mov    %rax,%rdi
  804ea0:	48 b8 67 2f 80 00 00 	movabs $0x802f67,%rax
  804ea7:	00 00 00 
  804eaa:	ff d0                	callq  *%rax
  804eac:	c9                   	leaveq 
  804ead:	c3                   	retq   

0000000000804eae <devcons_read>:
  804eae:	55                   	push   %rbp
  804eaf:	48 89 e5             	mov    %rsp,%rbp
  804eb2:	48 83 ec 30          	sub    $0x30,%rsp
  804eb6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804eba:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804ebe:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804ec2:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804ec7:	75 07                	jne    804ed0 <devcons_read+0x22>
  804ec9:	b8 00 00 00 00       	mov    $0x0,%eax
  804ece:	eb 4b                	jmp    804f1b <devcons_read+0x6d>
  804ed0:	eb 0c                	jmp    804ede <devcons_read+0x30>
  804ed2:	48 b8 d0 21 80 00 00 	movabs $0x8021d0,%rax
  804ed9:	00 00 00 
  804edc:	ff d0                	callq  *%rax
  804ede:	48 b8 10 21 80 00 00 	movabs $0x802110,%rax
  804ee5:	00 00 00 
  804ee8:	ff d0                	callq  *%rax
  804eea:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804eed:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804ef1:	74 df                	je     804ed2 <devcons_read+0x24>
  804ef3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804ef7:	79 05                	jns    804efe <devcons_read+0x50>
  804ef9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804efc:	eb 1d                	jmp    804f1b <devcons_read+0x6d>
  804efe:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804f02:	75 07                	jne    804f0b <devcons_read+0x5d>
  804f04:	b8 00 00 00 00       	mov    $0x0,%eax
  804f09:	eb 10                	jmp    804f1b <devcons_read+0x6d>
  804f0b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804f0e:	89 c2                	mov    %eax,%edx
  804f10:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804f14:	88 10                	mov    %dl,(%rax)
  804f16:	b8 01 00 00 00       	mov    $0x1,%eax
  804f1b:	c9                   	leaveq 
  804f1c:	c3                   	retq   

0000000000804f1d <devcons_write>:
  804f1d:	55                   	push   %rbp
  804f1e:	48 89 e5             	mov    %rsp,%rbp
  804f21:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  804f28:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804f2f:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804f36:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804f3d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804f44:	eb 76                	jmp    804fbc <devcons_write+0x9f>
  804f46:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804f4d:	89 c2                	mov    %eax,%edx
  804f4f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804f52:	29 c2                	sub    %eax,%edx
  804f54:	89 d0                	mov    %edx,%eax
  804f56:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804f59:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804f5c:	83 f8 7f             	cmp    $0x7f,%eax
  804f5f:	76 07                	jbe    804f68 <devcons_write+0x4b>
  804f61:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804f68:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804f6b:	48 63 d0             	movslq %eax,%rdx
  804f6e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804f71:	48 63 c8             	movslq %eax,%rcx
  804f74:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804f7b:	48 01 c1             	add    %rax,%rcx
  804f7e:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804f85:	48 89 ce             	mov    %rcx,%rsi
  804f88:	48 89 c7             	mov    %rax,%rdi
  804f8b:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  804f92:	00 00 00 
  804f95:	ff d0                	callq  *%rax
  804f97:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804f9a:	48 63 d0             	movslq %eax,%rdx
  804f9d:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804fa4:	48 89 d6             	mov    %rdx,%rsi
  804fa7:	48 89 c7             	mov    %rax,%rdi
  804faa:	48 b8 c6 20 80 00 00 	movabs $0x8020c6,%rax
  804fb1:	00 00 00 
  804fb4:	ff d0                	callq  *%rax
  804fb6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804fb9:	01 45 fc             	add    %eax,-0x4(%rbp)
  804fbc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804fbf:	48 98                	cltq   
  804fc1:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804fc8:	0f 82 78 ff ff ff    	jb     804f46 <devcons_write+0x29>
  804fce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804fd1:	c9                   	leaveq 
  804fd2:	c3                   	retq   

0000000000804fd3 <devcons_close>:
  804fd3:	55                   	push   %rbp
  804fd4:	48 89 e5             	mov    %rsp,%rbp
  804fd7:	48 83 ec 08          	sub    $0x8,%rsp
  804fdb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804fdf:	b8 00 00 00 00       	mov    $0x0,%eax
  804fe4:	c9                   	leaveq 
  804fe5:	c3                   	retq   

0000000000804fe6 <devcons_stat>:
  804fe6:	55                   	push   %rbp
  804fe7:	48 89 e5             	mov    %rsp,%rbp
  804fea:	48 83 ec 10          	sub    $0x10,%rsp
  804fee:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804ff2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804ff6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804ffa:	48 be 9a 60 80 00 00 	movabs $0x80609a,%rsi
  805001:	00 00 00 
  805004:	48 89 c7             	mov    %rax,%rdi
  805007:	48 b8 df 18 80 00 00 	movabs $0x8018df,%rax
  80500e:	00 00 00 
  805011:	ff d0                	callq  *%rax
  805013:	b8 00 00 00 00       	mov    $0x0,%eax
  805018:	c9                   	leaveq 
  805019:	c3                   	retq   

000000000080501a <set_pgfault_handler>:
  80501a:	55                   	push   %rbp
  80501b:	48 89 e5             	mov    %rsp,%rbp
  80501e:	48 83 ec 20          	sub    $0x20,%rsp
  805022:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  805026:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  80502d:	00 00 00 
  805030:	48 8b 00             	mov    (%rax),%rax
  805033:	48 85 c0             	test   %rax,%rax
  805036:	75 6f                	jne    8050a7 <set_pgfault_handler+0x8d>
  805038:	ba 07 00 00 00       	mov    $0x7,%edx
  80503d:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  805042:	bf 00 00 00 00       	mov    $0x0,%edi
  805047:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  80504e:	00 00 00 
  805051:	ff d0                	callq  *%rax
  805053:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805056:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80505a:	79 30                	jns    80508c <set_pgfault_handler+0x72>
  80505c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80505f:	89 c1                	mov    %eax,%ecx
  805061:	48 ba a8 60 80 00 00 	movabs $0x8060a8,%rdx
  805068:	00 00 00 
  80506b:	be 22 00 00 00       	mov    $0x22,%esi
  805070:	48 bf c7 60 80 00 00 	movabs $0x8060c7,%rdi
  805077:	00 00 00 
  80507a:	b8 00 00 00 00       	mov    $0x0,%eax
  80507f:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  805086:	00 00 00 
  805089:	41 ff d0             	callq  *%r8
  80508c:	48 be ba 50 80 00 00 	movabs $0x8050ba,%rsi
  805093:	00 00 00 
  805096:	bf 00 00 00 00       	mov    $0x0,%edi
  80509b:	48 b8 98 23 80 00 00 	movabs $0x802398,%rax
  8050a2:	00 00 00 
  8050a5:	ff d0                	callq  *%rax
  8050a7:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8050ae:	00 00 00 
  8050b1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8050b5:	48 89 10             	mov    %rdx,(%rax)
  8050b8:	c9                   	leaveq 
  8050b9:	c3                   	retq   

00000000008050ba <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  8050ba:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  8050bd:	48 a1 00 d0 80 00 00 	movabs 0x80d000,%rax
  8050c4:	00 00 00 
call *%rax
  8050c7:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  8050c9:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  8050d0:	00 08 
    movq 152(%rsp), %rax
  8050d2:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  8050d9:	00 
    movq 136(%rsp), %rbx
  8050da:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  8050e1:	00 
movq %rbx, (%rax)
  8050e2:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  8050e5:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  8050e9:	4c 8b 3c 24          	mov    (%rsp),%r15
  8050ed:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  8050f2:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  8050f7:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  8050fc:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  805101:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  805106:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  80510b:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  805110:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  805115:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  80511a:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  80511f:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  805124:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  805129:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  80512e:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  805133:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  805137:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  80513b:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  80513c:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  805141:	c3                   	retq   

0000000000805142 <pageref>:
  805142:	55                   	push   %rbp
  805143:	48 89 e5             	mov    %rsp,%rbp
  805146:	48 83 ec 18          	sub    $0x18,%rsp
  80514a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80514e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805152:	48 c1 e8 15          	shr    $0x15,%rax
  805156:	48 89 c2             	mov    %rax,%rdx
  805159:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  805160:	01 00 00 
  805163:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  805167:	83 e0 01             	and    $0x1,%eax
  80516a:	48 85 c0             	test   %rax,%rax
  80516d:	75 07                	jne    805176 <pageref+0x34>
  80516f:	b8 00 00 00 00       	mov    $0x0,%eax
  805174:	eb 53                	jmp    8051c9 <pageref+0x87>
  805176:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80517a:	48 c1 e8 0c          	shr    $0xc,%rax
  80517e:	48 89 c2             	mov    %rax,%rdx
  805181:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  805188:	01 00 00 
  80518b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80518f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  805193:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805197:	83 e0 01             	and    $0x1,%eax
  80519a:	48 85 c0             	test   %rax,%rax
  80519d:	75 07                	jne    8051a6 <pageref+0x64>
  80519f:	b8 00 00 00 00       	mov    $0x0,%eax
  8051a4:	eb 23                	jmp    8051c9 <pageref+0x87>
  8051a6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8051aa:	48 c1 e8 0c          	shr    $0xc,%rax
  8051ae:	48 89 c2             	mov    %rax,%rdx
  8051b1:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  8051b8:	00 00 00 
  8051bb:	48 c1 e2 04          	shl    $0x4,%rdx
  8051bf:	48 01 d0             	add    %rdx,%rax
  8051c2:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  8051c6:	0f b7 c0             	movzwl %ax,%eax
  8051c9:	c9                   	leaveq 
  8051ca:	c3                   	retq   

00000000008051cb <inet_addr>:
  8051cb:	55                   	push   %rbp
  8051cc:	48 89 e5             	mov    %rsp,%rbp
  8051cf:	48 83 ec 20          	sub    $0x20,%rsp
  8051d3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8051d7:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8051db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8051df:	48 89 d6             	mov    %rdx,%rsi
  8051e2:	48 89 c7             	mov    %rax,%rdi
  8051e5:	48 b8 01 52 80 00 00 	movabs $0x805201,%rax
  8051ec:	00 00 00 
  8051ef:	ff d0                	callq  *%rax
  8051f1:	85 c0                	test   %eax,%eax
  8051f3:	74 05                	je     8051fa <inet_addr+0x2f>
  8051f5:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8051f8:	eb 05                	jmp    8051ff <inet_addr+0x34>
  8051fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  8051ff:	c9                   	leaveq 
  805200:	c3                   	retq   

0000000000805201 <inet_aton>:
  805201:	55                   	push   %rbp
  805202:	48 89 e5             	mov    %rsp,%rbp
  805205:	48 83 ec 40          	sub    $0x40,%rsp
  805209:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  80520d:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  805211:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  805215:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  805219:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80521d:	0f b6 00             	movzbl (%rax),%eax
  805220:	0f be c0             	movsbl %al,%eax
  805223:	89 45 f4             	mov    %eax,-0xc(%rbp)
  805226:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805229:	3c 2f                	cmp    $0x2f,%al
  80522b:	76 07                	jbe    805234 <inet_aton+0x33>
  80522d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805230:	3c 39                	cmp    $0x39,%al
  805232:	76 0a                	jbe    80523e <inet_aton+0x3d>
  805234:	b8 00 00 00 00       	mov    $0x0,%eax
  805239:	e9 68 02 00 00       	jmpq   8054a6 <inet_aton+0x2a5>
  80523e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  805245:	c7 45 f8 0a 00 00 00 	movl   $0xa,-0x8(%rbp)
  80524c:	83 7d f4 30          	cmpl   $0x30,-0xc(%rbp)
  805250:	75 40                	jne    805292 <inet_aton+0x91>
  805252:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  805257:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80525b:	0f b6 00             	movzbl (%rax),%eax
  80525e:	0f be c0             	movsbl %al,%eax
  805261:	89 45 f4             	mov    %eax,-0xc(%rbp)
  805264:	83 7d f4 78          	cmpl   $0x78,-0xc(%rbp)
  805268:	74 06                	je     805270 <inet_aton+0x6f>
  80526a:	83 7d f4 58          	cmpl   $0x58,-0xc(%rbp)
  80526e:	75 1b                	jne    80528b <inet_aton+0x8a>
  805270:	c7 45 f8 10 00 00 00 	movl   $0x10,-0x8(%rbp)
  805277:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  80527c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  805280:	0f b6 00             	movzbl (%rax),%eax
  805283:	0f be c0             	movsbl %al,%eax
  805286:	89 45 f4             	mov    %eax,-0xc(%rbp)
  805289:	eb 07                	jmp    805292 <inet_aton+0x91>
  80528b:	c7 45 f8 08 00 00 00 	movl   $0x8,-0x8(%rbp)
  805292:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805295:	3c 2f                	cmp    $0x2f,%al
  805297:	76 2f                	jbe    8052c8 <inet_aton+0xc7>
  805299:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80529c:	3c 39                	cmp    $0x39,%al
  80529e:	77 28                	ja     8052c8 <inet_aton+0xc7>
  8052a0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8052a3:	0f af 45 fc          	imul   -0x4(%rbp),%eax
  8052a7:	89 c2                	mov    %eax,%edx
  8052a9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8052ac:	01 d0                	add    %edx,%eax
  8052ae:	83 e8 30             	sub    $0x30,%eax
  8052b1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8052b4:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  8052b9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8052bd:	0f b6 00             	movzbl (%rax),%eax
  8052c0:	0f be c0             	movsbl %al,%eax
  8052c3:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8052c6:	eb ca                	jmp    805292 <inet_aton+0x91>
  8052c8:	83 7d f8 10          	cmpl   $0x10,-0x8(%rbp)
  8052cc:	75 72                	jne    805340 <inet_aton+0x13f>
  8052ce:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8052d1:	3c 2f                	cmp    $0x2f,%al
  8052d3:	76 07                	jbe    8052dc <inet_aton+0xdb>
  8052d5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8052d8:	3c 39                	cmp    $0x39,%al
  8052da:	76 1c                	jbe    8052f8 <inet_aton+0xf7>
  8052dc:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8052df:	3c 60                	cmp    $0x60,%al
  8052e1:	76 07                	jbe    8052ea <inet_aton+0xe9>
  8052e3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8052e6:	3c 66                	cmp    $0x66,%al
  8052e8:	76 0e                	jbe    8052f8 <inet_aton+0xf7>
  8052ea:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8052ed:	3c 40                	cmp    $0x40,%al
  8052ef:	76 4f                	jbe    805340 <inet_aton+0x13f>
  8052f1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8052f4:	3c 46                	cmp    $0x46,%al
  8052f6:	77 48                	ja     805340 <inet_aton+0x13f>
  8052f8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8052fb:	c1 e0 04             	shl    $0x4,%eax
  8052fe:	89 c2                	mov    %eax,%edx
  805300:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805303:	8d 48 0a             	lea    0xa(%rax),%ecx
  805306:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805309:	3c 60                	cmp    $0x60,%al
  80530b:	76 0e                	jbe    80531b <inet_aton+0x11a>
  80530d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805310:	3c 7a                	cmp    $0x7a,%al
  805312:	77 07                	ja     80531b <inet_aton+0x11a>
  805314:	b8 61 00 00 00       	mov    $0x61,%eax
  805319:	eb 05                	jmp    805320 <inet_aton+0x11f>
  80531b:	b8 41 00 00 00       	mov    $0x41,%eax
  805320:	29 c1                	sub    %eax,%ecx
  805322:	89 c8                	mov    %ecx,%eax
  805324:	09 d0                	or     %edx,%eax
  805326:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805329:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  80532e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  805332:	0f b6 00             	movzbl (%rax),%eax
  805335:	0f be c0             	movsbl %al,%eax
  805338:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80533b:	e9 52 ff ff ff       	jmpq   805292 <inet_aton+0x91>
  805340:	83 7d f4 2e          	cmpl   $0x2e,-0xc(%rbp)
  805344:	75 40                	jne    805386 <inet_aton+0x185>
  805346:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80534a:	48 83 c0 0c          	add    $0xc,%rax
  80534e:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
  805352:	72 0a                	jb     80535e <inet_aton+0x15d>
  805354:	b8 00 00 00 00       	mov    $0x0,%eax
  805359:	e9 48 01 00 00       	jmpq   8054a6 <inet_aton+0x2a5>
  80535e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805362:	48 8d 50 04          	lea    0x4(%rax),%rdx
  805366:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80536a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80536d:	89 10                	mov    %edx,(%rax)
  80536f:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  805374:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  805378:	0f b6 00             	movzbl (%rax),%eax
  80537b:	0f be c0             	movsbl %al,%eax
  80537e:	89 45 f4             	mov    %eax,-0xc(%rbp)
  805381:	e9 a0 fe ff ff       	jmpq   805226 <inet_aton+0x25>
  805386:	90                   	nop
  805387:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80538b:	74 3c                	je     8053c9 <inet_aton+0x1c8>
  80538d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805390:	3c 1f                	cmp    $0x1f,%al
  805392:	76 2b                	jbe    8053bf <inet_aton+0x1be>
  805394:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805397:	84 c0                	test   %al,%al
  805399:	78 24                	js     8053bf <inet_aton+0x1be>
  80539b:	83 7d f4 20          	cmpl   $0x20,-0xc(%rbp)
  80539f:	74 28                	je     8053c9 <inet_aton+0x1c8>
  8053a1:	83 7d f4 0c          	cmpl   $0xc,-0xc(%rbp)
  8053a5:	74 22                	je     8053c9 <inet_aton+0x1c8>
  8053a7:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  8053ab:	74 1c                	je     8053c9 <inet_aton+0x1c8>
  8053ad:	83 7d f4 0d          	cmpl   $0xd,-0xc(%rbp)
  8053b1:	74 16                	je     8053c9 <inet_aton+0x1c8>
  8053b3:	83 7d f4 09          	cmpl   $0x9,-0xc(%rbp)
  8053b7:	74 10                	je     8053c9 <inet_aton+0x1c8>
  8053b9:	83 7d f4 0b          	cmpl   $0xb,-0xc(%rbp)
  8053bd:	74 0a                	je     8053c9 <inet_aton+0x1c8>
  8053bf:	b8 00 00 00 00       	mov    $0x0,%eax
  8053c4:	e9 dd 00 00 00       	jmpq   8054a6 <inet_aton+0x2a5>
  8053c9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8053cd:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8053d1:	48 29 c2             	sub    %rax,%rdx
  8053d4:	48 89 d0             	mov    %rdx,%rax
  8053d7:	48 c1 f8 02          	sar    $0x2,%rax
  8053db:	83 c0 01             	add    $0x1,%eax
  8053de:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8053e1:	83 7d e4 04          	cmpl   $0x4,-0x1c(%rbp)
  8053e5:	0f 87 98 00 00 00    	ja     805483 <inet_aton+0x282>
  8053eb:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8053ee:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8053f5:	00 
  8053f6:	48 b8 d8 60 80 00 00 	movabs $0x8060d8,%rax
  8053fd:	00 00 00 
  805400:	48 01 d0             	add    %rdx,%rax
  805403:	48 8b 00             	mov    (%rax),%rax
  805406:	ff e0                	jmpq   *%rax
  805408:	b8 00 00 00 00       	mov    $0x0,%eax
  80540d:	e9 94 00 00 00       	jmpq   8054a6 <inet_aton+0x2a5>
  805412:	81 7d fc ff ff ff 00 	cmpl   $0xffffff,-0x4(%rbp)
  805419:	76 0a                	jbe    805425 <inet_aton+0x224>
  80541b:	b8 00 00 00 00       	mov    $0x0,%eax
  805420:	e9 81 00 00 00       	jmpq   8054a6 <inet_aton+0x2a5>
  805425:	8b 45 d0             	mov    -0x30(%rbp),%eax
  805428:	c1 e0 18             	shl    $0x18,%eax
  80542b:	09 45 fc             	or     %eax,-0x4(%rbp)
  80542e:	eb 53                	jmp    805483 <inet_aton+0x282>
  805430:	81 7d fc ff ff 00 00 	cmpl   $0xffff,-0x4(%rbp)
  805437:	76 07                	jbe    805440 <inet_aton+0x23f>
  805439:	b8 00 00 00 00       	mov    $0x0,%eax
  80543e:	eb 66                	jmp    8054a6 <inet_aton+0x2a5>
  805440:	8b 45 d0             	mov    -0x30(%rbp),%eax
  805443:	c1 e0 18             	shl    $0x18,%eax
  805446:	89 c2                	mov    %eax,%edx
  805448:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80544b:	c1 e0 10             	shl    $0x10,%eax
  80544e:	09 d0                	or     %edx,%eax
  805450:	09 45 fc             	or     %eax,-0x4(%rbp)
  805453:	eb 2e                	jmp    805483 <inet_aton+0x282>
  805455:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
  80545c:	76 07                	jbe    805465 <inet_aton+0x264>
  80545e:	b8 00 00 00 00       	mov    $0x0,%eax
  805463:	eb 41                	jmp    8054a6 <inet_aton+0x2a5>
  805465:	8b 45 d0             	mov    -0x30(%rbp),%eax
  805468:	c1 e0 18             	shl    $0x18,%eax
  80546b:	89 c2                	mov    %eax,%edx
  80546d:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  805470:	c1 e0 10             	shl    $0x10,%eax
  805473:	09 c2                	or     %eax,%edx
  805475:	8b 45 d8             	mov    -0x28(%rbp),%eax
  805478:	c1 e0 08             	shl    $0x8,%eax
  80547b:	09 d0                	or     %edx,%eax
  80547d:	09 45 fc             	or     %eax,-0x4(%rbp)
  805480:	eb 01                	jmp    805483 <inet_aton+0x282>
  805482:	90                   	nop
  805483:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
  805488:	74 17                	je     8054a1 <inet_aton+0x2a0>
  80548a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80548d:	89 c7                	mov    %eax,%edi
  80548f:	48 b8 1f 56 80 00 00 	movabs $0x80561f,%rax
  805496:	00 00 00 
  805499:	ff d0                	callq  *%rax
  80549b:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80549f:	89 02                	mov    %eax,(%rdx)
  8054a1:	b8 01 00 00 00       	mov    $0x1,%eax
  8054a6:	c9                   	leaveq 
  8054a7:	c3                   	retq   

00000000008054a8 <inet_ntoa>:
  8054a8:	55                   	push   %rbp
  8054a9:	48 89 e5             	mov    %rsp,%rbp
  8054ac:	48 83 ec 30          	sub    $0x30,%rsp
  8054b0:	89 7d d0             	mov    %edi,-0x30(%rbp)
  8054b3:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8054b6:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8054b9:	48 b8 10 90 80 00 00 	movabs $0x809010,%rax
  8054c0:	00 00 00 
  8054c3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8054c7:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  8054cb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8054cf:	c6 45 ef 00          	movb   $0x0,-0x11(%rbp)
  8054d3:	e9 e0 00 00 00       	jmpq   8055b8 <inet_ntoa+0x110>
  8054d8:	c6 45 ee 00          	movb   $0x0,-0x12(%rbp)
  8054dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8054e0:	0f b6 08             	movzbl (%rax),%ecx
  8054e3:	0f b6 d1             	movzbl %cl,%edx
  8054e6:	89 d0                	mov    %edx,%eax
  8054e8:	c1 e0 02             	shl    $0x2,%eax
  8054eb:	01 d0                	add    %edx,%eax
  8054ed:	c1 e0 03             	shl    $0x3,%eax
  8054f0:	01 d0                	add    %edx,%eax
  8054f2:	8d 14 85 00 00 00 00 	lea    0x0(,%rax,4),%edx
  8054f9:	01 d0                	add    %edx,%eax
  8054fb:	66 c1 e8 08          	shr    $0x8,%ax
  8054ff:	c0 e8 03             	shr    $0x3,%al
  805502:	88 45 ed             	mov    %al,-0x13(%rbp)
  805505:	0f b6 55 ed          	movzbl -0x13(%rbp),%edx
  805509:	89 d0                	mov    %edx,%eax
  80550b:	c1 e0 02             	shl    $0x2,%eax
  80550e:	01 d0                	add    %edx,%eax
  805510:	01 c0                	add    %eax,%eax
  805512:	29 c1                	sub    %eax,%ecx
  805514:	89 c8                	mov    %ecx,%eax
  805516:	88 45 ed             	mov    %al,-0x13(%rbp)
  805519:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80551d:	0f b6 00             	movzbl (%rax),%eax
  805520:	0f b6 d0             	movzbl %al,%edx
  805523:	89 d0                	mov    %edx,%eax
  805525:	c1 e0 02             	shl    $0x2,%eax
  805528:	01 d0                	add    %edx,%eax
  80552a:	c1 e0 03             	shl    $0x3,%eax
  80552d:	01 d0                	add    %edx,%eax
  80552f:	8d 14 85 00 00 00 00 	lea    0x0(,%rax,4),%edx
  805536:	01 d0                	add    %edx,%eax
  805538:	66 c1 e8 08          	shr    $0x8,%ax
  80553c:	89 c2                	mov    %eax,%edx
  80553e:	c0 ea 03             	shr    $0x3,%dl
  805541:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805545:	88 10                	mov    %dl,(%rax)
  805547:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
  80554b:	8d 50 01             	lea    0x1(%rax),%edx
  80554e:	88 55 ee             	mov    %dl,-0x12(%rbp)
  805551:	0f b6 c0             	movzbl %al,%eax
  805554:	0f b6 55 ed          	movzbl -0x13(%rbp),%edx
  805558:	83 c2 30             	add    $0x30,%edx
  80555b:	48 98                	cltq   
  80555d:	88 54 05 e0          	mov    %dl,-0x20(%rbp,%rax,1)
  805561:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805565:	0f b6 00             	movzbl (%rax),%eax
  805568:	84 c0                	test   %al,%al
  80556a:	0f 85 6c ff ff ff    	jne    8054dc <inet_ntoa+0x34>
  805570:	eb 1a                	jmp    80558c <inet_ntoa+0xe4>
  805572:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805576:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80557a:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  80557e:	0f b6 55 ee          	movzbl -0x12(%rbp),%edx
  805582:	48 63 d2             	movslq %edx,%rdx
  805585:	0f b6 54 15 e0       	movzbl -0x20(%rbp,%rdx,1),%edx
  80558a:	88 10                	mov    %dl,(%rax)
  80558c:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
  805590:	8d 50 ff             	lea    -0x1(%rax),%edx
  805593:	88 55 ee             	mov    %dl,-0x12(%rbp)
  805596:	84 c0                	test   %al,%al
  805598:	75 d8                	jne    805572 <inet_ntoa+0xca>
  80559a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80559e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8055a2:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  8055a6:	c6 00 2e             	movb   $0x2e,(%rax)
  8055a9:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8055ae:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8055b2:	83 c0 01             	add    $0x1,%eax
  8055b5:	88 45 ef             	mov    %al,-0x11(%rbp)
  8055b8:	80 7d ef 03          	cmpb   $0x3,-0x11(%rbp)
  8055bc:	0f 86 16 ff ff ff    	jbe    8054d8 <inet_ntoa+0x30>
  8055c2:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
  8055c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8055cb:	c6 00 00             	movb   $0x0,(%rax)
  8055ce:	48 b8 10 90 80 00 00 	movabs $0x809010,%rax
  8055d5:	00 00 00 
  8055d8:	c9                   	leaveq 
  8055d9:	c3                   	retq   

00000000008055da <htons>:
  8055da:	55                   	push   %rbp
  8055db:	48 89 e5             	mov    %rsp,%rbp
  8055de:	48 83 ec 04          	sub    $0x4,%rsp
  8055e2:	89 f8                	mov    %edi,%eax
  8055e4:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
  8055e8:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  8055ec:	c1 e0 08             	shl    $0x8,%eax
  8055ef:	89 c2                	mov    %eax,%edx
  8055f1:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  8055f5:	66 c1 e8 08          	shr    $0x8,%ax
  8055f9:	09 d0                	or     %edx,%eax
  8055fb:	c9                   	leaveq 
  8055fc:	c3                   	retq   

00000000008055fd <ntohs>:
  8055fd:	55                   	push   %rbp
  8055fe:	48 89 e5             	mov    %rsp,%rbp
  805601:	48 83 ec 08          	sub    $0x8,%rsp
  805605:	89 f8                	mov    %edi,%eax
  805607:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
  80560b:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  80560f:	89 c7                	mov    %eax,%edi
  805611:	48 b8 da 55 80 00 00 	movabs $0x8055da,%rax
  805618:	00 00 00 
  80561b:	ff d0                	callq  *%rax
  80561d:	c9                   	leaveq 
  80561e:	c3                   	retq   

000000000080561f <htonl>:
  80561f:	55                   	push   %rbp
  805620:	48 89 e5             	mov    %rsp,%rbp
  805623:	48 83 ec 04          	sub    $0x4,%rsp
  805627:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80562a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80562d:	c1 e0 18             	shl    $0x18,%eax
  805630:	89 c2                	mov    %eax,%edx
  805632:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805635:	25 00 ff 00 00       	and    $0xff00,%eax
  80563a:	c1 e0 08             	shl    $0x8,%eax
  80563d:	09 c2                	or     %eax,%edx
  80563f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805642:	25 00 00 ff 00       	and    $0xff0000,%eax
  805647:	48 c1 e8 08          	shr    $0x8,%rax
  80564b:	09 c2                	or     %eax,%edx
  80564d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805650:	c1 e8 18             	shr    $0x18,%eax
  805653:	09 d0                	or     %edx,%eax
  805655:	c9                   	leaveq 
  805656:	c3                   	retq   

0000000000805657 <ntohl>:
  805657:	55                   	push   %rbp
  805658:	48 89 e5             	mov    %rsp,%rbp
  80565b:	48 83 ec 08          	sub    $0x8,%rsp
  80565f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805662:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805665:	89 c7                	mov    %eax,%edi
  805667:	48 b8 1f 56 80 00 00 	movabs $0x80561f,%rax
  80566e:	00 00 00 
  805671:	ff d0                	callq  *%rax
  805673:	c9                   	leaveq 
  805674:	c3                   	retq   
