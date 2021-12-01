
vmm/guest/obj/user/testfile:     file format elf64-x86-64


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
  80003c:	e8 39 0c 00 00       	callq  800c7a <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <xopen>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80004f:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800052:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800056:	48 89 c6             	mov    %rax,%rsi
  800059:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  800060:	00 00 00 
  800063:	48 b8 0e 1b 80 00 00 	movabs $0x801b0e,%rax
  80006a:	00 00 00 
  80006d:	ff d0                	callq  *%rax
  80006f:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  800076:	00 00 00 
  800079:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80007c:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  800082:	bf 01 00 00 00       	mov    $0x1,%edi
  800087:	48 b8 0f 2b 80 00 00 	movabs $0x802b0f,%rax
  80008e:	00 00 00 
  800091:	ff d0                	callq  *%rax
  800093:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800096:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800099:	b9 07 00 00 00       	mov    $0x7,%ecx
  80009e:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  8000a5:	00 00 00 
  8000a8:	be 01 00 00 00       	mov    $0x1,%esi
  8000ad:	89 c7                	mov    %eax,%edi
  8000af:	48 b8 de 28 80 00 00 	movabs $0x8028de,%rax
  8000b6:	00 00 00 
  8000b9:	ff d0                	callq  *%rax
  8000bb:	ba 00 00 00 00       	mov    $0x0,%edx
  8000c0:	be 00 c0 cc cc       	mov    $0xccccc000,%esi
  8000c5:	bf 00 00 00 00       	mov    $0x0,%edi
  8000ca:	48 b8 1d 28 80 00 00 	movabs $0x80281d,%rax
  8000d1:	00 00 00 
  8000d4:	ff d0                	callq  *%rax
  8000d6:	c9                   	leaveq 
  8000d7:	c3                   	retq   

00000000008000d8 <umain>:
  8000d8:	55                   	push   %rbp
  8000d9:	48 89 e5             	mov    %rsp,%rbp
  8000dc:	53                   	push   %rbx
  8000dd:	48 81 ec 18 03 00 00 	sub    $0x318,%rsp
  8000e4:	89 bd 2c fd ff ff    	mov    %edi,-0x2d4(%rbp)
  8000ea:	48 89 b5 20 fd ff ff 	mov    %rsi,-0x2e0(%rbp)
  8000f1:	be 00 00 00 00       	mov    $0x0,%esi
  8000f6:	48 bf e6 4c 80 00 00 	movabs $0x804ce6,%rdi
  8000fd:	00 00 00 
  800100:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800107:	00 00 00 
  80010a:	ff d0                	callq  *%rax
  80010c:	48 98                	cltq   
  80010e:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800112:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800117:	79 39                	jns    800152 <umain+0x7a>
  800119:	48 83 7d e0 f4       	cmpq   $0xfffffffffffffff4,-0x20(%rbp)
  80011e:	74 32                	je     800152 <umain+0x7a>
  800120:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800124:	48 89 c1             	mov    %rax,%rcx
  800127:	48 ba f1 4c 80 00 00 	movabs $0x804cf1,%rdx
  80012e:	00 00 00 
  800131:	be 21 00 00 00       	mov    $0x21,%esi
  800136:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  80013d:	00 00 00 
  800140:	b8 00 00 00 00       	mov    $0x0,%eax
  800145:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  80014c:	00 00 00 
  80014f:	41 ff d0             	callq  *%r8
  800152:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800157:	78 2a                	js     800183 <umain+0xab>
  800159:	48 ba 20 4d 80 00 00 	movabs $0x804d20,%rdx
  800160:	00 00 00 
  800163:	be 23 00 00 00       	mov    $0x23,%esi
  800168:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  80016f:	00 00 00 
  800172:	b8 00 00 00 00       	mov    $0x0,%eax
  800177:	48 b9 20 0d 80 00 00 	movabs $0x800d20,%rcx
  80017e:	00 00 00 
  800181:	ff d1                	callq  *%rcx
  800183:	be 00 00 00 00       	mov    $0x0,%esi
  800188:	48 bf 41 4d 80 00 00 	movabs $0x804d41,%rdi
  80018f:	00 00 00 
  800192:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800199:	00 00 00 
  80019c:	ff d0                	callq  *%rax
  80019e:	48 98                	cltq   
  8001a0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8001a4:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8001a9:	79 32                	jns    8001dd <umain+0x105>
  8001ab:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8001af:	48 89 c1             	mov    %rax,%rcx
  8001b2:	48 ba 4a 4d 80 00 00 	movabs $0x804d4a,%rdx
  8001b9:	00 00 00 
  8001bc:	be 26 00 00 00       	mov    $0x26,%esi
  8001c1:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  8001c8:	00 00 00 
  8001cb:	b8 00 00 00 00       	mov    $0x0,%eax
  8001d0:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  8001d7:	00 00 00 
  8001da:	41 ff d0             	callq  *%r8
  8001dd:	b8 00 c0 cc cc       	mov    $0xccccc000,%eax
  8001e2:	8b 00                	mov    (%rax),%eax
  8001e4:	83 f8 66             	cmp    $0x66,%eax
  8001e7:	75 18                	jne    800201 <umain+0x129>
  8001e9:	b8 00 c0 cc cc       	mov    $0xccccc000,%eax
  8001ee:	8b 40 04             	mov    0x4(%rax),%eax
  8001f1:	85 c0                	test   %eax,%eax
  8001f3:	75 0c                	jne    800201 <umain+0x129>
  8001f5:	b8 00 c0 cc cc       	mov    $0xccccc000,%eax
  8001fa:	8b 40 08             	mov    0x8(%rax),%eax
  8001fd:	85 c0                	test   %eax,%eax
  8001ff:	74 2a                	je     80022b <umain+0x153>
  800201:	48 ba 68 4d 80 00 00 	movabs $0x804d68,%rdx
  800208:	00 00 00 
  80020b:	be 28 00 00 00       	mov    $0x28,%esi
  800210:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  800217:	00 00 00 
  80021a:	b8 00 00 00 00       	mov    $0x0,%eax
  80021f:	48 b9 20 0d 80 00 00 	movabs $0x800d20,%rcx
  800226:	00 00 00 
  800229:	ff d1                	callq  *%rcx
  80022b:	48 bf 95 4d 80 00 00 	movabs $0x804d95,%rdi
  800232:	00 00 00 
  800235:	b8 00 00 00 00       	mov    $0x0,%eax
  80023a:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  800241:	00 00 00 
  800244:	ff d2                	callq  *%rdx
  800246:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  80024d:	00 00 00 
  800250:	48 8b 40 28          	mov    0x28(%rax),%rax
  800254:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80025b:	48 89 d6             	mov    %rdx,%rsi
  80025e:	bf 00 c0 cc cc       	mov    $0xccccc000,%edi
  800263:	ff d0                	callq  *%rax
  800265:	48 98                	cltq   
  800267:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80026b:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800270:	79 32                	jns    8002a4 <umain+0x1cc>
  800272:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800276:	48 89 c1             	mov    %rax,%rcx
  800279:	48 ba a9 4d 80 00 00 	movabs $0x804da9,%rdx
  800280:	00 00 00 
  800283:	be 2c 00 00 00       	mov    $0x2c,%esi
  800288:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  80028f:	00 00 00 
  800292:	b8 00 00 00 00       	mov    $0x0,%eax
  800297:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  80029e:	00 00 00 
  8002a1:	41 ff d0             	callq  *%r8
  8002a4:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8002ab:	00 00 00 
  8002ae:	48 8b 00             	mov    (%rax),%rax
  8002b1:	48 89 c7             	mov    %rax,%rdi
  8002b4:	48 b8 a2 1a 80 00 00 	movabs $0x801aa2,%rax
  8002bb:	00 00 00 
  8002be:	ff d0                	callq  *%rax
  8002c0:	8b 55 b0             	mov    -0x50(%rbp),%edx
  8002c3:	39 d0                	cmp    %edx,%eax
  8002c5:	74 51                	je     800318 <umain+0x240>
  8002c7:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8002ce:	00 00 00 
  8002d1:	48 8b 00             	mov    (%rax),%rax
  8002d4:	48 89 c7             	mov    %rax,%rdi
  8002d7:	48 b8 a2 1a 80 00 00 	movabs $0x801aa2,%rax
  8002de:	00 00 00 
  8002e1:	ff d0                	callq  *%rax
  8002e3:	89 c2                	mov    %eax,%edx
  8002e5:	8b 45 b0             	mov    -0x50(%rbp),%eax
  8002e8:	41 89 d0             	mov    %edx,%r8d
  8002eb:	89 c1                	mov    %eax,%ecx
  8002ed:	48 ba b8 4d 80 00 00 	movabs $0x804db8,%rdx
  8002f4:	00 00 00 
  8002f7:	be 2e 00 00 00       	mov    $0x2e,%esi
  8002fc:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  800303:	00 00 00 
  800306:	b8 00 00 00 00       	mov    $0x0,%eax
  80030b:	49 b9 20 0d 80 00 00 	movabs $0x800d20,%r9
  800312:	00 00 00 
  800315:	41 ff d1             	callq  *%r9
  800318:	48 bf de 4d 80 00 00 	movabs $0x804dde,%rdi
  80031f:	00 00 00 
  800322:	b8 00 00 00 00       	mov    $0x0,%eax
  800327:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  80032e:	00 00 00 
  800331:	ff d2                	callq  *%rdx
  800333:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  80033a:	ba 00 02 00 00       	mov    $0x200,%edx
  80033f:	be 00 00 00 00       	mov    $0x0,%esi
  800344:	48 89 c7             	mov    %rax,%rdi
  800347:	48 b8 a7 1d 80 00 00 	movabs $0x801da7,%rax
  80034e:	00 00 00 
  800351:	ff d0                	callq  *%rax
  800353:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  80035a:	00 00 00 
  80035d:	48 8b 40 10          	mov    0x10(%rax),%rax
  800361:	48 8d 8d 30 fd ff ff 	lea    -0x2d0(%rbp),%rcx
  800368:	ba 00 02 00 00       	mov    $0x200,%edx
  80036d:	48 89 ce             	mov    %rcx,%rsi
  800370:	bf 00 c0 cc cc       	mov    $0xccccc000,%edi
  800375:	ff d0                	callq  *%rax
  800377:	48 98                	cltq   
  800379:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80037d:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800382:	79 32                	jns    8003b6 <umain+0x2de>
  800384:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800388:	48 89 c1             	mov    %rax,%rcx
  80038b:	48 ba f1 4d 80 00 00 	movabs $0x804df1,%rdx
  800392:	00 00 00 
  800395:	be 33 00 00 00       	mov    $0x33,%esi
  80039a:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  8003a1:	00 00 00 
  8003a4:	b8 00 00 00 00       	mov    $0x0,%eax
  8003a9:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  8003b0:	00 00 00 
  8003b3:	41 ff d0             	callq  *%r8
  8003b6:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8003bd:	00 00 00 
  8003c0:	48 8b 10             	mov    (%rax),%rdx
  8003c3:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  8003ca:	48 89 d6             	mov    %rdx,%rsi
  8003cd:	48 89 c7             	mov    %rax,%rdi
  8003d0:	48 b8 70 1c 80 00 00 	movabs $0x801c70,%rax
  8003d7:	00 00 00 
  8003da:	ff d0                	callq  *%rax
  8003dc:	85 c0                	test   %eax,%eax
  8003de:	74 2a                	je     80040a <umain+0x332>
  8003e0:	48 ba ff 4d 80 00 00 	movabs $0x804dff,%rdx
  8003e7:	00 00 00 
  8003ea:	be 35 00 00 00       	mov    $0x35,%esi
  8003ef:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  8003f6:	00 00 00 
  8003f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8003fe:	48 b9 20 0d 80 00 00 	movabs $0x800d20,%rcx
  800405:	00 00 00 
  800408:	ff d1                	callq  *%rcx
  80040a:	48 bf 1d 4e 80 00 00 	movabs $0x804e1d,%rdi
  800411:	00 00 00 
  800414:	b8 00 00 00 00       	mov    $0x0,%eax
  800419:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  800420:	00 00 00 
  800423:	ff d2                	callq  *%rdx
  800425:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  80042c:	00 00 00 
  80042f:	48 8b 40 20          	mov    0x20(%rax),%rax
  800433:	bf 00 c0 cc cc       	mov    $0xccccc000,%edi
  800438:	ff d0                	callq  *%rax
  80043a:	48 98                	cltq   
  80043c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800440:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800445:	79 32                	jns    800479 <umain+0x3a1>
  800447:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80044b:	48 89 c1             	mov    %rax,%rcx
  80044e:	48 ba 30 4e 80 00 00 	movabs $0x804e30,%rdx
  800455:	00 00 00 
  800458:	be 39 00 00 00       	mov    $0x39,%esi
  80045d:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  800464:	00 00 00 
  800467:	b8 00 00 00 00       	mov    $0x0,%eax
  80046c:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  800473:	00 00 00 
  800476:	41 ff d0             	callq  *%r8
  800479:	48 bf 3f 4e 80 00 00 	movabs $0x804e3f,%rdi
  800480:	00 00 00 
  800483:	b8 00 00 00 00       	mov    $0x0,%eax
  800488:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  80048f:	00 00 00 
  800492:	ff d2                	callq  *%rdx
  800494:	b8 00 c0 cc cc       	mov    $0xccccc000,%eax
  800499:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80049d:	48 8b 00             	mov    (%rax),%rax
  8004a0:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  8004a4:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8004a8:	be 00 c0 cc cc       	mov    $0xccccc000,%esi
  8004ad:	bf 00 00 00 00       	mov    $0x0,%edi
  8004b2:	48 b8 e8 24 80 00 00 	movabs $0x8024e8,%rax
  8004b9:	00 00 00 
  8004bc:	ff d0                	callq  *%rax
  8004be:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  8004c5:	00 00 00 
  8004c8:	48 8b 40 10          	mov    0x10(%rax),%rax
  8004cc:	48 8d b5 30 fd ff ff 	lea    -0x2d0(%rbp),%rsi
  8004d3:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
  8004d7:	ba 00 02 00 00       	mov    $0x200,%edx
  8004dc:	48 89 cf             	mov    %rcx,%rdi
  8004df:	ff d0                	callq  *%rax
  8004e1:	48 98                	cltq   
  8004e3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8004e7:	48 83 7d e0 fd       	cmpq   $0xfffffffffffffffd,-0x20(%rbp)
  8004ec:	74 32                	je     800520 <umain+0x448>
  8004ee:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8004f2:	48 89 c1             	mov    %rax,%rcx
  8004f5:	48 ba 58 4e 80 00 00 	movabs $0x804e58,%rdx
  8004fc:	00 00 00 
  8004ff:	be 44 00 00 00       	mov    $0x44,%esi
  800504:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  80050b:	00 00 00 
  80050e:	b8 00 00 00 00       	mov    $0x0,%eax
  800513:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  80051a:	00 00 00 
  80051d:	41 ff d0             	callq  *%r8
  800520:	48 bf 8f 4e 80 00 00 	movabs $0x804e8f,%rdi
  800527:	00 00 00 
  80052a:	b8 00 00 00 00       	mov    $0x0,%eax
  80052f:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  800536:	00 00 00 
  800539:	ff d2                	callq  *%rdx
  80053b:	be 02 01 00 00       	mov    $0x102,%esi
  800540:	48 bf a5 4e 80 00 00 	movabs $0x804ea5,%rdi
  800547:	00 00 00 
  80054a:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800551:	00 00 00 
  800554:	ff d0                	callq  *%rax
  800556:	48 98                	cltq   
  800558:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80055c:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800561:	79 32                	jns    800595 <umain+0x4bd>
  800563:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800567:	48 89 c1             	mov    %rax,%rcx
  80056a:	48 ba af 4e 80 00 00 	movabs $0x804eaf,%rdx
  800571:	00 00 00 
  800574:	be 49 00 00 00       	mov    $0x49,%esi
  800579:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  800580:	00 00 00 
  800583:	b8 00 00 00 00       	mov    $0x0,%eax
  800588:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  80058f:	00 00 00 
  800592:	41 ff d0             	callq  *%r8
  800595:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80059c:	00 00 00 
  80059f:	48 8b 10             	mov    (%rax),%rdx
  8005a2:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  8005a9:	00 00 00 
  8005ac:	48 8b 70 18          	mov    0x18(%rax),%rsi
  8005b0:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  8005b7:	00 00 00 
  8005ba:	48 8b 08             	mov    (%rax),%rcx
  8005bd:	48 89 0c 24          	mov    %rcx,(%rsp)
  8005c1:	48 8b 48 08          	mov    0x8(%rax),%rcx
  8005c5:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  8005ca:	48 8b 48 10          	mov    0x10(%rax),%rcx
  8005ce:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
  8005d3:	48 8b 48 18          	mov    0x18(%rax),%rcx
  8005d7:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
  8005dc:	48 8b 48 20          	mov    0x20(%rax),%rcx
  8005e0:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
  8005e5:	48 8b 48 28          	mov    0x28(%rax),%rcx
  8005e9:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
  8005ee:	48 8b 40 30          	mov    0x30(%rax),%rax
  8005f2:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  8005f7:	b9 00 c0 cc cc       	mov    $0xccccc000,%ecx
  8005fc:	48 bf c8 4e 80 00 00 	movabs $0x804ec8,%rdi
  800603:	00 00 00 
  800606:	b8 00 00 00 00       	mov    $0x0,%eax
  80060b:	49 b8 59 0f 80 00 00 	movabs $0x800f59,%r8
  800612:	00 00 00 
  800615:	41 ff d0             	callq  *%r8
  800618:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  80061f:	00 00 00 
  800622:	48 8b 58 18          	mov    0x18(%rax),%rbx
  800626:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80062d:	00 00 00 
  800630:	48 8b 00             	mov    (%rax),%rax
  800633:	48 89 c7             	mov    %rax,%rdi
  800636:	48 b8 a2 1a 80 00 00 	movabs $0x801aa2,%rax
  80063d:	00 00 00 
  800640:	ff d0                	callq  *%rax
  800642:	48 63 d0             	movslq %eax,%rdx
  800645:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80064c:	00 00 00 
  80064f:	48 8b 00             	mov    (%rax),%rax
  800652:	48 89 c6             	mov    %rax,%rsi
  800655:	bf 00 c0 cc cc       	mov    $0xccccc000,%edi
  80065a:	ff d3                	callq  *%rbx
  80065c:	48 98                	cltq   
  80065e:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800662:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800669:	00 00 00 
  80066c:	48 8b 00             	mov    (%rax),%rax
  80066f:	48 89 c7             	mov    %rax,%rdi
  800672:	48 b8 a2 1a 80 00 00 	movabs $0x801aa2,%rax
  800679:	00 00 00 
  80067c:	ff d0                	callq  *%rax
  80067e:	48 98                	cltq   
  800680:	48 39 45 e0          	cmp    %rax,-0x20(%rbp)
  800684:	74 32                	je     8006b8 <umain+0x5e0>
  800686:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80068a:	48 89 c1             	mov    %rax,%rcx
  80068d:	48 ba 08 4f 80 00 00 	movabs $0x804f08,%rdx
  800694:	00 00 00 
  800697:	be 4e 00 00 00       	mov    $0x4e,%esi
  80069c:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  8006a3:	00 00 00 
  8006a6:	b8 00 00 00 00       	mov    $0x0,%eax
  8006ab:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  8006b2:	00 00 00 
  8006b5:	41 ff d0             	callq  *%r8
  8006b8:	48 bf 17 4f 80 00 00 	movabs $0x804f17,%rdi
  8006bf:	00 00 00 
  8006c2:	b8 00 00 00 00       	mov    $0x0,%eax
  8006c7:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  8006ce:	00 00 00 
  8006d1:	ff d2                	callq  *%rdx
  8006d3:	b8 00 c0 cc cc       	mov    $0xccccc000,%eax
  8006d8:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
  8006df:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  8006e6:	ba 00 02 00 00       	mov    $0x200,%edx
  8006eb:	be 00 00 00 00       	mov    $0x0,%esi
  8006f0:	48 89 c7             	mov    %rax,%rdi
  8006f3:	48 b8 a7 1d 80 00 00 	movabs $0x801da7,%rax
  8006fa:	00 00 00 
  8006fd:	ff d0                	callq  *%rax
  8006ff:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  800706:	00 00 00 
  800709:	48 8b 40 10          	mov    0x10(%rax),%rax
  80070d:	48 8d 8d 30 fd ff ff 	lea    -0x2d0(%rbp),%rcx
  800714:	ba 00 02 00 00       	mov    $0x200,%edx
  800719:	48 89 ce             	mov    %rcx,%rsi
  80071c:	bf 00 c0 cc cc       	mov    $0xccccc000,%edi
  800721:	ff d0                	callq  *%rax
  800723:	48 98                	cltq   
  800725:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800729:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80072e:	79 32                	jns    800762 <umain+0x68a>
  800730:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800734:	48 89 c1             	mov    %rax,%rcx
  800737:	48 ba 30 4f 80 00 00 	movabs $0x804f30,%rdx
  80073e:	00 00 00 
  800741:	be 54 00 00 00       	mov    $0x54,%esi
  800746:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  80074d:	00 00 00 
  800750:	b8 00 00 00 00       	mov    $0x0,%eax
  800755:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  80075c:	00 00 00 
  80075f:	41 ff d0             	callq  *%r8
  800762:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800769:	00 00 00 
  80076c:	48 8b 00             	mov    (%rax),%rax
  80076f:	48 89 c7             	mov    %rax,%rdi
  800772:	48 b8 a2 1a 80 00 00 	movabs $0x801aa2,%rax
  800779:	00 00 00 
  80077c:	ff d0                	callq  *%rax
  80077e:	48 98                	cltq   
  800780:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
  800784:	74 32                	je     8007b8 <umain+0x6e0>
  800786:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80078a:	48 89 c1             	mov    %rax,%rcx
  80078d:	48 ba 50 4f 80 00 00 	movabs $0x804f50,%rdx
  800794:	00 00 00 
  800797:	be 56 00 00 00       	mov    $0x56,%esi
  80079c:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  8007a3:	00 00 00 
  8007a6:	b8 00 00 00 00       	mov    $0x0,%eax
  8007ab:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  8007b2:	00 00 00 
  8007b5:	41 ff d0             	callq  *%r8
  8007b8:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8007bf:	00 00 00 
  8007c2:	48 8b 10             	mov    (%rax),%rdx
  8007c5:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  8007cc:	48 89 d6             	mov    %rdx,%rsi
  8007cf:	48 89 c7             	mov    %rax,%rdi
  8007d2:	48 b8 70 1c 80 00 00 	movabs $0x801c70,%rax
  8007d9:	00 00 00 
  8007dc:	ff d0                	callq  *%rax
  8007de:	85 c0                	test   %eax,%eax
  8007e0:	74 2a                	je     80080c <umain+0x734>
  8007e2:	48 ba 88 4f 80 00 00 	movabs $0x804f88,%rdx
  8007e9:	00 00 00 
  8007ec:	be 58 00 00 00       	mov    $0x58,%esi
  8007f1:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  8007f8:	00 00 00 
  8007fb:	b8 00 00 00 00       	mov    $0x0,%eax
  800800:	48 b9 20 0d 80 00 00 	movabs $0x800d20,%rcx
  800807:	00 00 00 
  80080a:	ff d1                	callq  *%rcx
  80080c:	48 bf b8 4f 80 00 00 	movabs $0x804fb8,%rdi
  800813:	00 00 00 
  800816:	b8 00 00 00 00       	mov    $0x0,%eax
  80081b:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  800822:	00 00 00 
  800825:	ff d2                	callq  *%rdx
  800827:	be 00 00 00 00       	mov    $0x0,%esi
  80082c:	48 bf e6 4c 80 00 00 	movabs $0x804ce6,%rdi
  800833:	00 00 00 
  800836:	48 b8 6f 35 80 00 00 	movabs $0x80356f,%rax
  80083d:	00 00 00 
  800840:	ff d0                	callq  *%rax
  800842:	48 98                	cltq   
  800844:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800848:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80084d:	79 39                	jns    800888 <umain+0x7b0>
  80084f:	48 83 7d e0 f4       	cmpq   $0xfffffffffffffff4,-0x20(%rbp)
  800854:	74 32                	je     800888 <umain+0x7b0>
  800856:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80085a:	48 89 c1             	mov    %rax,%rcx
  80085d:	48 ba dc 4f 80 00 00 	movabs $0x804fdc,%rdx
  800864:	00 00 00 
  800867:	be 5d 00 00 00       	mov    $0x5d,%esi
  80086c:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  800873:	00 00 00 
  800876:	b8 00 00 00 00       	mov    $0x0,%eax
  80087b:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  800882:	00 00 00 
  800885:	41 ff d0             	callq  *%r8
  800888:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80088d:	78 2a                	js     8008b9 <umain+0x7e1>
  80088f:	48 ba f0 4f 80 00 00 	movabs $0x804ff0,%rdx
  800896:	00 00 00 
  800899:	be 5f 00 00 00       	mov    $0x5f,%esi
  80089e:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  8008a5:	00 00 00 
  8008a8:	b8 00 00 00 00       	mov    $0x0,%eax
  8008ad:	48 b9 20 0d 80 00 00 	movabs $0x800d20,%rcx
  8008b4:	00 00 00 
  8008b7:	ff d1                	callq  *%rcx
  8008b9:	be 00 00 00 00       	mov    $0x0,%esi
  8008be:	48 bf 41 4d 80 00 00 	movabs $0x804d41,%rdi
  8008c5:	00 00 00 
  8008c8:	48 b8 6f 35 80 00 00 	movabs $0x80356f,%rax
  8008cf:	00 00 00 
  8008d2:	ff d0                	callq  *%rax
  8008d4:	48 98                	cltq   
  8008d6:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8008da:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8008df:	79 32                	jns    800913 <umain+0x83b>
  8008e1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8008e5:	48 89 c1             	mov    %rax,%rcx
  8008e8:	48 ba 0b 50 80 00 00 	movabs $0x80500b,%rdx
  8008ef:	00 00 00 
  8008f2:	be 62 00 00 00       	mov    $0x62,%esi
  8008f7:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  8008fe:	00 00 00 
  800901:	b8 00 00 00 00       	mov    $0x0,%eax
  800906:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  80090d:	00 00 00 
  800910:	41 ff d0             	callq  *%r8
  800913:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800917:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80091d:	48 c1 e0 0c          	shl    $0xc,%rax
  800921:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800925:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800929:	8b 00                	mov    (%rax),%eax
  80092b:	83 f8 66             	cmp    $0x66,%eax
  80092e:	75 16                	jne    800946 <umain+0x86e>
  800930:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800934:	8b 40 04             	mov    0x4(%rax),%eax
  800937:	85 c0                	test   %eax,%eax
  800939:	75 0b                	jne    800946 <umain+0x86e>
  80093b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80093f:	8b 40 08             	mov    0x8(%rax),%eax
  800942:	85 c0                	test   %eax,%eax
  800944:	74 2a                	je     800970 <umain+0x898>
  800946:	48 ba 20 50 80 00 00 	movabs $0x805020,%rdx
  80094d:	00 00 00 
  800950:	be 65 00 00 00       	mov    $0x65,%esi
  800955:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  80095c:	00 00 00 
  80095f:	b8 00 00 00 00       	mov    $0x0,%eax
  800964:	48 b9 20 0d 80 00 00 	movabs $0x800d20,%rcx
  80096b:	00 00 00 
  80096e:	ff d1                	callq  *%rcx
  800970:	48 bf 47 50 80 00 00 	movabs $0x805047,%rdi
  800977:	00 00 00 
  80097a:	b8 00 00 00 00       	mov    $0x0,%eax
  80097f:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  800986:	00 00 00 
  800989:	ff d2                	callq  *%rdx
  80098b:	be 01 01 00 00       	mov    $0x101,%esi
  800990:	48 bf 55 50 80 00 00 	movabs $0x805055,%rdi
  800997:	00 00 00 
  80099a:	48 b8 6f 35 80 00 00 	movabs $0x80356f,%rax
  8009a1:	00 00 00 
  8009a4:	ff d0                	callq  *%rax
  8009a6:	48 98                	cltq   
  8009a8:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  8009ac:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8009b1:	79 32                	jns    8009e5 <umain+0x90d>
  8009b3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8009b7:	48 89 c1             	mov    %rax,%rcx
  8009ba:	48 ba 5a 50 80 00 00 	movabs $0x80505a,%rdx
  8009c1:	00 00 00 
  8009c4:	be 6a 00 00 00       	mov    $0x6a,%esi
  8009c9:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  8009d0:	00 00 00 
  8009d3:	b8 00 00 00 00       	mov    $0x0,%eax
  8009d8:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  8009df:	00 00 00 
  8009e2:	41 ff d0             	callq  *%r8
  8009e5:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  8009ec:	ba 00 02 00 00       	mov    $0x200,%edx
  8009f1:	be 00 00 00 00       	mov    $0x0,%esi
  8009f6:	48 89 c7             	mov    %rax,%rdi
  8009f9:	48 b8 a7 1d 80 00 00 	movabs $0x801da7,%rax
  800a00:	00 00 00 
  800a03:	ff d0                	callq  *%rax
  800a05:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  800a0c:	00 
  800a0d:	e9 82 00 00 00       	jmpq   800a94 <umain+0x9bc>
  800a12:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  800a19:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a1d:	89 10                	mov    %edx,(%rax)
  800a1f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800a23:	48 8d 8d 30 fd ff ff 	lea    -0x2d0(%rbp),%rcx
  800a2a:	ba 00 02 00 00       	mov    $0x200,%edx
  800a2f:	48 89 ce             	mov    %rcx,%rsi
  800a32:	89 c7                	mov    %eax,%edi
  800a34:	48 b8 e3 31 80 00 00 	movabs $0x8031e3,%rax
  800a3b:	00 00 00 
  800a3e:	ff d0                	callq  *%rax
  800a40:	48 98                	cltq   
  800a42:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800a46:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800a4b:	79 39                	jns    800a86 <umain+0x9ae>
  800a4d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800a51:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a55:	49 89 d0             	mov    %rdx,%r8
  800a58:	48 89 c1             	mov    %rax,%rcx
  800a5b:	48 ba 69 50 80 00 00 	movabs $0x805069,%rdx
  800a62:	00 00 00 
  800a65:	be 6f 00 00 00       	mov    $0x6f,%esi
  800a6a:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  800a71:	00 00 00 
  800a74:	b8 00 00 00 00       	mov    $0x0,%eax
  800a79:	49 b9 20 0d 80 00 00 	movabs $0x800d20,%r9
  800a80:	00 00 00 
  800a83:	41 ff d1             	callq  *%r9
  800a86:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a8a:	48 05 00 02 00 00    	add    $0x200,%rax
  800a90:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800a94:	48 81 7d e8 ff df 01 	cmpq   $0x1dfff,-0x18(%rbp)
  800a9b:	00 
  800a9c:	0f 8e 70 ff ff ff    	jle    800a12 <umain+0x93a>
  800aa2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800aa6:	89 c7                	mov    %eax,%edi
  800aa8:	48 b8 77 2e 80 00 00 	movabs $0x802e77,%rax
  800aaf:	00 00 00 
  800ab2:	ff d0                	callq  *%rax
  800ab4:	be 00 00 00 00       	mov    $0x0,%esi
  800ab9:	48 bf 55 50 80 00 00 	movabs $0x805055,%rdi
  800ac0:	00 00 00 
  800ac3:	48 b8 6f 35 80 00 00 	movabs $0x80356f,%rax
  800aca:	00 00 00 
  800acd:	ff d0                	callq  *%rax
  800acf:	48 98                	cltq   
  800ad1:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800ad5:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  800ada:	79 32                	jns    800b0e <umain+0xa36>
  800adc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800ae0:	48 89 c1             	mov    %rax,%rcx
  800ae3:	48 ba 7b 50 80 00 00 	movabs $0x80507b,%rdx
  800aea:	00 00 00 
  800aed:	be 74 00 00 00       	mov    $0x74,%esi
  800af2:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  800af9:	00 00 00 
  800afc:	b8 00 00 00 00       	mov    $0x0,%eax
  800b01:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  800b08:	00 00 00 
  800b0b:	41 ff d0             	callq  *%r8
  800b0e:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  800b15:	00 
  800b16:	e9 1a 01 00 00       	jmpq   800c35 <umain+0xb5d>
  800b1b:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  800b22:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b26:	89 10                	mov    %edx,(%rax)
  800b28:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800b2c:	48 8d 8d 30 fd ff ff 	lea    -0x2d0(%rbp),%rcx
  800b33:	ba 00 02 00 00       	mov    $0x200,%edx
  800b38:	48 89 ce             	mov    %rcx,%rsi
  800b3b:	89 c7                	mov    %eax,%edi
  800b3d:	48 b8 6e 31 80 00 00 	movabs $0x80316e,%rax
  800b44:	00 00 00 
  800b47:	ff d0                	callq  *%rax
  800b49:	48 98                	cltq   
  800b4b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800b4f:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800b54:	79 39                	jns    800b8f <umain+0xab7>
  800b56:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800b5a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b5e:	49 89 d0             	mov    %rdx,%r8
  800b61:	48 89 c1             	mov    %rax,%rcx
  800b64:	48 ba 89 50 80 00 00 	movabs $0x805089,%rdx
  800b6b:	00 00 00 
  800b6e:	be 78 00 00 00       	mov    $0x78,%esi
  800b73:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  800b7a:	00 00 00 
  800b7d:	b8 00 00 00 00       	mov    $0x0,%eax
  800b82:	49 b9 20 0d 80 00 00 	movabs $0x800d20,%r9
  800b89:	00 00 00 
  800b8c:	41 ff d1             	callq  *%r9
  800b8f:	48 81 7d e0 00 02 00 	cmpq   $0x200,-0x20(%rbp)
  800b96:	00 
  800b97:	74 3f                	je     800bd8 <umain+0xb00>
  800b99:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800b9d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ba1:	41 b9 00 02 00 00    	mov    $0x200,%r9d
  800ba7:	49 89 d0             	mov    %rdx,%r8
  800baa:	48 89 c1             	mov    %rax,%rcx
  800bad:	48 ba a0 50 80 00 00 	movabs $0x8050a0,%rdx
  800bb4:	00 00 00 
  800bb7:	be 7b 00 00 00       	mov    $0x7b,%esi
  800bbc:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  800bc3:	00 00 00 
  800bc6:	b8 00 00 00 00       	mov    $0x0,%eax
  800bcb:	49 ba 20 0d 80 00 00 	movabs $0x800d20,%r10
  800bd2:	00 00 00 
  800bd5:	41 ff d2             	callq  *%r10
  800bd8:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  800bdf:	8b 00                	mov    (%rax),%eax
  800be1:	48 98                	cltq   
  800be3:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  800be7:	74 3e                	je     800c27 <umain+0xb4f>
  800be9:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  800bf0:	8b 10                	mov    (%rax),%edx
  800bf2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bf6:	41 89 d0             	mov    %edx,%r8d
  800bf9:	48 89 c1             	mov    %rax,%rcx
  800bfc:	48 ba d0 50 80 00 00 	movabs $0x8050d0,%rdx
  800c03:	00 00 00 
  800c06:	be 7e 00 00 00       	mov    $0x7e,%esi
  800c0b:	48 bf 0b 4d 80 00 00 	movabs $0x804d0b,%rdi
  800c12:	00 00 00 
  800c15:	b8 00 00 00 00       	mov    $0x0,%eax
  800c1a:	49 b9 20 0d 80 00 00 	movabs $0x800d20,%r9
  800c21:	00 00 00 
  800c24:	41 ff d1             	callq  *%r9
  800c27:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c2b:	48 05 00 02 00 00    	add    $0x200,%rax
  800c31:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c35:	48 81 7d e8 ff df 01 	cmpq   $0x1dfff,-0x18(%rbp)
  800c3c:	00 
  800c3d:	0f 8e d8 fe ff ff    	jle    800b1b <umain+0xa43>
  800c43:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800c47:	89 c7                	mov    %eax,%edi
  800c49:	48 b8 77 2e 80 00 00 	movabs $0x802e77,%rax
  800c50:	00 00 00 
  800c53:	ff d0                	callq  *%rax
  800c55:	48 bf f7 50 80 00 00 	movabs $0x8050f7,%rdi
  800c5c:	00 00 00 
  800c5f:	b8 00 00 00 00       	mov    $0x0,%eax
  800c64:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  800c6b:	00 00 00 
  800c6e:	ff d2                	callq  *%rdx
  800c70:	48 81 c4 18 03 00 00 	add    $0x318,%rsp
  800c77:	5b                   	pop    %rbx
  800c78:	5d                   	pop    %rbp
  800c79:	c3                   	retq   

0000000000800c7a <libmain>:
  800c7a:	55                   	push   %rbp
  800c7b:	48 89 e5             	mov    %rsp,%rbp
  800c7e:	48 83 ec 10          	sub    $0x10,%rsp
  800c82:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800c85:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800c89:	48 b8 c1 23 80 00 00 	movabs $0x8023c1,%rax
  800c90:	00 00 00 
  800c93:	ff d0                	callq  *%rax
  800c95:	25 ff 03 00 00       	and    $0x3ff,%eax
  800c9a:	48 98                	cltq   
  800c9c:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800ca3:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800caa:	00 00 00 
  800cad:	48 01 c2             	add    %rax,%rdx
  800cb0:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800cb7:	00 00 00 
  800cba:	48 89 10             	mov    %rdx,(%rax)
  800cbd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800cc1:	7e 14                	jle    800cd7 <libmain+0x5d>
  800cc3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800cc7:	48 8b 10             	mov    (%rax),%rdx
  800cca:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800cd1:	00 00 00 
  800cd4:	48 89 10             	mov    %rdx,(%rax)
  800cd7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800cdb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800cde:	48 89 d6             	mov    %rdx,%rsi
  800ce1:	89 c7                	mov    %eax,%edi
  800ce3:	48 b8 d8 00 80 00 00 	movabs $0x8000d8,%rax
  800cea:	00 00 00 
  800ced:	ff d0                	callq  *%rax
  800cef:	48 b8 fd 0c 80 00 00 	movabs $0x800cfd,%rax
  800cf6:	00 00 00 
  800cf9:	ff d0                	callq  *%rax
  800cfb:	c9                   	leaveq 
  800cfc:	c3                   	retq   

0000000000800cfd <exit>:
  800cfd:	55                   	push   %rbp
  800cfe:	48 89 e5             	mov    %rsp,%rbp
  800d01:	48 b8 c2 2e 80 00 00 	movabs $0x802ec2,%rax
  800d08:	00 00 00 
  800d0b:	ff d0                	callq  *%rax
  800d0d:	bf 00 00 00 00       	mov    $0x0,%edi
  800d12:	48 b8 7d 23 80 00 00 	movabs $0x80237d,%rax
  800d19:	00 00 00 
  800d1c:	ff d0                	callq  *%rax
  800d1e:	5d                   	pop    %rbp
  800d1f:	c3                   	retq   

0000000000800d20 <_panic>:
  800d20:	55                   	push   %rbp
  800d21:	48 89 e5             	mov    %rsp,%rbp
  800d24:	53                   	push   %rbx
  800d25:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  800d2c:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800d33:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800d39:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800d40:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800d47:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800d4e:	84 c0                	test   %al,%al
  800d50:	74 23                	je     800d75 <_panic+0x55>
  800d52:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800d59:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800d5d:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800d61:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800d65:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800d69:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800d6d:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800d71:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800d75:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800d7c:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800d83:	00 00 00 
  800d86:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  800d8d:	00 00 00 
  800d90:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800d94:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  800d9b:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800da2:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800da9:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800db0:	00 00 00 
  800db3:	48 8b 18             	mov    (%rax),%rbx
  800db6:	48 b8 c1 23 80 00 00 	movabs $0x8023c1,%rax
  800dbd:	00 00 00 
  800dc0:	ff d0                	callq  *%rax
  800dc2:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  800dc8:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800dcf:	41 89 c8             	mov    %ecx,%r8d
  800dd2:	48 89 d1             	mov    %rdx,%rcx
  800dd5:	48 89 da             	mov    %rbx,%rdx
  800dd8:	89 c6                	mov    %eax,%esi
  800dda:	48 bf 18 51 80 00 00 	movabs $0x805118,%rdi
  800de1:	00 00 00 
  800de4:	b8 00 00 00 00       	mov    $0x0,%eax
  800de9:	49 b9 59 0f 80 00 00 	movabs $0x800f59,%r9
  800df0:	00 00 00 
  800df3:	41 ff d1             	callq  *%r9
  800df6:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800dfd:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800e04:	48 89 d6             	mov    %rdx,%rsi
  800e07:	48 89 c7             	mov    %rax,%rdi
  800e0a:	48 b8 ad 0e 80 00 00 	movabs $0x800ead,%rax
  800e11:	00 00 00 
  800e14:	ff d0                	callq  *%rax
  800e16:	48 bf 3b 51 80 00 00 	movabs $0x80513b,%rdi
  800e1d:	00 00 00 
  800e20:	b8 00 00 00 00       	mov    $0x0,%eax
  800e25:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  800e2c:	00 00 00 
  800e2f:	ff d2                	callq  *%rdx
  800e31:	cc                   	int3   
  800e32:	eb fd                	jmp    800e31 <_panic+0x111>

0000000000800e34 <putch>:
  800e34:	55                   	push   %rbp
  800e35:	48 89 e5             	mov    %rsp,%rbp
  800e38:	48 83 ec 10          	sub    $0x10,%rsp
  800e3c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800e3f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800e43:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e47:	8b 00                	mov    (%rax),%eax
  800e49:	8d 48 01             	lea    0x1(%rax),%ecx
  800e4c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800e50:	89 0a                	mov    %ecx,(%rdx)
  800e52:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800e55:	89 d1                	mov    %edx,%ecx
  800e57:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800e5b:	48 98                	cltq   
  800e5d:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800e61:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e65:	8b 00                	mov    (%rax),%eax
  800e67:	3d ff 00 00 00       	cmp    $0xff,%eax
  800e6c:	75 2c                	jne    800e9a <putch+0x66>
  800e6e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e72:	8b 00                	mov    (%rax),%eax
  800e74:	48 98                	cltq   
  800e76:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800e7a:	48 83 c2 08          	add    $0x8,%rdx
  800e7e:	48 89 c6             	mov    %rax,%rsi
  800e81:	48 89 d7             	mov    %rdx,%rdi
  800e84:	48 b8 f5 22 80 00 00 	movabs $0x8022f5,%rax
  800e8b:	00 00 00 
  800e8e:	ff d0                	callq  *%rax
  800e90:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e94:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800e9a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e9e:	8b 40 04             	mov    0x4(%rax),%eax
  800ea1:	8d 50 01             	lea    0x1(%rax),%edx
  800ea4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ea8:	89 50 04             	mov    %edx,0x4(%rax)
  800eab:	c9                   	leaveq 
  800eac:	c3                   	retq   

0000000000800ead <vcprintf>:
  800ead:	55                   	push   %rbp
  800eae:	48 89 e5             	mov    %rsp,%rbp
  800eb1:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800eb8:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800ebf:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800ec6:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800ecd:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800ed4:	48 8b 0a             	mov    (%rdx),%rcx
  800ed7:	48 89 08             	mov    %rcx,(%rax)
  800eda:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ede:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800ee2:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800ee6:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800eea:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800ef1:	00 00 00 
  800ef4:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800efb:	00 00 00 
  800efe:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800f05:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800f0c:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800f13:	48 89 c6             	mov    %rax,%rsi
  800f16:	48 bf 34 0e 80 00 00 	movabs $0x800e34,%rdi
  800f1d:	00 00 00 
  800f20:	48 b8 0c 13 80 00 00 	movabs $0x80130c,%rax
  800f27:	00 00 00 
  800f2a:	ff d0                	callq  *%rax
  800f2c:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800f32:	48 98                	cltq   
  800f34:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800f3b:	48 83 c2 08          	add    $0x8,%rdx
  800f3f:	48 89 c6             	mov    %rax,%rsi
  800f42:	48 89 d7             	mov    %rdx,%rdi
  800f45:	48 b8 f5 22 80 00 00 	movabs $0x8022f5,%rax
  800f4c:	00 00 00 
  800f4f:	ff d0                	callq  *%rax
  800f51:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800f57:	c9                   	leaveq 
  800f58:	c3                   	retq   

0000000000800f59 <cprintf>:
  800f59:	55                   	push   %rbp
  800f5a:	48 89 e5             	mov    %rsp,%rbp
  800f5d:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800f64:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800f6b:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800f72:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800f79:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800f80:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f87:	84 c0                	test   %al,%al
  800f89:	74 20                	je     800fab <cprintf+0x52>
  800f8b:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800f8f:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f93:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f97:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f9b:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f9f:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800fa3:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800fa7:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800fab:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800fb2:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800fb9:	00 00 00 
  800fbc:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800fc3:	00 00 00 
  800fc6:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800fca:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800fd1:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800fd8:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800fdf:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800fe6:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800fed:	48 8b 0a             	mov    (%rdx),%rcx
  800ff0:	48 89 08             	mov    %rcx,(%rax)
  800ff3:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ff7:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800ffb:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800fff:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801003:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  80100a:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801011:	48 89 d6             	mov    %rdx,%rsi
  801014:	48 89 c7             	mov    %rax,%rdi
  801017:	48 b8 ad 0e 80 00 00 	movabs $0x800ead,%rax
  80101e:	00 00 00 
  801021:	ff d0                	callq  *%rax
  801023:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801029:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80102f:	c9                   	leaveq 
  801030:	c3                   	retq   

0000000000801031 <printnum>:
  801031:	55                   	push   %rbp
  801032:	48 89 e5             	mov    %rsp,%rbp
  801035:	53                   	push   %rbx
  801036:	48 83 ec 38          	sub    $0x38,%rsp
  80103a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80103e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801042:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801046:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  801049:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  80104d:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  801051:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  801054:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801058:	77 3b                	ja     801095 <printnum+0x64>
  80105a:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80105d:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  801061:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  801064:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801068:	ba 00 00 00 00       	mov    $0x0,%edx
  80106d:	48 f7 f3             	div    %rbx
  801070:	48 89 c2             	mov    %rax,%rdx
  801073:	8b 7d cc             	mov    -0x34(%rbp),%edi
  801076:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  801079:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  80107d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801081:	41 89 f9             	mov    %edi,%r9d
  801084:	48 89 c7             	mov    %rax,%rdi
  801087:	48 b8 31 10 80 00 00 	movabs $0x801031,%rax
  80108e:	00 00 00 
  801091:	ff d0                	callq  *%rax
  801093:	eb 1e                	jmp    8010b3 <printnum+0x82>
  801095:	eb 12                	jmp    8010a9 <printnum+0x78>
  801097:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80109b:	8b 55 cc             	mov    -0x34(%rbp),%edx
  80109e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010a2:	48 89 ce             	mov    %rcx,%rsi
  8010a5:	89 d7                	mov    %edx,%edi
  8010a7:	ff d0                	callq  *%rax
  8010a9:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  8010ad:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  8010b1:	7f e4                	jg     801097 <printnum+0x66>
  8010b3:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8010b6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8010ba:	ba 00 00 00 00       	mov    $0x0,%edx
  8010bf:	48 f7 f1             	div    %rcx
  8010c2:	48 89 d0             	mov    %rdx,%rax
  8010c5:	48 ba 30 53 80 00 00 	movabs $0x805330,%rdx
  8010cc:	00 00 00 
  8010cf:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  8010d3:	0f be d0             	movsbl %al,%edx
  8010d6:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8010da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010de:	48 89 ce             	mov    %rcx,%rsi
  8010e1:	89 d7                	mov    %edx,%edi
  8010e3:	ff d0                	callq  *%rax
  8010e5:	48 83 c4 38          	add    $0x38,%rsp
  8010e9:	5b                   	pop    %rbx
  8010ea:	5d                   	pop    %rbp
  8010eb:	c3                   	retq   

00000000008010ec <getuint>:
  8010ec:	55                   	push   %rbp
  8010ed:	48 89 e5             	mov    %rsp,%rbp
  8010f0:	48 83 ec 1c          	sub    $0x1c,%rsp
  8010f4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010f8:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8010fb:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8010ff:	7e 52                	jle    801153 <getuint+0x67>
  801101:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801105:	8b 00                	mov    (%rax),%eax
  801107:	83 f8 30             	cmp    $0x30,%eax
  80110a:	73 24                	jae    801130 <getuint+0x44>
  80110c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801110:	48 8b 50 10          	mov    0x10(%rax),%rdx
  801114:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801118:	8b 00                	mov    (%rax),%eax
  80111a:	89 c0                	mov    %eax,%eax
  80111c:	48 01 d0             	add    %rdx,%rax
  80111f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801123:	8b 12                	mov    (%rdx),%edx
  801125:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801128:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80112c:	89 0a                	mov    %ecx,(%rdx)
  80112e:	eb 17                	jmp    801147 <getuint+0x5b>
  801130:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801134:	48 8b 50 08          	mov    0x8(%rax),%rdx
  801138:	48 89 d0             	mov    %rdx,%rax
  80113b:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80113f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801143:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801147:	48 8b 00             	mov    (%rax),%rax
  80114a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80114e:	e9 a3 00 00 00       	jmpq   8011f6 <getuint+0x10a>
  801153:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  801157:	74 4f                	je     8011a8 <getuint+0xbc>
  801159:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80115d:	8b 00                	mov    (%rax),%eax
  80115f:	83 f8 30             	cmp    $0x30,%eax
  801162:	73 24                	jae    801188 <getuint+0x9c>
  801164:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801168:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80116c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801170:	8b 00                	mov    (%rax),%eax
  801172:	89 c0                	mov    %eax,%eax
  801174:	48 01 d0             	add    %rdx,%rax
  801177:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80117b:	8b 12                	mov    (%rdx),%edx
  80117d:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801180:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801184:	89 0a                	mov    %ecx,(%rdx)
  801186:	eb 17                	jmp    80119f <getuint+0xb3>
  801188:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80118c:	48 8b 50 08          	mov    0x8(%rax),%rdx
  801190:	48 89 d0             	mov    %rdx,%rax
  801193:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  801197:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80119b:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80119f:	48 8b 00             	mov    (%rax),%rax
  8011a2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8011a6:	eb 4e                	jmp    8011f6 <getuint+0x10a>
  8011a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011ac:	8b 00                	mov    (%rax),%eax
  8011ae:	83 f8 30             	cmp    $0x30,%eax
  8011b1:	73 24                	jae    8011d7 <getuint+0xeb>
  8011b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011b7:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8011bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011bf:	8b 00                	mov    (%rax),%eax
  8011c1:	89 c0                	mov    %eax,%eax
  8011c3:	48 01 d0             	add    %rdx,%rax
  8011c6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011ca:	8b 12                	mov    (%rdx),%edx
  8011cc:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8011cf:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011d3:	89 0a                	mov    %ecx,(%rdx)
  8011d5:	eb 17                	jmp    8011ee <getuint+0x102>
  8011d7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011db:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8011df:	48 89 d0             	mov    %rdx,%rax
  8011e2:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8011e6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011ea:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8011ee:	8b 00                	mov    (%rax),%eax
  8011f0:	89 c0                	mov    %eax,%eax
  8011f2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8011f6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011fa:	c9                   	leaveq 
  8011fb:	c3                   	retq   

00000000008011fc <getint>:
  8011fc:	55                   	push   %rbp
  8011fd:	48 89 e5             	mov    %rsp,%rbp
  801200:	48 83 ec 1c          	sub    $0x1c,%rsp
  801204:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801208:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80120b:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80120f:	7e 52                	jle    801263 <getint+0x67>
  801211:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801215:	8b 00                	mov    (%rax),%eax
  801217:	83 f8 30             	cmp    $0x30,%eax
  80121a:	73 24                	jae    801240 <getint+0x44>
  80121c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801220:	48 8b 50 10          	mov    0x10(%rax),%rdx
  801224:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801228:	8b 00                	mov    (%rax),%eax
  80122a:	89 c0                	mov    %eax,%eax
  80122c:	48 01 d0             	add    %rdx,%rax
  80122f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801233:	8b 12                	mov    (%rdx),%edx
  801235:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801238:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80123c:	89 0a                	mov    %ecx,(%rdx)
  80123e:	eb 17                	jmp    801257 <getint+0x5b>
  801240:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801244:	48 8b 50 08          	mov    0x8(%rax),%rdx
  801248:	48 89 d0             	mov    %rdx,%rax
  80124b:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80124f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801253:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801257:	48 8b 00             	mov    (%rax),%rax
  80125a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80125e:	e9 a3 00 00 00       	jmpq   801306 <getint+0x10a>
  801263:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  801267:	74 4f                	je     8012b8 <getint+0xbc>
  801269:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80126d:	8b 00                	mov    (%rax),%eax
  80126f:	83 f8 30             	cmp    $0x30,%eax
  801272:	73 24                	jae    801298 <getint+0x9c>
  801274:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801278:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80127c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801280:	8b 00                	mov    (%rax),%eax
  801282:	89 c0                	mov    %eax,%eax
  801284:	48 01 d0             	add    %rdx,%rax
  801287:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80128b:	8b 12                	mov    (%rdx),%edx
  80128d:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801290:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801294:	89 0a                	mov    %ecx,(%rdx)
  801296:	eb 17                	jmp    8012af <getint+0xb3>
  801298:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80129c:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8012a0:	48 89 d0             	mov    %rdx,%rax
  8012a3:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8012a7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8012ab:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8012af:	48 8b 00             	mov    (%rax),%rax
  8012b2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8012b6:	eb 4e                	jmp    801306 <getint+0x10a>
  8012b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012bc:	8b 00                	mov    (%rax),%eax
  8012be:	83 f8 30             	cmp    $0x30,%eax
  8012c1:	73 24                	jae    8012e7 <getint+0xeb>
  8012c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012c7:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8012cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012cf:	8b 00                	mov    (%rax),%eax
  8012d1:	89 c0                	mov    %eax,%eax
  8012d3:	48 01 d0             	add    %rdx,%rax
  8012d6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8012da:	8b 12                	mov    (%rdx),%edx
  8012dc:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8012df:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8012e3:	89 0a                	mov    %ecx,(%rdx)
  8012e5:	eb 17                	jmp    8012fe <getint+0x102>
  8012e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012eb:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8012ef:	48 89 d0             	mov    %rdx,%rax
  8012f2:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8012f6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8012fa:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8012fe:	8b 00                	mov    (%rax),%eax
  801300:	48 98                	cltq   
  801302:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801306:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80130a:	c9                   	leaveq 
  80130b:	c3                   	retq   

000000000080130c <vprintfmt>:
  80130c:	55                   	push   %rbp
  80130d:	48 89 e5             	mov    %rsp,%rbp
  801310:	41 54                	push   %r12
  801312:	53                   	push   %rbx
  801313:	48 83 ec 60          	sub    $0x60,%rsp
  801317:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  80131b:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  80131f:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  801323:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  801327:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80132b:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  80132f:	48 8b 0a             	mov    (%rdx),%rcx
  801332:	48 89 08             	mov    %rcx,(%rax)
  801335:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801339:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80133d:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801341:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801345:	eb 17                	jmp    80135e <vprintfmt+0x52>
  801347:	85 db                	test   %ebx,%ebx
  801349:	0f 84 cc 04 00 00    	je     80181b <vprintfmt+0x50f>
  80134f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801353:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801357:	48 89 d6             	mov    %rdx,%rsi
  80135a:	89 df                	mov    %ebx,%edi
  80135c:	ff d0                	callq  *%rax
  80135e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801362:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801366:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80136a:	0f b6 00             	movzbl (%rax),%eax
  80136d:	0f b6 d8             	movzbl %al,%ebx
  801370:	83 fb 25             	cmp    $0x25,%ebx
  801373:	75 d2                	jne    801347 <vprintfmt+0x3b>
  801375:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  801379:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  801380:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  801387:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80138e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  801395:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801399:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80139d:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8013a1:	0f b6 00             	movzbl (%rax),%eax
  8013a4:	0f b6 d8             	movzbl %al,%ebx
  8013a7:	8d 43 dd             	lea    -0x23(%rbx),%eax
  8013aa:	83 f8 55             	cmp    $0x55,%eax
  8013ad:	0f 87 34 04 00 00    	ja     8017e7 <vprintfmt+0x4db>
  8013b3:	89 c0                	mov    %eax,%eax
  8013b5:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8013bc:	00 
  8013bd:	48 b8 58 53 80 00 00 	movabs $0x805358,%rax
  8013c4:	00 00 00 
  8013c7:	48 01 d0             	add    %rdx,%rax
  8013ca:	48 8b 00             	mov    (%rax),%rax
  8013cd:	ff e0                	jmpq   *%rax
  8013cf:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8013d3:	eb c0                	jmp    801395 <vprintfmt+0x89>
  8013d5:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8013d9:	eb ba                	jmp    801395 <vprintfmt+0x89>
  8013db:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8013e2:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8013e5:	89 d0                	mov    %edx,%eax
  8013e7:	c1 e0 02             	shl    $0x2,%eax
  8013ea:	01 d0                	add    %edx,%eax
  8013ec:	01 c0                	add    %eax,%eax
  8013ee:	01 d8                	add    %ebx,%eax
  8013f0:	83 e8 30             	sub    $0x30,%eax
  8013f3:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8013f6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8013fa:	0f b6 00             	movzbl (%rax),%eax
  8013fd:	0f be d8             	movsbl %al,%ebx
  801400:	83 fb 2f             	cmp    $0x2f,%ebx
  801403:	7e 0c                	jle    801411 <vprintfmt+0x105>
  801405:	83 fb 39             	cmp    $0x39,%ebx
  801408:	7f 07                	jg     801411 <vprintfmt+0x105>
  80140a:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  80140f:	eb d1                	jmp    8013e2 <vprintfmt+0xd6>
  801411:	eb 58                	jmp    80146b <vprintfmt+0x15f>
  801413:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801416:	83 f8 30             	cmp    $0x30,%eax
  801419:	73 17                	jae    801432 <vprintfmt+0x126>
  80141b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80141f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801422:	89 c0                	mov    %eax,%eax
  801424:	48 01 d0             	add    %rdx,%rax
  801427:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80142a:	83 c2 08             	add    $0x8,%edx
  80142d:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801430:	eb 0f                	jmp    801441 <vprintfmt+0x135>
  801432:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  801436:	48 89 d0             	mov    %rdx,%rax
  801439:	48 83 c2 08          	add    $0x8,%rdx
  80143d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801441:	8b 00                	mov    (%rax),%eax
  801443:	89 45 d8             	mov    %eax,-0x28(%rbp)
  801446:	eb 23                	jmp    80146b <vprintfmt+0x15f>
  801448:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80144c:	79 0c                	jns    80145a <vprintfmt+0x14e>
  80144e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  801455:	e9 3b ff ff ff       	jmpq   801395 <vprintfmt+0x89>
  80145a:	e9 36 ff ff ff       	jmpq   801395 <vprintfmt+0x89>
  80145f:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  801466:	e9 2a ff ff ff       	jmpq   801395 <vprintfmt+0x89>
  80146b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80146f:	79 12                	jns    801483 <vprintfmt+0x177>
  801471:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801474:	89 45 dc             	mov    %eax,-0x24(%rbp)
  801477:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  80147e:	e9 12 ff ff ff       	jmpq   801395 <vprintfmt+0x89>
  801483:	e9 0d ff ff ff       	jmpq   801395 <vprintfmt+0x89>
  801488:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  80148c:	e9 04 ff ff ff       	jmpq   801395 <vprintfmt+0x89>
  801491:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801494:	83 f8 30             	cmp    $0x30,%eax
  801497:	73 17                	jae    8014b0 <vprintfmt+0x1a4>
  801499:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80149d:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8014a0:	89 c0                	mov    %eax,%eax
  8014a2:	48 01 d0             	add    %rdx,%rax
  8014a5:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8014a8:	83 c2 08             	add    $0x8,%edx
  8014ab:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8014ae:	eb 0f                	jmp    8014bf <vprintfmt+0x1b3>
  8014b0:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8014b4:	48 89 d0             	mov    %rdx,%rax
  8014b7:	48 83 c2 08          	add    $0x8,%rdx
  8014bb:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8014bf:	8b 10                	mov    (%rax),%edx
  8014c1:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8014c5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8014c9:	48 89 ce             	mov    %rcx,%rsi
  8014cc:	89 d7                	mov    %edx,%edi
  8014ce:	ff d0                	callq  *%rax
  8014d0:	e9 40 03 00 00       	jmpq   801815 <vprintfmt+0x509>
  8014d5:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8014d8:	83 f8 30             	cmp    $0x30,%eax
  8014db:	73 17                	jae    8014f4 <vprintfmt+0x1e8>
  8014dd:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8014e1:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8014e4:	89 c0                	mov    %eax,%eax
  8014e6:	48 01 d0             	add    %rdx,%rax
  8014e9:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8014ec:	83 c2 08             	add    $0x8,%edx
  8014ef:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8014f2:	eb 0f                	jmp    801503 <vprintfmt+0x1f7>
  8014f4:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8014f8:	48 89 d0             	mov    %rdx,%rax
  8014fb:	48 83 c2 08          	add    $0x8,%rdx
  8014ff:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801503:	8b 18                	mov    (%rax),%ebx
  801505:	85 db                	test   %ebx,%ebx
  801507:	79 02                	jns    80150b <vprintfmt+0x1ff>
  801509:	f7 db                	neg    %ebx
  80150b:	83 fb 15             	cmp    $0x15,%ebx
  80150e:	7f 16                	jg     801526 <vprintfmt+0x21a>
  801510:	48 b8 80 52 80 00 00 	movabs $0x805280,%rax
  801517:	00 00 00 
  80151a:	48 63 d3             	movslq %ebx,%rdx
  80151d:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  801521:	4d 85 e4             	test   %r12,%r12
  801524:	75 2e                	jne    801554 <vprintfmt+0x248>
  801526:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  80152a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80152e:	89 d9                	mov    %ebx,%ecx
  801530:	48 ba 41 53 80 00 00 	movabs $0x805341,%rdx
  801537:	00 00 00 
  80153a:	48 89 c7             	mov    %rax,%rdi
  80153d:	b8 00 00 00 00       	mov    $0x0,%eax
  801542:	49 b8 24 18 80 00 00 	movabs $0x801824,%r8
  801549:	00 00 00 
  80154c:	41 ff d0             	callq  *%r8
  80154f:	e9 c1 02 00 00       	jmpq   801815 <vprintfmt+0x509>
  801554:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801558:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80155c:	4c 89 e1             	mov    %r12,%rcx
  80155f:	48 ba 4a 53 80 00 00 	movabs $0x80534a,%rdx
  801566:	00 00 00 
  801569:	48 89 c7             	mov    %rax,%rdi
  80156c:	b8 00 00 00 00       	mov    $0x0,%eax
  801571:	49 b8 24 18 80 00 00 	movabs $0x801824,%r8
  801578:	00 00 00 
  80157b:	41 ff d0             	callq  *%r8
  80157e:	e9 92 02 00 00       	jmpq   801815 <vprintfmt+0x509>
  801583:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801586:	83 f8 30             	cmp    $0x30,%eax
  801589:	73 17                	jae    8015a2 <vprintfmt+0x296>
  80158b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80158f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801592:	89 c0                	mov    %eax,%eax
  801594:	48 01 d0             	add    %rdx,%rax
  801597:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80159a:	83 c2 08             	add    $0x8,%edx
  80159d:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8015a0:	eb 0f                	jmp    8015b1 <vprintfmt+0x2a5>
  8015a2:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8015a6:	48 89 d0             	mov    %rdx,%rax
  8015a9:	48 83 c2 08          	add    $0x8,%rdx
  8015ad:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8015b1:	4c 8b 20             	mov    (%rax),%r12
  8015b4:	4d 85 e4             	test   %r12,%r12
  8015b7:	75 0a                	jne    8015c3 <vprintfmt+0x2b7>
  8015b9:	49 bc 4d 53 80 00 00 	movabs $0x80534d,%r12
  8015c0:	00 00 00 
  8015c3:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8015c7:	7e 3f                	jle    801608 <vprintfmt+0x2fc>
  8015c9:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  8015cd:	74 39                	je     801608 <vprintfmt+0x2fc>
  8015cf:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8015d2:	48 98                	cltq   
  8015d4:	48 89 c6             	mov    %rax,%rsi
  8015d7:	4c 89 e7             	mov    %r12,%rdi
  8015da:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  8015e1:	00 00 00 
  8015e4:	ff d0                	callq  *%rax
  8015e6:	29 45 dc             	sub    %eax,-0x24(%rbp)
  8015e9:	eb 17                	jmp    801602 <vprintfmt+0x2f6>
  8015eb:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  8015ef:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8015f3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8015f7:	48 89 ce             	mov    %rcx,%rsi
  8015fa:	89 d7                	mov    %edx,%edi
  8015fc:	ff d0                	callq  *%rax
  8015fe:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801602:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801606:	7f e3                	jg     8015eb <vprintfmt+0x2df>
  801608:	eb 37                	jmp    801641 <vprintfmt+0x335>
  80160a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  80160e:	74 1e                	je     80162e <vprintfmt+0x322>
  801610:	83 fb 1f             	cmp    $0x1f,%ebx
  801613:	7e 05                	jle    80161a <vprintfmt+0x30e>
  801615:	83 fb 7e             	cmp    $0x7e,%ebx
  801618:	7e 14                	jle    80162e <vprintfmt+0x322>
  80161a:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80161e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801622:	48 89 d6             	mov    %rdx,%rsi
  801625:	bf 3f 00 00 00       	mov    $0x3f,%edi
  80162a:	ff d0                	callq  *%rax
  80162c:	eb 0f                	jmp    80163d <vprintfmt+0x331>
  80162e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801632:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801636:	48 89 d6             	mov    %rdx,%rsi
  801639:	89 df                	mov    %ebx,%edi
  80163b:	ff d0                	callq  *%rax
  80163d:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801641:	4c 89 e0             	mov    %r12,%rax
  801644:	4c 8d 60 01          	lea    0x1(%rax),%r12
  801648:	0f b6 00             	movzbl (%rax),%eax
  80164b:	0f be d8             	movsbl %al,%ebx
  80164e:	85 db                	test   %ebx,%ebx
  801650:	74 10                	je     801662 <vprintfmt+0x356>
  801652:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801656:	78 b2                	js     80160a <vprintfmt+0x2fe>
  801658:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  80165c:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801660:	79 a8                	jns    80160a <vprintfmt+0x2fe>
  801662:	eb 16                	jmp    80167a <vprintfmt+0x36e>
  801664:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801668:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80166c:	48 89 d6             	mov    %rdx,%rsi
  80166f:	bf 20 00 00 00       	mov    $0x20,%edi
  801674:	ff d0                	callq  *%rax
  801676:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  80167a:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80167e:	7f e4                	jg     801664 <vprintfmt+0x358>
  801680:	e9 90 01 00 00       	jmpq   801815 <vprintfmt+0x509>
  801685:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801689:	be 03 00 00 00       	mov    $0x3,%esi
  80168e:	48 89 c7             	mov    %rax,%rdi
  801691:	48 b8 fc 11 80 00 00 	movabs $0x8011fc,%rax
  801698:	00 00 00 
  80169b:	ff d0                	callq  *%rax
  80169d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8016a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016a5:	48 85 c0             	test   %rax,%rax
  8016a8:	79 1d                	jns    8016c7 <vprintfmt+0x3bb>
  8016aa:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8016ae:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8016b2:	48 89 d6             	mov    %rdx,%rsi
  8016b5:	bf 2d 00 00 00       	mov    $0x2d,%edi
  8016ba:	ff d0                	callq  *%rax
  8016bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016c0:	48 f7 d8             	neg    %rax
  8016c3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8016c7:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  8016ce:	e9 d5 00 00 00       	jmpq   8017a8 <vprintfmt+0x49c>
  8016d3:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8016d7:	be 03 00 00 00       	mov    $0x3,%esi
  8016dc:	48 89 c7             	mov    %rax,%rdi
  8016df:	48 b8 ec 10 80 00 00 	movabs $0x8010ec,%rax
  8016e6:	00 00 00 
  8016e9:	ff d0                	callq  *%rax
  8016eb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8016ef:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  8016f6:	e9 ad 00 00 00       	jmpq   8017a8 <vprintfmt+0x49c>
  8016fb:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8016ff:	be 03 00 00 00       	mov    $0x3,%esi
  801704:	48 89 c7             	mov    %rax,%rdi
  801707:	48 b8 ec 10 80 00 00 	movabs $0x8010ec,%rax
  80170e:	00 00 00 
  801711:	ff d0                	callq  *%rax
  801713:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801717:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  80171e:	e9 85 00 00 00       	jmpq   8017a8 <vprintfmt+0x49c>
  801723:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801727:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80172b:	48 89 d6             	mov    %rdx,%rsi
  80172e:	bf 30 00 00 00       	mov    $0x30,%edi
  801733:	ff d0                	callq  *%rax
  801735:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801739:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80173d:	48 89 d6             	mov    %rdx,%rsi
  801740:	bf 78 00 00 00       	mov    $0x78,%edi
  801745:	ff d0                	callq  *%rax
  801747:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80174a:	83 f8 30             	cmp    $0x30,%eax
  80174d:	73 17                	jae    801766 <vprintfmt+0x45a>
  80174f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801753:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801756:	89 c0                	mov    %eax,%eax
  801758:	48 01 d0             	add    %rdx,%rax
  80175b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80175e:	83 c2 08             	add    $0x8,%edx
  801761:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801764:	eb 0f                	jmp    801775 <vprintfmt+0x469>
  801766:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80176a:	48 89 d0             	mov    %rdx,%rax
  80176d:	48 83 c2 08          	add    $0x8,%rdx
  801771:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801775:	48 8b 00             	mov    (%rax),%rax
  801778:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80177c:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801783:	eb 23                	jmp    8017a8 <vprintfmt+0x49c>
  801785:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801789:	be 03 00 00 00       	mov    $0x3,%esi
  80178e:	48 89 c7             	mov    %rax,%rdi
  801791:	48 b8 ec 10 80 00 00 	movabs $0x8010ec,%rax
  801798:	00 00 00 
  80179b:	ff d0                	callq  *%rax
  80179d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8017a1:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  8017a8:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  8017ad:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  8017b0:	8b 7d dc             	mov    -0x24(%rbp),%edi
  8017b3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8017b7:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8017bb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8017bf:	45 89 c1             	mov    %r8d,%r9d
  8017c2:	41 89 f8             	mov    %edi,%r8d
  8017c5:	48 89 c7             	mov    %rax,%rdi
  8017c8:	48 b8 31 10 80 00 00 	movabs $0x801031,%rax
  8017cf:	00 00 00 
  8017d2:	ff d0                	callq  *%rax
  8017d4:	eb 3f                	jmp    801815 <vprintfmt+0x509>
  8017d6:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8017da:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8017de:	48 89 d6             	mov    %rdx,%rsi
  8017e1:	89 df                	mov    %ebx,%edi
  8017e3:	ff d0                	callq  *%rax
  8017e5:	eb 2e                	jmp    801815 <vprintfmt+0x509>
  8017e7:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8017eb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8017ef:	48 89 d6             	mov    %rdx,%rsi
  8017f2:	bf 25 00 00 00       	mov    $0x25,%edi
  8017f7:	ff d0                	callq  *%rax
  8017f9:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  8017fe:	eb 05                	jmp    801805 <vprintfmt+0x4f9>
  801800:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  801805:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801809:	48 83 e8 01          	sub    $0x1,%rax
  80180d:	0f b6 00             	movzbl (%rax),%eax
  801810:	3c 25                	cmp    $0x25,%al
  801812:	75 ec                	jne    801800 <vprintfmt+0x4f4>
  801814:	90                   	nop
  801815:	90                   	nop
  801816:	e9 43 fb ff ff       	jmpq   80135e <vprintfmt+0x52>
  80181b:	48 83 c4 60          	add    $0x60,%rsp
  80181f:	5b                   	pop    %rbx
  801820:	41 5c                	pop    %r12
  801822:	5d                   	pop    %rbp
  801823:	c3                   	retq   

0000000000801824 <printfmt>:
  801824:	55                   	push   %rbp
  801825:	48 89 e5             	mov    %rsp,%rbp
  801828:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  80182f:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  801836:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  80183d:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801844:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80184b:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801852:	84 c0                	test   %al,%al
  801854:	74 20                	je     801876 <printfmt+0x52>
  801856:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80185a:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80185e:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801862:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801866:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80186a:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80186e:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801872:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801876:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  80187d:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  801884:	00 00 00 
  801887:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  80188e:	00 00 00 
  801891:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801895:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80189c:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8018a3:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  8018aa:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  8018b1:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8018b8:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  8018bf:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  8018c6:	48 89 c7             	mov    %rax,%rdi
  8018c9:	48 b8 0c 13 80 00 00 	movabs $0x80130c,%rax
  8018d0:	00 00 00 
  8018d3:	ff d0                	callq  *%rax
  8018d5:	c9                   	leaveq 
  8018d6:	c3                   	retq   

00000000008018d7 <sprintputch>:
  8018d7:	55                   	push   %rbp
  8018d8:	48 89 e5             	mov    %rsp,%rbp
  8018db:	48 83 ec 10          	sub    $0x10,%rsp
  8018df:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8018e2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8018e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018ea:	8b 40 10             	mov    0x10(%rax),%eax
  8018ed:	8d 50 01             	lea    0x1(%rax),%edx
  8018f0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018f4:	89 50 10             	mov    %edx,0x10(%rax)
  8018f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018fb:	48 8b 10             	mov    (%rax),%rdx
  8018fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801902:	48 8b 40 08          	mov    0x8(%rax),%rax
  801906:	48 39 c2             	cmp    %rax,%rdx
  801909:	73 17                	jae    801922 <sprintputch+0x4b>
  80190b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80190f:	48 8b 00             	mov    (%rax),%rax
  801912:	48 8d 48 01          	lea    0x1(%rax),%rcx
  801916:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80191a:	48 89 0a             	mov    %rcx,(%rdx)
  80191d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801920:	88 10                	mov    %dl,(%rax)
  801922:	c9                   	leaveq 
  801923:	c3                   	retq   

0000000000801924 <vsnprintf>:
  801924:	55                   	push   %rbp
  801925:	48 89 e5             	mov    %rsp,%rbp
  801928:	48 83 ec 50          	sub    $0x50,%rsp
  80192c:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  801930:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  801933:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  801937:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  80193b:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  80193f:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  801943:	48 8b 0a             	mov    (%rdx),%rcx
  801946:	48 89 08             	mov    %rcx,(%rax)
  801949:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80194d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801951:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801955:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801959:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80195d:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  801961:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801964:	48 98                	cltq   
  801966:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80196a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80196e:	48 01 d0             	add    %rdx,%rax
  801971:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801975:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80197c:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  801981:	74 06                	je     801989 <vsnprintf+0x65>
  801983:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801987:	7f 07                	jg     801990 <vsnprintf+0x6c>
  801989:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80198e:	eb 2f                	jmp    8019bf <vsnprintf+0x9b>
  801990:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801994:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801998:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80199c:	48 89 c6             	mov    %rax,%rsi
  80199f:	48 bf d7 18 80 00 00 	movabs $0x8018d7,%rdi
  8019a6:	00 00 00 
  8019a9:	48 b8 0c 13 80 00 00 	movabs $0x80130c,%rax
  8019b0:	00 00 00 
  8019b3:	ff d0                	callq  *%rax
  8019b5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8019b9:	c6 00 00             	movb   $0x0,(%rax)
  8019bc:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8019bf:	c9                   	leaveq 
  8019c0:	c3                   	retq   

00000000008019c1 <snprintf>:
  8019c1:	55                   	push   %rbp
  8019c2:	48 89 e5             	mov    %rsp,%rbp
  8019c5:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  8019cc:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8019d3:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  8019d9:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8019e0:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8019e7:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8019ee:	84 c0                	test   %al,%al
  8019f0:	74 20                	je     801a12 <snprintf+0x51>
  8019f2:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8019f6:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8019fa:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8019fe:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801a02:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801a06:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801a0a:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801a0e:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801a12:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  801a19:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  801a20:	00 00 00 
  801a23:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  801a2a:	00 00 00 
  801a2d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801a31:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801a38:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801a3f:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801a46:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  801a4d:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801a54:	48 8b 0a             	mov    (%rdx),%rcx
  801a57:	48 89 08             	mov    %rcx,(%rax)
  801a5a:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801a5e:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801a62:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801a66:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801a6a:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  801a71:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801a78:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  801a7e:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801a85:	48 89 c7             	mov    %rax,%rdi
  801a88:	48 b8 24 19 80 00 00 	movabs $0x801924,%rax
  801a8f:	00 00 00 
  801a92:	ff d0                	callq  *%rax
  801a94:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801a9a:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801aa0:	c9                   	leaveq 
  801aa1:	c3                   	retq   

0000000000801aa2 <strlen>:
  801aa2:	55                   	push   %rbp
  801aa3:	48 89 e5             	mov    %rsp,%rbp
  801aa6:	48 83 ec 18          	sub    $0x18,%rsp
  801aaa:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801aae:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801ab5:	eb 09                	jmp    801ac0 <strlen+0x1e>
  801ab7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801abb:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801ac0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ac4:	0f b6 00             	movzbl (%rax),%eax
  801ac7:	84 c0                	test   %al,%al
  801ac9:	75 ec                	jne    801ab7 <strlen+0x15>
  801acb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ace:	c9                   	leaveq 
  801acf:	c3                   	retq   

0000000000801ad0 <strnlen>:
  801ad0:	55                   	push   %rbp
  801ad1:	48 89 e5             	mov    %rsp,%rbp
  801ad4:	48 83 ec 20          	sub    $0x20,%rsp
  801ad8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801adc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801ae0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801ae7:	eb 0e                	jmp    801af7 <strnlen+0x27>
  801ae9:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801aed:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801af2:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801af7:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  801afc:	74 0b                	je     801b09 <strnlen+0x39>
  801afe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b02:	0f b6 00             	movzbl (%rax),%eax
  801b05:	84 c0                	test   %al,%al
  801b07:	75 e0                	jne    801ae9 <strnlen+0x19>
  801b09:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b0c:	c9                   	leaveq 
  801b0d:	c3                   	retq   

0000000000801b0e <strcpy>:
  801b0e:	55                   	push   %rbp
  801b0f:	48 89 e5             	mov    %rsp,%rbp
  801b12:	48 83 ec 20          	sub    $0x20,%rsp
  801b16:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801b1a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801b1e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b22:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801b26:	90                   	nop
  801b27:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b2b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801b2f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801b33:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801b37:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801b3b:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801b3f:	0f b6 12             	movzbl (%rdx),%edx
  801b42:	88 10                	mov    %dl,(%rax)
  801b44:	0f b6 00             	movzbl (%rax),%eax
  801b47:	84 c0                	test   %al,%al
  801b49:	75 dc                	jne    801b27 <strcpy+0x19>
  801b4b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b4f:	c9                   	leaveq 
  801b50:	c3                   	retq   

0000000000801b51 <strcat>:
  801b51:	55                   	push   %rbp
  801b52:	48 89 e5             	mov    %rsp,%rbp
  801b55:	48 83 ec 20          	sub    $0x20,%rsp
  801b59:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801b5d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801b61:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b65:	48 89 c7             	mov    %rax,%rdi
  801b68:	48 b8 a2 1a 80 00 00 	movabs $0x801aa2,%rax
  801b6f:	00 00 00 
  801b72:	ff d0                	callq  *%rax
  801b74:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801b77:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b7a:	48 63 d0             	movslq %eax,%rdx
  801b7d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b81:	48 01 c2             	add    %rax,%rdx
  801b84:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801b88:	48 89 c6             	mov    %rax,%rsi
  801b8b:	48 89 d7             	mov    %rdx,%rdi
  801b8e:	48 b8 0e 1b 80 00 00 	movabs $0x801b0e,%rax
  801b95:	00 00 00 
  801b98:	ff d0                	callq  *%rax
  801b9a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b9e:	c9                   	leaveq 
  801b9f:	c3                   	retq   

0000000000801ba0 <strncpy>:
  801ba0:	55                   	push   %rbp
  801ba1:	48 89 e5             	mov    %rsp,%rbp
  801ba4:	48 83 ec 28          	sub    $0x28,%rsp
  801ba8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801bac:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801bb0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801bb4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801bb8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801bbc:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801bc3:	00 
  801bc4:	eb 2a                	jmp    801bf0 <strncpy+0x50>
  801bc6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801bca:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801bce:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801bd2:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801bd6:	0f b6 12             	movzbl (%rdx),%edx
  801bd9:	88 10                	mov    %dl,(%rax)
  801bdb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801bdf:	0f b6 00             	movzbl (%rax),%eax
  801be2:	84 c0                	test   %al,%al
  801be4:	74 05                	je     801beb <strncpy+0x4b>
  801be6:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801beb:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801bf0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bf4:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801bf8:	72 cc                	jb     801bc6 <strncpy+0x26>
  801bfa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801bfe:	c9                   	leaveq 
  801bff:	c3                   	retq   

0000000000801c00 <strlcpy>:
  801c00:	55                   	push   %rbp
  801c01:	48 89 e5             	mov    %rsp,%rbp
  801c04:	48 83 ec 28          	sub    $0x28,%rsp
  801c08:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801c0c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801c10:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801c14:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c18:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801c1c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801c21:	74 3d                	je     801c60 <strlcpy+0x60>
  801c23:	eb 1d                	jmp    801c42 <strlcpy+0x42>
  801c25:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c29:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801c2d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801c31:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801c35:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801c39:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801c3d:	0f b6 12             	movzbl (%rdx),%edx
  801c40:	88 10                	mov    %dl,(%rax)
  801c42:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801c47:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801c4c:	74 0b                	je     801c59 <strlcpy+0x59>
  801c4e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801c52:	0f b6 00             	movzbl (%rax),%eax
  801c55:	84 c0                	test   %al,%al
  801c57:	75 cc                	jne    801c25 <strlcpy+0x25>
  801c59:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c5d:	c6 00 00             	movb   $0x0,(%rax)
  801c60:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801c64:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c68:	48 29 c2             	sub    %rax,%rdx
  801c6b:	48 89 d0             	mov    %rdx,%rax
  801c6e:	c9                   	leaveq 
  801c6f:	c3                   	retq   

0000000000801c70 <strcmp>:
  801c70:	55                   	push   %rbp
  801c71:	48 89 e5             	mov    %rsp,%rbp
  801c74:	48 83 ec 10          	sub    $0x10,%rsp
  801c78:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c7c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c80:	eb 0a                	jmp    801c8c <strcmp+0x1c>
  801c82:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801c87:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801c8c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c90:	0f b6 00             	movzbl (%rax),%eax
  801c93:	84 c0                	test   %al,%al
  801c95:	74 12                	je     801ca9 <strcmp+0x39>
  801c97:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c9b:	0f b6 10             	movzbl (%rax),%edx
  801c9e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ca2:	0f b6 00             	movzbl (%rax),%eax
  801ca5:	38 c2                	cmp    %al,%dl
  801ca7:	74 d9                	je     801c82 <strcmp+0x12>
  801ca9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cad:	0f b6 00             	movzbl (%rax),%eax
  801cb0:	0f b6 d0             	movzbl %al,%edx
  801cb3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801cb7:	0f b6 00             	movzbl (%rax),%eax
  801cba:	0f b6 c0             	movzbl %al,%eax
  801cbd:	29 c2                	sub    %eax,%edx
  801cbf:	89 d0                	mov    %edx,%eax
  801cc1:	c9                   	leaveq 
  801cc2:	c3                   	retq   

0000000000801cc3 <strncmp>:
  801cc3:	55                   	push   %rbp
  801cc4:	48 89 e5             	mov    %rsp,%rbp
  801cc7:	48 83 ec 18          	sub    $0x18,%rsp
  801ccb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ccf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801cd3:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801cd7:	eb 0f                	jmp    801ce8 <strncmp+0x25>
  801cd9:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801cde:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801ce3:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801ce8:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801ced:	74 1d                	je     801d0c <strncmp+0x49>
  801cef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cf3:	0f b6 00             	movzbl (%rax),%eax
  801cf6:	84 c0                	test   %al,%al
  801cf8:	74 12                	je     801d0c <strncmp+0x49>
  801cfa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cfe:	0f b6 10             	movzbl (%rax),%edx
  801d01:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d05:	0f b6 00             	movzbl (%rax),%eax
  801d08:	38 c2                	cmp    %al,%dl
  801d0a:	74 cd                	je     801cd9 <strncmp+0x16>
  801d0c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801d11:	75 07                	jne    801d1a <strncmp+0x57>
  801d13:	b8 00 00 00 00       	mov    $0x0,%eax
  801d18:	eb 18                	jmp    801d32 <strncmp+0x6f>
  801d1a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d1e:	0f b6 00             	movzbl (%rax),%eax
  801d21:	0f b6 d0             	movzbl %al,%edx
  801d24:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d28:	0f b6 00             	movzbl (%rax),%eax
  801d2b:	0f b6 c0             	movzbl %al,%eax
  801d2e:	29 c2                	sub    %eax,%edx
  801d30:	89 d0                	mov    %edx,%eax
  801d32:	c9                   	leaveq 
  801d33:	c3                   	retq   

0000000000801d34 <strchr>:
  801d34:	55                   	push   %rbp
  801d35:	48 89 e5             	mov    %rsp,%rbp
  801d38:	48 83 ec 0c          	sub    $0xc,%rsp
  801d3c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d40:	89 f0                	mov    %esi,%eax
  801d42:	88 45 f4             	mov    %al,-0xc(%rbp)
  801d45:	eb 17                	jmp    801d5e <strchr+0x2a>
  801d47:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d4b:	0f b6 00             	movzbl (%rax),%eax
  801d4e:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801d51:	75 06                	jne    801d59 <strchr+0x25>
  801d53:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d57:	eb 15                	jmp    801d6e <strchr+0x3a>
  801d59:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801d5e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d62:	0f b6 00             	movzbl (%rax),%eax
  801d65:	84 c0                	test   %al,%al
  801d67:	75 de                	jne    801d47 <strchr+0x13>
  801d69:	b8 00 00 00 00       	mov    $0x0,%eax
  801d6e:	c9                   	leaveq 
  801d6f:	c3                   	retq   

0000000000801d70 <strfind>:
  801d70:	55                   	push   %rbp
  801d71:	48 89 e5             	mov    %rsp,%rbp
  801d74:	48 83 ec 0c          	sub    $0xc,%rsp
  801d78:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d7c:	89 f0                	mov    %esi,%eax
  801d7e:	88 45 f4             	mov    %al,-0xc(%rbp)
  801d81:	eb 13                	jmp    801d96 <strfind+0x26>
  801d83:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d87:	0f b6 00             	movzbl (%rax),%eax
  801d8a:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801d8d:	75 02                	jne    801d91 <strfind+0x21>
  801d8f:	eb 10                	jmp    801da1 <strfind+0x31>
  801d91:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801d96:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d9a:	0f b6 00             	movzbl (%rax),%eax
  801d9d:	84 c0                	test   %al,%al
  801d9f:	75 e2                	jne    801d83 <strfind+0x13>
  801da1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801da5:	c9                   	leaveq 
  801da6:	c3                   	retq   

0000000000801da7 <memset>:
  801da7:	55                   	push   %rbp
  801da8:	48 89 e5             	mov    %rsp,%rbp
  801dab:	48 83 ec 18          	sub    $0x18,%rsp
  801daf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801db3:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801db6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801dba:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801dbf:	75 06                	jne    801dc7 <memset+0x20>
  801dc1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801dc5:	eb 69                	jmp    801e30 <memset+0x89>
  801dc7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801dcb:	83 e0 03             	and    $0x3,%eax
  801dce:	48 85 c0             	test   %rax,%rax
  801dd1:	75 48                	jne    801e1b <memset+0x74>
  801dd3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801dd7:	83 e0 03             	and    $0x3,%eax
  801dda:	48 85 c0             	test   %rax,%rax
  801ddd:	75 3c                	jne    801e1b <memset+0x74>
  801ddf:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801de6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801de9:	c1 e0 18             	shl    $0x18,%eax
  801dec:	89 c2                	mov    %eax,%edx
  801dee:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801df1:	c1 e0 10             	shl    $0x10,%eax
  801df4:	09 c2                	or     %eax,%edx
  801df6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801df9:	c1 e0 08             	shl    $0x8,%eax
  801dfc:	09 d0                	or     %edx,%eax
  801dfe:	09 45 f4             	or     %eax,-0xc(%rbp)
  801e01:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e05:	48 c1 e8 02          	shr    $0x2,%rax
  801e09:	48 89 c1             	mov    %rax,%rcx
  801e0c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801e10:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801e13:	48 89 d7             	mov    %rdx,%rdi
  801e16:	fc                   	cld    
  801e17:	f3 ab                	rep stos %eax,%es:(%rdi)
  801e19:	eb 11                	jmp    801e2c <memset+0x85>
  801e1b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801e1f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801e22:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801e26:	48 89 d7             	mov    %rdx,%rdi
  801e29:	fc                   	cld    
  801e2a:	f3 aa                	rep stos %al,%es:(%rdi)
  801e2c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e30:	c9                   	leaveq 
  801e31:	c3                   	retq   

0000000000801e32 <memmove>:
  801e32:	55                   	push   %rbp
  801e33:	48 89 e5             	mov    %rsp,%rbp
  801e36:	48 83 ec 28          	sub    $0x28,%rsp
  801e3a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801e3e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801e42:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801e46:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801e4a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801e4e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e52:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801e56:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e5a:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801e5e:	0f 83 88 00 00 00    	jae    801eec <memmove+0xba>
  801e64:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e68:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801e6c:	48 01 d0             	add    %rdx,%rax
  801e6f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801e73:	76 77                	jbe    801eec <memmove+0xba>
  801e75:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e79:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801e7d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e81:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801e85:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e89:	83 e0 03             	and    $0x3,%eax
  801e8c:	48 85 c0             	test   %rax,%rax
  801e8f:	75 3b                	jne    801ecc <memmove+0x9a>
  801e91:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e95:	83 e0 03             	and    $0x3,%eax
  801e98:	48 85 c0             	test   %rax,%rax
  801e9b:	75 2f                	jne    801ecc <memmove+0x9a>
  801e9d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ea1:	83 e0 03             	and    $0x3,%eax
  801ea4:	48 85 c0             	test   %rax,%rax
  801ea7:	75 23                	jne    801ecc <memmove+0x9a>
  801ea9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ead:	48 83 e8 04          	sub    $0x4,%rax
  801eb1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801eb5:	48 83 ea 04          	sub    $0x4,%rdx
  801eb9:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801ebd:	48 c1 e9 02          	shr    $0x2,%rcx
  801ec1:	48 89 c7             	mov    %rax,%rdi
  801ec4:	48 89 d6             	mov    %rdx,%rsi
  801ec7:	fd                   	std    
  801ec8:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801eca:	eb 1d                	jmp    801ee9 <memmove+0xb7>
  801ecc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ed0:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801ed4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ed8:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801edc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ee0:	48 89 d7             	mov    %rdx,%rdi
  801ee3:	48 89 c1             	mov    %rax,%rcx
  801ee6:	fd                   	std    
  801ee7:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801ee9:	fc                   	cld    
  801eea:	eb 57                	jmp    801f43 <memmove+0x111>
  801eec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ef0:	83 e0 03             	and    $0x3,%eax
  801ef3:	48 85 c0             	test   %rax,%rax
  801ef6:	75 36                	jne    801f2e <memmove+0xfc>
  801ef8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801efc:	83 e0 03             	and    $0x3,%eax
  801eff:	48 85 c0             	test   %rax,%rax
  801f02:	75 2a                	jne    801f2e <memmove+0xfc>
  801f04:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f08:	83 e0 03             	and    $0x3,%eax
  801f0b:	48 85 c0             	test   %rax,%rax
  801f0e:	75 1e                	jne    801f2e <memmove+0xfc>
  801f10:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f14:	48 c1 e8 02          	shr    $0x2,%rax
  801f18:	48 89 c1             	mov    %rax,%rcx
  801f1b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f1f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801f23:	48 89 c7             	mov    %rax,%rdi
  801f26:	48 89 d6             	mov    %rdx,%rsi
  801f29:	fc                   	cld    
  801f2a:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801f2c:	eb 15                	jmp    801f43 <memmove+0x111>
  801f2e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f32:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801f36:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801f3a:	48 89 c7             	mov    %rax,%rdi
  801f3d:	48 89 d6             	mov    %rdx,%rsi
  801f40:	fc                   	cld    
  801f41:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801f43:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f47:	c9                   	leaveq 
  801f48:	c3                   	retq   

0000000000801f49 <memcpy>:
  801f49:	55                   	push   %rbp
  801f4a:	48 89 e5             	mov    %rsp,%rbp
  801f4d:	48 83 ec 18          	sub    $0x18,%rsp
  801f51:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f55:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801f59:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801f5d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801f61:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801f65:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f69:	48 89 ce             	mov    %rcx,%rsi
  801f6c:	48 89 c7             	mov    %rax,%rdi
  801f6f:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  801f76:	00 00 00 
  801f79:	ff d0                	callq  *%rax
  801f7b:	c9                   	leaveq 
  801f7c:	c3                   	retq   

0000000000801f7d <memcmp>:
  801f7d:	55                   	push   %rbp
  801f7e:	48 89 e5             	mov    %rsp,%rbp
  801f81:	48 83 ec 28          	sub    $0x28,%rsp
  801f85:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801f89:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801f8d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801f91:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f95:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801f99:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f9d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801fa1:	eb 36                	jmp    801fd9 <memcmp+0x5c>
  801fa3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801fa7:	0f b6 10             	movzbl (%rax),%edx
  801faa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801fae:	0f b6 00             	movzbl (%rax),%eax
  801fb1:	38 c2                	cmp    %al,%dl
  801fb3:	74 1a                	je     801fcf <memcmp+0x52>
  801fb5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801fb9:	0f b6 00             	movzbl (%rax),%eax
  801fbc:	0f b6 d0             	movzbl %al,%edx
  801fbf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801fc3:	0f b6 00             	movzbl (%rax),%eax
  801fc6:	0f b6 c0             	movzbl %al,%eax
  801fc9:	29 c2                	sub    %eax,%edx
  801fcb:	89 d0                	mov    %edx,%eax
  801fcd:	eb 20                	jmp    801fef <memcmp+0x72>
  801fcf:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801fd4:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801fd9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fdd:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801fe1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801fe5:	48 85 c0             	test   %rax,%rax
  801fe8:	75 b9                	jne    801fa3 <memcmp+0x26>
  801fea:	b8 00 00 00 00       	mov    $0x0,%eax
  801fef:	c9                   	leaveq 
  801ff0:	c3                   	retq   

0000000000801ff1 <memfind>:
  801ff1:	55                   	push   %rbp
  801ff2:	48 89 e5             	mov    %rsp,%rbp
  801ff5:	48 83 ec 28          	sub    $0x28,%rsp
  801ff9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801ffd:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802000:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802004:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802008:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80200c:	48 01 d0             	add    %rdx,%rax
  80200f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802013:	eb 15                	jmp    80202a <memfind+0x39>
  802015:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802019:	0f b6 10             	movzbl (%rax),%edx
  80201c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80201f:	38 c2                	cmp    %al,%dl
  802021:	75 02                	jne    802025 <memfind+0x34>
  802023:	eb 0f                	jmp    802034 <memfind+0x43>
  802025:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80202a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80202e:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  802032:	72 e1                	jb     802015 <memfind+0x24>
  802034:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802038:	c9                   	leaveq 
  802039:	c3                   	retq   

000000000080203a <strtol>:
  80203a:	55                   	push   %rbp
  80203b:	48 89 e5             	mov    %rsp,%rbp
  80203e:	48 83 ec 34          	sub    $0x34,%rsp
  802042:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802046:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80204a:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80204d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802054:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  80205b:	00 
  80205c:	eb 05                	jmp    802063 <strtol+0x29>
  80205e:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  802063:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802067:	0f b6 00             	movzbl (%rax),%eax
  80206a:	3c 20                	cmp    $0x20,%al
  80206c:	74 f0                	je     80205e <strtol+0x24>
  80206e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802072:	0f b6 00             	movzbl (%rax),%eax
  802075:	3c 09                	cmp    $0x9,%al
  802077:	74 e5                	je     80205e <strtol+0x24>
  802079:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80207d:	0f b6 00             	movzbl (%rax),%eax
  802080:	3c 2b                	cmp    $0x2b,%al
  802082:	75 07                	jne    80208b <strtol+0x51>
  802084:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  802089:	eb 17                	jmp    8020a2 <strtol+0x68>
  80208b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80208f:	0f b6 00             	movzbl (%rax),%eax
  802092:	3c 2d                	cmp    $0x2d,%al
  802094:	75 0c                	jne    8020a2 <strtol+0x68>
  802096:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80209b:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8020a2:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8020a6:	74 06                	je     8020ae <strtol+0x74>
  8020a8:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8020ac:	75 28                	jne    8020d6 <strtol+0x9c>
  8020ae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020b2:	0f b6 00             	movzbl (%rax),%eax
  8020b5:	3c 30                	cmp    $0x30,%al
  8020b7:	75 1d                	jne    8020d6 <strtol+0x9c>
  8020b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020bd:	48 83 c0 01          	add    $0x1,%rax
  8020c1:	0f b6 00             	movzbl (%rax),%eax
  8020c4:	3c 78                	cmp    $0x78,%al
  8020c6:	75 0e                	jne    8020d6 <strtol+0x9c>
  8020c8:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8020cd:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8020d4:	eb 2c                	jmp    802102 <strtol+0xc8>
  8020d6:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8020da:	75 19                	jne    8020f5 <strtol+0xbb>
  8020dc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020e0:	0f b6 00             	movzbl (%rax),%eax
  8020e3:	3c 30                	cmp    $0x30,%al
  8020e5:	75 0e                	jne    8020f5 <strtol+0xbb>
  8020e7:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8020ec:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  8020f3:	eb 0d                	jmp    802102 <strtol+0xc8>
  8020f5:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8020f9:	75 07                	jne    802102 <strtol+0xc8>
  8020fb:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  802102:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802106:	0f b6 00             	movzbl (%rax),%eax
  802109:	3c 2f                	cmp    $0x2f,%al
  80210b:	7e 1d                	jle    80212a <strtol+0xf0>
  80210d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802111:	0f b6 00             	movzbl (%rax),%eax
  802114:	3c 39                	cmp    $0x39,%al
  802116:	7f 12                	jg     80212a <strtol+0xf0>
  802118:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80211c:	0f b6 00             	movzbl (%rax),%eax
  80211f:	0f be c0             	movsbl %al,%eax
  802122:	83 e8 30             	sub    $0x30,%eax
  802125:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802128:	eb 4e                	jmp    802178 <strtol+0x13e>
  80212a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80212e:	0f b6 00             	movzbl (%rax),%eax
  802131:	3c 60                	cmp    $0x60,%al
  802133:	7e 1d                	jle    802152 <strtol+0x118>
  802135:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802139:	0f b6 00             	movzbl (%rax),%eax
  80213c:	3c 7a                	cmp    $0x7a,%al
  80213e:	7f 12                	jg     802152 <strtol+0x118>
  802140:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802144:	0f b6 00             	movzbl (%rax),%eax
  802147:	0f be c0             	movsbl %al,%eax
  80214a:	83 e8 57             	sub    $0x57,%eax
  80214d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802150:	eb 26                	jmp    802178 <strtol+0x13e>
  802152:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802156:	0f b6 00             	movzbl (%rax),%eax
  802159:	3c 40                	cmp    $0x40,%al
  80215b:	7e 48                	jle    8021a5 <strtol+0x16b>
  80215d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802161:	0f b6 00             	movzbl (%rax),%eax
  802164:	3c 5a                	cmp    $0x5a,%al
  802166:	7f 3d                	jg     8021a5 <strtol+0x16b>
  802168:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80216c:	0f b6 00             	movzbl (%rax),%eax
  80216f:	0f be c0             	movsbl %al,%eax
  802172:	83 e8 37             	sub    $0x37,%eax
  802175:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802178:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80217b:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  80217e:	7c 02                	jl     802182 <strtol+0x148>
  802180:	eb 23                	jmp    8021a5 <strtol+0x16b>
  802182:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  802187:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80218a:	48 98                	cltq   
  80218c:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  802191:	48 89 c2             	mov    %rax,%rdx
  802194:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802197:	48 98                	cltq   
  802199:	48 01 d0             	add    %rdx,%rax
  80219c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8021a0:	e9 5d ff ff ff       	jmpq   802102 <strtol+0xc8>
  8021a5:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8021aa:	74 0b                	je     8021b7 <strtol+0x17d>
  8021ac:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8021b0:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8021b4:	48 89 10             	mov    %rdx,(%rax)
  8021b7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8021bb:	74 09                	je     8021c6 <strtol+0x18c>
  8021bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8021c1:	48 f7 d8             	neg    %rax
  8021c4:	eb 04                	jmp    8021ca <strtol+0x190>
  8021c6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8021ca:	c9                   	leaveq 
  8021cb:	c3                   	retq   

00000000008021cc <strstr>:
  8021cc:	55                   	push   %rbp
  8021cd:	48 89 e5             	mov    %rsp,%rbp
  8021d0:	48 83 ec 30          	sub    $0x30,%rsp
  8021d4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8021d8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8021dc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8021e0:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8021e4:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8021e8:	0f b6 00             	movzbl (%rax),%eax
  8021eb:	88 45 ff             	mov    %al,-0x1(%rbp)
  8021ee:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  8021f2:	75 06                	jne    8021fa <strstr+0x2e>
  8021f4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8021f8:	eb 6b                	jmp    802265 <strstr+0x99>
  8021fa:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8021fe:	48 89 c7             	mov    %rax,%rdi
  802201:	48 b8 a2 1a 80 00 00 	movabs $0x801aa2,%rax
  802208:	00 00 00 
  80220b:	ff d0                	callq  *%rax
  80220d:	48 98                	cltq   
  80220f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802213:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802217:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80221b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80221f:	0f b6 00             	movzbl (%rax),%eax
  802222:	88 45 ef             	mov    %al,-0x11(%rbp)
  802225:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  802229:	75 07                	jne    802232 <strstr+0x66>
  80222b:	b8 00 00 00 00       	mov    $0x0,%eax
  802230:	eb 33                	jmp    802265 <strstr+0x99>
  802232:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  802236:	3a 45 ff             	cmp    -0x1(%rbp),%al
  802239:	75 d8                	jne    802213 <strstr+0x47>
  80223b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80223f:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802243:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802247:	48 89 ce             	mov    %rcx,%rsi
  80224a:	48 89 c7             	mov    %rax,%rdi
  80224d:	48 b8 c3 1c 80 00 00 	movabs $0x801cc3,%rax
  802254:	00 00 00 
  802257:	ff d0                	callq  *%rax
  802259:	85 c0                	test   %eax,%eax
  80225b:	75 b6                	jne    802213 <strstr+0x47>
  80225d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802261:	48 83 e8 01          	sub    $0x1,%rax
  802265:	c9                   	leaveq 
  802266:	c3                   	retq   

0000000000802267 <syscall>:
  802267:	55                   	push   %rbp
  802268:	48 89 e5             	mov    %rsp,%rbp
  80226b:	53                   	push   %rbx
  80226c:	48 83 ec 48          	sub    $0x48,%rsp
  802270:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802273:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802276:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80227a:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80227e:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  802282:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  802286:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802289:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80228d:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  802291:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  802295:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  802299:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80229d:	4c 89 c3             	mov    %r8,%rbx
  8022a0:	cd 30                	int    $0x30
  8022a2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8022a6:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8022aa:	74 3e                	je     8022ea <syscall+0x83>
  8022ac:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8022b1:	7e 37                	jle    8022ea <syscall+0x83>
  8022b3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8022b7:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8022ba:	49 89 d0             	mov    %rdx,%r8
  8022bd:	89 c1                	mov    %eax,%ecx
  8022bf:	48 ba 08 56 80 00 00 	movabs $0x805608,%rdx
  8022c6:	00 00 00 
  8022c9:	be 24 00 00 00       	mov    $0x24,%esi
  8022ce:	48 bf 25 56 80 00 00 	movabs $0x805625,%rdi
  8022d5:	00 00 00 
  8022d8:	b8 00 00 00 00       	mov    $0x0,%eax
  8022dd:	49 b9 20 0d 80 00 00 	movabs $0x800d20,%r9
  8022e4:	00 00 00 
  8022e7:	41 ff d1             	callq  *%r9
  8022ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022ee:	48 83 c4 48          	add    $0x48,%rsp
  8022f2:	5b                   	pop    %rbx
  8022f3:	5d                   	pop    %rbp
  8022f4:	c3                   	retq   

00000000008022f5 <sys_cputs>:
  8022f5:	55                   	push   %rbp
  8022f6:	48 89 e5             	mov    %rsp,%rbp
  8022f9:	48 83 ec 20          	sub    $0x20,%rsp
  8022fd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802301:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802305:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802309:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80230d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802314:	00 
  802315:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80231b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802321:	48 89 d1             	mov    %rdx,%rcx
  802324:	48 89 c2             	mov    %rax,%rdx
  802327:	be 00 00 00 00       	mov    $0x0,%esi
  80232c:	bf 00 00 00 00       	mov    $0x0,%edi
  802331:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  802338:	00 00 00 
  80233b:	ff d0                	callq  *%rax
  80233d:	c9                   	leaveq 
  80233e:	c3                   	retq   

000000000080233f <sys_cgetc>:
  80233f:	55                   	push   %rbp
  802340:	48 89 e5             	mov    %rsp,%rbp
  802343:	48 83 ec 10          	sub    $0x10,%rsp
  802347:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80234e:	00 
  80234f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802355:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80235b:	b9 00 00 00 00       	mov    $0x0,%ecx
  802360:	ba 00 00 00 00       	mov    $0x0,%edx
  802365:	be 00 00 00 00       	mov    $0x0,%esi
  80236a:	bf 01 00 00 00       	mov    $0x1,%edi
  80236f:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  802376:	00 00 00 
  802379:	ff d0                	callq  *%rax
  80237b:	c9                   	leaveq 
  80237c:	c3                   	retq   

000000000080237d <sys_env_destroy>:
  80237d:	55                   	push   %rbp
  80237e:	48 89 e5             	mov    %rsp,%rbp
  802381:	48 83 ec 10          	sub    $0x10,%rsp
  802385:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802388:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80238b:	48 98                	cltq   
  80238d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802394:	00 
  802395:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80239b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8023a1:	b9 00 00 00 00       	mov    $0x0,%ecx
  8023a6:	48 89 c2             	mov    %rax,%rdx
  8023a9:	be 01 00 00 00       	mov    $0x1,%esi
  8023ae:	bf 03 00 00 00       	mov    $0x3,%edi
  8023b3:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  8023ba:	00 00 00 
  8023bd:	ff d0                	callq  *%rax
  8023bf:	c9                   	leaveq 
  8023c0:	c3                   	retq   

00000000008023c1 <sys_getenvid>:
  8023c1:	55                   	push   %rbp
  8023c2:	48 89 e5             	mov    %rsp,%rbp
  8023c5:	48 83 ec 10          	sub    $0x10,%rsp
  8023c9:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8023d0:	00 
  8023d1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8023d7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8023dd:	b9 00 00 00 00       	mov    $0x0,%ecx
  8023e2:	ba 00 00 00 00       	mov    $0x0,%edx
  8023e7:	be 00 00 00 00       	mov    $0x0,%esi
  8023ec:	bf 02 00 00 00       	mov    $0x2,%edi
  8023f1:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  8023f8:	00 00 00 
  8023fb:	ff d0                	callq  *%rax
  8023fd:	c9                   	leaveq 
  8023fe:	c3                   	retq   

00000000008023ff <sys_yield>:
  8023ff:	55                   	push   %rbp
  802400:	48 89 e5             	mov    %rsp,%rbp
  802403:	48 83 ec 10          	sub    $0x10,%rsp
  802407:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80240e:	00 
  80240f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802415:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80241b:	b9 00 00 00 00       	mov    $0x0,%ecx
  802420:	ba 00 00 00 00       	mov    $0x0,%edx
  802425:	be 00 00 00 00       	mov    $0x0,%esi
  80242a:	bf 0b 00 00 00       	mov    $0xb,%edi
  80242f:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  802436:	00 00 00 
  802439:	ff d0                	callq  *%rax
  80243b:	c9                   	leaveq 
  80243c:	c3                   	retq   

000000000080243d <sys_page_alloc>:
  80243d:	55                   	push   %rbp
  80243e:	48 89 e5             	mov    %rsp,%rbp
  802441:	48 83 ec 20          	sub    $0x20,%rsp
  802445:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802448:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80244c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80244f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802452:	48 63 c8             	movslq %eax,%rcx
  802455:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802459:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80245c:	48 98                	cltq   
  80245e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802465:	00 
  802466:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80246c:	49 89 c8             	mov    %rcx,%r8
  80246f:	48 89 d1             	mov    %rdx,%rcx
  802472:	48 89 c2             	mov    %rax,%rdx
  802475:	be 01 00 00 00       	mov    $0x1,%esi
  80247a:	bf 04 00 00 00       	mov    $0x4,%edi
  80247f:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  802486:	00 00 00 
  802489:	ff d0                	callq  *%rax
  80248b:	c9                   	leaveq 
  80248c:	c3                   	retq   

000000000080248d <sys_page_map>:
  80248d:	55                   	push   %rbp
  80248e:	48 89 e5             	mov    %rsp,%rbp
  802491:	48 83 ec 30          	sub    $0x30,%rsp
  802495:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802498:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80249c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80249f:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  8024a3:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  8024a7:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8024aa:	48 63 c8             	movslq %eax,%rcx
  8024ad:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  8024b1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8024b4:	48 63 f0             	movslq %eax,%rsi
  8024b7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8024bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024be:	48 98                	cltq   
  8024c0:	48 89 0c 24          	mov    %rcx,(%rsp)
  8024c4:	49 89 f9             	mov    %rdi,%r9
  8024c7:	49 89 f0             	mov    %rsi,%r8
  8024ca:	48 89 d1             	mov    %rdx,%rcx
  8024cd:	48 89 c2             	mov    %rax,%rdx
  8024d0:	be 01 00 00 00       	mov    $0x1,%esi
  8024d5:	bf 05 00 00 00       	mov    $0x5,%edi
  8024da:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  8024e1:	00 00 00 
  8024e4:	ff d0                	callq  *%rax
  8024e6:	c9                   	leaveq 
  8024e7:	c3                   	retq   

00000000008024e8 <sys_page_unmap>:
  8024e8:	55                   	push   %rbp
  8024e9:	48 89 e5             	mov    %rsp,%rbp
  8024ec:	48 83 ec 20          	sub    $0x20,%rsp
  8024f0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8024f3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8024f7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8024fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024fe:	48 98                	cltq   
  802500:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802507:	00 
  802508:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80250e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802514:	48 89 d1             	mov    %rdx,%rcx
  802517:	48 89 c2             	mov    %rax,%rdx
  80251a:	be 01 00 00 00       	mov    $0x1,%esi
  80251f:	bf 06 00 00 00       	mov    $0x6,%edi
  802524:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  80252b:	00 00 00 
  80252e:	ff d0                	callq  *%rax
  802530:	c9                   	leaveq 
  802531:	c3                   	retq   

0000000000802532 <sys_env_set_status>:
  802532:	55                   	push   %rbp
  802533:	48 89 e5             	mov    %rsp,%rbp
  802536:	48 83 ec 10          	sub    $0x10,%rsp
  80253a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80253d:	89 75 f8             	mov    %esi,-0x8(%rbp)
  802540:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802543:	48 63 d0             	movslq %eax,%rdx
  802546:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802549:	48 98                	cltq   
  80254b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802552:	00 
  802553:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802559:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80255f:	48 89 d1             	mov    %rdx,%rcx
  802562:	48 89 c2             	mov    %rax,%rdx
  802565:	be 01 00 00 00       	mov    $0x1,%esi
  80256a:	bf 08 00 00 00       	mov    $0x8,%edi
  80256f:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  802576:	00 00 00 
  802579:	ff d0                	callq  *%rax
  80257b:	c9                   	leaveq 
  80257c:	c3                   	retq   

000000000080257d <sys_env_set_trapframe>:
  80257d:	55                   	push   %rbp
  80257e:	48 89 e5             	mov    %rsp,%rbp
  802581:	48 83 ec 20          	sub    $0x20,%rsp
  802585:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802588:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80258c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802590:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802593:	48 98                	cltq   
  802595:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80259c:	00 
  80259d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8025a3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8025a9:	48 89 d1             	mov    %rdx,%rcx
  8025ac:	48 89 c2             	mov    %rax,%rdx
  8025af:	be 01 00 00 00       	mov    $0x1,%esi
  8025b4:	bf 09 00 00 00       	mov    $0x9,%edi
  8025b9:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  8025c0:	00 00 00 
  8025c3:	ff d0                	callq  *%rax
  8025c5:	c9                   	leaveq 
  8025c6:	c3                   	retq   

00000000008025c7 <sys_env_set_pgfault_upcall>:
  8025c7:	55                   	push   %rbp
  8025c8:	48 89 e5             	mov    %rsp,%rbp
  8025cb:	48 83 ec 20          	sub    $0x20,%rsp
  8025cf:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8025d2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8025d6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8025da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025dd:	48 98                	cltq   
  8025df:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8025e6:	00 
  8025e7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8025ed:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8025f3:	48 89 d1             	mov    %rdx,%rcx
  8025f6:	48 89 c2             	mov    %rax,%rdx
  8025f9:	be 01 00 00 00       	mov    $0x1,%esi
  8025fe:	bf 0a 00 00 00       	mov    $0xa,%edi
  802603:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  80260a:	00 00 00 
  80260d:	ff d0                	callq  *%rax
  80260f:	c9                   	leaveq 
  802610:	c3                   	retq   

0000000000802611 <sys_ipc_try_send>:
  802611:	55                   	push   %rbp
  802612:	48 89 e5             	mov    %rsp,%rbp
  802615:	48 83 ec 20          	sub    $0x20,%rsp
  802619:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80261c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802620:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  802624:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  802627:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80262a:	48 63 f0             	movslq %eax,%rsi
  80262d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802631:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802634:	48 98                	cltq   
  802636:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80263a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802641:	00 
  802642:	49 89 f1             	mov    %rsi,%r9
  802645:	49 89 c8             	mov    %rcx,%r8
  802648:	48 89 d1             	mov    %rdx,%rcx
  80264b:	48 89 c2             	mov    %rax,%rdx
  80264e:	be 00 00 00 00       	mov    $0x0,%esi
  802653:	bf 0c 00 00 00       	mov    $0xc,%edi
  802658:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  80265f:	00 00 00 
  802662:	ff d0                	callq  *%rax
  802664:	c9                   	leaveq 
  802665:	c3                   	retq   

0000000000802666 <sys_ipc_recv>:
  802666:	55                   	push   %rbp
  802667:	48 89 e5             	mov    %rsp,%rbp
  80266a:	48 83 ec 10          	sub    $0x10,%rsp
  80266e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802672:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802676:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80267d:	00 
  80267e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802684:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80268a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80268f:	48 89 c2             	mov    %rax,%rdx
  802692:	be 01 00 00 00       	mov    $0x1,%esi
  802697:	bf 0d 00 00 00       	mov    $0xd,%edi
  80269c:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  8026a3:	00 00 00 
  8026a6:	ff d0                	callq  *%rax
  8026a8:	c9                   	leaveq 
  8026a9:	c3                   	retq   

00000000008026aa <sys_time_msec>:
  8026aa:	55                   	push   %rbp
  8026ab:	48 89 e5             	mov    %rsp,%rbp
  8026ae:	48 83 ec 10          	sub    $0x10,%rsp
  8026b2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8026b9:	00 
  8026ba:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8026c0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8026c6:	b9 00 00 00 00       	mov    $0x0,%ecx
  8026cb:	ba 00 00 00 00       	mov    $0x0,%edx
  8026d0:	be 00 00 00 00       	mov    $0x0,%esi
  8026d5:	bf 0e 00 00 00       	mov    $0xe,%edi
  8026da:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  8026e1:	00 00 00 
  8026e4:	ff d0                	callq  *%rax
  8026e6:	c9                   	leaveq 
  8026e7:	c3                   	retq   

00000000008026e8 <sys_net_transmit>:
  8026e8:	55                   	push   %rbp
  8026e9:	48 89 e5             	mov    %rsp,%rbp
  8026ec:	48 83 ec 20          	sub    $0x20,%rsp
  8026f0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8026f4:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8026f7:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8026fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8026fe:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802705:	00 
  802706:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80270c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802712:	48 89 d1             	mov    %rdx,%rcx
  802715:	48 89 c2             	mov    %rax,%rdx
  802718:	be 00 00 00 00       	mov    $0x0,%esi
  80271d:	bf 0f 00 00 00       	mov    $0xf,%edi
  802722:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  802729:	00 00 00 
  80272c:	ff d0                	callq  *%rax
  80272e:	c9                   	leaveq 
  80272f:	c3                   	retq   

0000000000802730 <sys_net_receive>:
  802730:	55                   	push   %rbp
  802731:	48 89 e5             	mov    %rsp,%rbp
  802734:	48 83 ec 20          	sub    $0x20,%rsp
  802738:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80273c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80273f:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802742:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802746:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80274d:	00 
  80274e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802754:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80275a:	48 89 d1             	mov    %rdx,%rcx
  80275d:	48 89 c2             	mov    %rax,%rdx
  802760:	be 00 00 00 00       	mov    $0x0,%esi
  802765:	bf 10 00 00 00       	mov    $0x10,%edi
  80276a:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  802771:	00 00 00 
  802774:	ff d0                	callq  *%rax
  802776:	c9                   	leaveq 
  802777:	c3                   	retq   

0000000000802778 <sys_ept_map>:
  802778:	55                   	push   %rbp
  802779:	48 89 e5             	mov    %rsp,%rbp
  80277c:	48 83 ec 30          	sub    $0x30,%rsp
  802780:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802783:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802787:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80278a:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  80278e:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802792:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802795:	48 63 c8             	movslq %eax,%rcx
  802798:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  80279c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80279f:	48 63 f0             	movslq %eax,%rsi
  8027a2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8027a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027a9:	48 98                	cltq   
  8027ab:	48 89 0c 24          	mov    %rcx,(%rsp)
  8027af:	49 89 f9             	mov    %rdi,%r9
  8027b2:	49 89 f0             	mov    %rsi,%r8
  8027b5:	48 89 d1             	mov    %rdx,%rcx
  8027b8:	48 89 c2             	mov    %rax,%rdx
  8027bb:	be 00 00 00 00       	mov    $0x0,%esi
  8027c0:	bf 11 00 00 00       	mov    $0x11,%edi
  8027c5:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  8027cc:	00 00 00 
  8027cf:	ff d0                	callq  *%rax
  8027d1:	c9                   	leaveq 
  8027d2:	c3                   	retq   

00000000008027d3 <sys_env_mkguest>:
  8027d3:	55                   	push   %rbp
  8027d4:	48 89 e5             	mov    %rsp,%rbp
  8027d7:	48 83 ec 20          	sub    $0x20,%rsp
  8027db:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8027df:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8027e3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8027e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8027eb:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8027f2:	00 
  8027f3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8027f9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8027ff:	48 89 d1             	mov    %rdx,%rcx
  802802:	48 89 c2             	mov    %rax,%rdx
  802805:	be 00 00 00 00       	mov    $0x0,%esi
  80280a:	bf 12 00 00 00       	mov    $0x12,%edi
  80280f:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  802816:	00 00 00 
  802819:	ff d0                	callq  *%rax
  80281b:	c9                   	leaveq 
  80281c:	c3                   	retq   

000000000080281d <ipc_recv>:
  80281d:	55                   	push   %rbp
  80281e:	48 89 e5             	mov    %rsp,%rbp
  802821:	48 83 ec 30          	sub    $0x30,%rsp
  802825:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802829:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80282d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802831:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802836:	75 0e                	jne    802846 <ipc_recv+0x29>
  802838:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80283f:	00 00 00 
  802842:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802846:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80284a:	48 89 c7             	mov    %rax,%rdi
  80284d:	48 b8 66 26 80 00 00 	movabs $0x802666,%rax
  802854:	00 00 00 
  802857:	ff d0                	callq  *%rax
  802859:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80285c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802860:	79 27                	jns    802889 <ipc_recv+0x6c>
  802862:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802867:	74 0a                	je     802873 <ipc_recv+0x56>
  802869:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80286d:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  802873:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802878:	74 0a                	je     802884 <ipc_recv+0x67>
  80287a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80287e:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  802884:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802887:	eb 53                	jmp    8028dc <ipc_recv+0xbf>
  802889:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80288e:	74 19                	je     8028a9 <ipc_recv+0x8c>
  802890:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802897:	00 00 00 
  80289a:	48 8b 00             	mov    (%rax),%rax
  80289d:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8028a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028a7:	89 10                	mov    %edx,(%rax)
  8028a9:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8028ae:	74 19                	je     8028c9 <ipc_recv+0xac>
  8028b0:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8028b7:	00 00 00 
  8028ba:	48 8b 00             	mov    (%rax),%rax
  8028bd:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8028c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028c7:	89 10                	mov    %edx,(%rax)
  8028c9:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8028d0:	00 00 00 
  8028d3:	48 8b 00             	mov    (%rax),%rax
  8028d6:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  8028dc:	c9                   	leaveq 
  8028dd:	c3                   	retq   

00000000008028de <ipc_send>:
  8028de:	55                   	push   %rbp
  8028df:	48 89 e5             	mov    %rsp,%rbp
  8028e2:	48 83 ec 30          	sub    $0x30,%rsp
  8028e6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8028e9:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8028ec:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  8028f0:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8028f3:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8028f8:	75 10                	jne    80290a <ipc_send+0x2c>
  8028fa:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802901:	00 00 00 
  802904:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802908:	eb 0e                	jmp    802918 <ipc_send+0x3a>
  80290a:	eb 0c                	jmp    802918 <ipc_send+0x3a>
  80290c:	48 b8 ff 23 80 00 00 	movabs $0x8023ff,%rax
  802913:	00 00 00 
  802916:	ff d0                	callq  *%rax
  802918:	8b 75 e8             	mov    -0x18(%rbp),%esi
  80291b:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  80291e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802922:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802925:	89 c7                	mov    %eax,%edi
  802927:	48 b8 11 26 80 00 00 	movabs $0x802611,%rax
  80292e:	00 00 00 
  802931:	ff d0                	callq  *%rax
  802933:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802936:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  80293a:	74 d0                	je     80290c <ipc_send+0x2e>
  80293c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802940:	79 30                	jns    802972 <ipc_send+0x94>
  802942:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802945:	89 c1                	mov    %eax,%ecx
  802947:	48 ba 36 56 80 00 00 	movabs $0x805636,%rdx
  80294e:	00 00 00 
  802951:	be 44 00 00 00       	mov    $0x44,%esi
  802956:	48 bf 4c 56 80 00 00 	movabs $0x80564c,%rdi
  80295d:	00 00 00 
  802960:	b8 00 00 00 00       	mov    $0x0,%eax
  802965:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  80296c:	00 00 00 
  80296f:	41 ff d0             	callq  *%r8
  802972:	c9                   	leaveq 
  802973:	c3                   	retq   

0000000000802974 <ipc_host_recv>:
  802974:	55                   	push   %rbp
  802975:	48 89 e5             	mov    %rsp,%rbp
  802978:	53                   	push   %rbx
  802979:	48 83 ec 28          	sub    $0x28,%rsp
  80297d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802981:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  802988:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
  80298f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802994:	75 0e                	jne    8029a4 <ipc_host_recv+0x30>
  802996:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80299d:	00 00 00 
  8029a0:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8029a4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8029a8:	ba 07 00 00 00       	mov    $0x7,%edx
  8029ad:	48 89 c6             	mov    %rax,%rsi
  8029b0:	bf 00 00 00 00       	mov    $0x0,%edi
  8029b5:	48 b8 3d 24 80 00 00 	movabs $0x80243d,%rax
  8029bc:	00 00 00 
  8029bf:	ff d0                	callq  *%rax
  8029c1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8029c5:	48 c1 e8 0c          	shr    $0xc,%rax
  8029c9:	48 89 c2             	mov    %rax,%rdx
  8029cc:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8029d3:	01 00 00 
  8029d6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8029da:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  8029e0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8029e4:	b8 03 00 00 00       	mov    $0x3,%eax
  8029e9:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8029ed:	48 89 d3             	mov    %rdx,%rbx
  8029f0:	0f 01 c1             	vmcall 
  8029f3:	89 f2                	mov    %esi,%edx
  8029f5:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8029f8:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8029fb:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8029ff:	79 05                	jns    802a06 <ipc_host_recv+0x92>
  802a01:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a04:	eb 03                	jmp    802a09 <ipc_host_recv+0x95>
  802a06:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802a09:	48 83 c4 28          	add    $0x28,%rsp
  802a0d:	5b                   	pop    %rbx
  802a0e:	5d                   	pop    %rbp
  802a0f:	c3                   	retq   

0000000000802a10 <ipc_host_send>:
  802a10:	55                   	push   %rbp
  802a11:	48 89 e5             	mov    %rsp,%rbp
  802a14:	53                   	push   %rbx
  802a15:	48 83 ec 38          	sub    $0x38,%rsp
  802a19:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802a1c:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802a1f:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  802a23:	89 4d cc             	mov    %ecx,-0x34(%rbp)
  802a26:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  802a2d:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  802a32:	75 0e                	jne    802a42 <ipc_host_send+0x32>
  802a34:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802a3b:	00 00 00 
  802a3e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  802a42:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802a46:	48 c1 e8 0c          	shr    $0xc,%rax
  802a4a:	48 89 c2             	mov    %rax,%rdx
  802a4d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802a54:	01 00 00 
  802a57:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a5b:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802a61:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802a65:	b8 02 00 00 00       	mov    $0x2,%eax
  802a6a:	8b 7d dc             	mov    -0x24(%rbp),%edi
  802a6d:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802a70:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802a74:	8b 75 cc             	mov    -0x34(%rbp),%esi
  802a77:	89 fb                	mov    %edi,%ebx
  802a79:	0f 01 c1             	vmcall 
  802a7c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802a7f:	eb 26                	jmp    802aa7 <ipc_host_send+0x97>
  802a81:	48 b8 ff 23 80 00 00 	movabs $0x8023ff,%rax
  802a88:	00 00 00 
  802a8b:	ff d0                	callq  *%rax
  802a8d:	b8 02 00 00 00       	mov    $0x2,%eax
  802a92:	8b 7d dc             	mov    -0x24(%rbp),%edi
  802a95:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802a98:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802a9c:	8b 75 cc             	mov    -0x34(%rbp),%esi
  802a9f:	89 fb                	mov    %edi,%ebx
  802aa1:	0f 01 c1             	vmcall 
  802aa4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802aa7:	83 7d ec f8          	cmpl   $0xfffffff8,-0x14(%rbp)
  802aab:	74 d4                	je     802a81 <ipc_host_send+0x71>
  802aad:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802ab1:	79 55                	jns    802b08 <ipc_host_send+0xf8>
  802ab3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ab6:	89 c2                	mov    %eax,%edx
  802ab8:	be 81 00 00 00       	mov    $0x81,%esi
  802abd:	48 bf 59 56 80 00 00 	movabs $0x805659,%rdi
  802ac4:	00 00 00 
  802ac7:	b8 00 00 00 00       	mov    $0x0,%eax
  802acc:	48 b9 59 0f 80 00 00 	movabs $0x800f59,%rcx
  802ad3:	00 00 00 
  802ad6:	ff d1                	callq  *%rcx
  802ad8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802adb:	89 c1                	mov    %eax,%ecx
  802add:	48 ba 36 56 80 00 00 	movabs $0x805636,%rdx
  802ae4:	00 00 00 
  802ae7:	be 82 00 00 00       	mov    $0x82,%esi
  802aec:	48 bf 4c 56 80 00 00 	movabs $0x80564c,%rdi
  802af3:	00 00 00 
  802af6:	b8 00 00 00 00       	mov    $0x0,%eax
  802afb:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  802b02:	00 00 00 
  802b05:	41 ff d0             	callq  *%r8
  802b08:	48 83 c4 38          	add    $0x38,%rsp
  802b0c:	5b                   	pop    %rbx
  802b0d:	5d                   	pop    %rbp
  802b0e:	c3                   	retq   

0000000000802b0f <ipc_find_env>:
  802b0f:	55                   	push   %rbp
  802b10:	48 89 e5             	mov    %rsp,%rbp
  802b13:	48 83 ec 14          	sub    $0x14,%rsp
  802b17:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802b1a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802b21:	eb 4e                	jmp    802b71 <ipc_find_env+0x62>
  802b23:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802b2a:	00 00 00 
  802b2d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b30:	48 98                	cltq   
  802b32:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802b39:	48 01 d0             	add    %rdx,%rax
  802b3c:	48 05 d0 00 00 00    	add    $0xd0,%rax
  802b42:	8b 00                	mov    (%rax),%eax
  802b44:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802b47:	75 24                	jne    802b6d <ipc_find_env+0x5e>
  802b49:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802b50:	00 00 00 
  802b53:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b56:	48 98                	cltq   
  802b58:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802b5f:	48 01 d0             	add    %rdx,%rax
  802b62:	48 05 c0 00 00 00    	add    $0xc0,%rax
  802b68:	8b 40 08             	mov    0x8(%rax),%eax
  802b6b:	eb 12                	jmp    802b7f <ipc_find_env+0x70>
  802b6d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802b71:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  802b78:	7e a9                	jle    802b23 <ipc_find_env+0x14>
  802b7a:	b8 00 00 00 00       	mov    $0x0,%eax
  802b7f:	c9                   	leaveq 
  802b80:	c3                   	retq   

0000000000802b81 <fd2num>:
  802b81:	55                   	push   %rbp
  802b82:	48 89 e5             	mov    %rsp,%rbp
  802b85:	48 83 ec 08          	sub    $0x8,%rsp
  802b89:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802b8d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802b91:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802b98:	ff ff ff 
  802b9b:	48 01 d0             	add    %rdx,%rax
  802b9e:	48 c1 e8 0c          	shr    $0xc,%rax
  802ba2:	c9                   	leaveq 
  802ba3:	c3                   	retq   

0000000000802ba4 <fd2data>:
  802ba4:	55                   	push   %rbp
  802ba5:	48 89 e5             	mov    %rsp,%rbp
  802ba8:	48 83 ec 08          	sub    $0x8,%rsp
  802bac:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802bb0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802bb4:	48 89 c7             	mov    %rax,%rdi
  802bb7:	48 b8 81 2b 80 00 00 	movabs $0x802b81,%rax
  802bbe:	00 00 00 
  802bc1:	ff d0                	callq  *%rax
  802bc3:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802bc9:	48 c1 e0 0c          	shl    $0xc,%rax
  802bcd:	c9                   	leaveq 
  802bce:	c3                   	retq   

0000000000802bcf <fd_alloc>:
  802bcf:	55                   	push   %rbp
  802bd0:	48 89 e5             	mov    %rsp,%rbp
  802bd3:	48 83 ec 18          	sub    $0x18,%rsp
  802bd7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802bdb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802be2:	eb 6b                	jmp    802c4f <fd_alloc+0x80>
  802be4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802be7:	48 98                	cltq   
  802be9:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802bef:	48 c1 e0 0c          	shl    $0xc,%rax
  802bf3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802bf7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bfb:	48 c1 e8 15          	shr    $0x15,%rax
  802bff:	48 89 c2             	mov    %rax,%rdx
  802c02:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802c09:	01 00 00 
  802c0c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c10:	83 e0 01             	and    $0x1,%eax
  802c13:	48 85 c0             	test   %rax,%rax
  802c16:	74 21                	je     802c39 <fd_alloc+0x6a>
  802c18:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c1c:	48 c1 e8 0c          	shr    $0xc,%rax
  802c20:	48 89 c2             	mov    %rax,%rdx
  802c23:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802c2a:	01 00 00 
  802c2d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c31:	83 e0 01             	and    $0x1,%eax
  802c34:	48 85 c0             	test   %rax,%rax
  802c37:	75 12                	jne    802c4b <fd_alloc+0x7c>
  802c39:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c3d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802c41:	48 89 10             	mov    %rdx,(%rax)
  802c44:	b8 00 00 00 00       	mov    $0x0,%eax
  802c49:	eb 1a                	jmp    802c65 <fd_alloc+0x96>
  802c4b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802c4f:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802c53:	7e 8f                	jle    802be4 <fd_alloc+0x15>
  802c55:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c59:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802c60:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  802c65:	c9                   	leaveq 
  802c66:	c3                   	retq   

0000000000802c67 <fd_lookup>:
  802c67:	55                   	push   %rbp
  802c68:	48 89 e5             	mov    %rsp,%rbp
  802c6b:	48 83 ec 20          	sub    $0x20,%rsp
  802c6f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802c72:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802c76:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802c7a:	78 06                	js     802c82 <fd_lookup+0x1b>
  802c7c:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802c80:	7e 07                	jle    802c89 <fd_lookup+0x22>
  802c82:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802c87:	eb 6c                	jmp    802cf5 <fd_lookup+0x8e>
  802c89:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802c8c:	48 98                	cltq   
  802c8e:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802c94:	48 c1 e0 0c          	shl    $0xc,%rax
  802c98:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802c9c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ca0:	48 c1 e8 15          	shr    $0x15,%rax
  802ca4:	48 89 c2             	mov    %rax,%rdx
  802ca7:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802cae:	01 00 00 
  802cb1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802cb5:	83 e0 01             	and    $0x1,%eax
  802cb8:	48 85 c0             	test   %rax,%rax
  802cbb:	74 21                	je     802cde <fd_lookup+0x77>
  802cbd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802cc1:	48 c1 e8 0c          	shr    $0xc,%rax
  802cc5:	48 89 c2             	mov    %rax,%rdx
  802cc8:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802ccf:	01 00 00 
  802cd2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802cd6:	83 e0 01             	and    $0x1,%eax
  802cd9:	48 85 c0             	test   %rax,%rax
  802cdc:	75 07                	jne    802ce5 <fd_lookup+0x7e>
  802cde:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802ce3:	eb 10                	jmp    802cf5 <fd_lookup+0x8e>
  802ce5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ce9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802ced:	48 89 10             	mov    %rdx,(%rax)
  802cf0:	b8 00 00 00 00       	mov    $0x0,%eax
  802cf5:	c9                   	leaveq 
  802cf6:	c3                   	retq   

0000000000802cf7 <fd_close>:
  802cf7:	55                   	push   %rbp
  802cf8:	48 89 e5             	mov    %rsp,%rbp
  802cfb:	48 83 ec 30          	sub    $0x30,%rsp
  802cff:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802d03:	89 f0                	mov    %esi,%eax
  802d05:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802d08:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802d0c:	48 89 c7             	mov    %rax,%rdi
  802d0f:	48 b8 81 2b 80 00 00 	movabs $0x802b81,%rax
  802d16:	00 00 00 
  802d19:	ff d0                	callq  *%rax
  802d1b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d1f:	48 89 d6             	mov    %rdx,%rsi
  802d22:	89 c7                	mov    %eax,%edi
  802d24:	48 b8 67 2c 80 00 00 	movabs $0x802c67,%rax
  802d2b:	00 00 00 
  802d2e:	ff d0                	callq  *%rax
  802d30:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d33:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d37:	78 0a                	js     802d43 <fd_close+0x4c>
  802d39:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d3d:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802d41:	74 12                	je     802d55 <fd_close+0x5e>
  802d43:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802d47:	74 05                	je     802d4e <fd_close+0x57>
  802d49:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d4c:	eb 05                	jmp    802d53 <fd_close+0x5c>
  802d4e:	b8 00 00 00 00       	mov    $0x0,%eax
  802d53:	eb 69                	jmp    802dbe <fd_close+0xc7>
  802d55:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802d59:	8b 00                	mov    (%rax),%eax
  802d5b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802d5f:	48 89 d6             	mov    %rdx,%rsi
  802d62:	89 c7                	mov    %eax,%edi
  802d64:	48 b8 c0 2d 80 00 00 	movabs $0x802dc0,%rax
  802d6b:	00 00 00 
  802d6e:	ff d0                	callq  *%rax
  802d70:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d73:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d77:	78 2a                	js     802da3 <fd_close+0xac>
  802d79:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d7d:	48 8b 40 20          	mov    0x20(%rax),%rax
  802d81:	48 85 c0             	test   %rax,%rax
  802d84:	74 16                	je     802d9c <fd_close+0xa5>
  802d86:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d8a:	48 8b 40 20          	mov    0x20(%rax),%rax
  802d8e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802d92:	48 89 d7             	mov    %rdx,%rdi
  802d95:	ff d0                	callq  *%rax
  802d97:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d9a:	eb 07                	jmp    802da3 <fd_close+0xac>
  802d9c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802da3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802da7:	48 89 c6             	mov    %rax,%rsi
  802daa:	bf 00 00 00 00       	mov    $0x0,%edi
  802daf:	48 b8 e8 24 80 00 00 	movabs $0x8024e8,%rax
  802db6:	00 00 00 
  802db9:	ff d0                	callq  *%rax
  802dbb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dbe:	c9                   	leaveq 
  802dbf:	c3                   	retq   

0000000000802dc0 <dev_lookup>:
  802dc0:	55                   	push   %rbp
  802dc1:	48 89 e5             	mov    %rsp,%rbp
  802dc4:	48 83 ec 20          	sub    $0x20,%rsp
  802dc8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802dcb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802dcf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802dd6:	eb 41                	jmp    802e19 <dev_lookup+0x59>
  802dd8:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802ddf:	00 00 00 
  802de2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802de5:	48 63 d2             	movslq %edx,%rdx
  802de8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802dec:	8b 00                	mov    (%rax),%eax
  802dee:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802df1:	75 22                	jne    802e15 <dev_lookup+0x55>
  802df3:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802dfa:	00 00 00 
  802dfd:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802e00:	48 63 d2             	movslq %edx,%rdx
  802e03:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802e07:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802e0b:	48 89 10             	mov    %rdx,(%rax)
  802e0e:	b8 00 00 00 00       	mov    $0x0,%eax
  802e13:	eb 60                	jmp    802e75 <dev_lookup+0xb5>
  802e15:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802e19:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802e20:	00 00 00 
  802e23:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802e26:	48 63 d2             	movslq %edx,%rdx
  802e29:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802e2d:	48 85 c0             	test   %rax,%rax
  802e30:	75 a6                	jne    802dd8 <dev_lookup+0x18>
  802e32:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802e39:	00 00 00 
  802e3c:	48 8b 00             	mov    (%rax),%rax
  802e3f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802e45:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802e48:	89 c6                	mov    %eax,%esi
  802e4a:	48 bf 78 56 80 00 00 	movabs $0x805678,%rdi
  802e51:	00 00 00 
  802e54:	b8 00 00 00 00       	mov    $0x0,%eax
  802e59:	48 b9 59 0f 80 00 00 	movabs $0x800f59,%rcx
  802e60:	00 00 00 
  802e63:	ff d1                	callq  *%rcx
  802e65:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802e69:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802e70:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802e75:	c9                   	leaveq 
  802e76:	c3                   	retq   

0000000000802e77 <close>:
  802e77:	55                   	push   %rbp
  802e78:	48 89 e5             	mov    %rsp,%rbp
  802e7b:	48 83 ec 20          	sub    $0x20,%rsp
  802e7f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802e82:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802e86:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e89:	48 89 d6             	mov    %rdx,%rsi
  802e8c:	89 c7                	mov    %eax,%edi
  802e8e:	48 b8 67 2c 80 00 00 	movabs $0x802c67,%rax
  802e95:	00 00 00 
  802e98:	ff d0                	callq  *%rax
  802e9a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e9d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ea1:	79 05                	jns    802ea8 <close+0x31>
  802ea3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ea6:	eb 18                	jmp    802ec0 <close+0x49>
  802ea8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802eac:	be 01 00 00 00       	mov    $0x1,%esi
  802eb1:	48 89 c7             	mov    %rax,%rdi
  802eb4:	48 b8 f7 2c 80 00 00 	movabs $0x802cf7,%rax
  802ebb:	00 00 00 
  802ebe:	ff d0                	callq  *%rax
  802ec0:	c9                   	leaveq 
  802ec1:	c3                   	retq   

0000000000802ec2 <close_all>:
  802ec2:	55                   	push   %rbp
  802ec3:	48 89 e5             	mov    %rsp,%rbp
  802ec6:	48 83 ec 10          	sub    $0x10,%rsp
  802eca:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802ed1:	eb 15                	jmp    802ee8 <close_all+0x26>
  802ed3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ed6:	89 c7                	mov    %eax,%edi
  802ed8:	48 b8 77 2e 80 00 00 	movabs $0x802e77,%rax
  802edf:	00 00 00 
  802ee2:	ff d0                	callq  *%rax
  802ee4:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802ee8:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802eec:	7e e5                	jle    802ed3 <close_all+0x11>
  802eee:	c9                   	leaveq 
  802eef:	c3                   	retq   

0000000000802ef0 <dup>:
  802ef0:	55                   	push   %rbp
  802ef1:	48 89 e5             	mov    %rsp,%rbp
  802ef4:	48 83 ec 40          	sub    $0x40,%rsp
  802ef8:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802efb:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802efe:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802f02:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802f05:	48 89 d6             	mov    %rdx,%rsi
  802f08:	89 c7                	mov    %eax,%edi
  802f0a:	48 b8 67 2c 80 00 00 	movabs $0x802c67,%rax
  802f11:	00 00 00 
  802f14:	ff d0                	callq  *%rax
  802f16:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f19:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f1d:	79 08                	jns    802f27 <dup+0x37>
  802f1f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f22:	e9 70 01 00 00       	jmpq   803097 <dup+0x1a7>
  802f27:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802f2a:	89 c7                	mov    %eax,%edi
  802f2c:	48 b8 77 2e 80 00 00 	movabs $0x802e77,%rax
  802f33:	00 00 00 
  802f36:	ff d0                	callq  *%rax
  802f38:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802f3b:	48 98                	cltq   
  802f3d:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802f43:	48 c1 e0 0c          	shl    $0xc,%rax
  802f47:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802f4b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802f4f:	48 89 c7             	mov    %rax,%rdi
  802f52:	48 b8 a4 2b 80 00 00 	movabs $0x802ba4,%rax
  802f59:	00 00 00 
  802f5c:	ff d0                	callq  *%rax
  802f5e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802f62:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f66:	48 89 c7             	mov    %rax,%rdi
  802f69:	48 b8 a4 2b 80 00 00 	movabs $0x802ba4,%rax
  802f70:	00 00 00 
  802f73:	ff d0                	callq  *%rax
  802f75:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802f79:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f7d:	48 c1 e8 15          	shr    $0x15,%rax
  802f81:	48 89 c2             	mov    %rax,%rdx
  802f84:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802f8b:	01 00 00 
  802f8e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802f92:	83 e0 01             	and    $0x1,%eax
  802f95:	48 85 c0             	test   %rax,%rax
  802f98:	74 73                	je     80300d <dup+0x11d>
  802f9a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f9e:	48 c1 e8 0c          	shr    $0xc,%rax
  802fa2:	48 89 c2             	mov    %rax,%rdx
  802fa5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802fac:	01 00 00 
  802faf:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802fb3:	83 e0 01             	and    $0x1,%eax
  802fb6:	48 85 c0             	test   %rax,%rax
  802fb9:	74 52                	je     80300d <dup+0x11d>
  802fbb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fbf:	48 c1 e8 0c          	shr    $0xc,%rax
  802fc3:	48 89 c2             	mov    %rax,%rdx
  802fc6:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802fcd:	01 00 00 
  802fd0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802fd4:	25 07 0e 00 00       	and    $0xe07,%eax
  802fd9:	89 c1                	mov    %eax,%ecx
  802fdb:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802fdf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fe3:	41 89 c8             	mov    %ecx,%r8d
  802fe6:	48 89 d1             	mov    %rdx,%rcx
  802fe9:	ba 00 00 00 00       	mov    $0x0,%edx
  802fee:	48 89 c6             	mov    %rax,%rsi
  802ff1:	bf 00 00 00 00       	mov    $0x0,%edi
  802ff6:	48 b8 8d 24 80 00 00 	movabs $0x80248d,%rax
  802ffd:	00 00 00 
  803000:	ff d0                	callq  *%rax
  803002:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803005:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803009:	79 02                	jns    80300d <dup+0x11d>
  80300b:	eb 57                	jmp    803064 <dup+0x174>
  80300d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803011:	48 c1 e8 0c          	shr    $0xc,%rax
  803015:	48 89 c2             	mov    %rax,%rdx
  803018:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80301f:	01 00 00 
  803022:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803026:	25 07 0e 00 00       	and    $0xe07,%eax
  80302b:	89 c1                	mov    %eax,%ecx
  80302d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803031:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803035:	41 89 c8             	mov    %ecx,%r8d
  803038:	48 89 d1             	mov    %rdx,%rcx
  80303b:	ba 00 00 00 00       	mov    $0x0,%edx
  803040:	48 89 c6             	mov    %rax,%rsi
  803043:	bf 00 00 00 00       	mov    $0x0,%edi
  803048:	48 b8 8d 24 80 00 00 	movabs $0x80248d,%rax
  80304f:	00 00 00 
  803052:	ff d0                	callq  *%rax
  803054:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803057:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80305b:	79 02                	jns    80305f <dup+0x16f>
  80305d:	eb 05                	jmp    803064 <dup+0x174>
  80305f:	8b 45 c8             	mov    -0x38(%rbp),%eax
  803062:	eb 33                	jmp    803097 <dup+0x1a7>
  803064:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803068:	48 89 c6             	mov    %rax,%rsi
  80306b:	bf 00 00 00 00       	mov    $0x0,%edi
  803070:	48 b8 e8 24 80 00 00 	movabs $0x8024e8,%rax
  803077:	00 00 00 
  80307a:	ff d0                	callq  *%rax
  80307c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803080:	48 89 c6             	mov    %rax,%rsi
  803083:	bf 00 00 00 00       	mov    $0x0,%edi
  803088:	48 b8 e8 24 80 00 00 	movabs $0x8024e8,%rax
  80308f:	00 00 00 
  803092:	ff d0                	callq  *%rax
  803094:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803097:	c9                   	leaveq 
  803098:	c3                   	retq   

0000000000803099 <read>:
  803099:	55                   	push   %rbp
  80309a:	48 89 e5             	mov    %rsp,%rbp
  80309d:	48 83 ec 40          	sub    $0x40,%rsp
  8030a1:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8030a4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8030a8:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8030ac:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8030b0:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8030b3:	48 89 d6             	mov    %rdx,%rsi
  8030b6:	89 c7                	mov    %eax,%edi
  8030b8:	48 b8 67 2c 80 00 00 	movabs $0x802c67,%rax
  8030bf:	00 00 00 
  8030c2:	ff d0                	callq  *%rax
  8030c4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030c7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030cb:	78 24                	js     8030f1 <read+0x58>
  8030cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030d1:	8b 00                	mov    (%rax),%eax
  8030d3:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8030d7:	48 89 d6             	mov    %rdx,%rsi
  8030da:	89 c7                	mov    %eax,%edi
  8030dc:	48 b8 c0 2d 80 00 00 	movabs $0x802dc0,%rax
  8030e3:	00 00 00 
  8030e6:	ff d0                	callq  *%rax
  8030e8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030eb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030ef:	79 05                	jns    8030f6 <read+0x5d>
  8030f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030f4:	eb 76                	jmp    80316c <read+0xd3>
  8030f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030fa:	8b 40 08             	mov    0x8(%rax),%eax
  8030fd:	83 e0 03             	and    $0x3,%eax
  803100:	83 f8 01             	cmp    $0x1,%eax
  803103:	75 3a                	jne    80313f <read+0xa6>
  803105:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80310c:	00 00 00 
  80310f:	48 8b 00             	mov    (%rax),%rax
  803112:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803118:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80311b:	89 c6                	mov    %eax,%esi
  80311d:	48 bf 97 56 80 00 00 	movabs $0x805697,%rdi
  803124:	00 00 00 
  803127:	b8 00 00 00 00       	mov    $0x0,%eax
  80312c:	48 b9 59 0f 80 00 00 	movabs $0x800f59,%rcx
  803133:	00 00 00 
  803136:	ff d1                	callq  *%rcx
  803138:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80313d:	eb 2d                	jmp    80316c <read+0xd3>
  80313f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803143:	48 8b 40 10          	mov    0x10(%rax),%rax
  803147:	48 85 c0             	test   %rax,%rax
  80314a:	75 07                	jne    803153 <read+0xba>
  80314c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803151:	eb 19                	jmp    80316c <read+0xd3>
  803153:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803157:	48 8b 40 10          	mov    0x10(%rax),%rax
  80315b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80315f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803163:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  803167:	48 89 cf             	mov    %rcx,%rdi
  80316a:	ff d0                	callq  *%rax
  80316c:	c9                   	leaveq 
  80316d:	c3                   	retq   

000000000080316e <readn>:
  80316e:	55                   	push   %rbp
  80316f:	48 89 e5             	mov    %rsp,%rbp
  803172:	48 83 ec 30          	sub    $0x30,%rsp
  803176:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803179:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80317d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803181:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803188:	eb 49                	jmp    8031d3 <readn+0x65>
  80318a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80318d:	48 98                	cltq   
  80318f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803193:	48 29 c2             	sub    %rax,%rdx
  803196:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803199:	48 63 c8             	movslq %eax,%rcx
  80319c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8031a0:	48 01 c1             	add    %rax,%rcx
  8031a3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8031a6:	48 89 ce             	mov    %rcx,%rsi
  8031a9:	89 c7                	mov    %eax,%edi
  8031ab:	48 b8 99 30 80 00 00 	movabs $0x803099,%rax
  8031b2:	00 00 00 
  8031b5:	ff d0                	callq  *%rax
  8031b7:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8031ba:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8031be:	79 05                	jns    8031c5 <readn+0x57>
  8031c0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8031c3:	eb 1c                	jmp    8031e1 <readn+0x73>
  8031c5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8031c9:	75 02                	jne    8031cd <readn+0x5f>
  8031cb:	eb 11                	jmp    8031de <readn+0x70>
  8031cd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8031d0:	01 45 fc             	add    %eax,-0x4(%rbp)
  8031d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031d6:	48 98                	cltq   
  8031d8:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8031dc:	72 ac                	jb     80318a <readn+0x1c>
  8031de:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031e1:	c9                   	leaveq 
  8031e2:	c3                   	retq   

00000000008031e3 <write>:
  8031e3:	55                   	push   %rbp
  8031e4:	48 89 e5             	mov    %rsp,%rbp
  8031e7:	48 83 ec 40          	sub    $0x40,%rsp
  8031eb:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8031ee:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8031f2:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8031f6:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8031fa:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8031fd:	48 89 d6             	mov    %rdx,%rsi
  803200:	89 c7                	mov    %eax,%edi
  803202:	48 b8 67 2c 80 00 00 	movabs $0x802c67,%rax
  803209:	00 00 00 
  80320c:	ff d0                	callq  *%rax
  80320e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803211:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803215:	78 24                	js     80323b <write+0x58>
  803217:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80321b:	8b 00                	mov    (%rax),%eax
  80321d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803221:	48 89 d6             	mov    %rdx,%rsi
  803224:	89 c7                	mov    %eax,%edi
  803226:	48 b8 c0 2d 80 00 00 	movabs $0x802dc0,%rax
  80322d:	00 00 00 
  803230:	ff d0                	callq  *%rax
  803232:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803235:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803239:	79 05                	jns    803240 <write+0x5d>
  80323b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80323e:	eb 75                	jmp    8032b5 <write+0xd2>
  803240:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803244:	8b 40 08             	mov    0x8(%rax),%eax
  803247:	83 e0 03             	and    $0x3,%eax
  80324a:	85 c0                	test   %eax,%eax
  80324c:	75 3a                	jne    803288 <write+0xa5>
  80324e:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803255:	00 00 00 
  803258:	48 8b 00             	mov    (%rax),%rax
  80325b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803261:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803264:	89 c6                	mov    %eax,%esi
  803266:	48 bf b3 56 80 00 00 	movabs $0x8056b3,%rdi
  80326d:	00 00 00 
  803270:	b8 00 00 00 00       	mov    $0x0,%eax
  803275:	48 b9 59 0f 80 00 00 	movabs $0x800f59,%rcx
  80327c:	00 00 00 
  80327f:	ff d1                	callq  *%rcx
  803281:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803286:	eb 2d                	jmp    8032b5 <write+0xd2>
  803288:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80328c:	48 8b 40 18          	mov    0x18(%rax),%rax
  803290:	48 85 c0             	test   %rax,%rax
  803293:	75 07                	jne    80329c <write+0xb9>
  803295:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80329a:	eb 19                	jmp    8032b5 <write+0xd2>
  80329c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032a0:	48 8b 40 18          	mov    0x18(%rax),%rax
  8032a4:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8032a8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8032ac:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8032b0:	48 89 cf             	mov    %rcx,%rdi
  8032b3:	ff d0                	callq  *%rax
  8032b5:	c9                   	leaveq 
  8032b6:	c3                   	retq   

00000000008032b7 <seek>:
  8032b7:	55                   	push   %rbp
  8032b8:	48 89 e5             	mov    %rsp,%rbp
  8032bb:	48 83 ec 18          	sub    $0x18,%rsp
  8032bf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8032c2:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8032c5:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8032c9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8032cc:	48 89 d6             	mov    %rdx,%rsi
  8032cf:	89 c7                	mov    %eax,%edi
  8032d1:	48 b8 67 2c 80 00 00 	movabs $0x802c67,%rax
  8032d8:	00 00 00 
  8032db:	ff d0                	callq  *%rax
  8032dd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032e0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032e4:	79 05                	jns    8032eb <seek+0x34>
  8032e6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032e9:	eb 0f                	jmp    8032fa <seek+0x43>
  8032eb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032ef:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8032f2:	89 50 04             	mov    %edx,0x4(%rax)
  8032f5:	b8 00 00 00 00       	mov    $0x0,%eax
  8032fa:	c9                   	leaveq 
  8032fb:	c3                   	retq   

00000000008032fc <ftruncate>:
  8032fc:	55                   	push   %rbp
  8032fd:	48 89 e5             	mov    %rsp,%rbp
  803300:	48 83 ec 30          	sub    $0x30,%rsp
  803304:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803307:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80330a:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80330e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803311:	48 89 d6             	mov    %rdx,%rsi
  803314:	89 c7                	mov    %eax,%edi
  803316:	48 b8 67 2c 80 00 00 	movabs $0x802c67,%rax
  80331d:	00 00 00 
  803320:	ff d0                	callq  *%rax
  803322:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803325:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803329:	78 24                	js     80334f <ftruncate+0x53>
  80332b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80332f:	8b 00                	mov    (%rax),%eax
  803331:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803335:	48 89 d6             	mov    %rdx,%rsi
  803338:	89 c7                	mov    %eax,%edi
  80333a:	48 b8 c0 2d 80 00 00 	movabs $0x802dc0,%rax
  803341:	00 00 00 
  803344:	ff d0                	callq  *%rax
  803346:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803349:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80334d:	79 05                	jns    803354 <ftruncate+0x58>
  80334f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803352:	eb 72                	jmp    8033c6 <ftruncate+0xca>
  803354:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803358:	8b 40 08             	mov    0x8(%rax),%eax
  80335b:	83 e0 03             	and    $0x3,%eax
  80335e:	85 c0                	test   %eax,%eax
  803360:	75 3a                	jne    80339c <ftruncate+0xa0>
  803362:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803369:	00 00 00 
  80336c:	48 8b 00             	mov    (%rax),%rax
  80336f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803375:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803378:	89 c6                	mov    %eax,%esi
  80337a:	48 bf d0 56 80 00 00 	movabs $0x8056d0,%rdi
  803381:	00 00 00 
  803384:	b8 00 00 00 00       	mov    $0x0,%eax
  803389:	48 b9 59 0f 80 00 00 	movabs $0x800f59,%rcx
  803390:	00 00 00 
  803393:	ff d1                	callq  *%rcx
  803395:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80339a:	eb 2a                	jmp    8033c6 <ftruncate+0xca>
  80339c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033a0:	48 8b 40 30          	mov    0x30(%rax),%rax
  8033a4:	48 85 c0             	test   %rax,%rax
  8033a7:	75 07                	jne    8033b0 <ftruncate+0xb4>
  8033a9:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8033ae:	eb 16                	jmp    8033c6 <ftruncate+0xca>
  8033b0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033b4:	48 8b 40 30          	mov    0x30(%rax),%rax
  8033b8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8033bc:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8033bf:	89 ce                	mov    %ecx,%esi
  8033c1:	48 89 d7             	mov    %rdx,%rdi
  8033c4:	ff d0                	callq  *%rax
  8033c6:	c9                   	leaveq 
  8033c7:	c3                   	retq   

00000000008033c8 <fstat>:
  8033c8:	55                   	push   %rbp
  8033c9:	48 89 e5             	mov    %rsp,%rbp
  8033cc:	48 83 ec 30          	sub    $0x30,%rsp
  8033d0:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8033d3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8033d7:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8033db:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8033de:	48 89 d6             	mov    %rdx,%rsi
  8033e1:	89 c7                	mov    %eax,%edi
  8033e3:	48 b8 67 2c 80 00 00 	movabs $0x802c67,%rax
  8033ea:	00 00 00 
  8033ed:	ff d0                	callq  *%rax
  8033ef:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033f2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033f6:	78 24                	js     80341c <fstat+0x54>
  8033f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8033fc:	8b 00                	mov    (%rax),%eax
  8033fe:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803402:	48 89 d6             	mov    %rdx,%rsi
  803405:	89 c7                	mov    %eax,%edi
  803407:	48 b8 c0 2d 80 00 00 	movabs $0x802dc0,%rax
  80340e:	00 00 00 
  803411:	ff d0                	callq  *%rax
  803413:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803416:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80341a:	79 05                	jns    803421 <fstat+0x59>
  80341c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80341f:	eb 5e                	jmp    80347f <fstat+0xb7>
  803421:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803425:	48 8b 40 28          	mov    0x28(%rax),%rax
  803429:	48 85 c0             	test   %rax,%rax
  80342c:	75 07                	jne    803435 <fstat+0x6d>
  80342e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803433:	eb 4a                	jmp    80347f <fstat+0xb7>
  803435:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803439:	c6 00 00             	movb   $0x0,(%rax)
  80343c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803440:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  803447:	00 00 00 
  80344a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80344e:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803455:	00 00 00 
  803458:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80345c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803460:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  803467:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80346b:	48 8b 40 28          	mov    0x28(%rax),%rax
  80346f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803473:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  803477:	48 89 ce             	mov    %rcx,%rsi
  80347a:	48 89 d7             	mov    %rdx,%rdi
  80347d:	ff d0                	callq  *%rax
  80347f:	c9                   	leaveq 
  803480:	c3                   	retq   

0000000000803481 <stat>:
  803481:	55                   	push   %rbp
  803482:	48 89 e5             	mov    %rsp,%rbp
  803485:	48 83 ec 20          	sub    $0x20,%rsp
  803489:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80348d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803491:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803495:	be 00 00 00 00       	mov    $0x0,%esi
  80349a:	48 89 c7             	mov    %rax,%rdi
  80349d:	48 b8 6f 35 80 00 00 	movabs $0x80356f,%rax
  8034a4:	00 00 00 
  8034a7:	ff d0                	callq  *%rax
  8034a9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034ac:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034b0:	79 05                	jns    8034b7 <stat+0x36>
  8034b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034b5:	eb 2f                	jmp    8034e6 <stat+0x65>
  8034b7:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8034bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034be:	48 89 d6             	mov    %rdx,%rsi
  8034c1:	89 c7                	mov    %eax,%edi
  8034c3:	48 b8 c8 33 80 00 00 	movabs $0x8033c8,%rax
  8034ca:	00 00 00 
  8034cd:	ff d0                	callq  *%rax
  8034cf:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8034d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034d5:	89 c7                	mov    %eax,%edi
  8034d7:	48 b8 77 2e 80 00 00 	movabs $0x802e77,%rax
  8034de:	00 00 00 
  8034e1:	ff d0                	callq  *%rax
  8034e3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8034e6:	c9                   	leaveq 
  8034e7:	c3                   	retq   

00000000008034e8 <fsipc>:
  8034e8:	55                   	push   %rbp
  8034e9:	48 89 e5             	mov    %rsp,%rbp
  8034ec:	48 83 ec 10          	sub    $0x10,%rsp
  8034f0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8034f3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8034f7:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8034fe:	00 00 00 
  803501:	8b 00                	mov    (%rax),%eax
  803503:	85 c0                	test   %eax,%eax
  803505:	75 1d                	jne    803524 <fsipc+0x3c>
  803507:	bf 01 00 00 00       	mov    $0x1,%edi
  80350c:	48 b8 0f 2b 80 00 00 	movabs $0x802b0f,%rax
  803513:	00 00 00 
  803516:	ff d0                	callq  *%rax
  803518:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  80351f:	00 00 00 
  803522:	89 02                	mov    %eax,(%rdx)
  803524:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80352b:	00 00 00 
  80352e:	8b 00                	mov    (%rax),%eax
  803530:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803533:	b9 07 00 00 00       	mov    $0x7,%ecx
  803538:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  80353f:	00 00 00 
  803542:	89 c7                	mov    %eax,%edi
  803544:	48 b8 de 28 80 00 00 	movabs $0x8028de,%rax
  80354b:	00 00 00 
  80354e:	ff d0                	callq  *%rax
  803550:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803554:	ba 00 00 00 00       	mov    $0x0,%edx
  803559:	48 89 c6             	mov    %rax,%rsi
  80355c:	bf 00 00 00 00       	mov    $0x0,%edi
  803561:	48 b8 1d 28 80 00 00 	movabs $0x80281d,%rax
  803568:	00 00 00 
  80356b:	ff d0                	callq  *%rax
  80356d:	c9                   	leaveq 
  80356e:	c3                   	retq   

000000000080356f <open>:
  80356f:	55                   	push   %rbp
  803570:	48 89 e5             	mov    %rsp,%rbp
  803573:	48 83 ec 20          	sub    $0x20,%rsp
  803577:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80357b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80357e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803582:	48 89 c7             	mov    %rax,%rdi
  803585:	48 b8 a2 1a 80 00 00 	movabs $0x801aa2,%rax
  80358c:	00 00 00 
  80358f:	ff d0                	callq  *%rax
  803591:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803596:	7e 0a                	jle    8035a2 <open+0x33>
  803598:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80359d:	e9 a5 00 00 00       	jmpq   803647 <open+0xd8>
  8035a2:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8035a6:	48 89 c7             	mov    %rax,%rdi
  8035a9:	48 b8 cf 2b 80 00 00 	movabs $0x802bcf,%rax
  8035b0:	00 00 00 
  8035b3:	ff d0                	callq  *%rax
  8035b5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8035b8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8035bc:	79 08                	jns    8035c6 <open+0x57>
  8035be:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035c1:	e9 81 00 00 00       	jmpq   803647 <open+0xd8>
  8035c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035ca:	48 89 c6             	mov    %rax,%rsi
  8035cd:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8035d4:	00 00 00 
  8035d7:	48 b8 0e 1b 80 00 00 	movabs $0x801b0e,%rax
  8035de:	00 00 00 
  8035e1:	ff d0                	callq  *%rax
  8035e3:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8035ea:	00 00 00 
  8035ed:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8035f0:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  8035f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035fa:	48 89 c6             	mov    %rax,%rsi
  8035fd:	bf 01 00 00 00       	mov    $0x1,%edi
  803602:	48 b8 e8 34 80 00 00 	movabs $0x8034e8,%rax
  803609:	00 00 00 
  80360c:	ff d0                	callq  *%rax
  80360e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803611:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803615:	79 1d                	jns    803634 <open+0xc5>
  803617:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80361b:	be 00 00 00 00       	mov    $0x0,%esi
  803620:	48 89 c7             	mov    %rax,%rdi
  803623:	48 b8 f7 2c 80 00 00 	movabs $0x802cf7,%rax
  80362a:	00 00 00 
  80362d:	ff d0                	callq  *%rax
  80362f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803632:	eb 13                	jmp    803647 <open+0xd8>
  803634:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803638:	48 89 c7             	mov    %rax,%rdi
  80363b:	48 b8 81 2b 80 00 00 	movabs $0x802b81,%rax
  803642:	00 00 00 
  803645:	ff d0                	callq  *%rax
  803647:	c9                   	leaveq 
  803648:	c3                   	retq   

0000000000803649 <devfile_flush>:
  803649:	55                   	push   %rbp
  80364a:	48 89 e5             	mov    %rsp,%rbp
  80364d:	48 83 ec 10          	sub    $0x10,%rsp
  803651:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803655:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803659:	8b 50 0c             	mov    0xc(%rax),%edx
  80365c:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803663:	00 00 00 
  803666:	89 10                	mov    %edx,(%rax)
  803668:	be 00 00 00 00       	mov    $0x0,%esi
  80366d:	bf 06 00 00 00       	mov    $0x6,%edi
  803672:	48 b8 e8 34 80 00 00 	movabs $0x8034e8,%rax
  803679:	00 00 00 
  80367c:	ff d0                	callq  *%rax
  80367e:	c9                   	leaveq 
  80367f:	c3                   	retq   

0000000000803680 <devfile_read>:
  803680:	55                   	push   %rbp
  803681:	48 89 e5             	mov    %rsp,%rbp
  803684:	48 83 ec 30          	sub    $0x30,%rsp
  803688:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80368c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803690:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803694:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803698:	8b 50 0c             	mov    0xc(%rax),%edx
  80369b:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8036a2:	00 00 00 
  8036a5:	89 10                	mov    %edx,(%rax)
  8036a7:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8036ae:	00 00 00 
  8036b1:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8036b5:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8036b9:	be 00 00 00 00       	mov    $0x0,%esi
  8036be:	bf 03 00 00 00       	mov    $0x3,%edi
  8036c3:	48 b8 e8 34 80 00 00 	movabs $0x8034e8,%rax
  8036ca:	00 00 00 
  8036cd:	ff d0                	callq  *%rax
  8036cf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036d2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036d6:	79 08                	jns    8036e0 <devfile_read+0x60>
  8036d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036db:	e9 a4 00 00 00       	jmpq   803784 <devfile_read+0x104>
  8036e0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036e3:	48 98                	cltq   
  8036e5:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8036e9:	76 35                	jbe    803720 <devfile_read+0xa0>
  8036eb:	48 b9 f6 56 80 00 00 	movabs $0x8056f6,%rcx
  8036f2:	00 00 00 
  8036f5:	48 ba fd 56 80 00 00 	movabs $0x8056fd,%rdx
  8036fc:	00 00 00 
  8036ff:	be 89 00 00 00       	mov    $0x89,%esi
  803704:	48 bf 12 57 80 00 00 	movabs $0x805712,%rdi
  80370b:	00 00 00 
  80370e:	b8 00 00 00 00       	mov    $0x0,%eax
  803713:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  80371a:	00 00 00 
  80371d:	41 ff d0             	callq  *%r8
  803720:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  803727:	7e 35                	jle    80375e <devfile_read+0xde>
  803729:	48 b9 20 57 80 00 00 	movabs $0x805720,%rcx
  803730:	00 00 00 
  803733:	48 ba fd 56 80 00 00 	movabs $0x8056fd,%rdx
  80373a:	00 00 00 
  80373d:	be 8a 00 00 00       	mov    $0x8a,%esi
  803742:	48 bf 12 57 80 00 00 	movabs $0x805712,%rdi
  803749:	00 00 00 
  80374c:	b8 00 00 00 00       	mov    $0x0,%eax
  803751:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  803758:	00 00 00 
  80375b:	41 ff d0             	callq  *%r8
  80375e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803761:	48 63 d0             	movslq %eax,%rdx
  803764:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803768:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  80376f:	00 00 00 
  803772:	48 89 c7             	mov    %rax,%rdi
  803775:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  80377c:	00 00 00 
  80377f:	ff d0                	callq  *%rax
  803781:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803784:	c9                   	leaveq 
  803785:	c3                   	retq   

0000000000803786 <devfile_write>:
  803786:	55                   	push   %rbp
  803787:	48 89 e5             	mov    %rsp,%rbp
  80378a:	48 83 ec 40          	sub    $0x40,%rsp
  80378e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803792:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803796:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80379a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80379e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8037a2:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  8037a9:	00 
  8037aa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037ae:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  8037b2:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  8037b7:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  8037bb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8037bf:	8b 50 0c             	mov    0xc(%rax),%edx
  8037c2:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8037c9:	00 00 00 
  8037cc:	89 10                	mov    %edx,(%rax)
  8037ce:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8037d5:	00 00 00 
  8037d8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8037dc:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8037e0:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8037e4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8037e8:	48 89 c6             	mov    %rax,%rsi
  8037eb:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  8037f2:	00 00 00 
  8037f5:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  8037fc:	00 00 00 
  8037ff:	ff d0                	callq  *%rax
  803801:	be 00 00 00 00       	mov    $0x0,%esi
  803806:	bf 04 00 00 00       	mov    $0x4,%edi
  80380b:	48 b8 e8 34 80 00 00 	movabs $0x8034e8,%rax
  803812:	00 00 00 
  803815:	ff d0                	callq  *%rax
  803817:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80381a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80381e:	79 05                	jns    803825 <devfile_write+0x9f>
  803820:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803823:	eb 43                	jmp    803868 <devfile_write+0xe2>
  803825:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803828:	48 98                	cltq   
  80382a:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80382e:	76 35                	jbe    803865 <devfile_write+0xdf>
  803830:	48 b9 f6 56 80 00 00 	movabs $0x8056f6,%rcx
  803837:	00 00 00 
  80383a:	48 ba fd 56 80 00 00 	movabs $0x8056fd,%rdx
  803841:	00 00 00 
  803844:	be a8 00 00 00       	mov    $0xa8,%esi
  803849:	48 bf 12 57 80 00 00 	movabs $0x805712,%rdi
  803850:	00 00 00 
  803853:	b8 00 00 00 00       	mov    $0x0,%eax
  803858:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  80385f:	00 00 00 
  803862:	41 ff d0             	callq  *%r8
  803865:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803868:	c9                   	leaveq 
  803869:	c3                   	retq   

000000000080386a <devfile_stat>:
  80386a:	55                   	push   %rbp
  80386b:	48 89 e5             	mov    %rsp,%rbp
  80386e:	48 83 ec 20          	sub    $0x20,%rsp
  803872:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803876:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80387a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80387e:	8b 50 0c             	mov    0xc(%rax),%edx
  803881:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803888:	00 00 00 
  80388b:	89 10                	mov    %edx,(%rax)
  80388d:	be 00 00 00 00       	mov    $0x0,%esi
  803892:	bf 05 00 00 00       	mov    $0x5,%edi
  803897:	48 b8 e8 34 80 00 00 	movabs $0x8034e8,%rax
  80389e:	00 00 00 
  8038a1:	ff d0                	callq  *%rax
  8038a3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038a6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038aa:	79 05                	jns    8038b1 <devfile_stat+0x47>
  8038ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038af:	eb 56                	jmp    803907 <devfile_stat+0x9d>
  8038b1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8038b5:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8038bc:	00 00 00 
  8038bf:	48 89 c7             	mov    %rax,%rdi
  8038c2:	48 b8 0e 1b 80 00 00 	movabs $0x801b0e,%rax
  8038c9:	00 00 00 
  8038cc:	ff d0                	callq  *%rax
  8038ce:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8038d5:	00 00 00 
  8038d8:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  8038de:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8038e2:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8038e8:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8038ef:	00 00 00 
  8038f2:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  8038f8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8038fc:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803902:	b8 00 00 00 00       	mov    $0x0,%eax
  803907:	c9                   	leaveq 
  803908:	c3                   	retq   

0000000000803909 <devfile_trunc>:
  803909:	55                   	push   %rbp
  80390a:	48 89 e5             	mov    %rsp,%rbp
  80390d:	48 83 ec 10          	sub    $0x10,%rsp
  803911:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803915:	89 75 f4             	mov    %esi,-0xc(%rbp)
  803918:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80391c:	8b 50 0c             	mov    0xc(%rax),%edx
  80391f:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803926:	00 00 00 
  803929:	89 10                	mov    %edx,(%rax)
  80392b:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803932:	00 00 00 
  803935:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803938:	89 50 04             	mov    %edx,0x4(%rax)
  80393b:	be 00 00 00 00       	mov    $0x0,%esi
  803940:	bf 02 00 00 00       	mov    $0x2,%edi
  803945:	48 b8 e8 34 80 00 00 	movabs $0x8034e8,%rax
  80394c:	00 00 00 
  80394f:	ff d0                	callq  *%rax
  803951:	c9                   	leaveq 
  803952:	c3                   	retq   

0000000000803953 <remove>:
  803953:	55                   	push   %rbp
  803954:	48 89 e5             	mov    %rsp,%rbp
  803957:	48 83 ec 10          	sub    $0x10,%rsp
  80395b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80395f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803963:	48 89 c7             	mov    %rax,%rdi
  803966:	48 b8 a2 1a 80 00 00 	movabs $0x801aa2,%rax
  80396d:	00 00 00 
  803970:	ff d0                	callq  *%rax
  803972:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803977:	7e 07                	jle    803980 <remove+0x2d>
  803979:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80397e:	eb 33                	jmp    8039b3 <remove+0x60>
  803980:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803984:	48 89 c6             	mov    %rax,%rsi
  803987:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  80398e:	00 00 00 
  803991:	48 b8 0e 1b 80 00 00 	movabs $0x801b0e,%rax
  803998:	00 00 00 
  80399b:	ff d0                	callq  *%rax
  80399d:	be 00 00 00 00       	mov    $0x0,%esi
  8039a2:	bf 07 00 00 00       	mov    $0x7,%edi
  8039a7:	48 b8 e8 34 80 00 00 	movabs $0x8034e8,%rax
  8039ae:	00 00 00 
  8039b1:	ff d0                	callq  *%rax
  8039b3:	c9                   	leaveq 
  8039b4:	c3                   	retq   

00000000008039b5 <sync>:
  8039b5:	55                   	push   %rbp
  8039b6:	48 89 e5             	mov    %rsp,%rbp
  8039b9:	be 00 00 00 00       	mov    $0x0,%esi
  8039be:	bf 08 00 00 00       	mov    $0x8,%edi
  8039c3:	48 b8 e8 34 80 00 00 	movabs $0x8034e8,%rax
  8039ca:	00 00 00 
  8039cd:	ff d0                	callq  *%rax
  8039cf:	5d                   	pop    %rbp
  8039d0:	c3                   	retq   

00000000008039d1 <copy>:
  8039d1:	55                   	push   %rbp
  8039d2:	48 89 e5             	mov    %rsp,%rbp
  8039d5:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  8039dc:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  8039e3:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  8039ea:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  8039f1:	be 00 00 00 00       	mov    $0x0,%esi
  8039f6:	48 89 c7             	mov    %rax,%rdi
  8039f9:	48 b8 6f 35 80 00 00 	movabs $0x80356f,%rax
  803a00:	00 00 00 
  803a03:	ff d0                	callq  *%rax
  803a05:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a08:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a0c:	79 28                	jns    803a36 <copy+0x65>
  803a0e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a11:	89 c6                	mov    %eax,%esi
  803a13:	48 bf 2c 57 80 00 00 	movabs $0x80572c,%rdi
  803a1a:	00 00 00 
  803a1d:	b8 00 00 00 00       	mov    $0x0,%eax
  803a22:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  803a29:	00 00 00 
  803a2c:	ff d2                	callq  *%rdx
  803a2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a31:	e9 74 01 00 00       	jmpq   803baa <copy+0x1d9>
  803a36:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  803a3d:	be 01 01 00 00       	mov    $0x101,%esi
  803a42:	48 89 c7             	mov    %rax,%rdi
  803a45:	48 b8 6f 35 80 00 00 	movabs $0x80356f,%rax
  803a4c:	00 00 00 
  803a4f:	ff d0                	callq  *%rax
  803a51:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803a54:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803a58:	79 39                	jns    803a93 <copy+0xc2>
  803a5a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803a5d:	89 c6                	mov    %eax,%esi
  803a5f:	48 bf 42 57 80 00 00 	movabs $0x805742,%rdi
  803a66:	00 00 00 
  803a69:	b8 00 00 00 00       	mov    $0x0,%eax
  803a6e:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  803a75:	00 00 00 
  803a78:	ff d2                	callq  *%rdx
  803a7a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a7d:	89 c7                	mov    %eax,%edi
  803a7f:	48 b8 77 2e 80 00 00 	movabs $0x802e77,%rax
  803a86:	00 00 00 
  803a89:	ff d0                	callq  *%rax
  803a8b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803a8e:	e9 17 01 00 00       	jmpq   803baa <copy+0x1d9>
  803a93:	eb 74                	jmp    803b09 <copy+0x138>
  803a95:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803a98:	48 63 d0             	movslq %eax,%rdx
  803a9b:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803aa2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803aa5:	48 89 ce             	mov    %rcx,%rsi
  803aa8:	89 c7                	mov    %eax,%edi
  803aaa:	48 b8 e3 31 80 00 00 	movabs $0x8031e3,%rax
  803ab1:	00 00 00 
  803ab4:	ff d0                	callq  *%rax
  803ab6:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803ab9:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803abd:	79 4a                	jns    803b09 <copy+0x138>
  803abf:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803ac2:	89 c6                	mov    %eax,%esi
  803ac4:	48 bf 5c 57 80 00 00 	movabs $0x80575c,%rdi
  803acb:	00 00 00 
  803ace:	b8 00 00 00 00       	mov    $0x0,%eax
  803ad3:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  803ada:	00 00 00 
  803add:	ff d2                	callq  *%rdx
  803adf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ae2:	89 c7                	mov    %eax,%edi
  803ae4:	48 b8 77 2e 80 00 00 	movabs $0x802e77,%rax
  803aeb:	00 00 00 
  803aee:	ff d0                	callq  *%rax
  803af0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803af3:	89 c7                	mov    %eax,%edi
  803af5:	48 b8 77 2e 80 00 00 	movabs $0x802e77,%rax
  803afc:	00 00 00 
  803aff:	ff d0                	callq  *%rax
  803b01:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803b04:	e9 a1 00 00 00       	jmpq   803baa <copy+0x1d9>
  803b09:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803b10:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b13:	ba 00 02 00 00       	mov    $0x200,%edx
  803b18:	48 89 ce             	mov    %rcx,%rsi
  803b1b:	89 c7                	mov    %eax,%edi
  803b1d:	48 b8 99 30 80 00 00 	movabs $0x803099,%rax
  803b24:	00 00 00 
  803b27:	ff d0                	callq  *%rax
  803b29:	89 45 f4             	mov    %eax,-0xc(%rbp)
  803b2c:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803b30:	0f 8f 5f ff ff ff    	jg     803a95 <copy+0xc4>
  803b36:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803b3a:	79 47                	jns    803b83 <copy+0x1b2>
  803b3c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803b3f:	89 c6                	mov    %eax,%esi
  803b41:	48 bf 6f 57 80 00 00 	movabs $0x80576f,%rdi
  803b48:	00 00 00 
  803b4b:	b8 00 00 00 00       	mov    $0x0,%eax
  803b50:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  803b57:	00 00 00 
  803b5a:	ff d2                	callq  *%rdx
  803b5c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b5f:	89 c7                	mov    %eax,%edi
  803b61:	48 b8 77 2e 80 00 00 	movabs $0x802e77,%rax
  803b68:	00 00 00 
  803b6b:	ff d0                	callq  *%rax
  803b6d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803b70:	89 c7                	mov    %eax,%edi
  803b72:	48 b8 77 2e 80 00 00 	movabs $0x802e77,%rax
  803b79:	00 00 00 
  803b7c:	ff d0                	callq  *%rax
  803b7e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803b81:	eb 27                	jmp    803baa <copy+0x1d9>
  803b83:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b86:	89 c7                	mov    %eax,%edi
  803b88:	48 b8 77 2e 80 00 00 	movabs $0x802e77,%rax
  803b8f:	00 00 00 
  803b92:	ff d0                	callq  *%rax
  803b94:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803b97:	89 c7                	mov    %eax,%edi
  803b99:	48 b8 77 2e 80 00 00 	movabs $0x802e77,%rax
  803ba0:	00 00 00 
  803ba3:	ff d0                	callq  *%rax
  803ba5:	b8 00 00 00 00       	mov    $0x0,%eax
  803baa:	c9                   	leaveq 
  803bab:	c3                   	retq   

0000000000803bac <fd2sockid>:
  803bac:	55                   	push   %rbp
  803bad:	48 89 e5             	mov    %rsp,%rbp
  803bb0:	48 83 ec 20          	sub    $0x20,%rsp
  803bb4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803bb7:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803bbb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803bbe:	48 89 d6             	mov    %rdx,%rsi
  803bc1:	89 c7                	mov    %eax,%edi
  803bc3:	48 b8 67 2c 80 00 00 	movabs $0x802c67,%rax
  803bca:	00 00 00 
  803bcd:	ff d0                	callq  *%rax
  803bcf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bd2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803bd6:	79 05                	jns    803bdd <fd2sockid+0x31>
  803bd8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bdb:	eb 24                	jmp    803c01 <fd2sockid+0x55>
  803bdd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803be1:	8b 10                	mov    (%rax),%edx
  803be3:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  803bea:	00 00 00 
  803bed:	8b 00                	mov    (%rax),%eax
  803bef:	39 c2                	cmp    %eax,%edx
  803bf1:	74 07                	je     803bfa <fd2sockid+0x4e>
  803bf3:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803bf8:	eb 07                	jmp    803c01 <fd2sockid+0x55>
  803bfa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bfe:	8b 40 0c             	mov    0xc(%rax),%eax
  803c01:	c9                   	leaveq 
  803c02:	c3                   	retq   

0000000000803c03 <alloc_sockfd>:
  803c03:	55                   	push   %rbp
  803c04:	48 89 e5             	mov    %rsp,%rbp
  803c07:	48 83 ec 20          	sub    $0x20,%rsp
  803c0b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c0e:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803c12:	48 89 c7             	mov    %rax,%rdi
  803c15:	48 b8 cf 2b 80 00 00 	movabs $0x802bcf,%rax
  803c1c:	00 00 00 
  803c1f:	ff d0                	callq  *%rax
  803c21:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c24:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c28:	78 26                	js     803c50 <alloc_sockfd+0x4d>
  803c2a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c2e:	ba 07 04 00 00       	mov    $0x407,%edx
  803c33:	48 89 c6             	mov    %rax,%rsi
  803c36:	bf 00 00 00 00       	mov    $0x0,%edi
  803c3b:	48 b8 3d 24 80 00 00 	movabs $0x80243d,%rax
  803c42:	00 00 00 
  803c45:	ff d0                	callq  *%rax
  803c47:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c4a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c4e:	79 16                	jns    803c66 <alloc_sockfd+0x63>
  803c50:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c53:	89 c7                	mov    %eax,%edi
  803c55:	48 b8 10 41 80 00 00 	movabs $0x804110,%rax
  803c5c:	00 00 00 
  803c5f:	ff d0                	callq  *%rax
  803c61:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c64:	eb 3a                	jmp    803ca0 <alloc_sockfd+0x9d>
  803c66:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c6a:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  803c71:	00 00 00 
  803c74:	8b 12                	mov    (%rdx),%edx
  803c76:	89 10                	mov    %edx,(%rax)
  803c78:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c7c:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803c83:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c87:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803c8a:	89 50 0c             	mov    %edx,0xc(%rax)
  803c8d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c91:	48 89 c7             	mov    %rax,%rdi
  803c94:	48 b8 81 2b 80 00 00 	movabs $0x802b81,%rax
  803c9b:	00 00 00 
  803c9e:	ff d0                	callq  *%rax
  803ca0:	c9                   	leaveq 
  803ca1:	c3                   	retq   

0000000000803ca2 <accept>:
  803ca2:	55                   	push   %rbp
  803ca3:	48 89 e5             	mov    %rsp,%rbp
  803ca6:	48 83 ec 30          	sub    $0x30,%rsp
  803caa:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803cad:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803cb1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803cb5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803cb8:	89 c7                	mov    %eax,%edi
  803cba:	48 b8 ac 3b 80 00 00 	movabs $0x803bac,%rax
  803cc1:	00 00 00 
  803cc4:	ff d0                	callq  *%rax
  803cc6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803cc9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ccd:	79 05                	jns    803cd4 <accept+0x32>
  803ccf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cd2:	eb 3b                	jmp    803d0f <accept+0x6d>
  803cd4:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803cd8:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803cdc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cdf:	48 89 ce             	mov    %rcx,%rsi
  803ce2:	89 c7                	mov    %eax,%edi
  803ce4:	48 b8 ed 3f 80 00 00 	movabs $0x803fed,%rax
  803ceb:	00 00 00 
  803cee:	ff d0                	callq  *%rax
  803cf0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803cf3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803cf7:	79 05                	jns    803cfe <accept+0x5c>
  803cf9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cfc:	eb 11                	jmp    803d0f <accept+0x6d>
  803cfe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d01:	89 c7                	mov    %eax,%edi
  803d03:	48 b8 03 3c 80 00 00 	movabs $0x803c03,%rax
  803d0a:	00 00 00 
  803d0d:	ff d0                	callq  *%rax
  803d0f:	c9                   	leaveq 
  803d10:	c3                   	retq   

0000000000803d11 <bind>:
  803d11:	55                   	push   %rbp
  803d12:	48 89 e5             	mov    %rsp,%rbp
  803d15:	48 83 ec 20          	sub    $0x20,%rsp
  803d19:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d1c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803d20:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803d23:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d26:	89 c7                	mov    %eax,%edi
  803d28:	48 b8 ac 3b 80 00 00 	movabs $0x803bac,%rax
  803d2f:	00 00 00 
  803d32:	ff d0                	callq  *%rax
  803d34:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d37:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d3b:	79 05                	jns    803d42 <bind+0x31>
  803d3d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d40:	eb 1b                	jmp    803d5d <bind+0x4c>
  803d42:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803d45:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803d49:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d4c:	48 89 ce             	mov    %rcx,%rsi
  803d4f:	89 c7                	mov    %eax,%edi
  803d51:	48 b8 6c 40 80 00 00 	movabs $0x80406c,%rax
  803d58:	00 00 00 
  803d5b:	ff d0                	callq  *%rax
  803d5d:	c9                   	leaveq 
  803d5e:	c3                   	retq   

0000000000803d5f <shutdown>:
  803d5f:	55                   	push   %rbp
  803d60:	48 89 e5             	mov    %rsp,%rbp
  803d63:	48 83 ec 20          	sub    $0x20,%rsp
  803d67:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d6a:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803d6d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d70:	89 c7                	mov    %eax,%edi
  803d72:	48 b8 ac 3b 80 00 00 	movabs $0x803bac,%rax
  803d79:	00 00 00 
  803d7c:	ff d0                	callq  *%rax
  803d7e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d81:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d85:	79 05                	jns    803d8c <shutdown+0x2d>
  803d87:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d8a:	eb 16                	jmp    803da2 <shutdown+0x43>
  803d8c:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803d8f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d92:	89 d6                	mov    %edx,%esi
  803d94:	89 c7                	mov    %eax,%edi
  803d96:	48 b8 d0 40 80 00 00 	movabs $0x8040d0,%rax
  803d9d:	00 00 00 
  803da0:	ff d0                	callq  *%rax
  803da2:	c9                   	leaveq 
  803da3:	c3                   	retq   

0000000000803da4 <devsock_close>:
  803da4:	55                   	push   %rbp
  803da5:	48 89 e5             	mov    %rsp,%rbp
  803da8:	48 83 ec 10          	sub    $0x10,%rsp
  803dac:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803db0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803db4:	48 89 c7             	mov    %rax,%rdi
  803db7:	48 b8 34 4c 80 00 00 	movabs $0x804c34,%rax
  803dbe:	00 00 00 
  803dc1:	ff d0                	callq  *%rax
  803dc3:	83 f8 01             	cmp    $0x1,%eax
  803dc6:	75 17                	jne    803ddf <devsock_close+0x3b>
  803dc8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803dcc:	8b 40 0c             	mov    0xc(%rax),%eax
  803dcf:	89 c7                	mov    %eax,%edi
  803dd1:	48 b8 10 41 80 00 00 	movabs $0x804110,%rax
  803dd8:	00 00 00 
  803ddb:	ff d0                	callq  *%rax
  803ddd:	eb 05                	jmp    803de4 <devsock_close+0x40>
  803ddf:	b8 00 00 00 00       	mov    $0x0,%eax
  803de4:	c9                   	leaveq 
  803de5:	c3                   	retq   

0000000000803de6 <connect>:
  803de6:	55                   	push   %rbp
  803de7:	48 89 e5             	mov    %rsp,%rbp
  803dea:	48 83 ec 20          	sub    $0x20,%rsp
  803dee:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803df1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803df5:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803df8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803dfb:	89 c7                	mov    %eax,%edi
  803dfd:	48 b8 ac 3b 80 00 00 	movabs $0x803bac,%rax
  803e04:	00 00 00 
  803e07:	ff d0                	callq  *%rax
  803e09:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e0c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e10:	79 05                	jns    803e17 <connect+0x31>
  803e12:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e15:	eb 1b                	jmp    803e32 <connect+0x4c>
  803e17:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803e1a:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803e1e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e21:	48 89 ce             	mov    %rcx,%rsi
  803e24:	89 c7                	mov    %eax,%edi
  803e26:	48 b8 3d 41 80 00 00 	movabs $0x80413d,%rax
  803e2d:	00 00 00 
  803e30:	ff d0                	callq  *%rax
  803e32:	c9                   	leaveq 
  803e33:	c3                   	retq   

0000000000803e34 <listen>:
  803e34:	55                   	push   %rbp
  803e35:	48 89 e5             	mov    %rsp,%rbp
  803e38:	48 83 ec 20          	sub    $0x20,%rsp
  803e3c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803e3f:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803e42:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803e45:	89 c7                	mov    %eax,%edi
  803e47:	48 b8 ac 3b 80 00 00 	movabs $0x803bac,%rax
  803e4e:	00 00 00 
  803e51:	ff d0                	callq  *%rax
  803e53:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e56:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e5a:	79 05                	jns    803e61 <listen+0x2d>
  803e5c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e5f:	eb 16                	jmp    803e77 <listen+0x43>
  803e61:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803e64:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e67:	89 d6                	mov    %edx,%esi
  803e69:	89 c7                	mov    %eax,%edi
  803e6b:	48 b8 a1 41 80 00 00 	movabs $0x8041a1,%rax
  803e72:	00 00 00 
  803e75:	ff d0                	callq  *%rax
  803e77:	c9                   	leaveq 
  803e78:	c3                   	retq   

0000000000803e79 <devsock_read>:
  803e79:	55                   	push   %rbp
  803e7a:	48 89 e5             	mov    %rsp,%rbp
  803e7d:	48 83 ec 20          	sub    $0x20,%rsp
  803e81:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803e85:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803e89:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803e8d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e91:	89 c2                	mov    %eax,%edx
  803e93:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e97:	8b 40 0c             	mov    0xc(%rax),%eax
  803e9a:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803e9e:	b9 00 00 00 00       	mov    $0x0,%ecx
  803ea3:	89 c7                	mov    %eax,%edi
  803ea5:	48 b8 e1 41 80 00 00 	movabs $0x8041e1,%rax
  803eac:	00 00 00 
  803eaf:	ff d0                	callq  *%rax
  803eb1:	c9                   	leaveq 
  803eb2:	c3                   	retq   

0000000000803eb3 <devsock_write>:
  803eb3:	55                   	push   %rbp
  803eb4:	48 89 e5             	mov    %rsp,%rbp
  803eb7:	48 83 ec 20          	sub    $0x20,%rsp
  803ebb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803ebf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803ec3:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803ec7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803ecb:	89 c2                	mov    %eax,%edx
  803ecd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ed1:	8b 40 0c             	mov    0xc(%rax),%eax
  803ed4:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803ed8:	b9 00 00 00 00       	mov    $0x0,%ecx
  803edd:	89 c7                	mov    %eax,%edi
  803edf:	48 b8 ad 42 80 00 00 	movabs $0x8042ad,%rax
  803ee6:	00 00 00 
  803ee9:	ff d0                	callq  *%rax
  803eeb:	c9                   	leaveq 
  803eec:	c3                   	retq   

0000000000803eed <devsock_stat>:
  803eed:	55                   	push   %rbp
  803eee:	48 89 e5             	mov    %rsp,%rbp
  803ef1:	48 83 ec 10          	sub    $0x10,%rsp
  803ef5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803ef9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803efd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f01:	48 be 8a 57 80 00 00 	movabs $0x80578a,%rsi
  803f08:	00 00 00 
  803f0b:	48 89 c7             	mov    %rax,%rdi
  803f0e:	48 b8 0e 1b 80 00 00 	movabs $0x801b0e,%rax
  803f15:	00 00 00 
  803f18:	ff d0                	callq  *%rax
  803f1a:	b8 00 00 00 00       	mov    $0x0,%eax
  803f1f:	c9                   	leaveq 
  803f20:	c3                   	retq   

0000000000803f21 <socket>:
  803f21:	55                   	push   %rbp
  803f22:	48 89 e5             	mov    %rsp,%rbp
  803f25:	48 83 ec 20          	sub    $0x20,%rsp
  803f29:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f2c:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803f2f:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803f32:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803f35:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803f38:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f3b:	89 ce                	mov    %ecx,%esi
  803f3d:	89 c7                	mov    %eax,%edi
  803f3f:	48 b8 65 43 80 00 00 	movabs $0x804365,%rax
  803f46:	00 00 00 
  803f49:	ff d0                	callq  *%rax
  803f4b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f4e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f52:	79 05                	jns    803f59 <socket+0x38>
  803f54:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f57:	eb 11                	jmp    803f6a <socket+0x49>
  803f59:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f5c:	89 c7                	mov    %eax,%edi
  803f5e:	48 b8 03 3c 80 00 00 	movabs $0x803c03,%rax
  803f65:	00 00 00 
  803f68:	ff d0                	callq  *%rax
  803f6a:	c9                   	leaveq 
  803f6b:	c3                   	retq   

0000000000803f6c <nsipc>:
  803f6c:	55                   	push   %rbp
  803f6d:	48 89 e5             	mov    %rsp,%rbp
  803f70:	48 83 ec 10          	sub    $0x10,%rsp
  803f74:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f77:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803f7e:	00 00 00 
  803f81:	8b 00                	mov    (%rax),%eax
  803f83:	85 c0                	test   %eax,%eax
  803f85:	75 1d                	jne    803fa4 <nsipc+0x38>
  803f87:	bf 02 00 00 00       	mov    $0x2,%edi
  803f8c:	48 b8 0f 2b 80 00 00 	movabs $0x802b0f,%rax
  803f93:	00 00 00 
  803f96:	ff d0                	callq  *%rax
  803f98:	48 ba 04 80 80 00 00 	movabs $0x808004,%rdx
  803f9f:	00 00 00 
  803fa2:	89 02                	mov    %eax,(%rdx)
  803fa4:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803fab:	00 00 00 
  803fae:	8b 00                	mov    (%rax),%eax
  803fb0:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803fb3:	b9 07 00 00 00       	mov    $0x7,%ecx
  803fb8:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803fbf:	00 00 00 
  803fc2:	89 c7                	mov    %eax,%edi
  803fc4:	48 b8 de 28 80 00 00 	movabs $0x8028de,%rax
  803fcb:	00 00 00 
  803fce:	ff d0                	callq  *%rax
  803fd0:	ba 00 00 00 00       	mov    $0x0,%edx
  803fd5:	be 00 00 00 00       	mov    $0x0,%esi
  803fda:	bf 00 00 00 00       	mov    $0x0,%edi
  803fdf:	48 b8 1d 28 80 00 00 	movabs $0x80281d,%rax
  803fe6:	00 00 00 
  803fe9:	ff d0                	callq  *%rax
  803feb:	c9                   	leaveq 
  803fec:	c3                   	retq   

0000000000803fed <nsipc_accept>:
  803fed:	55                   	push   %rbp
  803fee:	48 89 e5             	mov    %rsp,%rbp
  803ff1:	48 83 ec 30          	sub    $0x30,%rsp
  803ff5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ff8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803ffc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804000:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804007:	00 00 00 
  80400a:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80400d:	89 10                	mov    %edx,(%rax)
  80400f:	bf 01 00 00 00       	mov    $0x1,%edi
  804014:	48 b8 6c 3f 80 00 00 	movabs $0x803f6c,%rax
  80401b:	00 00 00 
  80401e:	ff d0                	callq  *%rax
  804020:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804023:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804027:	78 3e                	js     804067 <nsipc_accept+0x7a>
  804029:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804030:	00 00 00 
  804033:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804037:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80403b:	8b 40 10             	mov    0x10(%rax),%eax
  80403e:	89 c2                	mov    %eax,%edx
  804040:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  804044:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804048:	48 89 ce             	mov    %rcx,%rsi
  80404b:	48 89 c7             	mov    %rax,%rdi
  80404e:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  804055:	00 00 00 
  804058:	ff d0                	callq  *%rax
  80405a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80405e:	8b 50 10             	mov    0x10(%rax),%edx
  804061:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804065:	89 10                	mov    %edx,(%rax)
  804067:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80406a:	c9                   	leaveq 
  80406b:	c3                   	retq   

000000000080406c <nsipc_bind>:
  80406c:	55                   	push   %rbp
  80406d:	48 89 e5             	mov    %rsp,%rbp
  804070:	48 83 ec 10          	sub    $0x10,%rsp
  804074:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804077:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80407b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80407e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804085:	00 00 00 
  804088:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80408b:	89 10                	mov    %edx,(%rax)
  80408d:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804090:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804094:	48 89 c6             	mov    %rax,%rsi
  804097:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  80409e:	00 00 00 
  8040a1:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  8040a8:	00 00 00 
  8040ab:	ff d0                	callq  *%rax
  8040ad:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040b4:	00 00 00 
  8040b7:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8040ba:	89 50 14             	mov    %edx,0x14(%rax)
  8040bd:	bf 02 00 00 00       	mov    $0x2,%edi
  8040c2:	48 b8 6c 3f 80 00 00 	movabs $0x803f6c,%rax
  8040c9:	00 00 00 
  8040cc:	ff d0                	callq  *%rax
  8040ce:	c9                   	leaveq 
  8040cf:	c3                   	retq   

00000000008040d0 <nsipc_shutdown>:
  8040d0:	55                   	push   %rbp
  8040d1:	48 89 e5             	mov    %rsp,%rbp
  8040d4:	48 83 ec 10          	sub    $0x10,%rsp
  8040d8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8040db:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8040de:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040e5:	00 00 00 
  8040e8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8040eb:	89 10                	mov    %edx,(%rax)
  8040ed:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040f4:	00 00 00 
  8040f7:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8040fa:	89 50 04             	mov    %edx,0x4(%rax)
  8040fd:	bf 03 00 00 00       	mov    $0x3,%edi
  804102:	48 b8 6c 3f 80 00 00 	movabs $0x803f6c,%rax
  804109:	00 00 00 
  80410c:	ff d0                	callq  *%rax
  80410e:	c9                   	leaveq 
  80410f:	c3                   	retq   

0000000000804110 <nsipc_close>:
  804110:	55                   	push   %rbp
  804111:	48 89 e5             	mov    %rsp,%rbp
  804114:	48 83 ec 10          	sub    $0x10,%rsp
  804118:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80411b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804122:	00 00 00 
  804125:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804128:	89 10                	mov    %edx,(%rax)
  80412a:	bf 04 00 00 00       	mov    $0x4,%edi
  80412f:	48 b8 6c 3f 80 00 00 	movabs $0x803f6c,%rax
  804136:	00 00 00 
  804139:	ff d0                	callq  *%rax
  80413b:	c9                   	leaveq 
  80413c:	c3                   	retq   

000000000080413d <nsipc_connect>:
  80413d:	55                   	push   %rbp
  80413e:	48 89 e5             	mov    %rsp,%rbp
  804141:	48 83 ec 10          	sub    $0x10,%rsp
  804145:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804148:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80414c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80414f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804156:	00 00 00 
  804159:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80415c:	89 10                	mov    %edx,(%rax)
  80415e:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804161:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804165:	48 89 c6             	mov    %rax,%rsi
  804168:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  80416f:	00 00 00 
  804172:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  804179:	00 00 00 
  80417c:	ff d0                	callq  *%rax
  80417e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804185:	00 00 00 
  804188:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80418b:	89 50 14             	mov    %edx,0x14(%rax)
  80418e:	bf 05 00 00 00       	mov    $0x5,%edi
  804193:	48 b8 6c 3f 80 00 00 	movabs $0x803f6c,%rax
  80419a:	00 00 00 
  80419d:	ff d0                	callq  *%rax
  80419f:	c9                   	leaveq 
  8041a0:	c3                   	retq   

00000000008041a1 <nsipc_listen>:
  8041a1:	55                   	push   %rbp
  8041a2:	48 89 e5             	mov    %rsp,%rbp
  8041a5:	48 83 ec 10          	sub    $0x10,%rsp
  8041a9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8041ac:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8041af:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8041b6:	00 00 00 
  8041b9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8041bc:	89 10                	mov    %edx,(%rax)
  8041be:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8041c5:	00 00 00 
  8041c8:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8041cb:	89 50 04             	mov    %edx,0x4(%rax)
  8041ce:	bf 06 00 00 00       	mov    $0x6,%edi
  8041d3:	48 b8 6c 3f 80 00 00 	movabs $0x803f6c,%rax
  8041da:	00 00 00 
  8041dd:	ff d0                	callq  *%rax
  8041df:	c9                   	leaveq 
  8041e0:	c3                   	retq   

00000000008041e1 <nsipc_recv>:
  8041e1:	55                   	push   %rbp
  8041e2:	48 89 e5             	mov    %rsp,%rbp
  8041e5:	48 83 ec 30          	sub    $0x30,%rsp
  8041e9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8041ec:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8041f0:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8041f3:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8041f6:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8041fd:	00 00 00 
  804200:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804203:	89 10                	mov    %edx,(%rax)
  804205:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80420c:	00 00 00 
  80420f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804212:	89 50 04             	mov    %edx,0x4(%rax)
  804215:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80421c:	00 00 00 
  80421f:	8b 55 dc             	mov    -0x24(%rbp),%edx
  804222:	89 50 08             	mov    %edx,0x8(%rax)
  804225:	bf 07 00 00 00       	mov    $0x7,%edi
  80422a:	48 b8 6c 3f 80 00 00 	movabs $0x803f6c,%rax
  804231:	00 00 00 
  804234:	ff d0                	callq  *%rax
  804236:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804239:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80423d:	78 69                	js     8042a8 <nsipc_recv+0xc7>
  80423f:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  804246:	7f 08                	jg     804250 <nsipc_recv+0x6f>
  804248:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80424b:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  80424e:	7e 35                	jle    804285 <nsipc_recv+0xa4>
  804250:	48 b9 91 57 80 00 00 	movabs $0x805791,%rcx
  804257:	00 00 00 
  80425a:	48 ba a6 57 80 00 00 	movabs $0x8057a6,%rdx
  804261:	00 00 00 
  804264:	be 62 00 00 00       	mov    $0x62,%esi
  804269:	48 bf bb 57 80 00 00 	movabs $0x8057bb,%rdi
  804270:	00 00 00 
  804273:	b8 00 00 00 00       	mov    $0x0,%eax
  804278:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  80427f:	00 00 00 
  804282:	41 ff d0             	callq  *%r8
  804285:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804288:	48 63 d0             	movslq %eax,%rdx
  80428b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80428f:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  804296:	00 00 00 
  804299:	48 89 c7             	mov    %rax,%rdi
  80429c:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  8042a3:	00 00 00 
  8042a6:	ff d0                	callq  *%rax
  8042a8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042ab:	c9                   	leaveq 
  8042ac:	c3                   	retq   

00000000008042ad <nsipc_send>:
  8042ad:	55                   	push   %rbp
  8042ae:	48 89 e5             	mov    %rsp,%rbp
  8042b1:	48 83 ec 20          	sub    $0x20,%rsp
  8042b5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8042b8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8042bc:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8042bf:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8042c2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8042c9:	00 00 00 
  8042cc:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8042cf:	89 10                	mov    %edx,(%rax)
  8042d1:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  8042d8:	7e 35                	jle    80430f <nsipc_send+0x62>
  8042da:	48 b9 ca 57 80 00 00 	movabs $0x8057ca,%rcx
  8042e1:	00 00 00 
  8042e4:	48 ba a6 57 80 00 00 	movabs $0x8057a6,%rdx
  8042eb:	00 00 00 
  8042ee:	be 6d 00 00 00       	mov    $0x6d,%esi
  8042f3:	48 bf bb 57 80 00 00 	movabs $0x8057bb,%rdi
  8042fa:	00 00 00 
  8042fd:	b8 00 00 00 00       	mov    $0x0,%eax
  804302:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  804309:	00 00 00 
  80430c:	41 ff d0             	callq  *%r8
  80430f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804312:	48 63 d0             	movslq %eax,%rdx
  804315:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804319:	48 89 c6             	mov    %rax,%rsi
  80431c:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  804323:	00 00 00 
  804326:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  80432d:	00 00 00 
  804330:	ff d0                	callq  *%rax
  804332:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804339:	00 00 00 
  80433c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80433f:	89 50 04             	mov    %edx,0x4(%rax)
  804342:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804349:	00 00 00 
  80434c:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80434f:	89 50 08             	mov    %edx,0x8(%rax)
  804352:	bf 08 00 00 00       	mov    $0x8,%edi
  804357:	48 b8 6c 3f 80 00 00 	movabs $0x803f6c,%rax
  80435e:	00 00 00 
  804361:	ff d0                	callq  *%rax
  804363:	c9                   	leaveq 
  804364:	c3                   	retq   

0000000000804365 <nsipc_socket>:
  804365:	55                   	push   %rbp
  804366:	48 89 e5             	mov    %rsp,%rbp
  804369:	48 83 ec 10          	sub    $0x10,%rsp
  80436d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804370:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804373:	89 55 f4             	mov    %edx,-0xc(%rbp)
  804376:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80437d:	00 00 00 
  804380:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804383:	89 10                	mov    %edx,(%rax)
  804385:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80438c:	00 00 00 
  80438f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804392:	89 50 04             	mov    %edx,0x4(%rax)
  804395:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80439c:	00 00 00 
  80439f:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8043a2:	89 50 08             	mov    %edx,0x8(%rax)
  8043a5:	bf 09 00 00 00       	mov    $0x9,%edi
  8043aa:	48 b8 6c 3f 80 00 00 	movabs $0x803f6c,%rax
  8043b1:	00 00 00 
  8043b4:	ff d0                	callq  *%rax
  8043b6:	c9                   	leaveq 
  8043b7:	c3                   	retq   

00000000008043b8 <pipe>:
  8043b8:	55                   	push   %rbp
  8043b9:	48 89 e5             	mov    %rsp,%rbp
  8043bc:	53                   	push   %rbx
  8043bd:	48 83 ec 38          	sub    $0x38,%rsp
  8043c1:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8043c5:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  8043c9:	48 89 c7             	mov    %rax,%rdi
  8043cc:	48 b8 cf 2b 80 00 00 	movabs $0x802bcf,%rax
  8043d3:	00 00 00 
  8043d6:	ff d0                	callq  *%rax
  8043d8:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8043db:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8043df:	0f 88 bf 01 00 00    	js     8045a4 <pipe+0x1ec>
  8043e5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043e9:	ba 07 04 00 00       	mov    $0x407,%edx
  8043ee:	48 89 c6             	mov    %rax,%rsi
  8043f1:	bf 00 00 00 00       	mov    $0x0,%edi
  8043f6:	48 b8 3d 24 80 00 00 	movabs $0x80243d,%rax
  8043fd:	00 00 00 
  804400:	ff d0                	callq  *%rax
  804402:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804405:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804409:	0f 88 95 01 00 00    	js     8045a4 <pipe+0x1ec>
  80440f:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  804413:	48 89 c7             	mov    %rax,%rdi
  804416:	48 b8 cf 2b 80 00 00 	movabs $0x802bcf,%rax
  80441d:	00 00 00 
  804420:	ff d0                	callq  *%rax
  804422:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804425:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804429:	0f 88 5d 01 00 00    	js     80458c <pipe+0x1d4>
  80442f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804433:	ba 07 04 00 00       	mov    $0x407,%edx
  804438:	48 89 c6             	mov    %rax,%rsi
  80443b:	bf 00 00 00 00       	mov    $0x0,%edi
  804440:	48 b8 3d 24 80 00 00 	movabs $0x80243d,%rax
  804447:	00 00 00 
  80444a:	ff d0                	callq  *%rax
  80444c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80444f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804453:	0f 88 33 01 00 00    	js     80458c <pipe+0x1d4>
  804459:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80445d:	48 89 c7             	mov    %rax,%rdi
  804460:	48 b8 a4 2b 80 00 00 	movabs $0x802ba4,%rax
  804467:	00 00 00 
  80446a:	ff d0                	callq  *%rax
  80446c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804470:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804474:	ba 07 04 00 00       	mov    $0x407,%edx
  804479:	48 89 c6             	mov    %rax,%rsi
  80447c:	bf 00 00 00 00       	mov    $0x0,%edi
  804481:	48 b8 3d 24 80 00 00 	movabs $0x80243d,%rax
  804488:	00 00 00 
  80448b:	ff d0                	callq  *%rax
  80448d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804490:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804494:	79 05                	jns    80449b <pipe+0xe3>
  804496:	e9 d9 00 00 00       	jmpq   804574 <pipe+0x1bc>
  80449b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80449f:	48 89 c7             	mov    %rax,%rdi
  8044a2:	48 b8 a4 2b 80 00 00 	movabs $0x802ba4,%rax
  8044a9:	00 00 00 
  8044ac:	ff d0                	callq  *%rax
  8044ae:	48 89 c2             	mov    %rax,%rdx
  8044b1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8044b5:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  8044bb:	48 89 d1             	mov    %rdx,%rcx
  8044be:	ba 00 00 00 00       	mov    $0x0,%edx
  8044c3:	48 89 c6             	mov    %rax,%rsi
  8044c6:	bf 00 00 00 00       	mov    $0x0,%edi
  8044cb:	48 b8 8d 24 80 00 00 	movabs $0x80248d,%rax
  8044d2:	00 00 00 
  8044d5:	ff d0                	callq  *%rax
  8044d7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8044da:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8044de:	79 1b                	jns    8044fb <pipe+0x143>
  8044e0:	90                   	nop
  8044e1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8044e5:	48 89 c6             	mov    %rax,%rsi
  8044e8:	bf 00 00 00 00       	mov    $0x0,%edi
  8044ed:	48 b8 e8 24 80 00 00 	movabs $0x8024e8,%rax
  8044f4:	00 00 00 
  8044f7:	ff d0                	callq  *%rax
  8044f9:	eb 79                	jmp    804574 <pipe+0x1bc>
  8044fb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8044ff:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  804506:	00 00 00 
  804509:	8b 12                	mov    (%rdx),%edx
  80450b:	89 10                	mov    %edx,(%rax)
  80450d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804511:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  804518:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80451c:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  804523:	00 00 00 
  804526:	8b 12                	mov    (%rdx),%edx
  804528:	89 10                	mov    %edx,(%rax)
  80452a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80452e:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  804535:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804539:	48 89 c7             	mov    %rax,%rdi
  80453c:	48 b8 81 2b 80 00 00 	movabs $0x802b81,%rax
  804543:	00 00 00 
  804546:	ff d0                	callq  *%rax
  804548:	89 c2                	mov    %eax,%edx
  80454a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80454e:	89 10                	mov    %edx,(%rax)
  804550:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804554:	48 8d 58 04          	lea    0x4(%rax),%rbx
  804558:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80455c:	48 89 c7             	mov    %rax,%rdi
  80455f:	48 b8 81 2b 80 00 00 	movabs $0x802b81,%rax
  804566:	00 00 00 
  804569:	ff d0                	callq  *%rax
  80456b:	89 03                	mov    %eax,(%rbx)
  80456d:	b8 00 00 00 00       	mov    $0x0,%eax
  804572:	eb 33                	jmp    8045a7 <pipe+0x1ef>
  804574:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804578:	48 89 c6             	mov    %rax,%rsi
  80457b:	bf 00 00 00 00       	mov    $0x0,%edi
  804580:	48 b8 e8 24 80 00 00 	movabs $0x8024e8,%rax
  804587:	00 00 00 
  80458a:	ff d0                	callq  *%rax
  80458c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804590:	48 89 c6             	mov    %rax,%rsi
  804593:	bf 00 00 00 00       	mov    $0x0,%edi
  804598:	48 b8 e8 24 80 00 00 	movabs $0x8024e8,%rax
  80459f:	00 00 00 
  8045a2:	ff d0                	callq  *%rax
  8045a4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8045a7:	48 83 c4 38          	add    $0x38,%rsp
  8045ab:	5b                   	pop    %rbx
  8045ac:	5d                   	pop    %rbp
  8045ad:	c3                   	retq   

00000000008045ae <_pipeisclosed>:
  8045ae:	55                   	push   %rbp
  8045af:	48 89 e5             	mov    %rsp,%rbp
  8045b2:	53                   	push   %rbx
  8045b3:	48 83 ec 28          	sub    $0x28,%rsp
  8045b7:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8045bb:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8045bf:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8045c6:	00 00 00 
  8045c9:	48 8b 00             	mov    (%rax),%rax
  8045cc:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8045d2:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8045d5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8045d9:	48 89 c7             	mov    %rax,%rdi
  8045dc:	48 b8 34 4c 80 00 00 	movabs $0x804c34,%rax
  8045e3:	00 00 00 
  8045e6:	ff d0                	callq  *%rax
  8045e8:	89 c3                	mov    %eax,%ebx
  8045ea:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8045ee:	48 89 c7             	mov    %rax,%rdi
  8045f1:	48 b8 34 4c 80 00 00 	movabs $0x804c34,%rax
  8045f8:	00 00 00 
  8045fb:	ff d0                	callq  *%rax
  8045fd:	39 c3                	cmp    %eax,%ebx
  8045ff:	0f 94 c0             	sete   %al
  804602:	0f b6 c0             	movzbl %al,%eax
  804605:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804608:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80460f:	00 00 00 
  804612:	48 8b 00             	mov    (%rax),%rax
  804615:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80461b:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80461e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804621:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804624:	75 05                	jne    80462b <_pipeisclosed+0x7d>
  804626:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804629:	eb 4f                	jmp    80467a <_pipeisclosed+0xcc>
  80462b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80462e:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804631:	74 42                	je     804675 <_pipeisclosed+0xc7>
  804633:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  804637:	75 3c                	jne    804675 <_pipeisclosed+0xc7>
  804639:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804640:	00 00 00 
  804643:	48 8b 00             	mov    (%rax),%rax
  804646:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  80464c:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80464f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804652:	89 c6                	mov    %eax,%esi
  804654:	48 bf db 57 80 00 00 	movabs $0x8057db,%rdi
  80465b:	00 00 00 
  80465e:	b8 00 00 00 00       	mov    $0x0,%eax
  804663:	49 b8 59 0f 80 00 00 	movabs $0x800f59,%r8
  80466a:	00 00 00 
  80466d:	41 ff d0             	callq  *%r8
  804670:	e9 4a ff ff ff       	jmpq   8045bf <_pipeisclosed+0x11>
  804675:	e9 45 ff ff ff       	jmpq   8045bf <_pipeisclosed+0x11>
  80467a:	48 83 c4 28          	add    $0x28,%rsp
  80467e:	5b                   	pop    %rbx
  80467f:	5d                   	pop    %rbp
  804680:	c3                   	retq   

0000000000804681 <pipeisclosed>:
  804681:	55                   	push   %rbp
  804682:	48 89 e5             	mov    %rsp,%rbp
  804685:	48 83 ec 30          	sub    $0x30,%rsp
  804689:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80468c:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  804690:	8b 45 dc             	mov    -0x24(%rbp),%eax
  804693:	48 89 d6             	mov    %rdx,%rsi
  804696:	89 c7                	mov    %eax,%edi
  804698:	48 b8 67 2c 80 00 00 	movabs $0x802c67,%rax
  80469f:	00 00 00 
  8046a2:	ff d0                	callq  *%rax
  8046a4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8046a7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046ab:	79 05                	jns    8046b2 <pipeisclosed+0x31>
  8046ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046b0:	eb 31                	jmp    8046e3 <pipeisclosed+0x62>
  8046b2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8046b6:	48 89 c7             	mov    %rax,%rdi
  8046b9:	48 b8 a4 2b 80 00 00 	movabs $0x802ba4,%rax
  8046c0:	00 00 00 
  8046c3:	ff d0                	callq  *%rax
  8046c5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8046c9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8046cd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8046d1:	48 89 d6             	mov    %rdx,%rsi
  8046d4:	48 89 c7             	mov    %rax,%rdi
  8046d7:	48 b8 ae 45 80 00 00 	movabs $0x8045ae,%rax
  8046de:	00 00 00 
  8046e1:	ff d0                	callq  *%rax
  8046e3:	c9                   	leaveq 
  8046e4:	c3                   	retq   

00000000008046e5 <devpipe_read>:
  8046e5:	55                   	push   %rbp
  8046e6:	48 89 e5             	mov    %rsp,%rbp
  8046e9:	48 83 ec 40          	sub    $0x40,%rsp
  8046ed:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8046f1:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8046f5:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8046f9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8046fd:	48 89 c7             	mov    %rax,%rdi
  804700:	48 b8 a4 2b 80 00 00 	movabs $0x802ba4,%rax
  804707:	00 00 00 
  80470a:	ff d0                	callq  *%rax
  80470c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804710:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804714:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804718:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80471f:	00 
  804720:	e9 92 00 00 00       	jmpq   8047b7 <devpipe_read+0xd2>
  804725:	eb 41                	jmp    804768 <devpipe_read+0x83>
  804727:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  80472c:	74 09                	je     804737 <devpipe_read+0x52>
  80472e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804732:	e9 92 00 00 00       	jmpq   8047c9 <devpipe_read+0xe4>
  804737:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80473b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80473f:	48 89 d6             	mov    %rdx,%rsi
  804742:	48 89 c7             	mov    %rax,%rdi
  804745:	48 b8 ae 45 80 00 00 	movabs $0x8045ae,%rax
  80474c:	00 00 00 
  80474f:	ff d0                	callq  *%rax
  804751:	85 c0                	test   %eax,%eax
  804753:	74 07                	je     80475c <devpipe_read+0x77>
  804755:	b8 00 00 00 00       	mov    $0x0,%eax
  80475a:	eb 6d                	jmp    8047c9 <devpipe_read+0xe4>
  80475c:	48 b8 ff 23 80 00 00 	movabs $0x8023ff,%rax
  804763:	00 00 00 
  804766:	ff d0                	callq  *%rax
  804768:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80476c:	8b 10                	mov    (%rax),%edx
  80476e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804772:	8b 40 04             	mov    0x4(%rax),%eax
  804775:	39 c2                	cmp    %eax,%edx
  804777:	74 ae                	je     804727 <devpipe_read+0x42>
  804779:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80477d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804781:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  804785:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804789:	8b 00                	mov    (%rax),%eax
  80478b:	99                   	cltd   
  80478c:	c1 ea 1b             	shr    $0x1b,%edx
  80478f:	01 d0                	add    %edx,%eax
  804791:	83 e0 1f             	and    $0x1f,%eax
  804794:	29 d0                	sub    %edx,%eax
  804796:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80479a:	48 98                	cltq   
  80479c:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  8047a1:	88 01                	mov    %al,(%rcx)
  8047a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8047a7:	8b 00                	mov    (%rax),%eax
  8047a9:	8d 50 01             	lea    0x1(%rax),%edx
  8047ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8047b0:	89 10                	mov    %edx,(%rax)
  8047b2:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8047b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8047bb:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8047bf:	0f 82 60 ff ff ff    	jb     804725 <devpipe_read+0x40>
  8047c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8047c9:	c9                   	leaveq 
  8047ca:	c3                   	retq   

00000000008047cb <devpipe_write>:
  8047cb:	55                   	push   %rbp
  8047cc:	48 89 e5             	mov    %rsp,%rbp
  8047cf:	48 83 ec 40          	sub    $0x40,%rsp
  8047d3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8047d7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8047db:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8047df:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8047e3:	48 89 c7             	mov    %rax,%rdi
  8047e6:	48 b8 a4 2b 80 00 00 	movabs $0x802ba4,%rax
  8047ed:	00 00 00 
  8047f0:	ff d0                	callq  *%rax
  8047f2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8047f6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8047fa:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8047fe:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804805:	00 
  804806:	e9 8e 00 00 00       	jmpq   804899 <devpipe_write+0xce>
  80480b:	eb 31                	jmp    80483e <devpipe_write+0x73>
  80480d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804811:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804815:	48 89 d6             	mov    %rdx,%rsi
  804818:	48 89 c7             	mov    %rax,%rdi
  80481b:	48 b8 ae 45 80 00 00 	movabs $0x8045ae,%rax
  804822:	00 00 00 
  804825:	ff d0                	callq  *%rax
  804827:	85 c0                	test   %eax,%eax
  804829:	74 07                	je     804832 <devpipe_write+0x67>
  80482b:	b8 00 00 00 00       	mov    $0x0,%eax
  804830:	eb 79                	jmp    8048ab <devpipe_write+0xe0>
  804832:	48 b8 ff 23 80 00 00 	movabs $0x8023ff,%rax
  804839:	00 00 00 
  80483c:	ff d0                	callq  *%rax
  80483e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804842:	8b 40 04             	mov    0x4(%rax),%eax
  804845:	48 63 d0             	movslq %eax,%rdx
  804848:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80484c:	8b 00                	mov    (%rax),%eax
  80484e:	48 98                	cltq   
  804850:	48 83 c0 20          	add    $0x20,%rax
  804854:	48 39 c2             	cmp    %rax,%rdx
  804857:	73 b4                	jae    80480d <devpipe_write+0x42>
  804859:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80485d:	8b 40 04             	mov    0x4(%rax),%eax
  804860:	99                   	cltd   
  804861:	c1 ea 1b             	shr    $0x1b,%edx
  804864:	01 d0                	add    %edx,%eax
  804866:	83 e0 1f             	and    $0x1f,%eax
  804869:	29 d0                	sub    %edx,%eax
  80486b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80486f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  804873:	48 01 ca             	add    %rcx,%rdx
  804876:	0f b6 0a             	movzbl (%rdx),%ecx
  804879:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80487d:	48 98                	cltq   
  80487f:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  804883:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804887:	8b 40 04             	mov    0x4(%rax),%eax
  80488a:	8d 50 01             	lea    0x1(%rax),%edx
  80488d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804891:	89 50 04             	mov    %edx,0x4(%rax)
  804894:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804899:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80489d:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8048a1:	0f 82 64 ff ff ff    	jb     80480b <devpipe_write+0x40>
  8048a7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8048ab:	c9                   	leaveq 
  8048ac:	c3                   	retq   

00000000008048ad <devpipe_stat>:
  8048ad:	55                   	push   %rbp
  8048ae:	48 89 e5             	mov    %rsp,%rbp
  8048b1:	48 83 ec 20          	sub    $0x20,%rsp
  8048b5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8048b9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8048bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8048c1:	48 89 c7             	mov    %rax,%rdi
  8048c4:	48 b8 a4 2b 80 00 00 	movabs $0x802ba4,%rax
  8048cb:	00 00 00 
  8048ce:	ff d0                	callq  *%rax
  8048d0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8048d4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8048d8:	48 be ee 57 80 00 00 	movabs $0x8057ee,%rsi
  8048df:	00 00 00 
  8048e2:	48 89 c7             	mov    %rax,%rdi
  8048e5:	48 b8 0e 1b 80 00 00 	movabs $0x801b0e,%rax
  8048ec:	00 00 00 
  8048ef:	ff d0                	callq  *%rax
  8048f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8048f5:	8b 50 04             	mov    0x4(%rax),%edx
  8048f8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8048fc:	8b 00                	mov    (%rax),%eax
  8048fe:	29 c2                	sub    %eax,%edx
  804900:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804904:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80490a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80490e:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804915:	00 00 00 
  804918:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80491c:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  804923:	00 00 00 
  804926:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  80492d:	b8 00 00 00 00       	mov    $0x0,%eax
  804932:	c9                   	leaveq 
  804933:	c3                   	retq   

0000000000804934 <devpipe_close>:
  804934:	55                   	push   %rbp
  804935:	48 89 e5             	mov    %rsp,%rbp
  804938:	48 83 ec 10          	sub    $0x10,%rsp
  80493c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804940:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804944:	48 89 c6             	mov    %rax,%rsi
  804947:	bf 00 00 00 00       	mov    $0x0,%edi
  80494c:	48 b8 e8 24 80 00 00 	movabs $0x8024e8,%rax
  804953:	00 00 00 
  804956:	ff d0                	callq  *%rax
  804958:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80495c:	48 89 c7             	mov    %rax,%rdi
  80495f:	48 b8 a4 2b 80 00 00 	movabs $0x802ba4,%rax
  804966:	00 00 00 
  804969:	ff d0                	callq  *%rax
  80496b:	48 89 c6             	mov    %rax,%rsi
  80496e:	bf 00 00 00 00       	mov    $0x0,%edi
  804973:	48 b8 e8 24 80 00 00 	movabs $0x8024e8,%rax
  80497a:	00 00 00 
  80497d:	ff d0                	callq  *%rax
  80497f:	c9                   	leaveq 
  804980:	c3                   	retq   

0000000000804981 <cputchar>:
  804981:	55                   	push   %rbp
  804982:	48 89 e5             	mov    %rsp,%rbp
  804985:	48 83 ec 20          	sub    $0x20,%rsp
  804989:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80498c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80498f:	88 45 ff             	mov    %al,-0x1(%rbp)
  804992:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804996:	be 01 00 00 00       	mov    $0x1,%esi
  80499b:	48 89 c7             	mov    %rax,%rdi
  80499e:	48 b8 f5 22 80 00 00 	movabs $0x8022f5,%rax
  8049a5:	00 00 00 
  8049a8:	ff d0                	callq  *%rax
  8049aa:	c9                   	leaveq 
  8049ab:	c3                   	retq   

00000000008049ac <getchar>:
  8049ac:	55                   	push   %rbp
  8049ad:	48 89 e5             	mov    %rsp,%rbp
  8049b0:	48 83 ec 10          	sub    $0x10,%rsp
  8049b4:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  8049b8:	ba 01 00 00 00       	mov    $0x1,%edx
  8049bd:	48 89 c6             	mov    %rax,%rsi
  8049c0:	bf 00 00 00 00       	mov    $0x0,%edi
  8049c5:	48 b8 99 30 80 00 00 	movabs $0x803099,%rax
  8049cc:	00 00 00 
  8049cf:	ff d0                	callq  *%rax
  8049d1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8049d4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8049d8:	79 05                	jns    8049df <getchar+0x33>
  8049da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049dd:	eb 14                	jmp    8049f3 <getchar+0x47>
  8049df:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8049e3:	7f 07                	jg     8049ec <getchar+0x40>
  8049e5:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  8049ea:	eb 07                	jmp    8049f3 <getchar+0x47>
  8049ec:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  8049f0:	0f b6 c0             	movzbl %al,%eax
  8049f3:	c9                   	leaveq 
  8049f4:	c3                   	retq   

00000000008049f5 <iscons>:
  8049f5:	55                   	push   %rbp
  8049f6:	48 89 e5             	mov    %rsp,%rbp
  8049f9:	48 83 ec 20          	sub    $0x20,%rsp
  8049fd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804a00:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804a04:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804a07:	48 89 d6             	mov    %rdx,%rsi
  804a0a:	89 c7                	mov    %eax,%edi
  804a0c:	48 b8 67 2c 80 00 00 	movabs $0x802c67,%rax
  804a13:	00 00 00 
  804a16:	ff d0                	callq  *%rax
  804a18:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804a1b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804a1f:	79 05                	jns    804a26 <iscons+0x31>
  804a21:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a24:	eb 1a                	jmp    804a40 <iscons+0x4b>
  804a26:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a2a:	8b 10                	mov    (%rax),%edx
  804a2c:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  804a33:	00 00 00 
  804a36:	8b 00                	mov    (%rax),%eax
  804a38:	39 c2                	cmp    %eax,%edx
  804a3a:	0f 94 c0             	sete   %al
  804a3d:	0f b6 c0             	movzbl %al,%eax
  804a40:	c9                   	leaveq 
  804a41:	c3                   	retq   

0000000000804a42 <opencons>:
  804a42:	55                   	push   %rbp
  804a43:	48 89 e5             	mov    %rsp,%rbp
  804a46:	48 83 ec 10          	sub    $0x10,%rsp
  804a4a:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804a4e:	48 89 c7             	mov    %rax,%rdi
  804a51:	48 b8 cf 2b 80 00 00 	movabs $0x802bcf,%rax
  804a58:	00 00 00 
  804a5b:	ff d0                	callq  *%rax
  804a5d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804a60:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804a64:	79 05                	jns    804a6b <opencons+0x29>
  804a66:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a69:	eb 5b                	jmp    804ac6 <opencons+0x84>
  804a6b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a6f:	ba 07 04 00 00       	mov    $0x407,%edx
  804a74:	48 89 c6             	mov    %rax,%rsi
  804a77:	bf 00 00 00 00       	mov    $0x0,%edi
  804a7c:	48 b8 3d 24 80 00 00 	movabs $0x80243d,%rax
  804a83:	00 00 00 
  804a86:	ff d0                	callq  *%rax
  804a88:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804a8b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804a8f:	79 05                	jns    804a96 <opencons+0x54>
  804a91:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a94:	eb 30                	jmp    804ac6 <opencons+0x84>
  804a96:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a9a:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  804aa1:	00 00 00 
  804aa4:	8b 12                	mov    (%rdx),%edx
  804aa6:	89 10                	mov    %edx,(%rax)
  804aa8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804aac:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804ab3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804ab7:	48 89 c7             	mov    %rax,%rdi
  804aba:	48 b8 81 2b 80 00 00 	movabs $0x802b81,%rax
  804ac1:	00 00 00 
  804ac4:	ff d0                	callq  *%rax
  804ac6:	c9                   	leaveq 
  804ac7:	c3                   	retq   

0000000000804ac8 <devcons_read>:
  804ac8:	55                   	push   %rbp
  804ac9:	48 89 e5             	mov    %rsp,%rbp
  804acc:	48 83 ec 30          	sub    $0x30,%rsp
  804ad0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804ad4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804ad8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804adc:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804ae1:	75 07                	jne    804aea <devcons_read+0x22>
  804ae3:	b8 00 00 00 00       	mov    $0x0,%eax
  804ae8:	eb 4b                	jmp    804b35 <devcons_read+0x6d>
  804aea:	eb 0c                	jmp    804af8 <devcons_read+0x30>
  804aec:	48 b8 ff 23 80 00 00 	movabs $0x8023ff,%rax
  804af3:	00 00 00 
  804af6:	ff d0                	callq  *%rax
  804af8:	48 b8 3f 23 80 00 00 	movabs $0x80233f,%rax
  804aff:	00 00 00 
  804b02:	ff d0                	callq  *%rax
  804b04:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804b07:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804b0b:	74 df                	je     804aec <devcons_read+0x24>
  804b0d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804b11:	79 05                	jns    804b18 <devcons_read+0x50>
  804b13:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b16:	eb 1d                	jmp    804b35 <devcons_read+0x6d>
  804b18:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804b1c:	75 07                	jne    804b25 <devcons_read+0x5d>
  804b1e:	b8 00 00 00 00       	mov    $0x0,%eax
  804b23:	eb 10                	jmp    804b35 <devcons_read+0x6d>
  804b25:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b28:	89 c2                	mov    %eax,%edx
  804b2a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804b2e:	88 10                	mov    %dl,(%rax)
  804b30:	b8 01 00 00 00       	mov    $0x1,%eax
  804b35:	c9                   	leaveq 
  804b36:	c3                   	retq   

0000000000804b37 <devcons_write>:
  804b37:	55                   	push   %rbp
  804b38:	48 89 e5             	mov    %rsp,%rbp
  804b3b:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  804b42:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804b49:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804b50:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804b57:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804b5e:	eb 76                	jmp    804bd6 <devcons_write+0x9f>
  804b60:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804b67:	89 c2                	mov    %eax,%edx
  804b69:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b6c:	29 c2                	sub    %eax,%edx
  804b6e:	89 d0                	mov    %edx,%eax
  804b70:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804b73:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804b76:	83 f8 7f             	cmp    $0x7f,%eax
  804b79:	76 07                	jbe    804b82 <devcons_write+0x4b>
  804b7b:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804b82:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804b85:	48 63 d0             	movslq %eax,%rdx
  804b88:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b8b:	48 63 c8             	movslq %eax,%rcx
  804b8e:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804b95:	48 01 c1             	add    %rax,%rcx
  804b98:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804b9f:	48 89 ce             	mov    %rcx,%rsi
  804ba2:	48 89 c7             	mov    %rax,%rdi
  804ba5:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  804bac:	00 00 00 
  804baf:	ff d0                	callq  *%rax
  804bb1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804bb4:	48 63 d0             	movslq %eax,%rdx
  804bb7:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804bbe:	48 89 d6             	mov    %rdx,%rsi
  804bc1:	48 89 c7             	mov    %rax,%rdi
  804bc4:	48 b8 f5 22 80 00 00 	movabs $0x8022f5,%rax
  804bcb:	00 00 00 
  804bce:	ff d0                	callq  *%rax
  804bd0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804bd3:	01 45 fc             	add    %eax,-0x4(%rbp)
  804bd6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804bd9:	48 98                	cltq   
  804bdb:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804be2:	0f 82 78 ff ff ff    	jb     804b60 <devcons_write+0x29>
  804be8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804beb:	c9                   	leaveq 
  804bec:	c3                   	retq   

0000000000804bed <devcons_close>:
  804bed:	55                   	push   %rbp
  804bee:	48 89 e5             	mov    %rsp,%rbp
  804bf1:	48 83 ec 08          	sub    $0x8,%rsp
  804bf5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804bf9:	b8 00 00 00 00       	mov    $0x0,%eax
  804bfe:	c9                   	leaveq 
  804bff:	c3                   	retq   

0000000000804c00 <devcons_stat>:
  804c00:	55                   	push   %rbp
  804c01:	48 89 e5             	mov    %rsp,%rbp
  804c04:	48 83 ec 10          	sub    $0x10,%rsp
  804c08:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804c0c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804c10:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804c14:	48 be fa 57 80 00 00 	movabs $0x8057fa,%rsi
  804c1b:	00 00 00 
  804c1e:	48 89 c7             	mov    %rax,%rdi
  804c21:	48 b8 0e 1b 80 00 00 	movabs $0x801b0e,%rax
  804c28:	00 00 00 
  804c2b:	ff d0                	callq  *%rax
  804c2d:	b8 00 00 00 00       	mov    $0x0,%eax
  804c32:	c9                   	leaveq 
  804c33:	c3                   	retq   

0000000000804c34 <pageref>:
  804c34:	55                   	push   %rbp
  804c35:	48 89 e5             	mov    %rsp,%rbp
  804c38:	48 83 ec 18          	sub    $0x18,%rsp
  804c3c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804c40:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804c44:	48 c1 e8 15          	shr    $0x15,%rax
  804c48:	48 89 c2             	mov    %rax,%rdx
  804c4b:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804c52:	01 00 00 
  804c55:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804c59:	83 e0 01             	and    $0x1,%eax
  804c5c:	48 85 c0             	test   %rax,%rax
  804c5f:	75 07                	jne    804c68 <pageref+0x34>
  804c61:	b8 00 00 00 00       	mov    $0x0,%eax
  804c66:	eb 53                	jmp    804cbb <pageref+0x87>
  804c68:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804c6c:	48 c1 e8 0c          	shr    $0xc,%rax
  804c70:	48 89 c2             	mov    %rax,%rdx
  804c73:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804c7a:	01 00 00 
  804c7d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804c81:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804c85:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c89:	83 e0 01             	and    $0x1,%eax
  804c8c:	48 85 c0             	test   %rax,%rax
  804c8f:	75 07                	jne    804c98 <pageref+0x64>
  804c91:	b8 00 00 00 00       	mov    $0x0,%eax
  804c96:	eb 23                	jmp    804cbb <pageref+0x87>
  804c98:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c9c:	48 c1 e8 0c          	shr    $0xc,%rax
  804ca0:	48 89 c2             	mov    %rax,%rdx
  804ca3:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804caa:	00 00 00 
  804cad:	48 c1 e2 04          	shl    $0x4,%rdx
  804cb1:	48 01 d0             	add    %rdx,%rax
  804cb4:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804cb8:	0f b7 c0             	movzwl %ax,%eax
  804cbb:	c9                   	leaveq 
  804cbc:	c3                   	retq   
