
vmm/guest/obj/net/testoutput:     file format elf64-x86-64


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
  80003c:	e8 59 05 00 00       	callq  80059a <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	53                   	push   %rbx
  800048:	48 83 ec 28          	sub    $0x28,%rsp
  80004c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80004f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  800053:	48 b8 e1 1c 80 00 00 	movabs $0x801ce1,%rax
  80005a:	00 00 00 
  80005d:	ff d0                	callq  *%rax
  80005f:	89 45 e8             	mov    %eax,-0x18(%rbp)
  800062:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800069:	00 00 00 
  80006c:	48 bb 20 4d 80 00 00 	movabs $0x804d20,%rbx
  800073:	00 00 00 
  800076:	48 89 18             	mov    %rbx,(%rax)
  800079:	48 b8 dd 24 80 00 00 	movabs $0x8024dd,%rax
  800080:	00 00 00 
  800083:	ff d0                	callq  *%rax
  800085:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  80008c:	00 00 00 
  80008f:	89 02                	mov    %eax,(%rdx)
  800091:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  800098:	00 00 00 
  80009b:	8b 00                	mov    (%rax),%eax
  80009d:	85 c0                	test   %eax,%eax
  80009f:	79 2a                	jns    8000cb <umain+0x88>
  8000a1:	48 ba 2b 4d 80 00 00 	movabs $0x804d2b,%rdx
  8000a8:	00 00 00 
  8000ab:	be 17 00 00 00       	mov    $0x17,%esi
  8000b0:	48 bf 39 4d 80 00 00 	movabs $0x804d39,%rdi
  8000b7:	00 00 00 
  8000ba:	b8 00 00 00 00       	mov    $0x0,%eax
  8000bf:	48 b9 40 06 80 00 00 	movabs $0x800640,%rcx
  8000c6:	00 00 00 
  8000c9:	ff d1                	callq  *%rcx
  8000cb:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8000d2:	00 00 00 
  8000d5:	8b 00                	mov    (%rax),%eax
  8000d7:	85 c0                	test   %eax,%eax
  8000d9:	75 16                	jne    8000f1 <umain+0xae>
  8000db:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8000de:	89 c7                	mov    %eax,%edi
  8000e0:	48 b8 83 04 80 00 00 	movabs $0x800483,%rax
  8000e7:	00 00 00 
  8000ea:	ff d0                	callq  *%rax
  8000ec:	e9 50 01 00 00       	jmpq   800241 <umain+0x1fe>
  8000f1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  8000f8:	e9 1b 01 00 00       	jmpq   800218 <umain+0x1d5>
  8000fd:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800104:	00 00 00 
  800107:	48 8b 00             	mov    (%rax),%rax
  80010a:	ba 07 00 00 00       	mov    $0x7,%edx
  80010f:	48 89 c6             	mov    %rax,%rsi
  800112:	bf 00 00 00 00       	mov    $0x0,%edi
  800117:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  80011e:	00 00 00 
  800121:	ff d0                	callq  *%rax
  800123:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  800126:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80012a:	79 30                	jns    80015c <umain+0x119>
  80012c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80012f:	89 c1                	mov    %eax,%ecx
  800131:	48 ba 4d 4d 80 00 00 	movabs $0x804d4d,%rdx
  800138:	00 00 00 
  80013b:	be 1f 00 00 00       	mov    $0x1f,%esi
  800140:	48 bf 39 4d 80 00 00 	movabs $0x804d39,%rdi
  800147:	00 00 00 
  80014a:	b8 00 00 00 00       	mov    $0x0,%eax
  80014f:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  800156:	00 00 00 
  800159:	41 ff d0             	callq  *%r8
  80015c:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800163:	00 00 00 
  800166:	48 8b 18             	mov    (%rax),%rbx
  800169:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800170:	00 00 00 
  800173:	48 8b 00             	mov    (%rax),%rax
  800176:	48 8d 78 04          	lea    0x4(%rax),%rdi
  80017a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80017d:	89 c1                	mov    %eax,%ecx
  80017f:	48 ba 60 4d 80 00 00 	movabs $0x804d60,%rdx
  800186:	00 00 00 
  800189:	be fc 0f 00 00       	mov    $0xffc,%esi
  80018e:	b8 00 00 00 00       	mov    $0x0,%eax
  800193:	49 b8 e1 12 80 00 00 	movabs $0x8012e1,%r8
  80019a:	00 00 00 
  80019d:	41 ff d0             	callq  *%r8
  8001a0:	89 03                	mov    %eax,(%rbx)
  8001a2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8001a5:	89 c6                	mov    %eax,%esi
  8001a7:	48 bf 6c 4d 80 00 00 	movabs $0x804d6c,%rdi
  8001ae:	00 00 00 
  8001b1:	b8 00 00 00 00       	mov    $0x0,%eax
  8001b6:	48 ba 79 08 80 00 00 	movabs $0x800879,%rdx
  8001bd:	00 00 00 
  8001c0:	ff d2                	callq  *%rdx
  8001c2:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8001c9:	00 00 00 
  8001cc:	48 8b 10             	mov    (%rax),%rdx
  8001cf:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8001d6:	00 00 00 
  8001d9:	8b 00                	mov    (%rax),%eax
  8001db:	b9 07 00 00 00       	mov    $0x7,%ecx
  8001e0:	be 0b 00 00 00       	mov    $0xb,%esi
  8001e5:	89 c7                	mov    %eax,%edi
  8001e7:	48 b8 13 28 80 00 00 	movabs $0x802813,%rax
  8001ee:	00 00 00 
  8001f1:	ff d0                	callq  *%rax
  8001f3:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8001fa:	00 00 00 
  8001fd:	48 8b 00             	mov    (%rax),%rax
  800200:	48 89 c6             	mov    %rax,%rsi
  800203:	bf 00 00 00 00       	mov    $0x0,%edi
  800208:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  80020f:	00 00 00 
  800212:	ff d0                	callq  *%rax
  800214:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
  800218:	83 7d ec 09          	cmpl   $0x9,-0x14(%rbp)
  80021c:	0f 8e db fe ff ff    	jle    8000fd <umain+0xba>
  800222:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  800229:	eb 10                	jmp    80023b <umain+0x1f8>
  80022b:	48 b8 1f 1d 80 00 00 	movabs $0x801d1f,%rax
  800232:	00 00 00 
  800235:	ff d0                	callq  *%rax
  800237:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
  80023b:	83 7d ec 13          	cmpl   $0x13,-0x14(%rbp)
  80023f:	7e ea                	jle    80022b <umain+0x1e8>
  800241:	48 83 c4 28          	add    $0x28,%rsp
  800245:	5b                   	pop    %rbx
  800246:	5d                   	pop    %rbp
  800247:	c3                   	retq   

0000000000800248 <timer>:
  800248:	55                   	push   %rbp
  800249:	48 89 e5             	mov    %rsp,%rbp
  80024c:	53                   	push   %rbx
  80024d:	48 83 ec 28          	sub    $0x28,%rsp
  800251:	89 7d dc             	mov    %edi,-0x24(%rbp)
  800254:	89 75 d8             	mov    %esi,-0x28(%rbp)
  800257:	48 b8 ca 1f 80 00 00 	movabs $0x801fca,%rax
  80025e:	00 00 00 
  800261:	ff d0                	callq  *%rax
  800263:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800266:	01 d0                	add    %edx,%eax
  800268:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80026b:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800272:	00 00 00 
  800275:	48 bb 88 4d 80 00 00 	movabs $0x804d88,%rbx
  80027c:	00 00 00 
  80027f:	48 89 18             	mov    %rbx,(%rax)
  800282:	eb 0c                	jmp    800290 <timer+0x48>
  800284:	48 b8 1f 1d 80 00 00 	movabs $0x801d1f,%rax
  80028b:	00 00 00 
  80028e:	ff d0                	callq  *%rax
  800290:	48 b8 ca 1f 80 00 00 	movabs $0x801fca,%rax
  800297:	00 00 00 
  80029a:	ff d0                	callq  *%rax
  80029c:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80029f:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8002a2:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8002a5:	73 06                	jae    8002ad <timer+0x65>
  8002a7:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8002ab:	79 d7                	jns    800284 <timer+0x3c>
  8002ad:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8002b1:	79 30                	jns    8002e3 <timer+0x9b>
  8002b3:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8002b6:	89 c1                	mov    %eax,%ecx
  8002b8:	48 ba 91 4d 80 00 00 	movabs $0x804d91,%rdx
  8002bf:	00 00 00 
  8002c2:	be 10 00 00 00       	mov    $0x10,%esi
  8002c7:	48 bf a3 4d 80 00 00 	movabs $0x804da3,%rdi
  8002ce:	00 00 00 
  8002d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8002d6:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  8002dd:	00 00 00 
  8002e0:	41 ff d0             	callq  *%r8
  8002e3:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8002e6:	b9 00 00 00 00       	mov    $0x0,%ecx
  8002eb:	ba 00 00 00 00       	mov    $0x0,%edx
  8002f0:	be 0c 00 00 00       	mov    $0xc,%esi
  8002f5:	89 c7                	mov    %eax,%edi
  8002f7:	48 b8 13 28 80 00 00 	movabs $0x802813,%rax
  8002fe:	00 00 00 
  800301:	ff d0                	callq  *%rax
  800303:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  800307:	ba 00 00 00 00       	mov    $0x0,%edx
  80030c:	be 00 00 00 00       	mov    $0x0,%esi
  800311:	48 89 c7             	mov    %rax,%rdi
  800314:	48 b8 52 27 80 00 00 	movabs $0x802752,%rax
  80031b:	00 00 00 
  80031e:	ff d0                	callq  *%rax
  800320:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  800323:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800326:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800329:	39 c2                	cmp    %eax,%edx
  80032b:	74 22                	je     80034f <timer+0x107>
  80032d:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800330:	89 c6                	mov    %eax,%esi
  800332:	48 bf b8 4d 80 00 00 	movabs $0x804db8,%rdi
  800339:	00 00 00 
  80033c:	b8 00 00 00 00       	mov    $0x0,%eax
  800341:	48 ba 79 08 80 00 00 	movabs $0x800879,%rdx
  800348:	00 00 00 
  80034b:	ff d2                	callq  *%rdx
  80034d:	eb b4                	jmp    800303 <timer+0xbb>
  80034f:	48 b8 ca 1f 80 00 00 	movabs $0x801fca,%rax
  800356:	00 00 00 
  800359:	ff d0                	callq  *%rax
  80035b:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80035e:	01 d0                	add    %edx,%eax
  800360:	89 45 ec             	mov    %eax,-0x14(%rbp)
  800363:	90                   	nop
  800364:	e9 27 ff ff ff       	jmpq   800290 <timer+0x48>

0000000000800369 <input>:
  800369:	55                   	push   %rbp
  80036a:	48 89 e5             	mov    %rsp,%rbp
  80036d:	53                   	push   %rbx
  80036e:	48 83 ec 28          	sub    $0x28,%rsp
  800372:	89 7d dc             	mov    %edi,-0x24(%rbp)
  800375:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80037c:	00 00 00 
  80037f:	48 bb f3 4d 80 00 00 	movabs $0x804df3,%rbx
  800386:	00 00 00 
  800389:	48 89 18             	mov    %rbx,(%rax)
  80038c:	ba 07 00 00 00       	mov    $0x7,%edx
  800391:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  800398:	00 00 00 
  80039b:	bf 00 00 00 00       	mov    $0x0,%edi
  8003a0:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  8003a7:	00 00 00 
  8003aa:	ff d0                	callq  *%rax
  8003ac:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8003af:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8003b3:	79 30                	jns    8003e5 <input+0x7c>
  8003b5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8003b8:	89 c1                	mov    %eax,%ecx
  8003ba:	48 ba fc 4d 80 00 00 	movabs $0x804dfc,%rdx
  8003c1:	00 00 00 
  8003c4:	be 0e 00 00 00       	mov    $0xe,%esi
  8003c9:	48 bf 0f 4e 80 00 00 	movabs $0x804e0f,%rdi
  8003d0:	00 00 00 
  8003d3:	b8 00 00 00 00       	mov    $0x0,%eax
  8003d8:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  8003df:	00 00 00 
  8003e2:	41 ff d0             	callq  *%r8
  8003e5:	be ee 05 00 00       	mov    $0x5ee,%esi
  8003ea:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  8003f1:	00 00 00 
  8003f4:	48 b8 50 20 80 00 00 	movabs $0x802050,%rax
  8003fb:	00 00 00 
  8003fe:	ff d0                	callq  *%rax
  800400:	89 45 ec             	mov    %eax,-0x14(%rbp)
  800403:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  800407:	75 0e                	jne    800417 <input+0xae>
  800409:	48 b8 1f 1d 80 00 00 	movabs $0x801d1f,%rax
  800410:	00 00 00 
  800413:	ff d0                	callq  *%rax
  800415:	eb 67                	jmp    80047e <input+0x115>
  800417:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80041b:	79 22                	jns    80043f <input+0xd6>
  80041d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800420:	89 c6                	mov    %eax,%esi
  800422:	48 bf 1e 4e 80 00 00 	movabs $0x804e1e,%rdi
  800429:	00 00 00 
  80042c:	b8 00 00 00 00       	mov    $0x0,%eax
  800431:	48 ba 79 08 80 00 00 	movabs $0x800879,%rdx
  800438:	00 00 00 
  80043b:	ff d2                	callq  *%rdx
  80043d:	eb 3f                	jmp    80047e <input+0x115>
  80043f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  800443:	7e 39                	jle    80047e <input+0x115>
  800445:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80044c:	00 00 00 
  80044f:	8b 55 ec             	mov    -0x14(%rbp),%edx
  800452:	89 10                	mov    %edx,(%rax)
  800454:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800457:	b9 05 00 00 00       	mov    $0x5,%ecx
  80045c:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  800463:	00 00 00 
  800466:	be 0a 00 00 00       	mov    $0xa,%esi
  80046b:	89 c7                	mov    %eax,%edi
  80046d:	48 b8 13 28 80 00 00 	movabs $0x802813,%rax
  800474:	00 00 00 
  800477:	ff d0                	callq  *%rax
  800479:	e9 0e ff ff ff       	jmpq   80038c <input+0x23>
  80047e:	e9 09 ff ff ff       	jmpq   80038c <input+0x23>

0000000000800483 <output>:
  800483:	55                   	push   %rbp
  800484:	48 89 e5             	mov    %rsp,%rbp
  800487:	53                   	push   %rbx
  800488:	48 83 ec 28          	sub    $0x28,%rsp
  80048c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80048f:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800496:	00 00 00 
  800499:	48 bb 40 4e 80 00 00 	movabs $0x804e40,%rbx
  8004a0:	00 00 00 
  8004a3:	48 89 18             	mov    %rbx,(%rax)
  8004a6:	48 8d 45 e4          	lea    -0x1c(%rbp),%rax
  8004aa:	ba 00 00 00 00       	mov    $0x0,%edx
  8004af:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  8004b6:	00 00 00 
  8004b9:	48 89 c7             	mov    %rax,%rdi
  8004bc:	48 b8 52 27 80 00 00 	movabs $0x802752,%rax
  8004c3:	00 00 00 
  8004c6:	ff d0                	callq  *%rax
  8004c8:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8004cb:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8004ce:	3b 45 dc             	cmp    -0x24(%rbp),%eax
  8004d1:	74 35                	je     800508 <output+0x85>
  8004d3:	48 b9 4a 4e 80 00 00 	movabs $0x804e4a,%rcx
  8004da:	00 00 00 
  8004dd:	48 ba 5b 4e 80 00 00 	movabs $0x804e5b,%rdx
  8004e4:	00 00 00 
  8004e7:	be 11 00 00 00       	mov    $0x11,%esi
  8004ec:	48 bf 70 4e 80 00 00 	movabs $0x804e70,%rdi
  8004f3:	00 00 00 
  8004f6:	b8 00 00 00 00       	mov    $0x0,%eax
  8004fb:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  800502:	00 00 00 
  800505:	41 ff d0             	callq  *%r8
  800508:	83 7d ec 0b          	cmpl   $0xb,-0x14(%rbp)
  80050c:	74 35                	je     800543 <output+0xc0>
  80050e:	48 b9 80 4e 80 00 00 	movabs $0x804e80,%rcx
  800515:	00 00 00 
  800518:	48 ba 5b 4e 80 00 00 	movabs $0x804e5b,%rdx
  80051f:	00 00 00 
  800522:	be 12 00 00 00       	mov    $0x12,%esi
  800527:	48 bf 70 4e 80 00 00 	movabs $0x804e70,%rdi
  80052e:	00 00 00 
  800531:	b8 00 00 00 00       	mov    $0x0,%eax
  800536:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  80053d:	00 00 00 
  800540:	41 ff d0             	callq  *%r8
  800543:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80054a:	00 00 00 
  80054d:	8b 00                	mov    (%rax),%eax
  80054f:	89 c6                	mov    %eax,%esi
  800551:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  800558:	00 00 00 
  80055b:	48 b8 08 20 80 00 00 	movabs $0x802008,%rax
  800562:	00 00 00 
  800565:	ff d0                	callq  *%rax
  800567:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80056a:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80056e:	79 25                	jns    800595 <output+0x112>
  800570:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800573:	89 c6                	mov    %eax,%esi
  800575:	48 bf 98 4e 80 00 00 	movabs $0x804e98,%rdi
  80057c:	00 00 00 
  80057f:	b8 00 00 00 00       	mov    $0x0,%eax
  800584:	48 ba 79 08 80 00 00 	movabs $0x800879,%rdx
  80058b:	00 00 00 
  80058e:	ff d2                	callq  *%rdx
  800590:	e9 11 ff ff ff       	jmpq   8004a6 <output+0x23>
  800595:	e9 0c ff ff ff       	jmpq   8004a6 <output+0x23>

000000000080059a <libmain>:
  80059a:	55                   	push   %rbp
  80059b:	48 89 e5             	mov    %rsp,%rbp
  80059e:	48 83 ec 10          	sub    $0x10,%rsp
  8005a2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8005a5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8005a9:	48 b8 e1 1c 80 00 00 	movabs $0x801ce1,%rax
  8005b0:	00 00 00 
  8005b3:	ff d0                	callq  *%rax
  8005b5:	25 ff 03 00 00       	and    $0x3ff,%eax
  8005ba:	48 98                	cltq   
  8005bc:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8005c3:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8005ca:	00 00 00 
  8005cd:	48 01 c2             	add    %rax,%rdx
  8005d0:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8005d7:	00 00 00 
  8005da:	48 89 10             	mov    %rdx,(%rax)
  8005dd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8005e1:	7e 14                	jle    8005f7 <libmain+0x5d>
  8005e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8005e7:	48 8b 10             	mov    (%rax),%rdx
  8005ea:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8005f1:	00 00 00 
  8005f4:	48 89 10             	mov    %rdx,(%rax)
  8005f7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8005fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8005fe:	48 89 d6             	mov    %rdx,%rsi
  800601:	89 c7                	mov    %eax,%edi
  800603:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  80060a:	00 00 00 
  80060d:	ff d0                	callq  *%rax
  80060f:	48 b8 1d 06 80 00 00 	movabs $0x80061d,%rax
  800616:	00 00 00 
  800619:	ff d0                	callq  *%rax
  80061b:	c9                   	leaveq 
  80061c:	c3                   	retq   

000000000080061d <exit>:
  80061d:	55                   	push   %rbp
  80061e:	48 89 e5             	mov    %rsp,%rbp
  800621:	48 b8 f7 2d 80 00 00 	movabs $0x802df7,%rax
  800628:	00 00 00 
  80062b:	ff d0                	callq  *%rax
  80062d:	bf 00 00 00 00       	mov    $0x0,%edi
  800632:	48 b8 9d 1c 80 00 00 	movabs $0x801c9d,%rax
  800639:	00 00 00 
  80063c:	ff d0                	callq  *%rax
  80063e:	5d                   	pop    %rbp
  80063f:	c3                   	retq   

0000000000800640 <_panic>:
  800640:	55                   	push   %rbp
  800641:	48 89 e5             	mov    %rsp,%rbp
  800644:	53                   	push   %rbx
  800645:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  80064c:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800653:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800659:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800660:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800667:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  80066e:	84 c0                	test   %al,%al
  800670:	74 23                	je     800695 <_panic+0x55>
  800672:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800679:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  80067d:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800681:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800685:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800689:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  80068d:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800691:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800695:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  80069c:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  8006a3:	00 00 00 
  8006a6:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  8006ad:	00 00 00 
  8006b0:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8006b4:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8006bb:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8006c2:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8006c9:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8006d0:	00 00 00 
  8006d3:	48 8b 18             	mov    (%rax),%rbx
  8006d6:	48 b8 e1 1c 80 00 00 	movabs $0x801ce1,%rax
  8006dd:	00 00 00 
  8006e0:	ff d0                	callq  *%rax
  8006e2:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  8006e8:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8006ef:	41 89 c8             	mov    %ecx,%r8d
  8006f2:	48 89 d1             	mov    %rdx,%rcx
  8006f5:	48 89 da             	mov    %rbx,%rdx
  8006f8:	89 c6                	mov    %eax,%esi
  8006fa:	48 bf c8 4e 80 00 00 	movabs $0x804ec8,%rdi
  800701:	00 00 00 
  800704:	b8 00 00 00 00       	mov    $0x0,%eax
  800709:	49 b9 79 08 80 00 00 	movabs $0x800879,%r9
  800710:	00 00 00 
  800713:	41 ff d1             	callq  *%r9
  800716:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  80071d:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800724:	48 89 d6             	mov    %rdx,%rsi
  800727:	48 89 c7             	mov    %rax,%rdi
  80072a:	48 b8 cd 07 80 00 00 	movabs $0x8007cd,%rax
  800731:	00 00 00 
  800734:	ff d0                	callq  *%rax
  800736:	48 bf eb 4e 80 00 00 	movabs $0x804eeb,%rdi
  80073d:	00 00 00 
  800740:	b8 00 00 00 00       	mov    $0x0,%eax
  800745:	48 ba 79 08 80 00 00 	movabs $0x800879,%rdx
  80074c:	00 00 00 
  80074f:	ff d2                	callq  *%rdx
  800751:	cc                   	int3   
  800752:	eb fd                	jmp    800751 <_panic+0x111>

0000000000800754 <putch>:
  800754:	55                   	push   %rbp
  800755:	48 89 e5             	mov    %rsp,%rbp
  800758:	48 83 ec 10          	sub    $0x10,%rsp
  80075c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80075f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800763:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800767:	8b 00                	mov    (%rax),%eax
  800769:	8d 48 01             	lea    0x1(%rax),%ecx
  80076c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800770:	89 0a                	mov    %ecx,(%rdx)
  800772:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800775:	89 d1                	mov    %edx,%ecx
  800777:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80077b:	48 98                	cltq   
  80077d:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800781:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800785:	8b 00                	mov    (%rax),%eax
  800787:	3d ff 00 00 00       	cmp    $0xff,%eax
  80078c:	75 2c                	jne    8007ba <putch+0x66>
  80078e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800792:	8b 00                	mov    (%rax),%eax
  800794:	48 98                	cltq   
  800796:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80079a:	48 83 c2 08          	add    $0x8,%rdx
  80079e:	48 89 c6             	mov    %rax,%rsi
  8007a1:	48 89 d7             	mov    %rdx,%rdi
  8007a4:	48 b8 15 1c 80 00 00 	movabs $0x801c15,%rax
  8007ab:	00 00 00 
  8007ae:	ff d0                	callq  *%rax
  8007b0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8007b4:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8007ba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8007be:	8b 40 04             	mov    0x4(%rax),%eax
  8007c1:	8d 50 01             	lea    0x1(%rax),%edx
  8007c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8007c8:	89 50 04             	mov    %edx,0x4(%rax)
  8007cb:	c9                   	leaveq 
  8007cc:	c3                   	retq   

00000000008007cd <vcprintf>:
  8007cd:	55                   	push   %rbp
  8007ce:	48 89 e5             	mov    %rsp,%rbp
  8007d1:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8007d8:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8007df:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8007e6:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8007ed:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8007f4:	48 8b 0a             	mov    (%rdx),%rcx
  8007f7:	48 89 08             	mov    %rcx,(%rax)
  8007fa:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8007fe:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800802:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800806:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80080a:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800811:	00 00 00 
  800814:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80081b:	00 00 00 
  80081e:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800825:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  80082c:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800833:	48 89 c6             	mov    %rax,%rsi
  800836:	48 bf 54 07 80 00 00 	movabs $0x800754,%rdi
  80083d:	00 00 00 
  800840:	48 b8 2c 0c 80 00 00 	movabs $0x800c2c,%rax
  800847:	00 00 00 
  80084a:	ff d0                	callq  *%rax
  80084c:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800852:	48 98                	cltq   
  800854:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80085b:	48 83 c2 08          	add    $0x8,%rdx
  80085f:	48 89 c6             	mov    %rax,%rsi
  800862:	48 89 d7             	mov    %rdx,%rdi
  800865:	48 b8 15 1c 80 00 00 	movabs $0x801c15,%rax
  80086c:	00 00 00 
  80086f:	ff d0                	callq  *%rax
  800871:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800877:	c9                   	leaveq 
  800878:	c3                   	retq   

0000000000800879 <cprintf>:
  800879:	55                   	push   %rbp
  80087a:	48 89 e5             	mov    %rsp,%rbp
  80087d:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800884:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  80088b:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800892:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800899:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8008a0:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8008a7:	84 c0                	test   %al,%al
  8008a9:	74 20                	je     8008cb <cprintf+0x52>
  8008ab:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8008af:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8008b3:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8008b7:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8008bb:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8008bf:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8008c3:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8008c7:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8008cb:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8008d2:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8008d9:	00 00 00 
  8008dc:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8008e3:	00 00 00 
  8008e6:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8008ea:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8008f1:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8008f8:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8008ff:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800906:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80090d:	48 8b 0a             	mov    (%rdx),%rcx
  800910:	48 89 08             	mov    %rcx,(%rax)
  800913:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800917:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80091b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80091f:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800923:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  80092a:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800931:	48 89 d6             	mov    %rdx,%rsi
  800934:	48 89 c7             	mov    %rax,%rdi
  800937:	48 b8 cd 07 80 00 00 	movabs $0x8007cd,%rax
  80093e:	00 00 00 
  800941:	ff d0                	callq  *%rax
  800943:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800949:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80094f:	c9                   	leaveq 
  800950:	c3                   	retq   

0000000000800951 <printnum>:
  800951:	55                   	push   %rbp
  800952:	48 89 e5             	mov    %rsp,%rbp
  800955:	53                   	push   %rbx
  800956:	48 83 ec 38          	sub    $0x38,%rsp
  80095a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80095e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800962:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800966:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  800969:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  80096d:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  800971:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  800974:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800978:	77 3b                	ja     8009b5 <printnum+0x64>
  80097a:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80097d:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  800981:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  800984:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800988:	ba 00 00 00 00       	mov    $0x0,%edx
  80098d:	48 f7 f3             	div    %rbx
  800990:	48 89 c2             	mov    %rax,%rdx
  800993:	8b 7d cc             	mov    -0x34(%rbp),%edi
  800996:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800999:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  80099d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009a1:	41 89 f9             	mov    %edi,%r9d
  8009a4:	48 89 c7             	mov    %rax,%rdi
  8009a7:	48 b8 51 09 80 00 00 	movabs $0x800951,%rax
  8009ae:	00 00 00 
  8009b1:	ff d0                	callq  *%rax
  8009b3:	eb 1e                	jmp    8009d3 <printnum+0x82>
  8009b5:	eb 12                	jmp    8009c9 <printnum+0x78>
  8009b7:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8009bb:	8b 55 cc             	mov    -0x34(%rbp),%edx
  8009be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009c2:	48 89 ce             	mov    %rcx,%rsi
  8009c5:	89 d7                	mov    %edx,%edi
  8009c7:	ff d0                	callq  *%rax
  8009c9:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  8009cd:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  8009d1:	7f e4                	jg     8009b7 <printnum+0x66>
  8009d3:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8009d6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8009da:	ba 00 00 00 00       	mov    $0x0,%edx
  8009df:	48 f7 f1             	div    %rcx
  8009e2:	48 89 d0             	mov    %rdx,%rax
  8009e5:	48 ba f0 50 80 00 00 	movabs $0x8050f0,%rdx
  8009ec:	00 00 00 
  8009ef:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  8009f3:	0f be d0             	movsbl %al,%edx
  8009f6:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8009fa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009fe:	48 89 ce             	mov    %rcx,%rsi
  800a01:	89 d7                	mov    %edx,%edi
  800a03:	ff d0                	callq  *%rax
  800a05:	48 83 c4 38          	add    $0x38,%rsp
  800a09:	5b                   	pop    %rbx
  800a0a:	5d                   	pop    %rbp
  800a0b:	c3                   	retq   

0000000000800a0c <getuint>:
  800a0c:	55                   	push   %rbp
  800a0d:	48 89 e5             	mov    %rsp,%rbp
  800a10:	48 83 ec 1c          	sub    $0x1c,%rsp
  800a14:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800a18:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800a1b:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800a1f:	7e 52                	jle    800a73 <getuint+0x67>
  800a21:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a25:	8b 00                	mov    (%rax),%eax
  800a27:	83 f8 30             	cmp    $0x30,%eax
  800a2a:	73 24                	jae    800a50 <getuint+0x44>
  800a2c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a30:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a34:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a38:	8b 00                	mov    (%rax),%eax
  800a3a:	89 c0                	mov    %eax,%eax
  800a3c:	48 01 d0             	add    %rdx,%rax
  800a3f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a43:	8b 12                	mov    (%rdx),%edx
  800a45:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800a48:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a4c:	89 0a                	mov    %ecx,(%rdx)
  800a4e:	eb 17                	jmp    800a67 <getuint+0x5b>
  800a50:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a54:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800a58:	48 89 d0             	mov    %rdx,%rax
  800a5b:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800a5f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a63:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a67:	48 8b 00             	mov    (%rax),%rax
  800a6a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a6e:	e9 a3 00 00 00       	jmpq   800b16 <getuint+0x10a>
  800a73:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800a77:	74 4f                	je     800ac8 <getuint+0xbc>
  800a79:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a7d:	8b 00                	mov    (%rax),%eax
  800a7f:	83 f8 30             	cmp    $0x30,%eax
  800a82:	73 24                	jae    800aa8 <getuint+0x9c>
  800a84:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a88:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a8c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a90:	8b 00                	mov    (%rax),%eax
  800a92:	89 c0                	mov    %eax,%eax
  800a94:	48 01 d0             	add    %rdx,%rax
  800a97:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a9b:	8b 12                	mov    (%rdx),%edx
  800a9d:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800aa0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800aa4:	89 0a                	mov    %ecx,(%rdx)
  800aa6:	eb 17                	jmp    800abf <getuint+0xb3>
  800aa8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800aac:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800ab0:	48 89 d0             	mov    %rdx,%rax
  800ab3:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800ab7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800abb:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800abf:	48 8b 00             	mov    (%rax),%rax
  800ac2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800ac6:	eb 4e                	jmp    800b16 <getuint+0x10a>
  800ac8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800acc:	8b 00                	mov    (%rax),%eax
  800ace:	83 f8 30             	cmp    $0x30,%eax
  800ad1:	73 24                	jae    800af7 <getuint+0xeb>
  800ad3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ad7:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800adb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800adf:	8b 00                	mov    (%rax),%eax
  800ae1:	89 c0                	mov    %eax,%eax
  800ae3:	48 01 d0             	add    %rdx,%rax
  800ae6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800aea:	8b 12                	mov    (%rdx),%edx
  800aec:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800aef:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800af3:	89 0a                	mov    %ecx,(%rdx)
  800af5:	eb 17                	jmp    800b0e <getuint+0x102>
  800af7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800afb:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800aff:	48 89 d0             	mov    %rdx,%rax
  800b02:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800b06:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b0a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800b0e:	8b 00                	mov    (%rax),%eax
  800b10:	89 c0                	mov    %eax,%eax
  800b12:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800b16:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800b1a:	c9                   	leaveq 
  800b1b:	c3                   	retq   

0000000000800b1c <getint>:
  800b1c:	55                   	push   %rbp
  800b1d:	48 89 e5             	mov    %rsp,%rbp
  800b20:	48 83 ec 1c          	sub    $0x1c,%rsp
  800b24:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800b28:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800b2b:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800b2f:	7e 52                	jle    800b83 <getint+0x67>
  800b31:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b35:	8b 00                	mov    (%rax),%eax
  800b37:	83 f8 30             	cmp    $0x30,%eax
  800b3a:	73 24                	jae    800b60 <getint+0x44>
  800b3c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b40:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800b44:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b48:	8b 00                	mov    (%rax),%eax
  800b4a:	89 c0                	mov    %eax,%eax
  800b4c:	48 01 d0             	add    %rdx,%rax
  800b4f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b53:	8b 12                	mov    (%rdx),%edx
  800b55:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800b58:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b5c:	89 0a                	mov    %ecx,(%rdx)
  800b5e:	eb 17                	jmp    800b77 <getint+0x5b>
  800b60:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b64:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800b68:	48 89 d0             	mov    %rdx,%rax
  800b6b:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800b6f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b73:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800b77:	48 8b 00             	mov    (%rax),%rax
  800b7a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800b7e:	e9 a3 00 00 00       	jmpq   800c26 <getint+0x10a>
  800b83:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800b87:	74 4f                	je     800bd8 <getint+0xbc>
  800b89:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b8d:	8b 00                	mov    (%rax),%eax
  800b8f:	83 f8 30             	cmp    $0x30,%eax
  800b92:	73 24                	jae    800bb8 <getint+0x9c>
  800b94:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b98:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800b9c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ba0:	8b 00                	mov    (%rax),%eax
  800ba2:	89 c0                	mov    %eax,%eax
  800ba4:	48 01 d0             	add    %rdx,%rax
  800ba7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bab:	8b 12                	mov    (%rdx),%edx
  800bad:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800bb0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bb4:	89 0a                	mov    %ecx,(%rdx)
  800bb6:	eb 17                	jmp    800bcf <getint+0xb3>
  800bb8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bbc:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800bc0:	48 89 d0             	mov    %rdx,%rax
  800bc3:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800bc7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bcb:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800bcf:	48 8b 00             	mov    (%rax),%rax
  800bd2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800bd6:	eb 4e                	jmp    800c26 <getint+0x10a>
  800bd8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bdc:	8b 00                	mov    (%rax),%eax
  800bde:	83 f8 30             	cmp    $0x30,%eax
  800be1:	73 24                	jae    800c07 <getint+0xeb>
  800be3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800be7:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800beb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bef:	8b 00                	mov    (%rax),%eax
  800bf1:	89 c0                	mov    %eax,%eax
  800bf3:	48 01 d0             	add    %rdx,%rax
  800bf6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bfa:	8b 12                	mov    (%rdx),%edx
  800bfc:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800bff:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800c03:	89 0a                	mov    %ecx,(%rdx)
  800c05:	eb 17                	jmp    800c1e <getint+0x102>
  800c07:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c0b:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800c0f:	48 89 d0             	mov    %rdx,%rax
  800c12:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800c16:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800c1a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800c1e:	8b 00                	mov    (%rax),%eax
  800c20:	48 98                	cltq   
  800c22:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800c26:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800c2a:	c9                   	leaveq 
  800c2b:	c3                   	retq   

0000000000800c2c <vprintfmt>:
  800c2c:	55                   	push   %rbp
  800c2d:	48 89 e5             	mov    %rsp,%rbp
  800c30:	41 54                	push   %r12
  800c32:	53                   	push   %rbx
  800c33:	48 83 ec 60          	sub    $0x60,%rsp
  800c37:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800c3b:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800c3f:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800c43:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800c47:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c4b:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800c4f:	48 8b 0a             	mov    (%rdx),%rcx
  800c52:	48 89 08             	mov    %rcx,(%rax)
  800c55:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800c59:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800c5d:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800c61:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800c65:	eb 17                	jmp    800c7e <vprintfmt+0x52>
  800c67:	85 db                	test   %ebx,%ebx
  800c69:	0f 84 cc 04 00 00    	je     80113b <vprintfmt+0x50f>
  800c6f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c73:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c77:	48 89 d6             	mov    %rdx,%rsi
  800c7a:	89 df                	mov    %ebx,%edi
  800c7c:	ff d0                	callq  *%rax
  800c7e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800c82:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800c86:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800c8a:	0f b6 00             	movzbl (%rax),%eax
  800c8d:	0f b6 d8             	movzbl %al,%ebx
  800c90:	83 fb 25             	cmp    $0x25,%ebx
  800c93:	75 d2                	jne    800c67 <vprintfmt+0x3b>
  800c95:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800c99:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800ca0:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800ca7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800cae:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800cb5:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800cb9:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800cbd:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800cc1:	0f b6 00             	movzbl (%rax),%eax
  800cc4:	0f b6 d8             	movzbl %al,%ebx
  800cc7:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800cca:	83 f8 55             	cmp    $0x55,%eax
  800ccd:	0f 87 34 04 00 00    	ja     801107 <vprintfmt+0x4db>
  800cd3:	89 c0                	mov    %eax,%eax
  800cd5:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800cdc:	00 
  800cdd:	48 b8 18 51 80 00 00 	movabs $0x805118,%rax
  800ce4:	00 00 00 
  800ce7:	48 01 d0             	add    %rdx,%rax
  800cea:	48 8b 00             	mov    (%rax),%rax
  800ced:	ff e0                	jmpq   *%rax
  800cef:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800cf3:	eb c0                	jmp    800cb5 <vprintfmt+0x89>
  800cf5:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800cf9:	eb ba                	jmp    800cb5 <vprintfmt+0x89>
  800cfb:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800d02:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800d05:	89 d0                	mov    %edx,%eax
  800d07:	c1 e0 02             	shl    $0x2,%eax
  800d0a:	01 d0                	add    %edx,%eax
  800d0c:	01 c0                	add    %eax,%eax
  800d0e:	01 d8                	add    %ebx,%eax
  800d10:	83 e8 30             	sub    $0x30,%eax
  800d13:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800d16:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800d1a:	0f b6 00             	movzbl (%rax),%eax
  800d1d:	0f be d8             	movsbl %al,%ebx
  800d20:	83 fb 2f             	cmp    $0x2f,%ebx
  800d23:	7e 0c                	jle    800d31 <vprintfmt+0x105>
  800d25:	83 fb 39             	cmp    $0x39,%ebx
  800d28:	7f 07                	jg     800d31 <vprintfmt+0x105>
  800d2a:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800d2f:	eb d1                	jmp    800d02 <vprintfmt+0xd6>
  800d31:	eb 58                	jmp    800d8b <vprintfmt+0x15f>
  800d33:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d36:	83 f8 30             	cmp    $0x30,%eax
  800d39:	73 17                	jae    800d52 <vprintfmt+0x126>
  800d3b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800d3f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d42:	89 c0                	mov    %eax,%eax
  800d44:	48 01 d0             	add    %rdx,%rax
  800d47:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d4a:	83 c2 08             	add    $0x8,%edx
  800d4d:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d50:	eb 0f                	jmp    800d61 <vprintfmt+0x135>
  800d52:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800d56:	48 89 d0             	mov    %rdx,%rax
  800d59:	48 83 c2 08          	add    $0x8,%rdx
  800d5d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d61:	8b 00                	mov    (%rax),%eax
  800d63:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800d66:	eb 23                	jmp    800d8b <vprintfmt+0x15f>
  800d68:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d6c:	79 0c                	jns    800d7a <vprintfmt+0x14e>
  800d6e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800d75:	e9 3b ff ff ff       	jmpq   800cb5 <vprintfmt+0x89>
  800d7a:	e9 36 ff ff ff       	jmpq   800cb5 <vprintfmt+0x89>
  800d7f:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800d86:	e9 2a ff ff ff       	jmpq   800cb5 <vprintfmt+0x89>
  800d8b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d8f:	79 12                	jns    800da3 <vprintfmt+0x177>
  800d91:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800d94:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800d97:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800d9e:	e9 12 ff ff ff       	jmpq   800cb5 <vprintfmt+0x89>
  800da3:	e9 0d ff ff ff       	jmpq   800cb5 <vprintfmt+0x89>
  800da8:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800dac:	e9 04 ff ff ff       	jmpq   800cb5 <vprintfmt+0x89>
  800db1:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800db4:	83 f8 30             	cmp    $0x30,%eax
  800db7:	73 17                	jae    800dd0 <vprintfmt+0x1a4>
  800db9:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800dbd:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800dc0:	89 c0                	mov    %eax,%eax
  800dc2:	48 01 d0             	add    %rdx,%rax
  800dc5:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800dc8:	83 c2 08             	add    $0x8,%edx
  800dcb:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800dce:	eb 0f                	jmp    800ddf <vprintfmt+0x1b3>
  800dd0:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800dd4:	48 89 d0             	mov    %rdx,%rax
  800dd7:	48 83 c2 08          	add    $0x8,%rdx
  800ddb:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ddf:	8b 10                	mov    (%rax),%edx
  800de1:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800de5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800de9:	48 89 ce             	mov    %rcx,%rsi
  800dec:	89 d7                	mov    %edx,%edi
  800dee:	ff d0                	callq  *%rax
  800df0:	e9 40 03 00 00       	jmpq   801135 <vprintfmt+0x509>
  800df5:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800df8:	83 f8 30             	cmp    $0x30,%eax
  800dfb:	73 17                	jae    800e14 <vprintfmt+0x1e8>
  800dfd:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800e01:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e04:	89 c0                	mov    %eax,%eax
  800e06:	48 01 d0             	add    %rdx,%rax
  800e09:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e0c:	83 c2 08             	add    $0x8,%edx
  800e0f:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800e12:	eb 0f                	jmp    800e23 <vprintfmt+0x1f7>
  800e14:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800e18:	48 89 d0             	mov    %rdx,%rax
  800e1b:	48 83 c2 08          	add    $0x8,%rdx
  800e1f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800e23:	8b 18                	mov    (%rax),%ebx
  800e25:	85 db                	test   %ebx,%ebx
  800e27:	79 02                	jns    800e2b <vprintfmt+0x1ff>
  800e29:	f7 db                	neg    %ebx
  800e2b:	83 fb 15             	cmp    $0x15,%ebx
  800e2e:	7f 16                	jg     800e46 <vprintfmt+0x21a>
  800e30:	48 b8 40 50 80 00 00 	movabs $0x805040,%rax
  800e37:	00 00 00 
  800e3a:	48 63 d3             	movslq %ebx,%rdx
  800e3d:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800e41:	4d 85 e4             	test   %r12,%r12
  800e44:	75 2e                	jne    800e74 <vprintfmt+0x248>
  800e46:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800e4a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e4e:	89 d9                	mov    %ebx,%ecx
  800e50:	48 ba 01 51 80 00 00 	movabs $0x805101,%rdx
  800e57:	00 00 00 
  800e5a:	48 89 c7             	mov    %rax,%rdi
  800e5d:	b8 00 00 00 00       	mov    $0x0,%eax
  800e62:	49 b8 44 11 80 00 00 	movabs $0x801144,%r8
  800e69:	00 00 00 
  800e6c:	41 ff d0             	callq  *%r8
  800e6f:	e9 c1 02 00 00       	jmpq   801135 <vprintfmt+0x509>
  800e74:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800e78:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e7c:	4c 89 e1             	mov    %r12,%rcx
  800e7f:	48 ba 0a 51 80 00 00 	movabs $0x80510a,%rdx
  800e86:	00 00 00 
  800e89:	48 89 c7             	mov    %rax,%rdi
  800e8c:	b8 00 00 00 00       	mov    $0x0,%eax
  800e91:	49 b8 44 11 80 00 00 	movabs $0x801144,%r8
  800e98:	00 00 00 
  800e9b:	41 ff d0             	callq  *%r8
  800e9e:	e9 92 02 00 00       	jmpq   801135 <vprintfmt+0x509>
  800ea3:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ea6:	83 f8 30             	cmp    $0x30,%eax
  800ea9:	73 17                	jae    800ec2 <vprintfmt+0x296>
  800eab:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800eaf:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800eb2:	89 c0                	mov    %eax,%eax
  800eb4:	48 01 d0             	add    %rdx,%rax
  800eb7:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800eba:	83 c2 08             	add    $0x8,%edx
  800ebd:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ec0:	eb 0f                	jmp    800ed1 <vprintfmt+0x2a5>
  800ec2:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800ec6:	48 89 d0             	mov    %rdx,%rax
  800ec9:	48 83 c2 08          	add    $0x8,%rdx
  800ecd:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ed1:	4c 8b 20             	mov    (%rax),%r12
  800ed4:	4d 85 e4             	test   %r12,%r12
  800ed7:	75 0a                	jne    800ee3 <vprintfmt+0x2b7>
  800ed9:	49 bc 0d 51 80 00 00 	movabs $0x80510d,%r12
  800ee0:	00 00 00 
  800ee3:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800ee7:	7e 3f                	jle    800f28 <vprintfmt+0x2fc>
  800ee9:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800eed:	74 39                	je     800f28 <vprintfmt+0x2fc>
  800eef:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800ef2:	48 98                	cltq   
  800ef4:	48 89 c6             	mov    %rax,%rsi
  800ef7:	4c 89 e7             	mov    %r12,%rdi
  800efa:	48 b8 f0 13 80 00 00 	movabs $0x8013f0,%rax
  800f01:	00 00 00 
  800f04:	ff d0                	callq  *%rax
  800f06:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800f09:	eb 17                	jmp    800f22 <vprintfmt+0x2f6>
  800f0b:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800f0f:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800f13:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f17:	48 89 ce             	mov    %rcx,%rsi
  800f1a:	89 d7                	mov    %edx,%edi
  800f1c:	ff d0                	callq  *%rax
  800f1e:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800f22:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800f26:	7f e3                	jg     800f0b <vprintfmt+0x2df>
  800f28:	eb 37                	jmp    800f61 <vprintfmt+0x335>
  800f2a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800f2e:	74 1e                	je     800f4e <vprintfmt+0x322>
  800f30:	83 fb 1f             	cmp    $0x1f,%ebx
  800f33:	7e 05                	jle    800f3a <vprintfmt+0x30e>
  800f35:	83 fb 7e             	cmp    $0x7e,%ebx
  800f38:	7e 14                	jle    800f4e <vprintfmt+0x322>
  800f3a:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f3e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f42:	48 89 d6             	mov    %rdx,%rsi
  800f45:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800f4a:	ff d0                	callq  *%rax
  800f4c:	eb 0f                	jmp    800f5d <vprintfmt+0x331>
  800f4e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f52:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f56:	48 89 d6             	mov    %rdx,%rsi
  800f59:	89 df                	mov    %ebx,%edi
  800f5b:	ff d0                	callq  *%rax
  800f5d:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800f61:	4c 89 e0             	mov    %r12,%rax
  800f64:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800f68:	0f b6 00             	movzbl (%rax),%eax
  800f6b:	0f be d8             	movsbl %al,%ebx
  800f6e:	85 db                	test   %ebx,%ebx
  800f70:	74 10                	je     800f82 <vprintfmt+0x356>
  800f72:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800f76:	78 b2                	js     800f2a <vprintfmt+0x2fe>
  800f78:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800f7c:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800f80:	79 a8                	jns    800f2a <vprintfmt+0x2fe>
  800f82:	eb 16                	jmp    800f9a <vprintfmt+0x36e>
  800f84:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f88:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f8c:	48 89 d6             	mov    %rdx,%rsi
  800f8f:	bf 20 00 00 00       	mov    $0x20,%edi
  800f94:	ff d0                	callq  *%rax
  800f96:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800f9a:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800f9e:	7f e4                	jg     800f84 <vprintfmt+0x358>
  800fa0:	e9 90 01 00 00       	jmpq   801135 <vprintfmt+0x509>
  800fa5:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800fa9:	be 03 00 00 00       	mov    $0x3,%esi
  800fae:	48 89 c7             	mov    %rax,%rdi
  800fb1:	48 b8 1c 0b 80 00 00 	movabs $0x800b1c,%rax
  800fb8:	00 00 00 
  800fbb:	ff d0                	callq  *%rax
  800fbd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800fc1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fc5:	48 85 c0             	test   %rax,%rax
  800fc8:	79 1d                	jns    800fe7 <vprintfmt+0x3bb>
  800fca:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800fce:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800fd2:	48 89 d6             	mov    %rdx,%rsi
  800fd5:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800fda:	ff d0                	callq  *%rax
  800fdc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fe0:	48 f7 d8             	neg    %rax
  800fe3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800fe7:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800fee:	e9 d5 00 00 00       	jmpq   8010c8 <vprintfmt+0x49c>
  800ff3:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ff7:	be 03 00 00 00       	mov    $0x3,%esi
  800ffc:	48 89 c7             	mov    %rax,%rdi
  800fff:	48 b8 0c 0a 80 00 00 	movabs $0x800a0c,%rax
  801006:	00 00 00 
  801009:	ff d0                	callq  *%rax
  80100b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80100f:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  801016:	e9 ad 00 00 00       	jmpq   8010c8 <vprintfmt+0x49c>
  80101b:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80101f:	be 03 00 00 00       	mov    $0x3,%esi
  801024:	48 89 c7             	mov    %rax,%rdi
  801027:	48 b8 0c 0a 80 00 00 	movabs $0x800a0c,%rax
  80102e:	00 00 00 
  801031:	ff d0                	callq  *%rax
  801033:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801037:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  80103e:	e9 85 00 00 00       	jmpq   8010c8 <vprintfmt+0x49c>
  801043:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801047:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80104b:	48 89 d6             	mov    %rdx,%rsi
  80104e:	bf 30 00 00 00       	mov    $0x30,%edi
  801053:	ff d0                	callq  *%rax
  801055:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801059:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80105d:	48 89 d6             	mov    %rdx,%rsi
  801060:	bf 78 00 00 00       	mov    $0x78,%edi
  801065:	ff d0                	callq  *%rax
  801067:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80106a:	83 f8 30             	cmp    $0x30,%eax
  80106d:	73 17                	jae    801086 <vprintfmt+0x45a>
  80106f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801073:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801076:	89 c0                	mov    %eax,%eax
  801078:	48 01 d0             	add    %rdx,%rax
  80107b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80107e:	83 c2 08             	add    $0x8,%edx
  801081:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801084:	eb 0f                	jmp    801095 <vprintfmt+0x469>
  801086:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80108a:	48 89 d0             	mov    %rdx,%rax
  80108d:	48 83 c2 08          	add    $0x8,%rdx
  801091:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801095:	48 8b 00             	mov    (%rax),%rax
  801098:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80109c:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  8010a3:	eb 23                	jmp    8010c8 <vprintfmt+0x49c>
  8010a5:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8010a9:	be 03 00 00 00       	mov    $0x3,%esi
  8010ae:	48 89 c7             	mov    %rax,%rdi
  8010b1:	48 b8 0c 0a 80 00 00 	movabs $0x800a0c,%rax
  8010b8:	00 00 00 
  8010bb:	ff d0                	callq  *%rax
  8010bd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8010c1:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  8010c8:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  8010cd:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  8010d0:	8b 7d dc             	mov    -0x24(%rbp),%edi
  8010d3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010d7:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8010db:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8010df:	45 89 c1             	mov    %r8d,%r9d
  8010e2:	41 89 f8             	mov    %edi,%r8d
  8010e5:	48 89 c7             	mov    %rax,%rdi
  8010e8:	48 b8 51 09 80 00 00 	movabs $0x800951,%rax
  8010ef:	00 00 00 
  8010f2:	ff d0                	callq  *%rax
  8010f4:	eb 3f                	jmp    801135 <vprintfmt+0x509>
  8010f6:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8010fa:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8010fe:	48 89 d6             	mov    %rdx,%rsi
  801101:	89 df                	mov    %ebx,%edi
  801103:	ff d0                	callq  *%rax
  801105:	eb 2e                	jmp    801135 <vprintfmt+0x509>
  801107:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80110b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80110f:	48 89 d6             	mov    %rdx,%rsi
  801112:	bf 25 00 00 00       	mov    $0x25,%edi
  801117:	ff d0                	callq  *%rax
  801119:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  80111e:	eb 05                	jmp    801125 <vprintfmt+0x4f9>
  801120:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  801125:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801129:	48 83 e8 01          	sub    $0x1,%rax
  80112d:	0f b6 00             	movzbl (%rax),%eax
  801130:	3c 25                	cmp    $0x25,%al
  801132:	75 ec                	jne    801120 <vprintfmt+0x4f4>
  801134:	90                   	nop
  801135:	90                   	nop
  801136:	e9 43 fb ff ff       	jmpq   800c7e <vprintfmt+0x52>
  80113b:	48 83 c4 60          	add    $0x60,%rsp
  80113f:	5b                   	pop    %rbx
  801140:	41 5c                	pop    %r12
  801142:	5d                   	pop    %rbp
  801143:	c3                   	retq   

0000000000801144 <printfmt>:
  801144:	55                   	push   %rbp
  801145:	48 89 e5             	mov    %rsp,%rbp
  801148:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  80114f:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  801156:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  80115d:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801164:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80116b:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801172:	84 c0                	test   %al,%al
  801174:	74 20                	je     801196 <printfmt+0x52>
  801176:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80117a:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80117e:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801182:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801186:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80118a:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80118e:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801192:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801196:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  80119d:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  8011a4:	00 00 00 
  8011a7:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  8011ae:	00 00 00 
  8011b1:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8011b5:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8011bc:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8011c3:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  8011ca:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  8011d1:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8011d8:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  8011df:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  8011e6:	48 89 c7             	mov    %rax,%rdi
  8011e9:	48 b8 2c 0c 80 00 00 	movabs $0x800c2c,%rax
  8011f0:	00 00 00 
  8011f3:	ff d0                	callq  *%rax
  8011f5:	c9                   	leaveq 
  8011f6:	c3                   	retq   

00000000008011f7 <sprintputch>:
  8011f7:	55                   	push   %rbp
  8011f8:	48 89 e5             	mov    %rsp,%rbp
  8011fb:	48 83 ec 10          	sub    $0x10,%rsp
  8011ff:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801202:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801206:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80120a:	8b 40 10             	mov    0x10(%rax),%eax
  80120d:	8d 50 01             	lea    0x1(%rax),%edx
  801210:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801214:	89 50 10             	mov    %edx,0x10(%rax)
  801217:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80121b:	48 8b 10             	mov    (%rax),%rdx
  80121e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801222:	48 8b 40 08          	mov    0x8(%rax),%rax
  801226:	48 39 c2             	cmp    %rax,%rdx
  801229:	73 17                	jae    801242 <sprintputch+0x4b>
  80122b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80122f:	48 8b 00             	mov    (%rax),%rax
  801232:	48 8d 48 01          	lea    0x1(%rax),%rcx
  801236:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80123a:	48 89 0a             	mov    %rcx,(%rdx)
  80123d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801240:	88 10                	mov    %dl,(%rax)
  801242:	c9                   	leaveq 
  801243:	c3                   	retq   

0000000000801244 <vsnprintf>:
  801244:	55                   	push   %rbp
  801245:	48 89 e5             	mov    %rsp,%rbp
  801248:	48 83 ec 50          	sub    $0x50,%rsp
  80124c:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  801250:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  801253:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  801257:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  80125b:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  80125f:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  801263:	48 8b 0a             	mov    (%rdx),%rcx
  801266:	48 89 08             	mov    %rcx,(%rax)
  801269:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80126d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801271:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801275:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801279:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80127d:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  801281:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801284:	48 98                	cltq   
  801286:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80128a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80128e:	48 01 d0             	add    %rdx,%rax
  801291:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801295:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80129c:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  8012a1:	74 06                	je     8012a9 <vsnprintf+0x65>
  8012a3:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  8012a7:	7f 07                	jg     8012b0 <vsnprintf+0x6c>
  8012a9:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8012ae:	eb 2f                	jmp    8012df <vsnprintf+0x9b>
  8012b0:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  8012b4:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  8012b8:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8012bc:	48 89 c6             	mov    %rax,%rsi
  8012bf:	48 bf f7 11 80 00 00 	movabs $0x8011f7,%rdi
  8012c6:	00 00 00 
  8012c9:	48 b8 2c 0c 80 00 00 	movabs $0x800c2c,%rax
  8012d0:	00 00 00 
  8012d3:	ff d0                	callq  *%rax
  8012d5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8012d9:	c6 00 00             	movb   $0x0,(%rax)
  8012dc:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8012df:	c9                   	leaveq 
  8012e0:	c3                   	retq   

00000000008012e1 <snprintf>:
  8012e1:	55                   	push   %rbp
  8012e2:	48 89 e5             	mov    %rsp,%rbp
  8012e5:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  8012ec:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8012f3:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  8012f9:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801300:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801307:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80130e:	84 c0                	test   %al,%al
  801310:	74 20                	je     801332 <snprintf+0x51>
  801312:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801316:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80131a:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80131e:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801322:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801326:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80132a:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80132e:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801332:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  801339:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  801340:	00 00 00 
  801343:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  80134a:	00 00 00 
  80134d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801351:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801358:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80135f:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801366:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80136d:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801374:	48 8b 0a             	mov    (%rdx),%rcx
  801377:	48 89 08             	mov    %rcx,(%rax)
  80137a:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80137e:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801382:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801386:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80138a:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  801391:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801398:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80139e:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8013a5:	48 89 c7             	mov    %rax,%rdi
  8013a8:	48 b8 44 12 80 00 00 	movabs $0x801244,%rax
  8013af:	00 00 00 
  8013b2:	ff d0                	callq  *%rax
  8013b4:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8013ba:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8013c0:	c9                   	leaveq 
  8013c1:	c3                   	retq   

00000000008013c2 <strlen>:
  8013c2:	55                   	push   %rbp
  8013c3:	48 89 e5             	mov    %rsp,%rbp
  8013c6:	48 83 ec 18          	sub    $0x18,%rsp
  8013ca:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013ce:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8013d5:	eb 09                	jmp    8013e0 <strlen+0x1e>
  8013d7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8013db:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8013e0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013e4:	0f b6 00             	movzbl (%rax),%eax
  8013e7:	84 c0                	test   %al,%al
  8013e9:	75 ec                	jne    8013d7 <strlen+0x15>
  8013eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8013ee:	c9                   	leaveq 
  8013ef:	c3                   	retq   

00000000008013f0 <strnlen>:
  8013f0:	55                   	push   %rbp
  8013f1:	48 89 e5             	mov    %rsp,%rbp
  8013f4:	48 83 ec 20          	sub    $0x20,%rsp
  8013f8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013fc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801400:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801407:	eb 0e                	jmp    801417 <strnlen+0x27>
  801409:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80140d:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801412:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801417:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80141c:	74 0b                	je     801429 <strnlen+0x39>
  80141e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801422:	0f b6 00             	movzbl (%rax),%eax
  801425:	84 c0                	test   %al,%al
  801427:	75 e0                	jne    801409 <strnlen+0x19>
  801429:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80142c:	c9                   	leaveq 
  80142d:	c3                   	retq   

000000000080142e <strcpy>:
  80142e:	55                   	push   %rbp
  80142f:	48 89 e5             	mov    %rsp,%rbp
  801432:	48 83 ec 20          	sub    $0x20,%rsp
  801436:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80143a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80143e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801442:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801446:	90                   	nop
  801447:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80144b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80144f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801453:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801457:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80145b:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80145f:	0f b6 12             	movzbl (%rdx),%edx
  801462:	88 10                	mov    %dl,(%rax)
  801464:	0f b6 00             	movzbl (%rax),%eax
  801467:	84 c0                	test   %al,%al
  801469:	75 dc                	jne    801447 <strcpy+0x19>
  80146b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80146f:	c9                   	leaveq 
  801470:	c3                   	retq   

0000000000801471 <strcat>:
  801471:	55                   	push   %rbp
  801472:	48 89 e5             	mov    %rsp,%rbp
  801475:	48 83 ec 20          	sub    $0x20,%rsp
  801479:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80147d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801481:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801485:	48 89 c7             	mov    %rax,%rdi
  801488:	48 b8 c2 13 80 00 00 	movabs $0x8013c2,%rax
  80148f:	00 00 00 
  801492:	ff d0                	callq  *%rax
  801494:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801497:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80149a:	48 63 d0             	movslq %eax,%rdx
  80149d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014a1:	48 01 c2             	add    %rax,%rdx
  8014a4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014a8:	48 89 c6             	mov    %rax,%rsi
  8014ab:	48 89 d7             	mov    %rdx,%rdi
  8014ae:	48 b8 2e 14 80 00 00 	movabs $0x80142e,%rax
  8014b5:	00 00 00 
  8014b8:	ff d0                	callq  *%rax
  8014ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014be:	c9                   	leaveq 
  8014bf:	c3                   	retq   

00000000008014c0 <strncpy>:
  8014c0:	55                   	push   %rbp
  8014c1:	48 89 e5             	mov    %rsp,%rbp
  8014c4:	48 83 ec 28          	sub    $0x28,%rsp
  8014c8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014cc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014d0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014d8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8014dc:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8014e3:	00 
  8014e4:	eb 2a                	jmp    801510 <strncpy+0x50>
  8014e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014ea:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8014ee:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8014f2:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8014f6:	0f b6 12             	movzbl (%rdx),%edx
  8014f9:	88 10                	mov    %dl,(%rax)
  8014fb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014ff:	0f b6 00             	movzbl (%rax),%eax
  801502:	84 c0                	test   %al,%al
  801504:	74 05                	je     80150b <strncpy+0x4b>
  801506:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  80150b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801510:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801514:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801518:	72 cc                	jb     8014e6 <strncpy+0x26>
  80151a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80151e:	c9                   	leaveq 
  80151f:	c3                   	retq   

0000000000801520 <strlcpy>:
  801520:	55                   	push   %rbp
  801521:	48 89 e5             	mov    %rsp,%rbp
  801524:	48 83 ec 28          	sub    $0x28,%rsp
  801528:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80152c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801530:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801534:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801538:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80153c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801541:	74 3d                	je     801580 <strlcpy+0x60>
  801543:	eb 1d                	jmp    801562 <strlcpy+0x42>
  801545:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801549:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80154d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801551:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801555:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801559:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80155d:	0f b6 12             	movzbl (%rdx),%edx
  801560:	88 10                	mov    %dl,(%rax)
  801562:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801567:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80156c:	74 0b                	je     801579 <strlcpy+0x59>
  80156e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801572:	0f b6 00             	movzbl (%rax),%eax
  801575:	84 c0                	test   %al,%al
  801577:	75 cc                	jne    801545 <strlcpy+0x25>
  801579:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80157d:	c6 00 00             	movb   $0x0,(%rax)
  801580:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801584:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801588:	48 29 c2             	sub    %rax,%rdx
  80158b:	48 89 d0             	mov    %rdx,%rax
  80158e:	c9                   	leaveq 
  80158f:	c3                   	retq   

0000000000801590 <strcmp>:
  801590:	55                   	push   %rbp
  801591:	48 89 e5             	mov    %rsp,%rbp
  801594:	48 83 ec 10          	sub    $0x10,%rsp
  801598:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80159c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8015a0:	eb 0a                	jmp    8015ac <strcmp+0x1c>
  8015a2:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8015a7:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8015ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015b0:	0f b6 00             	movzbl (%rax),%eax
  8015b3:	84 c0                	test   %al,%al
  8015b5:	74 12                	je     8015c9 <strcmp+0x39>
  8015b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015bb:	0f b6 10             	movzbl (%rax),%edx
  8015be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015c2:	0f b6 00             	movzbl (%rax),%eax
  8015c5:	38 c2                	cmp    %al,%dl
  8015c7:	74 d9                	je     8015a2 <strcmp+0x12>
  8015c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015cd:	0f b6 00             	movzbl (%rax),%eax
  8015d0:	0f b6 d0             	movzbl %al,%edx
  8015d3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015d7:	0f b6 00             	movzbl (%rax),%eax
  8015da:	0f b6 c0             	movzbl %al,%eax
  8015dd:	29 c2                	sub    %eax,%edx
  8015df:	89 d0                	mov    %edx,%eax
  8015e1:	c9                   	leaveq 
  8015e2:	c3                   	retq   

00000000008015e3 <strncmp>:
  8015e3:	55                   	push   %rbp
  8015e4:	48 89 e5             	mov    %rsp,%rbp
  8015e7:	48 83 ec 18          	sub    $0x18,%rsp
  8015eb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8015ef:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8015f3:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8015f7:	eb 0f                	jmp    801608 <strncmp+0x25>
  8015f9:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  8015fe:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801603:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801608:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80160d:	74 1d                	je     80162c <strncmp+0x49>
  80160f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801613:	0f b6 00             	movzbl (%rax),%eax
  801616:	84 c0                	test   %al,%al
  801618:	74 12                	je     80162c <strncmp+0x49>
  80161a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80161e:	0f b6 10             	movzbl (%rax),%edx
  801621:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801625:	0f b6 00             	movzbl (%rax),%eax
  801628:	38 c2                	cmp    %al,%dl
  80162a:	74 cd                	je     8015f9 <strncmp+0x16>
  80162c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801631:	75 07                	jne    80163a <strncmp+0x57>
  801633:	b8 00 00 00 00       	mov    $0x0,%eax
  801638:	eb 18                	jmp    801652 <strncmp+0x6f>
  80163a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80163e:	0f b6 00             	movzbl (%rax),%eax
  801641:	0f b6 d0             	movzbl %al,%edx
  801644:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801648:	0f b6 00             	movzbl (%rax),%eax
  80164b:	0f b6 c0             	movzbl %al,%eax
  80164e:	29 c2                	sub    %eax,%edx
  801650:	89 d0                	mov    %edx,%eax
  801652:	c9                   	leaveq 
  801653:	c3                   	retq   

0000000000801654 <strchr>:
  801654:	55                   	push   %rbp
  801655:	48 89 e5             	mov    %rsp,%rbp
  801658:	48 83 ec 0c          	sub    $0xc,%rsp
  80165c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801660:	89 f0                	mov    %esi,%eax
  801662:	88 45 f4             	mov    %al,-0xc(%rbp)
  801665:	eb 17                	jmp    80167e <strchr+0x2a>
  801667:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80166b:	0f b6 00             	movzbl (%rax),%eax
  80166e:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801671:	75 06                	jne    801679 <strchr+0x25>
  801673:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801677:	eb 15                	jmp    80168e <strchr+0x3a>
  801679:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80167e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801682:	0f b6 00             	movzbl (%rax),%eax
  801685:	84 c0                	test   %al,%al
  801687:	75 de                	jne    801667 <strchr+0x13>
  801689:	b8 00 00 00 00       	mov    $0x0,%eax
  80168e:	c9                   	leaveq 
  80168f:	c3                   	retq   

0000000000801690 <strfind>:
  801690:	55                   	push   %rbp
  801691:	48 89 e5             	mov    %rsp,%rbp
  801694:	48 83 ec 0c          	sub    $0xc,%rsp
  801698:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80169c:	89 f0                	mov    %esi,%eax
  80169e:	88 45 f4             	mov    %al,-0xc(%rbp)
  8016a1:	eb 13                	jmp    8016b6 <strfind+0x26>
  8016a3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016a7:	0f b6 00             	movzbl (%rax),%eax
  8016aa:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8016ad:	75 02                	jne    8016b1 <strfind+0x21>
  8016af:	eb 10                	jmp    8016c1 <strfind+0x31>
  8016b1:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8016b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016ba:	0f b6 00             	movzbl (%rax),%eax
  8016bd:	84 c0                	test   %al,%al
  8016bf:	75 e2                	jne    8016a3 <strfind+0x13>
  8016c1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016c5:	c9                   	leaveq 
  8016c6:	c3                   	retq   

00000000008016c7 <memset>:
  8016c7:	55                   	push   %rbp
  8016c8:	48 89 e5             	mov    %rsp,%rbp
  8016cb:	48 83 ec 18          	sub    $0x18,%rsp
  8016cf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8016d3:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8016d6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8016da:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8016df:	75 06                	jne    8016e7 <memset+0x20>
  8016e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016e5:	eb 69                	jmp    801750 <memset+0x89>
  8016e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016eb:	83 e0 03             	and    $0x3,%eax
  8016ee:	48 85 c0             	test   %rax,%rax
  8016f1:	75 48                	jne    80173b <memset+0x74>
  8016f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016f7:	83 e0 03             	and    $0x3,%eax
  8016fa:	48 85 c0             	test   %rax,%rax
  8016fd:	75 3c                	jne    80173b <memset+0x74>
  8016ff:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801706:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801709:	c1 e0 18             	shl    $0x18,%eax
  80170c:	89 c2                	mov    %eax,%edx
  80170e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801711:	c1 e0 10             	shl    $0x10,%eax
  801714:	09 c2                	or     %eax,%edx
  801716:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801719:	c1 e0 08             	shl    $0x8,%eax
  80171c:	09 d0                	or     %edx,%eax
  80171e:	09 45 f4             	or     %eax,-0xc(%rbp)
  801721:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801725:	48 c1 e8 02          	shr    $0x2,%rax
  801729:	48 89 c1             	mov    %rax,%rcx
  80172c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801730:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801733:	48 89 d7             	mov    %rdx,%rdi
  801736:	fc                   	cld    
  801737:	f3 ab                	rep stos %eax,%es:(%rdi)
  801739:	eb 11                	jmp    80174c <memset+0x85>
  80173b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80173f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801742:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801746:	48 89 d7             	mov    %rdx,%rdi
  801749:	fc                   	cld    
  80174a:	f3 aa                	rep stos %al,%es:(%rdi)
  80174c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801750:	c9                   	leaveq 
  801751:	c3                   	retq   

0000000000801752 <memmove>:
  801752:	55                   	push   %rbp
  801753:	48 89 e5             	mov    %rsp,%rbp
  801756:	48 83 ec 28          	sub    $0x28,%rsp
  80175a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80175e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801762:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801766:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80176a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80176e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801772:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801776:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80177a:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80177e:	0f 83 88 00 00 00    	jae    80180c <memmove+0xba>
  801784:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801788:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80178c:	48 01 d0             	add    %rdx,%rax
  80178f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801793:	76 77                	jbe    80180c <memmove+0xba>
  801795:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801799:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80179d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017a1:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8017a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017a9:	83 e0 03             	and    $0x3,%eax
  8017ac:	48 85 c0             	test   %rax,%rax
  8017af:	75 3b                	jne    8017ec <memmove+0x9a>
  8017b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017b5:	83 e0 03             	and    $0x3,%eax
  8017b8:	48 85 c0             	test   %rax,%rax
  8017bb:	75 2f                	jne    8017ec <memmove+0x9a>
  8017bd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017c1:	83 e0 03             	and    $0x3,%eax
  8017c4:	48 85 c0             	test   %rax,%rax
  8017c7:	75 23                	jne    8017ec <memmove+0x9a>
  8017c9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017cd:	48 83 e8 04          	sub    $0x4,%rax
  8017d1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8017d5:	48 83 ea 04          	sub    $0x4,%rdx
  8017d9:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8017dd:	48 c1 e9 02          	shr    $0x2,%rcx
  8017e1:	48 89 c7             	mov    %rax,%rdi
  8017e4:	48 89 d6             	mov    %rdx,%rsi
  8017e7:	fd                   	std    
  8017e8:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8017ea:	eb 1d                	jmp    801809 <memmove+0xb7>
  8017ec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017f0:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8017f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017f8:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8017fc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801800:	48 89 d7             	mov    %rdx,%rdi
  801803:	48 89 c1             	mov    %rax,%rcx
  801806:	fd                   	std    
  801807:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801809:	fc                   	cld    
  80180a:	eb 57                	jmp    801863 <memmove+0x111>
  80180c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801810:	83 e0 03             	and    $0x3,%eax
  801813:	48 85 c0             	test   %rax,%rax
  801816:	75 36                	jne    80184e <memmove+0xfc>
  801818:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80181c:	83 e0 03             	and    $0x3,%eax
  80181f:	48 85 c0             	test   %rax,%rax
  801822:	75 2a                	jne    80184e <memmove+0xfc>
  801824:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801828:	83 e0 03             	and    $0x3,%eax
  80182b:	48 85 c0             	test   %rax,%rax
  80182e:	75 1e                	jne    80184e <memmove+0xfc>
  801830:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801834:	48 c1 e8 02          	shr    $0x2,%rax
  801838:	48 89 c1             	mov    %rax,%rcx
  80183b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80183f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801843:	48 89 c7             	mov    %rax,%rdi
  801846:	48 89 d6             	mov    %rdx,%rsi
  801849:	fc                   	cld    
  80184a:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80184c:	eb 15                	jmp    801863 <memmove+0x111>
  80184e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801852:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801856:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80185a:	48 89 c7             	mov    %rax,%rdi
  80185d:	48 89 d6             	mov    %rdx,%rsi
  801860:	fc                   	cld    
  801861:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801863:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801867:	c9                   	leaveq 
  801868:	c3                   	retq   

0000000000801869 <memcpy>:
  801869:	55                   	push   %rbp
  80186a:	48 89 e5             	mov    %rsp,%rbp
  80186d:	48 83 ec 18          	sub    $0x18,%rsp
  801871:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801875:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801879:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80187d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801881:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801885:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801889:	48 89 ce             	mov    %rcx,%rsi
  80188c:	48 89 c7             	mov    %rax,%rdi
  80188f:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  801896:	00 00 00 
  801899:	ff d0                	callq  *%rax
  80189b:	c9                   	leaveq 
  80189c:	c3                   	retq   

000000000080189d <memcmp>:
  80189d:	55                   	push   %rbp
  80189e:	48 89 e5             	mov    %rsp,%rbp
  8018a1:	48 83 ec 28          	sub    $0x28,%rsp
  8018a5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8018a9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8018ad:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8018b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018b5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8018b9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8018bd:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8018c1:	eb 36                	jmp    8018f9 <memcmp+0x5c>
  8018c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018c7:	0f b6 10             	movzbl (%rax),%edx
  8018ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018ce:	0f b6 00             	movzbl (%rax),%eax
  8018d1:	38 c2                	cmp    %al,%dl
  8018d3:	74 1a                	je     8018ef <memcmp+0x52>
  8018d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018d9:	0f b6 00             	movzbl (%rax),%eax
  8018dc:	0f b6 d0             	movzbl %al,%edx
  8018df:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018e3:	0f b6 00             	movzbl (%rax),%eax
  8018e6:	0f b6 c0             	movzbl %al,%eax
  8018e9:	29 c2                	sub    %eax,%edx
  8018eb:	89 d0                	mov    %edx,%eax
  8018ed:	eb 20                	jmp    80190f <memcmp+0x72>
  8018ef:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8018f4:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8018f9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018fd:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801901:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801905:	48 85 c0             	test   %rax,%rax
  801908:	75 b9                	jne    8018c3 <memcmp+0x26>
  80190a:	b8 00 00 00 00       	mov    $0x0,%eax
  80190f:	c9                   	leaveq 
  801910:	c3                   	retq   

0000000000801911 <memfind>:
  801911:	55                   	push   %rbp
  801912:	48 89 e5             	mov    %rsp,%rbp
  801915:	48 83 ec 28          	sub    $0x28,%rsp
  801919:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80191d:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801920:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801924:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801928:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80192c:	48 01 d0             	add    %rdx,%rax
  80192f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801933:	eb 15                	jmp    80194a <memfind+0x39>
  801935:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801939:	0f b6 10             	movzbl (%rax),%edx
  80193c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80193f:	38 c2                	cmp    %al,%dl
  801941:	75 02                	jne    801945 <memfind+0x34>
  801943:	eb 0f                	jmp    801954 <memfind+0x43>
  801945:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80194a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80194e:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801952:	72 e1                	jb     801935 <memfind+0x24>
  801954:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801958:	c9                   	leaveq 
  801959:	c3                   	retq   

000000000080195a <strtol>:
  80195a:	55                   	push   %rbp
  80195b:	48 89 e5             	mov    %rsp,%rbp
  80195e:	48 83 ec 34          	sub    $0x34,%rsp
  801962:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801966:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80196a:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80196d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801974:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  80197b:	00 
  80197c:	eb 05                	jmp    801983 <strtol+0x29>
  80197e:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801983:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801987:	0f b6 00             	movzbl (%rax),%eax
  80198a:	3c 20                	cmp    $0x20,%al
  80198c:	74 f0                	je     80197e <strtol+0x24>
  80198e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801992:	0f b6 00             	movzbl (%rax),%eax
  801995:	3c 09                	cmp    $0x9,%al
  801997:	74 e5                	je     80197e <strtol+0x24>
  801999:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80199d:	0f b6 00             	movzbl (%rax),%eax
  8019a0:	3c 2b                	cmp    $0x2b,%al
  8019a2:	75 07                	jne    8019ab <strtol+0x51>
  8019a4:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8019a9:	eb 17                	jmp    8019c2 <strtol+0x68>
  8019ab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019af:	0f b6 00             	movzbl (%rax),%eax
  8019b2:	3c 2d                	cmp    $0x2d,%al
  8019b4:	75 0c                	jne    8019c2 <strtol+0x68>
  8019b6:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8019bb:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8019c2:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8019c6:	74 06                	je     8019ce <strtol+0x74>
  8019c8:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8019cc:	75 28                	jne    8019f6 <strtol+0x9c>
  8019ce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019d2:	0f b6 00             	movzbl (%rax),%eax
  8019d5:	3c 30                	cmp    $0x30,%al
  8019d7:	75 1d                	jne    8019f6 <strtol+0x9c>
  8019d9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019dd:	48 83 c0 01          	add    $0x1,%rax
  8019e1:	0f b6 00             	movzbl (%rax),%eax
  8019e4:	3c 78                	cmp    $0x78,%al
  8019e6:	75 0e                	jne    8019f6 <strtol+0x9c>
  8019e8:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8019ed:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8019f4:	eb 2c                	jmp    801a22 <strtol+0xc8>
  8019f6:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8019fa:	75 19                	jne    801a15 <strtol+0xbb>
  8019fc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a00:	0f b6 00             	movzbl (%rax),%eax
  801a03:	3c 30                	cmp    $0x30,%al
  801a05:	75 0e                	jne    801a15 <strtol+0xbb>
  801a07:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801a0c:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801a13:	eb 0d                	jmp    801a22 <strtol+0xc8>
  801a15:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801a19:	75 07                	jne    801a22 <strtol+0xc8>
  801a1b:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801a22:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a26:	0f b6 00             	movzbl (%rax),%eax
  801a29:	3c 2f                	cmp    $0x2f,%al
  801a2b:	7e 1d                	jle    801a4a <strtol+0xf0>
  801a2d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a31:	0f b6 00             	movzbl (%rax),%eax
  801a34:	3c 39                	cmp    $0x39,%al
  801a36:	7f 12                	jg     801a4a <strtol+0xf0>
  801a38:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a3c:	0f b6 00             	movzbl (%rax),%eax
  801a3f:	0f be c0             	movsbl %al,%eax
  801a42:	83 e8 30             	sub    $0x30,%eax
  801a45:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801a48:	eb 4e                	jmp    801a98 <strtol+0x13e>
  801a4a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a4e:	0f b6 00             	movzbl (%rax),%eax
  801a51:	3c 60                	cmp    $0x60,%al
  801a53:	7e 1d                	jle    801a72 <strtol+0x118>
  801a55:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a59:	0f b6 00             	movzbl (%rax),%eax
  801a5c:	3c 7a                	cmp    $0x7a,%al
  801a5e:	7f 12                	jg     801a72 <strtol+0x118>
  801a60:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a64:	0f b6 00             	movzbl (%rax),%eax
  801a67:	0f be c0             	movsbl %al,%eax
  801a6a:	83 e8 57             	sub    $0x57,%eax
  801a6d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801a70:	eb 26                	jmp    801a98 <strtol+0x13e>
  801a72:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a76:	0f b6 00             	movzbl (%rax),%eax
  801a79:	3c 40                	cmp    $0x40,%al
  801a7b:	7e 48                	jle    801ac5 <strtol+0x16b>
  801a7d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a81:	0f b6 00             	movzbl (%rax),%eax
  801a84:	3c 5a                	cmp    $0x5a,%al
  801a86:	7f 3d                	jg     801ac5 <strtol+0x16b>
  801a88:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a8c:	0f b6 00             	movzbl (%rax),%eax
  801a8f:	0f be c0             	movsbl %al,%eax
  801a92:	83 e8 37             	sub    $0x37,%eax
  801a95:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801a98:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801a9b:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801a9e:	7c 02                	jl     801aa2 <strtol+0x148>
  801aa0:	eb 23                	jmp    801ac5 <strtol+0x16b>
  801aa2:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801aa7:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801aaa:	48 98                	cltq   
  801aac:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801ab1:	48 89 c2             	mov    %rax,%rdx
  801ab4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801ab7:	48 98                	cltq   
  801ab9:	48 01 d0             	add    %rdx,%rax
  801abc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801ac0:	e9 5d ff ff ff       	jmpq   801a22 <strtol+0xc8>
  801ac5:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801aca:	74 0b                	je     801ad7 <strtol+0x17d>
  801acc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801ad0:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801ad4:	48 89 10             	mov    %rdx,(%rax)
  801ad7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801adb:	74 09                	je     801ae6 <strtol+0x18c>
  801add:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ae1:	48 f7 d8             	neg    %rax
  801ae4:	eb 04                	jmp    801aea <strtol+0x190>
  801ae6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801aea:	c9                   	leaveq 
  801aeb:	c3                   	retq   

0000000000801aec <strstr>:
  801aec:	55                   	push   %rbp
  801aed:	48 89 e5             	mov    %rsp,%rbp
  801af0:	48 83 ec 30          	sub    $0x30,%rsp
  801af4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801af8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801afc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801b00:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801b04:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801b08:	0f b6 00             	movzbl (%rax),%eax
  801b0b:	88 45 ff             	mov    %al,-0x1(%rbp)
  801b0e:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801b12:	75 06                	jne    801b1a <strstr+0x2e>
  801b14:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b18:	eb 6b                	jmp    801b85 <strstr+0x99>
  801b1a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801b1e:	48 89 c7             	mov    %rax,%rdi
  801b21:	48 b8 c2 13 80 00 00 	movabs $0x8013c2,%rax
  801b28:	00 00 00 
  801b2b:	ff d0                	callq  *%rax
  801b2d:	48 98                	cltq   
  801b2f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801b33:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b37:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801b3b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801b3f:	0f b6 00             	movzbl (%rax),%eax
  801b42:	88 45 ef             	mov    %al,-0x11(%rbp)
  801b45:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801b49:	75 07                	jne    801b52 <strstr+0x66>
  801b4b:	b8 00 00 00 00       	mov    $0x0,%eax
  801b50:	eb 33                	jmp    801b85 <strstr+0x99>
  801b52:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801b56:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801b59:	75 d8                	jne    801b33 <strstr+0x47>
  801b5b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b5f:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801b63:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b67:	48 89 ce             	mov    %rcx,%rsi
  801b6a:	48 89 c7             	mov    %rax,%rdi
  801b6d:	48 b8 e3 15 80 00 00 	movabs $0x8015e3,%rax
  801b74:	00 00 00 
  801b77:	ff d0                	callq  *%rax
  801b79:	85 c0                	test   %eax,%eax
  801b7b:	75 b6                	jne    801b33 <strstr+0x47>
  801b7d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b81:	48 83 e8 01          	sub    $0x1,%rax
  801b85:	c9                   	leaveq 
  801b86:	c3                   	retq   

0000000000801b87 <syscall>:
  801b87:	55                   	push   %rbp
  801b88:	48 89 e5             	mov    %rsp,%rbp
  801b8b:	53                   	push   %rbx
  801b8c:	48 83 ec 48          	sub    $0x48,%rsp
  801b90:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801b93:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801b96:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801b9a:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801b9e:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801ba2:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801ba6:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801ba9:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801bad:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801bb1:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801bb5:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801bb9:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801bbd:	4c 89 c3             	mov    %r8,%rbx
  801bc0:	cd 30                	int    $0x30
  801bc2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801bc6:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801bca:	74 3e                	je     801c0a <syscall+0x83>
  801bcc:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801bd1:	7e 37                	jle    801c0a <syscall+0x83>
  801bd3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801bd7:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801bda:	49 89 d0             	mov    %rdx,%r8
  801bdd:	89 c1                	mov    %eax,%ecx
  801bdf:	48 ba c8 53 80 00 00 	movabs $0x8053c8,%rdx
  801be6:	00 00 00 
  801be9:	be 24 00 00 00       	mov    $0x24,%esi
  801bee:	48 bf e5 53 80 00 00 	movabs $0x8053e5,%rdi
  801bf5:	00 00 00 
  801bf8:	b8 00 00 00 00       	mov    $0x0,%eax
  801bfd:	49 b9 40 06 80 00 00 	movabs $0x800640,%r9
  801c04:	00 00 00 
  801c07:	41 ff d1             	callq  *%r9
  801c0a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c0e:	48 83 c4 48          	add    $0x48,%rsp
  801c12:	5b                   	pop    %rbx
  801c13:	5d                   	pop    %rbp
  801c14:	c3                   	retq   

0000000000801c15 <sys_cputs>:
  801c15:	55                   	push   %rbp
  801c16:	48 89 e5             	mov    %rsp,%rbp
  801c19:	48 83 ec 20          	sub    $0x20,%rsp
  801c1d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c21:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c25:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c29:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c2d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c34:	00 
  801c35:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c3b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c41:	48 89 d1             	mov    %rdx,%rcx
  801c44:	48 89 c2             	mov    %rax,%rdx
  801c47:	be 00 00 00 00       	mov    $0x0,%esi
  801c4c:	bf 00 00 00 00       	mov    $0x0,%edi
  801c51:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801c58:	00 00 00 
  801c5b:	ff d0                	callq  *%rax
  801c5d:	c9                   	leaveq 
  801c5e:	c3                   	retq   

0000000000801c5f <sys_cgetc>:
  801c5f:	55                   	push   %rbp
  801c60:	48 89 e5             	mov    %rsp,%rbp
  801c63:	48 83 ec 10          	sub    $0x10,%rsp
  801c67:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c6e:	00 
  801c6f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c75:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c7b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c80:	ba 00 00 00 00       	mov    $0x0,%edx
  801c85:	be 00 00 00 00       	mov    $0x0,%esi
  801c8a:	bf 01 00 00 00       	mov    $0x1,%edi
  801c8f:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801c96:	00 00 00 
  801c99:	ff d0                	callq  *%rax
  801c9b:	c9                   	leaveq 
  801c9c:	c3                   	retq   

0000000000801c9d <sys_env_destroy>:
  801c9d:	55                   	push   %rbp
  801c9e:	48 89 e5             	mov    %rsp,%rbp
  801ca1:	48 83 ec 10          	sub    $0x10,%rsp
  801ca5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ca8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cab:	48 98                	cltq   
  801cad:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801cb4:	00 
  801cb5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cbb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cc1:	b9 00 00 00 00       	mov    $0x0,%ecx
  801cc6:	48 89 c2             	mov    %rax,%rdx
  801cc9:	be 01 00 00 00       	mov    $0x1,%esi
  801cce:	bf 03 00 00 00       	mov    $0x3,%edi
  801cd3:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801cda:	00 00 00 
  801cdd:	ff d0                	callq  *%rax
  801cdf:	c9                   	leaveq 
  801ce0:	c3                   	retq   

0000000000801ce1 <sys_getenvid>:
  801ce1:	55                   	push   %rbp
  801ce2:	48 89 e5             	mov    %rsp,%rbp
  801ce5:	48 83 ec 10          	sub    $0x10,%rsp
  801ce9:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801cf0:	00 
  801cf1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cf7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cfd:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d02:	ba 00 00 00 00       	mov    $0x0,%edx
  801d07:	be 00 00 00 00       	mov    $0x0,%esi
  801d0c:	bf 02 00 00 00       	mov    $0x2,%edi
  801d11:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801d18:	00 00 00 
  801d1b:	ff d0                	callq  *%rax
  801d1d:	c9                   	leaveq 
  801d1e:	c3                   	retq   

0000000000801d1f <sys_yield>:
  801d1f:	55                   	push   %rbp
  801d20:	48 89 e5             	mov    %rsp,%rbp
  801d23:	48 83 ec 10          	sub    $0x10,%rsp
  801d27:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d2e:	00 
  801d2f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d35:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d3b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d40:	ba 00 00 00 00       	mov    $0x0,%edx
  801d45:	be 00 00 00 00       	mov    $0x0,%esi
  801d4a:	bf 0b 00 00 00       	mov    $0xb,%edi
  801d4f:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801d56:	00 00 00 
  801d59:	ff d0                	callq  *%rax
  801d5b:	c9                   	leaveq 
  801d5c:	c3                   	retq   

0000000000801d5d <sys_page_alloc>:
  801d5d:	55                   	push   %rbp
  801d5e:	48 89 e5             	mov    %rsp,%rbp
  801d61:	48 83 ec 20          	sub    $0x20,%rsp
  801d65:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d68:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d6c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801d6f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d72:	48 63 c8             	movslq %eax,%rcx
  801d75:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d79:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d7c:	48 98                	cltq   
  801d7e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d85:	00 
  801d86:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d8c:	49 89 c8             	mov    %rcx,%r8
  801d8f:	48 89 d1             	mov    %rdx,%rcx
  801d92:	48 89 c2             	mov    %rax,%rdx
  801d95:	be 01 00 00 00       	mov    $0x1,%esi
  801d9a:	bf 04 00 00 00       	mov    $0x4,%edi
  801d9f:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801da6:	00 00 00 
  801da9:	ff d0                	callq  *%rax
  801dab:	c9                   	leaveq 
  801dac:	c3                   	retq   

0000000000801dad <sys_page_map>:
  801dad:	55                   	push   %rbp
  801dae:	48 89 e5             	mov    %rsp,%rbp
  801db1:	48 83 ec 30          	sub    $0x30,%rsp
  801db5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801db8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801dbc:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801dbf:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801dc3:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801dc7:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801dca:	48 63 c8             	movslq %eax,%rcx
  801dcd:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801dd1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801dd4:	48 63 f0             	movslq %eax,%rsi
  801dd7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ddb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801dde:	48 98                	cltq   
  801de0:	48 89 0c 24          	mov    %rcx,(%rsp)
  801de4:	49 89 f9             	mov    %rdi,%r9
  801de7:	49 89 f0             	mov    %rsi,%r8
  801dea:	48 89 d1             	mov    %rdx,%rcx
  801ded:	48 89 c2             	mov    %rax,%rdx
  801df0:	be 01 00 00 00       	mov    $0x1,%esi
  801df5:	bf 05 00 00 00       	mov    $0x5,%edi
  801dfa:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801e01:	00 00 00 
  801e04:	ff d0                	callq  *%rax
  801e06:	c9                   	leaveq 
  801e07:	c3                   	retq   

0000000000801e08 <sys_page_unmap>:
  801e08:	55                   	push   %rbp
  801e09:	48 89 e5             	mov    %rsp,%rbp
  801e0c:	48 83 ec 20          	sub    $0x20,%rsp
  801e10:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e13:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e17:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e1b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e1e:	48 98                	cltq   
  801e20:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e27:	00 
  801e28:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e2e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e34:	48 89 d1             	mov    %rdx,%rcx
  801e37:	48 89 c2             	mov    %rax,%rdx
  801e3a:	be 01 00 00 00       	mov    $0x1,%esi
  801e3f:	bf 06 00 00 00       	mov    $0x6,%edi
  801e44:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801e4b:	00 00 00 
  801e4e:	ff d0                	callq  *%rax
  801e50:	c9                   	leaveq 
  801e51:	c3                   	retq   

0000000000801e52 <sys_env_set_status>:
  801e52:	55                   	push   %rbp
  801e53:	48 89 e5             	mov    %rsp,%rbp
  801e56:	48 83 ec 10          	sub    $0x10,%rsp
  801e5a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e5d:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801e60:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e63:	48 63 d0             	movslq %eax,%rdx
  801e66:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e69:	48 98                	cltq   
  801e6b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e72:	00 
  801e73:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e79:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e7f:	48 89 d1             	mov    %rdx,%rcx
  801e82:	48 89 c2             	mov    %rax,%rdx
  801e85:	be 01 00 00 00       	mov    $0x1,%esi
  801e8a:	bf 08 00 00 00       	mov    $0x8,%edi
  801e8f:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801e96:	00 00 00 
  801e99:	ff d0                	callq  *%rax
  801e9b:	c9                   	leaveq 
  801e9c:	c3                   	retq   

0000000000801e9d <sys_env_set_trapframe>:
  801e9d:	55                   	push   %rbp
  801e9e:	48 89 e5             	mov    %rsp,%rbp
  801ea1:	48 83 ec 20          	sub    $0x20,%rsp
  801ea5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ea8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801eac:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801eb0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801eb3:	48 98                	cltq   
  801eb5:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ebc:	00 
  801ebd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ec3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ec9:	48 89 d1             	mov    %rdx,%rcx
  801ecc:	48 89 c2             	mov    %rax,%rdx
  801ecf:	be 01 00 00 00       	mov    $0x1,%esi
  801ed4:	bf 09 00 00 00       	mov    $0x9,%edi
  801ed9:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801ee0:	00 00 00 
  801ee3:	ff d0                	callq  *%rax
  801ee5:	c9                   	leaveq 
  801ee6:	c3                   	retq   

0000000000801ee7 <sys_env_set_pgfault_upcall>:
  801ee7:	55                   	push   %rbp
  801ee8:	48 89 e5             	mov    %rsp,%rbp
  801eeb:	48 83 ec 20          	sub    $0x20,%rsp
  801eef:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ef2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ef6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801efa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801efd:	48 98                	cltq   
  801eff:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f06:	00 
  801f07:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f0d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f13:	48 89 d1             	mov    %rdx,%rcx
  801f16:	48 89 c2             	mov    %rax,%rdx
  801f19:	be 01 00 00 00       	mov    $0x1,%esi
  801f1e:	bf 0a 00 00 00       	mov    $0xa,%edi
  801f23:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801f2a:	00 00 00 
  801f2d:	ff d0                	callq  *%rax
  801f2f:	c9                   	leaveq 
  801f30:	c3                   	retq   

0000000000801f31 <sys_ipc_try_send>:
  801f31:	55                   	push   %rbp
  801f32:	48 89 e5             	mov    %rsp,%rbp
  801f35:	48 83 ec 20          	sub    $0x20,%rsp
  801f39:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f3c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801f40:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801f44:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801f47:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f4a:	48 63 f0             	movslq %eax,%rsi
  801f4d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801f51:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f54:	48 98                	cltq   
  801f56:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801f5a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f61:	00 
  801f62:	49 89 f1             	mov    %rsi,%r9
  801f65:	49 89 c8             	mov    %rcx,%r8
  801f68:	48 89 d1             	mov    %rdx,%rcx
  801f6b:	48 89 c2             	mov    %rax,%rdx
  801f6e:	be 00 00 00 00       	mov    $0x0,%esi
  801f73:	bf 0c 00 00 00       	mov    $0xc,%edi
  801f78:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801f7f:	00 00 00 
  801f82:	ff d0                	callq  *%rax
  801f84:	c9                   	leaveq 
  801f85:	c3                   	retq   

0000000000801f86 <sys_ipc_recv>:
  801f86:	55                   	push   %rbp
  801f87:	48 89 e5             	mov    %rsp,%rbp
  801f8a:	48 83 ec 10          	sub    $0x10,%rsp
  801f8e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f92:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f96:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f9d:	00 
  801f9e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801fa4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801faa:	b9 00 00 00 00       	mov    $0x0,%ecx
  801faf:	48 89 c2             	mov    %rax,%rdx
  801fb2:	be 01 00 00 00       	mov    $0x1,%esi
  801fb7:	bf 0d 00 00 00       	mov    $0xd,%edi
  801fbc:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801fc3:	00 00 00 
  801fc6:	ff d0                	callq  *%rax
  801fc8:	c9                   	leaveq 
  801fc9:	c3                   	retq   

0000000000801fca <sys_time_msec>:
  801fca:	55                   	push   %rbp
  801fcb:	48 89 e5             	mov    %rsp,%rbp
  801fce:	48 83 ec 10          	sub    $0x10,%rsp
  801fd2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801fd9:	00 
  801fda:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801fe0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801fe6:	b9 00 00 00 00       	mov    $0x0,%ecx
  801feb:	ba 00 00 00 00       	mov    $0x0,%edx
  801ff0:	be 00 00 00 00       	mov    $0x0,%esi
  801ff5:	bf 0e 00 00 00       	mov    $0xe,%edi
  801ffa:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  802001:	00 00 00 
  802004:	ff d0                	callq  *%rax
  802006:	c9                   	leaveq 
  802007:	c3                   	retq   

0000000000802008 <sys_net_transmit>:
  802008:	55                   	push   %rbp
  802009:	48 89 e5             	mov    %rsp,%rbp
  80200c:	48 83 ec 20          	sub    $0x20,%rsp
  802010:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802014:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802017:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80201a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80201e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802025:	00 
  802026:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80202c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802032:	48 89 d1             	mov    %rdx,%rcx
  802035:	48 89 c2             	mov    %rax,%rdx
  802038:	be 00 00 00 00       	mov    $0x0,%esi
  80203d:	bf 0f 00 00 00       	mov    $0xf,%edi
  802042:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  802049:	00 00 00 
  80204c:	ff d0                	callq  *%rax
  80204e:	c9                   	leaveq 
  80204f:	c3                   	retq   

0000000000802050 <sys_net_receive>:
  802050:	55                   	push   %rbp
  802051:	48 89 e5             	mov    %rsp,%rbp
  802054:	48 83 ec 20          	sub    $0x20,%rsp
  802058:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80205c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80205f:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802062:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802066:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80206d:	00 
  80206e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802074:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80207a:	48 89 d1             	mov    %rdx,%rcx
  80207d:	48 89 c2             	mov    %rax,%rdx
  802080:	be 00 00 00 00       	mov    $0x0,%esi
  802085:	bf 10 00 00 00       	mov    $0x10,%edi
  80208a:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  802091:	00 00 00 
  802094:	ff d0                	callq  *%rax
  802096:	c9                   	leaveq 
  802097:	c3                   	retq   

0000000000802098 <sys_ept_map>:
  802098:	55                   	push   %rbp
  802099:	48 89 e5             	mov    %rsp,%rbp
  80209c:	48 83 ec 30          	sub    $0x30,%rsp
  8020a0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8020a3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8020a7:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8020aa:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  8020ae:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  8020b2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8020b5:	48 63 c8             	movslq %eax,%rcx
  8020b8:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  8020bc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8020bf:	48 63 f0             	movslq %eax,%rsi
  8020c2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8020c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020c9:	48 98                	cltq   
  8020cb:	48 89 0c 24          	mov    %rcx,(%rsp)
  8020cf:	49 89 f9             	mov    %rdi,%r9
  8020d2:	49 89 f0             	mov    %rsi,%r8
  8020d5:	48 89 d1             	mov    %rdx,%rcx
  8020d8:	48 89 c2             	mov    %rax,%rdx
  8020db:	be 00 00 00 00       	mov    $0x0,%esi
  8020e0:	bf 11 00 00 00       	mov    $0x11,%edi
  8020e5:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  8020ec:	00 00 00 
  8020ef:	ff d0                	callq  *%rax
  8020f1:	c9                   	leaveq 
  8020f2:	c3                   	retq   

00000000008020f3 <sys_env_mkguest>:
  8020f3:	55                   	push   %rbp
  8020f4:	48 89 e5             	mov    %rsp,%rbp
  8020f7:	48 83 ec 20          	sub    $0x20,%rsp
  8020fb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8020ff:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802103:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802107:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80210b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802112:	00 
  802113:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802119:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80211f:	48 89 d1             	mov    %rdx,%rcx
  802122:	48 89 c2             	mov    %rax,%rdx
  802125:	be 00 00 00 00       	mov    $0x0,%esi
  80212a:	bf 12 00 00 00       	mov    $0x12,%edi
  80212f:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  802136:	00 00 00 
  802139:	ff d0                	callq  *%rax
  80213b:	c9                   	leaveq 
  80213c:	c3                   	retq   

000000000080213d <pgfault>:
  80213d:	55                   	push   %rbp
  80213e:	48 89 e5             	mov    %rsp,%rbp
  802141:	48 83 ec 30          	sub    $0x30,%rsp
  802145:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802149:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80214d:	48 8b 00             	mov    (%rax),%rax
  802150:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802154:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802158:	48 8b 40 08          	mov    0x8(%rax),%rax
  80215c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80215f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802162:	83 e0 02             	and    $0x2,%eax
  802165:	85 c0                	test   %eax,%eax
  802167:	75 40                	jne    8021a9 <pgfault+0x6c>
  802169:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80216d:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  802174:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802178:	49 89 d0             	mov    %rdx,%r8
  80217b:	48 89 c1             	mov    %rax,%rcx
  80217e:	48 ba f8 53 80 00 00 	movabs $0x8053f8,%rdx
  802185:	00 00 00 
  802188:	be 1f 00 00 00       	mov    $0x1f,%esi
  80218d:	48 bf 11 54 80 00 00 	movabs $0x805411,%rdi
  802194:	00 00 00 
  802197:	b8 00 00 00 00       	mov    $0x0,%eax
  80219c:	49 b9 40 06 80 00 00 	movabs $0x800640,%r9
  8021a3:	00 00 00 
  8021a6:	41 ff d1             	callq  *%r9
  8021a9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8021ad:	48 c1 e8 0c          	shr    $0xc,%rax
  8021b1:	48 89 c2             	mov    %rax,%rdx
  8021b4:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8021bb:	01 00 00 
  8021be:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021c2:	25 07 08 00 00       	and    $0x807,%eax
  8021c7:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  8021cd:	74 4e                	je     80221d <pgfault+0xe0>
  8021cf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8021d3:	48 c1 e8 0c          	shr    $0xc,%rax
  8021d7:	48 89 c2             	mov    %rax,%rdx
  8021da:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8021e1:	01 00 00 
  8021e4:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8021e8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8021ec:	49 89 d0             	mov    %rdx,%r8
  8021ef:	48 89 c1             	mov    %rax,%rcx
  8021f2:	48 ba 20 54 80 00 00 	movabs $0x805420,%rdx
  8021f9:	00 00 00 
  8021fc:	be 22 00 00 00       	mov    $0x22,%esi
  802201:	48 bf 11 54 80 00 00 	movabs $0x805411,%rdi
  802208:	00 00 00 
  80220b:	b8 00 00 00 00       	mov    $0x0,%eax
  802210:	49 b9 40 06 80 00 00 	movabs $0x800640,%r9
  802217:	00 00 00 
  80221a:	41 ff d1             	callq  *%r9
  80221d:	ba 07 00 00 00       	mov    $0x7,%edx
  802222:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802227:	bf 00 00 00 00       	mov    $0x0,%edi
  80222c:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  802233:	00 00 00 
  802236:	ff d0                	callq  *%rax
  802238:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80223b:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80223f:	79 30                	jns    802271 <pgfault+0x134>
  802241:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802244:	89 c1                	mov    %eax,%ecx
  802246:	48 ba 4b 54 80 00 00 	movabs $0x80544b,%rdx
  80224d:	00 00 00 
  802250:	be 30 00 00 00       	mov    $0x30,%esi
  802255:	48 bf 11 54 80 00 00 	movabs $0x805411,%rdi
  80225c:	00 00 00 
  80225f:	b8 00 00 00 00       	mov    $0x0,%eax
  802264:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  80226b:	00 00 00 
  80226e:	41 ff d0             	callq  *%r8
  802271:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802275:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802279:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80227d:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802283:	ba 00 10 00 00       	mov    $0x1000,%edx
  802288:	48 89 c6             	mov    %rax,%rsi
  80228b:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  802290:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  802297:	00 00 00 
  80229a:	ff d0                	callq  *%rax
  80229c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8022a0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8022a4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022a8:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  8022ae:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  8022b4:	48 89 c1             	mov    %rax,%rcx
  8022b7:	ba 00 00 00 00       	mov    $0x0,%edx
  8022bc:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8022c1:	bf 00 00 00 00       	mov    $0x0,%edi
  8022c6:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  8022cd:	00 00 00 
  8022d0:	ff d0                	callq  *%rax
  8022d2:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8022d5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8022d9:	79 30                	jns    80230b <pgfault+0x1ce>
  8022db:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8022de:	89 c1                	mov    %eax,%ecx
  8022e0:	48 ba 5e 54 80 00 00 	movabs $0x80545e,%rdx
  8022e7:	00 00 00 
  8022ea:	be 35 00 00 00       	mov    $0x35,%esi
  8022ef:	48 bf 11 54 80 00 00 	movabs $0x805411,%rdi
  8022f6:	00 00 00 
  8022f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8022fe:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  802305:	00 00 00 
  802308:	41 ff d0             	callq  *%r8
  80230b:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802310:	bf 00 00 00 00       	mov    $0x0,%edi
  802315:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  80231c:	00 00 00 
  80231f:	ff d0                	callq  *%rax
  802321:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802324:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802328:	79 30                	jns    80235a <pgfault+0x21d>
  80232a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80232d:	89 c1                	mov    %eax,%ecx
  80232f:	48 ba 6f 54 80 00 00 	movabs $0x80546f,%rdx
  802336:	00 00 00 
  802339:	be 39 00 00 00       	mov    $0x39,%esi
  80233e:	48 bf 11 54 80 00 00 	movabs $0x805411,%rdi
  802345:	00 00 00 
  802348:	b8 00 00 00 00       	mov    $0x0,%eax
  80234d:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  802354:	00 00 00 
  802357:	41 ff d0             	callq  *%r8
  80235a:	c9                   	leaveq 
  80235b:	c3                   	retq   

000000000080235c <duppage>:
  80235c:	55                   	push   %rbp
  80235d:	48 89 e5             	mov    %rsp,%rbp
  802360:	48 83 ec 30          	sub    $0x30,%rsp
  802364:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802367:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80236a:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80236d:	c1 e0 0c             	shl    $0xc,%eax
  802370:	89 c0                	mov    %eax,%eax
  802372:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802376:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80237d:	01 00 00 
  802380:	8b 55 d8             	mov    -0x28(%rbp),%edx
  802383:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802387:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80238b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80238f:	25 02 08 00 00       	and    $0x802,%eax
  802394:	48 85 c0             	test   %rax,%rax
  802397:	74 0e                	je     8023a7 <duppage+0x4b>
  802399:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80239d:	25 00 04 00 00       	and    $0x400,%eax
  8023a2:	48 85 c0             	test   %rax,%rax
  8023a5:	74 70                	je     802417 <duppage+0xbb>
  8023a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023ab:	25 07 0e 00 00       	and    $0xe07,%eax
  8023b0:	89 c6                	mov    %eax,%esi
  8023b2:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8023b6:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8023b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8023bd:	41 89 f0             	mov    %esi,%r8d
  8023c0:	48 89 c6             	mov    %rax,%rsi
  8023c3:	bf 00 00 00 00       	mov    $0x0,%edi
  8023c8:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  8023cf:	00 00 00 
  8023d2:	ff d0                	callq  *%rax
  8023d4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8023d7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8023db:	79 30                	jns    80240d <duppage+0xb1>
  8023dd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8023e0:	89 c1                	mov    %eax,%ecx
  8023e2:	48 ba 5e 54 80 00 00 	movabs $0x80545e,%rdx
  8023e9:	00 00 00 
  8023ec:	be 63 00 00 00       	mov    $0x63,%esi
  8023f1:	48 bf 11 54 80 00 00 	movabs $0x805411,%rdi
  8023f8:	00 00 00 
  8023fb:	b8 00 00 00 00       	mov    $0x0,%eax
  802400:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  802407:	00 00 00 
  80240a:	41 ff d0             	callq  *%r8
  80240d:	b8 00 00 00 00       	mov    $0x0,%eax
  802412:	e9 c4 00 00 00       	jmpq   8024db <duppage+0x17f>
  802417:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  80241b:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80241e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802422:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  802428:	48 89 c6             	mov    %rax,%rsi
  80242b:	bf 00 00 00 00       	mov    $0x0,%edi
  802430:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  802437:	00 00 00 
  80243a:	ff d0                	callq  *%rax
  80243c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80243f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802443:	79 30                	jns    802475 <duppage+0x119>
  802445:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802448:	89 c1                	mov    %eax,%ecx
  80244a:	48 ba 5e 54 80 00 00 	movabs $0x80545e,%rdx
  802451:	00 00 00 
  802454:	be 7e 00 00 00       	mov    $0x7e,%esi
  802459:	48 bf 11 54 80 00 00 	movabs $0x805411,%rdi
  802460:	00 00 00 
  802463:	b8 00 00 00 00       	mov    $0x0,%eax
  802468:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  80246f:	00 00 00 
  802472:	41 ff d0             	callq  *%r8
  802475:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802479:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80247d:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  802483:	48 89 d1             	mov    %rdx,%rcx
  802486:	ba 00 00 00 00       	mov    $0x0,%edx
  80248b:	48 89 c6             	mov    %rax,%rsi
  80248e:	bf 00 00 00 00       	mov    $0x0,%edi
  802493:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  80249a:	00 00 00 
  80249d:	ff d0                	callq  *%rax
  80249f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8024a2:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8024a6:	79 30                	jns    8024d8 <duppage+0x17c>
  8024a8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8024ab:	89 c1                	mov    %eax,%ecx
  8024ad:	48 ba 5e 54 80 00 00 	movabs $0x80545e,%rdx
  8024b4:	00 00 00 
  8024b7:	be 80 00 00 00       	mov    $0x80,%esi
  8024bc:	48 bf 11 54 80 00 00 	movabs $0x805411,%rdi
  8024c3:	00 00 00 
  8024c6:	b8 00 00 00 00       	mov    $0x0,%eax
  8024cb:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  8024d2:	00 00 00 
  8024d5:	41 ff d0             	callq  *%r8
  8024d8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8024db:	c9                   	leaveq 
  8024dc:	c3                   	retq   

00000000008024dd <fork>:
  8024dd:	55                   	push   %rbp
  8024de:	48 89 e5             	mov    %rsp,%rbp
  8024e1:	48 83 ec 20          	sub    $0x20,%rsp
  8024e5:	48 bf 3d 21 80 00 00 	movabs $0x80213d,%rdi
  8024ec:	00 00 00 
  8024ef:	48 b8 69 4b 80 00 00 	movabs $0x804b69,%rax
  8024f6:	00 00 00 
  8024f9:	ff d0                	callq  *%rax
  8024fb:	b8 07 00 00 00       	mov    $0x7,%eax
  802500:	cd 30                	int    $0x30
  802502:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802505:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802508:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80250b:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80250f:	79 08                	jns    802519 <fork+0x3c>
  802511:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802514:	e9 09 02 00 00       	jmpq   802722 <fork+0x245>
  802519:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80251d:	75 3e                	jne    80255d <fork+0x80>
  80251f:	48 b8 e1 1c 80 00 00 	movabs $0x801ce1,%rax
  802526:	00 00 00 
  802529:	ff d0                	callq  *%rax
  80252b:	25 ff 03 00 00       	and    $0x3ff,%eax
  802530:	48 98                	cltq   
  802532:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  802539:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802540:	00 00 00 
  802543:	48 01 c2             	add    %rax,%rdx
  802546:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  80254d:	00 00 00 
  802550:	48 89 10             	mov    %rdx,(%rax)
  802553:	b8 00 00 00 00       	mov    $0x0,%eax
  802558:	e9 c5 01 00 00       	jmpq   802722 <fork+0x245>
  80255d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802564:	e9 a4 00 00 00       	jmpq   80260d <fork+0x130>
  802569:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80256c:	c1 f8 12             	sar    $0x12,%eax
  80256f:	89 c2                	mov    %eax,%edx
  802571:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  802578:	01 00 00 
  80257b:	48 63 d2             	movslq %edx,%rdx
  80257e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802582:	83 e0 01             	and    $0x1,%eax
  802585:	48 85 c0             	test   %rax,%rax
  802588:	74 21                	je     8025ab <fork+0xce>
  80258a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80258d:	c1 f8 09             	sar    $0x9,%eax
  802590:	89 c2                	mov    %eax,%edx
  802592:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802599:	01 00 00 
  80259c:	48 63 d2             	movslq %edx,%rdx
  80259f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8025a3:	83 e0 01             	and    $0x1,%eax
  8025a6:	48 85 c0             	test   %rax,%rax
  8025a9:	75 09                	jne    8025b4 <fork+0xd7>
  8025ab:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  8025b2:	eb 59                	jmp    80260d <fork+0x130>
  8025b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025b7:	05 00 02 00 00       	add    $0x200,%eax
  8025bc:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8025bf:	eb 44                	jmp    802605 <fork+0x128>
  8025c1:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8025c8:	01 00 00 
  8025cb:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8025ce:	48 63 d2             	movslq %edx,%rdx
  8025d1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8025d5:	83 e0 05             	and    $0x5,%eax
  8025d8:	48 83 f8 05          	cmp    $0x5,%rax
  8025dc:	74 02                	je     8025e0 <fork+0x103>
  8025de:	eb 21                	jmp    802601 <fork+0x124>
  8025e0:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  8025e7:	75 02                	jne    8025eb <fork+0x10e>
  8025e9:	eb 16                	jmp    802601 <fork+0x124>
  8025eb:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8025ee:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8025f1:	89 d6                	mov    %edx,%esi
  8025f3:	89 c7                	mov    %eax,%edi
  8025f5:	48 b8 5c 23 80 00 00 	movabs $0x80235c,%rax
  8025fc:	00 00 00 
  8025ff:	ff d0                	callq  *%rax
  802601:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802605:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802608:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  80260b:	7c b4                	jl     8025c1 <fork+0xe4>
  80260d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802610:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  802615:	0f 86 4e ff ff ff    	jbe    802569 <fork+0x8c>
  80261b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80261e:	ba 07 00 00 00       	mov    $0x7,%edx
  802623:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  802628:	89 c7                	mov    %eax,%edi
  80262a:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  802631:	00 00 00 
  802634:	ff d0                	callq  *%rax
  802636:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802639:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80263d:	79 30                	jns    80266f <fork+0x192>
  80263f:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802642:	89 c1                	mov    %eax,%ecx
  802644:	48 ba 88 54 80 00 00 	movabs $0x805488,%rdx
  80264b:	00 00 00 
  80264e:	be bc 00 00 00       	mov    $0xbc,%esi
  802653:	48 bf 11 54 80 00 00 	movabs $0x805411,%rdi
  80265a:	00 00 00 
  80265d:	b8 00 00 00 00       	mov    $0x0,%eax
  802662:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  802669:	00 00 00 
  80266c:	41 ff d0             	callq  *%r8
  80266f:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  802676:	00 00 00 
  802679:	48 8b 00             	mov    (%rax),%rax
  80267c:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  802683:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802686:	48 89 d6             	mov    %rdx,%rsi
  802689:	89 c7                	mov    %eax,%edi
  80268b:	48 b8 e7 1e 80 00 00 	movabs $0x801ee7,%rax
  802692:	00 00 00 
  802695:	ff d0                	callq  *%rax
  802697:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80269a:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80269e:	79 30                	jns    8026d0 <fork+0x1f3>
  8026a0:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8026a3:	89 c1                	mov    %eax,%ecx
  8026a5:	48 ba a8 54 80 00 00 	movabs $0x8054a8,%rdx
  8026ac:	00 00 00 
  8026af:	be c0 00 00 00       	mov    $0xc0,%esi
  8026b4:	48 bf 11 54 80 00 00 	movabs $0x805411,%rdi
  8026bb:	00 00 00 
  8026be:	b8 00 00 00 00       	mov    $0x0,%eax
  8026c3:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  8026ca:	00 00 00 
  8026cd:	41 ff d0             	callq  *%r8
  8026d0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8026d3:	be 02 00 00 00       	mov    $0x2,%esi
  8026d8:	89 c7                	mov    %eax,%edi
  8026da:	48 b8 52 1e 80 00 00 	movabs $0x801e52,%rax
  8026e1:	00 00 00 
  8026e4:	ff d0                	callq  *%rax
  8026e6:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8026e9:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8026ed:	79 30                	jns    80271f <fork+0x242>
  8026ef:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8026f2:	89 c1                	mov    %eax,%ecx
  8026f4:	48 ba c7 54 80 00 00 	movabs $0x8054c7,%rdx
  8026fb:	00 00 00 
  8026fe:	be c5 00 00 00       	mov    $0xc5,%esi
  802703:	48 bf 11 54 80 00 00 	movabs $0x805411,%rdi
  80270a:	00 00 00 
  80270d:	b8 00 00 00 00       	mov    $0x0,%eax
  802712:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  802719:	00 00 00 
  80271c:	41 ff d0             	callq  *%r8
  80271f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802722:	c9                   	leaveq 
  802723:	c3                   	retq   

0000000000802724 <sfork>:
  802724:	55                   	push   %rbp
  802725:	48 89 e5             	mov    %rsp,%rbp
  802728:	48 ba de 54 80 00 00 	movabs $0x8054de,%rdx
  80272f:	00 00 00 
  802732:	be d2 00 00 00       	mov    $0xd2,%esi
  802737:	48 bf 11 54 80 00 00 	movabs $0x805411,%rdi
  80273e:	00 00 00 
  802741:	b8 00 00 00 00       	mov    $0x0,%eax
  802746:	48 b9 40 06 80 00 00 	movabs $0x800640,%rcx
  80274d:	00 00 00 
  802750:	ff d1                	callq  *%rcx

0000000000802752 <ipc_recv>:
  802752:	55                   	push   %rbp
  802753:	48 89 e5             	mov    %rsp,%rbp
  802756:	48 83 ec 30          	sub    $0x30,%rsp
  80275a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80275e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802762:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802766:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80276b:	75 0e                	jne    80277b <ipc_recv+0x29>
  80276d:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802774:	00 00 00 
  802777:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80277b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80277f:	48 89 c7             	mov    %rax,%rdi
  802782:	48 b8 86 1f 80 00 00 	movabs $0x801f86,%rax
  802789:	00 00 00 
  80278c:	ff d0                	callq  *%rax
  80278e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802791:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802795:	79 27                	jns    8027be <ipc_recv+0x6c>
  802797:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80279c:	74 0a                	je     8027a8 <ipc_recv+0x56>
  80279e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027a2:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8027a8:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8027ad:	74 0a                	je     8027b9 <ipc_recv+0x67>
  8027af:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027b3:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8027b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027bc:	eb 53                	jmp    802811 <ipc_recv+0xbf>
  8027be:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8027c3:	74 19                	je     8027de <ipc_recv+0x8c>
  8027c5:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8027cc:	00 00 00 
  8027cf:	48 8b 00             	mov    (%rax),%rax
  8027d2:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8027d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027dc:	89 10                	mov    %edx,(%rax)
  8027de:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8027e3:	74 19                	je     8027fe <ipc_recv+0xac>
  8027e5:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8027ec:	00 00 00 
  8027ef:	48 8b 00             	mov    (%rax),%rax
  8027f2:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8027f8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027fc:	89 10                	mov    %edx,(%rax)
  8027fe:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  802805:	00 00 00 
  802808:	48 8b 00             	mov    (%rax),%rax
  80280b:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  802811:	c9                   	leaveq 
  802812:	c3                   	retq   

0000000000802813 <ipc_send>:
  802813:	55                   	push   %rbp
  802814:	48 89 e5             	mov    %rsp,%rbp
  802817:	48 83 ec 30          	sub    $0x30,%rsp
  80281b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80281e:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802821:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  802825:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  802828:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80282d:	75 10                	jne    80283f <ipc_send+0x2c>
  80282f:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802836:	00 00 00 
  802839:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80283d:	eb 0e                	jmp    80284d <ipc_send+0x3a>
  80283f:	eb 0c                	jmp    80284d <ipc_send+0x3a>
  802841:	48 b8 1f 1d 80 00 00 	movabs $0x801d1f,%rax
  802848:	00 00 00 
  80284b:	ff d0                	callq  *%rax
  80284d:	8b 75 e8             	mov    -0x18(%rbp),%esi
  802850:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  802853:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802857:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80285a:	89 c7                	mov    %eax,%edi
  80285c:	48 b8 31 1f 80 00 00 	movabs $0x801f31,%rax
  802863:	00 00 00 
  802866:	ff d0                	callq  *%rax
  802868:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80286b:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  80286f:	74 d0                	je     802841 <ipc_send+0x2e>
  802871:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802875:	79 30                	jns    8028a7 <ipc_send+0x94>
  802877:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80287a:	89 c1                	mov    %eax,%ecx
  80287c:	48 ba f4 54 80 00 00 	movabs $0x8054f4,%rdx
  802883:	00 00 00 
  802886:	be 44 00 00 00       	mov    $0x44,%esi
  80288b:	48 bf 0a 55 80 00 00 	movabs $0x80550a,%rdi
  802892:	00 00 00 
  802895:	b8 00 00 00 00       	mov    $0x0,%eax
  80289a:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  8028a1:	00 00 00 
  8028a4:	41 ff d0             	callq  *%r8
  8028a7:	c9                   	leaveq 
  8028a8:	c3                   	retq   

00000000008028a9 <ipc_host_recv>:
  8028a9:	55                   	push   %rbp
  8028aa:	48 89 e5             	mov    %rsp,%rbp
  8028ad:	53                   	push   %rbx
  8028ae:	48 83 ec 28          	sub    $0x28,%rsp
  8028b2:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8028b6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  8028bd:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
  8028c4:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8028c9:	75 0e                	jne    8028d9 <ipc_host_recv+0x30>
  8028cb:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8028d2:	00 00 00 
  8028d5:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8028d9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028dd:	ba 07 00 00 00       	mov    $0x7,%edx
  8028e2:	48 89 c6             	mov    %rax,%rsi
  8028e5:	bf 00 00 00 00       	mov    $0x0,%edi
  8028ea:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  8028f1:	00 00 00 
  8028f4:	ff d0                	callq  *%rax
  8028f6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028fa:	48 c1 e8 0c          	shr    $0xc,%rax
  8028fe:	48 89 c2             	mov    %rax,%rdx
  802901:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802908:	01 00 00 
  80290b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80290f:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802915:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802919:	b8 03 00 00 00       	mov    $0x3,%eax
  80291e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802922:	48 89 d3             	mov    %rdx,%rbx
  802925:	0f 01 c1             	vmcall 
  802928:	89 f2                	mov    %esi,%edx
  80292a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80292d:	89 55 e8             	mov    %edx,-0x18(%rbp)
  802930:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802934:	79 05                	jns    80293b <ipc_host_recv+0x92>
  802936:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802939:	eb 03                	jmp    80293e <ipc_host_recv+0x95>
  80293b:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80293e:	48 83 c4 28          	add    $0x28,%rsp
  802942:	5b                   	pop    %rbx
  802943:	5d                   	pop    %rbp
  802944:	c3                   	retq   

0000000000802945 <ipc_host_send>:
  802945:	55                   	push   %rbp
  802946:	48 89 e5             	mov    %rsp,%rbp
  802949:	53                   	push   %rbx
  80294a:	48 83 ec 38          	sub    $0x38,%rsp
  80294e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802951:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802954:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  802958:	89 4d cc             	mov    %ecx,-0x34(%rbp)
  80295b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  802962:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  802967:	75 0e                	jne    802977 <ipc_host_send+0x32>
  802969:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802970:	00 00 00 
  802973:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  802977:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80297b:	48 c1 e8 0c          	shr    $0xc,%rax
  80297f:	48 89 c2             	mov    %rax,%rdx
  802982:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802989:	01 00 00 
  80298c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802990:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802996:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80299a:	b8 02 00 00 00       	mov    $0x2,%eax
  80299f:	8b 7d dc             	mov    -0x24(%rbp),%edi
  8029a2:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8029a5:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8029a9:	8b 75 cc             	mov    -0x34(%rbp),%esi
  8029ac:	89 fb                	mov    %edi,%ebx
  8029ae:	0f 01 c1             	vmcall 
  8029b1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8029b4:	eb 26                	jmp    8029dc <ipc_host_send+0x97>
  8029b6:	48 b8 1f 1d 80 00 00 	movabs $0x801d1f,%rax
  8029bd:	00 00 00 
  8029c0:	ff d0                	callq  *%rax
  8029c2:	b8 02 00 00 00       	mov    $0x2,%eax
  8029c7:	8b 7d dc             	mov    -0x24(%rbp),%edi
  8029ca:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8029cd:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8029d1:	8b 75 cc             	mov    -0x34(%rbp),%esi
  8029d4:	89 fb                	mov    %edi,%ebx
  8029d6:	0f 01 c1             	vmcall 
  8029d9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8029dc:	83 7d ec f8          	cmpl   $0xfffffff8,-0x14(%rbp)
  8029e0:	74 d4                	je     8029b6 <ipc_host_send+0x71>
  8029e2:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8029e6:	79 55                	jns    802a3d <ipc_host_send+0xf8>
  8029e8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8029eb:	89 c2                	mov    %eax,%edx
  8029ed:	be 81 00 00 00       	mov    $0x81,%esi
  8029f2:	48 bf 17 55 80 00 00 	movabs $0x805517,%rdi
  8029f9:	00 00 00 
  8029fc:	b8 00 00 00 00       	mov    $0x0,%eax
  802a01:	48 b9 79 08 80 00 00 	movabs $0x800879,%rcx
  802a08:	00 00 00 
  802a0b:	ff d1                	callq  *%rcx
  802a0d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a10:	89 c1                	mov    %eax,%ecx
  802a12:	48 ba f4 54 80 00 00 	movabs $0x8054f4,%rdx
  802a19:	00 00 00 
  802a1c:	be 82 00 00 00       	mov    $0x82,%esi
  802a21:	48 bf 0a 55 80 00 00 	movabs $0x80550a,%rdi
  802a28:	00 00 00 
  802a2b:	b8 00 00 00 00       	mov    $0x0,%eax
  802a30:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  802a37:	00 00 00 
  802a3a:	41 ff d0             	callq  *%r8
  802a3d:	48 83 c4 38          	add    $0x38,%rsp
  802a41:	5b                   	pop    %rbx
  802a42:	5d                   	pop    %rbp
  802a43:	c3                   	retq   

0000000000802a44 <ipc_find_env>:
  802a44:	55                   	push   %rbp
  802a45:	48 89 e5             	mov    %rsp,%rbp
  802a48:	48 83 ec 14          	sub    $0x14,%rsp
  802a4c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802a4f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802a56:	eb 4e                	jmp    802aa6 <ipc_find_env+0x62>
  802a58:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802a5f:	00 00 00 
  802a62:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a65:	48 98                	cltq   
  802a67:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802a6e:	48 01 d0             	add    %rdx,%rax
  802a71:	48 05 d0 00 00 00    	add    $0xd0,%rax
  802a77:	8b 00                	mov    (%rax),%eax
  802a79:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802a7c:	75 24                	jne    802aa2 <ipc_find_env+0x5e>
  802a7e:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802a85:	00 00 00 
  802a88:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a8b:	48 98                	cltq   
  802a8d:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802a94:	48 01 d0             	add    %rdx,%rax
  802a97:	48 05 c0 00 00 00    	add    $0xc0,%rax
  802a9d:	8b 40 08             	mov    0x8(%rax),%eax
  802aa0:	eb 12                	jmp    802ab4 <ipc_find_env+0x70>
  802aa2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802aa6:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  802aad:	7e a9                	jle    802a58 <ipc_find_env+0x14>
  802aaf:	b8 00 00 00 00       	mov    $0x0,%eax
  802ab4:	c9                   	leaveq 
  802ab5:	c3                   	retq   

0000000000802ab6 <fd2num>:
  802ab6:	55                   	push   %rbp
  802ab7:	48 89 e5             	mov    %rsp,%rbp
  802aba:	48 83 ec 08          	sub    $0x8,%rsp
  802abe:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802ac2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802ac6:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802acd:	ff ff ff 
  802ad0:	48 01 d0             	add    %rdx,%rax
  802ad3:	48 c1 e8 0c          	shr    $0xc,%rax
  802ad7:	c9                   	leaveq 
  802ad8:	c3                   	retq   

0000000000802ad9 <fd2data>:
  802ad9:	55                   	push   %rbp
  802ada:	48 89 e5             	mov    %rsp,%rbp
  802add:	48 83 ec 08          	sub    $0x8,%rsp
  802ae1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802ae5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ae9:	48 89 c7             	mov    %rax,%rdi
  802aec:	48 b8 b6 2a 80 00 00 	movabs $0x802ab6,%rax
  802af3:	00 00 00 
  802af6:	ff d0                	callq  *%rax
  802af8:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802afe:	48 c1 e0 0c          	shl    $0xc,%rax
  802b02:	c9                   	leaveq 
  802b03:	c3                   	retq   

0000000000802b04 <fd_alloc>:
  802b04:	55                   	push   %rbp
  802b05:	48 89 e5             	mov    %rsp,%rbp
  802b08:	48 83 ec 18          	sub    $0x18,%rsp
  802b0c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802b10:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802b17:	eb 6b                	jmp    802b84 <fd_alloc+0x80>
  802b19:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b1c:	48 98                	cltq   
  802b1e:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802b24:	48 c1 e0 0c          	shl    $0xc,%rax
  802b28:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802b2c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b30:	48 c1 e8 15          	shr    $0x15,%rax
  802b34:	48 89 c2             	mov    %rax,%rdx
  802b37:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802b3e:	01 00 00 
  802b41:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b45:	83 e0 01             	and    $0x1,%eax
  802b48:	48 85 c0             	test   %rax,%rax
  802b4b:	74 21                	je     802b6e <fd_alloc+0x6a>
  802b4d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b51:	48 c1 e8 0c          	shr    $0xc,%rax
  802b55:	48 89 c2             	mov    %rax,%rdx
  802b58:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802b5f:	01 00 00 
  802b62:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b66:	83 e0 01             	and    $0x1,%eax
  802b69:	48 85 c0             	test   %rax,%rax
  802b6c:	75 12                	jne    802b80 <fd_alloc+0x7c>
  802b6e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b72:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802b76:	48 89 10             	mov    %rdx,(%rax)
  802b79:	b8 00 00 00 00       	mov    $0x0,%eax
  802b7e:	eb 1a                	jmp    802b9a <fd_alloc+0x96>
  802b80:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802b84:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802b88:	7e 8f                	jle    802b19 <fd_alloc+0x15>
  802b8a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b8e:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802b95:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  802b9a:	c9                   	leaveq 
  802b9b:	c3                   	retq   

0000000000802b9c <fd_lookup>:
  802b9c:	55                   	push   %rbp
  802b9d:	48 89 e5             	mov    %rsp,%rbp
  802ba0:	48 83 ec 20          	sub    $0x20,%rsp
  802ba4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802ba7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802bab:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802baf:	78 06                	js     802bb7 <fd_lookup+0x1b>
  802bb1:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802bb5:	7e 07                	jle    802bbe <fd_lookup+0x22>
  802bb7:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802bbc:	eb 6c                	jmp    802c2a <fd_lookup+0x8e>
  802bbe:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802bc1:	48 98                	cltq   
  802bc3:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802bc9:	48 c1 e0 0c          	shl    $0xc,%rax
  802bcd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802bd1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802bd5:	48 c1 e8 15          	shr    $0x15,%rax
  802bd9:	48 89 c2             	mov    %rax,%rdx
  802bdc:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802be3:	01 00 00 
  802be6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802bea:	83 e0 01             	and    $0x1,%eax
  802bed:	48 85 c0             	test   %rax,%rax
  802bf0:	74 21                	je     802c13 <fd_lookup+0x77>
  802bf2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802bf6:	48 c1 e8 0c          	shr    $0xc,%rax
  802bfa:	48 89 c2             	mov    %rax,%rdx
  802bfd:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802c04:	01 00 00 
  802c07:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c0b:	83 e0 01             	and    $0x1,%eax
  802c0e:	48 85 c0             	test   %rax,%rax
  802c11:	75 07                	jne    802c1a <fd_lookup+0x7e>
  802c13:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802c18:	eb 10                	jmp    802c2a <fd_lookup+0x8e>
  802c1a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c1e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802c22:	48 89 10             	mov    %rdx,(%rax)
  802c25:	b8 00 00 00 00       	mov    $0x0,%eax
  802c2a:	c9                   	leaveq 
  802c2b:	c3                   	retq   

0000000000802c2c <fd_close>:
  802c2c:	55                   	push   %rbp
  802c2d:	48 89 e5             	mov    %rsp,%rbp
  802c30:	48 83 ec 30          	sub    $0x30,%rsp
  802c34:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802c38:	89 f0                	mov    %esi,%eax
  802c3a:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802c3d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c41:	48 89 c7             	mov    %rax,%rdi
  802c44:	48 b8 b6 2a 80 00 00 	movabs $0x802ab6,%rax
  802c4b:	00 00 00 
  802c4e:	ff d0                	callq  *%rax
  802c50:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802c54:	48 89 d6             	mov    %rdx,%rsi
  802c57:	89 c7                	mov    %eax,%edi
  802c59:	48 b8 9c 2b 80 00 00 	movabs $0x802b9c,%rax
  802c60:	00 00 00 
  802c63:	ff d0                	callq  *%rax
  802c65:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c68:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c6c:	78 0a                	js     802c78 <fd_close+0x4c>
  802c6e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c72:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802c76:	74 12                	je     802c8a <fd_close+0x5e>
  802c78:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802c7c:	74 05                	je     802c83 <fd_close+0x57>
  802c7e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c81:	eb 05                	jmp    802c88 <fd_close+0x5c>
  802c83:	b8 00 00 00 00       	mov    $0x0,%eax
  802c88:	eb 69                	jmp    802cf3 <fd_close+0xc7>
  802c8a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c8e:	8b 00                	mov    (%rax),%eax
  802c90:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802c94:	48 89 d6             	mov    %rdx,%rsi
  802c97:	89 c7                	mov    %eax,%edi
  802c99:	48 b8 f5 2c 80 00 00 	movabs $0x802cf5,%rax
  802ca0:	00 00 00 
  802ca3:	ff d0                	callq  *%rax
  802ca5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ca8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802cac:	78 2a                	js     802cd8 <fd_close+0xac>
  802cae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802cb2:	48 8b 40 20          	mov    0x20(%rax),%rax
  802cb6:	48 85 c0             	test   %rax,%rax
  802cb9:	74 16                	je     802cd1 <fd_close+0xa5>
  802cbb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802cbf:	48 8b 40 20          	mov    0x20(%rax),%rax
  802cc3:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802cc7:	48 89 d7             	mov    %rdx,%rdi
  802cca:	ff d0                	callq  *%rax
  802ccc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ccf:	eb 07                	jmp    802cd8 <fd_close+0xac>
  802cd1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802cd8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802cdc:	48 89 c6             	mov    %rax,%rsi
  802cdf:	bf 00 00 00 00       	mov    $0x0,%edi
  802ce4:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  802ceb:	00 00 00 
  802cee:	ff d0                	callq  *%rax
  802cf0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cf3:	c9                   	leaveq 
  802cf4:	c3                   	retq   

0000000000802cf5 <dev_lookup>:
  802cf5:	55                   	push   %rbp
  802cf6:	48 89 e5             	mov    %rsp,%rbp
  802cf9:	48 83 ec 20          	sub    $0x20,%rsp
  802cfd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802d00:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802d04:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802d0b:	eb 41                	jmp    802d4e <dev_lookup+0x59>
  802d0d:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802d14:	00 00 00 
  802d17:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802d1a:	48 63 d2             	movslq %edx,%rdx
  802d1d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802d21:	8b 00                	mov    (%rax),%eax
  802d23:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802d26:	75 22                	jne    802d4a <dev_lookup+0x55>
  802d28:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802d2f:	00 00 00 
  802d32:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802d35:	48 63 d2             	movslq %edx,%rdx
  802d38:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802d3c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d40:	48 89 10             	mov    %rdx,(%rax)
  802d43:	b8 00 00 00 00       	mov    $0x0,%eax
  802d48:	eb 60                	jmp    802daa <dev_lookup+0xb5>
  802d4a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802d4e:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802d55:	00 00 00 
  802d58:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802d5b:	48 63 d2             	movslq %edx,%rdx
  802d5e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802d62:	48 85 c0             	test   %rax,%rax
  802d65:	75 a6                	jne    802d0d <dev_lookup+0x18>
  802d67:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  802d6e:	00 00 00 
  802d71:	48 8b 00             	mov    (%rax),%rax
  802d74:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802d7a:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802d7d:	89 c6                	mov    %eax,%esi
  802d7f:	48 bf 38 55 80 00 00 	movabs $0x805538,%rdi
  802d86:	00 00 00 
  802d89:	b8 00 00 00 00       	mov    $0x0,%eax
  802d8e:	48 b9 79 08 80 00 00 	movabs $0x800879,%rcx
  802d95:	00 00 00 
  802d98:	ff d1                	callq  *%rcx
  802d9a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d9e:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802da5:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802daa:	c9                   	leaveq 
  802dab:	c3                   	retq   

0000000000802dac <close>:
  802dac:	55                   	push   %rbp
  802dad:	48 89 e5             	mov    %rsp,%rbp
  802db0:	48 83 ec 20          	sub    $0x20,%rsp
  802db4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802db7:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802dbb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802dbe:	48 89 d6             	mov    %rdx,%rsi
  802dc1:	89 c7                	mov    %eax,%edi
  802dc3:	48 b8 9c 2b 80 00 00 	movabs $0x802b9c,%rax
  802dca:	00 00 00 
  802dcd:	ff d0                	callq  *%rax
  802dcf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802dd2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802dd6:	79 05                	jns    802ddd <close+0x31>
  802dd8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ddb:	eb 18                	jmp    802df5 <close+0x49>
  802ddd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802de1:	be 01 00 00 00       	mov    $0x1,%esi
  802de6:	48 89 c7             	mov    %rax,%rdi
  802de9:	48 b8 2c 2c 80 00 00 	movabs $0x802c2c,%rax
  802df0:	00 00 00 
  802df3:	ff d0                	callq  *%rax
  802df5:	c9                   	leaveq 
  802df6:	c3                   	retq   

0000000000802df7 <close_all>:
  802df7:	55                   	push   %rbp
  802df8:	48 89 e5             	mov    %rsp,%rbp
  802dfb:	48 83 ec 10          	sub    $0x10,%rsp
  802dff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802e06:	eb 15                	jmp    802e1d <close_all+0x26>
  802e08:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e0b:	89 c7                	mov    %eax,%edi
  802e0d:	48 b8 ac 2d 80 00 00 	movabs $0x802dac,%rax
  802e14:	00 00 00 
  802e17:	ff d0                	callq  *%rax
  802e19:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802e1d:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802e21:	7e e5                	jle    802e08 <close_all+0x11>
  802e23:	c9                   	leaveq 
  802e24:	c3                   	retq   

0000000000802e25 <dup>:
  802e25:	55                   	push   %rbp
  802e26:	48 89 e5             	mov    %rsp,%rbp
  802e29:	48 83 ec 40          	sub    $0x40,%rsp
  802e2d:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802e30:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802e33:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802e37:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802e3a:	48 89 d6             	mov    %rdx,%rsi
  802e3d:	89 c7                	mov    %eax,%edi
  802e3f:	48 b8 9c 2b 80 00 00 	movabs $0x802b9c,%rax
  802e46:	00 00 00 
  802e49:	ff d0                	callq  *%rax
  802e4b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e4e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e52:	79 08                	jns    802e5c <dup+0x37>
  802e54:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e57:	e9 70 01 00 00       	jmpq   802fcc <dup+0x1a7>
  802e5c:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802e5f:	89 c7                	mov    %eax,%edi
  802e61:	48 b8 ac 2d 80 00 00 	movabs $0x802dac,%rax
  802e68:	00 00 00 
  802e6b:	ff d0                	callq  *%rax
  802e6d:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802e70:	48 98                	cltq   
  802e72:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802e78:	48 c1 e0 0c          	shl    $0xc,%rax
  802e7c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802e80:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802e84:	48 89 c7             	mov    %rax,%rdi
  802e87:	48 b8 d9 2a 80 00 00 	movabs $0x802ad9,%rax
  802e8e:	00 00 00 
  802e91:	ff d0                	callq  *%rax
  802e93:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802e97:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e9b:	48 89 c7             	mov    %rax,%rdi
  802e9e:	48 b8 d9 2a 80 00 00 	movabs $0x802ad9,%rax
  802ea5:	00 00 00 
  802ea8:	ff d0                	callq  *%rax
  802eaa:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802eae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802eb2:	48 c1 e8 15          	shr    $0x15,%rax
  802eb6:	48 89 c2             	mov    %rax,%rdx
  802eb9:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802ec0:	01 00 00 
  802ec3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802ec7:	83 e0 01             	and    $0x1,%eax
  802eca:	48 85 c0             	test   %rax,%rax
  802ecd:	74 73                	je     802f42 <dup+0x11d>
  802ecf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ed3:	48 c1 e8 0c          	shr    $0xc,%rax
  802ed7:	48 89 c2             	mov    %rax,%rdx
  802eda:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802ee1:	01 00 00 
  802ee4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802ee8:	83 e0 01             	and    $0x1,%eax
  802eeb:	48 85 c0             	test   %rax,%rax
  802eee:	74 52                	je     802f42 <dup+0x11d>
  802ef0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ef4:	48 c1 e8 0c          	shr    $0xc,%rax
  802ef8:	48 89 c2             	mov    %rax,%rdx
  802efb:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802f02:	01 00 00 
  802f05:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802f09:	25 07 0e 00 00       	and    $0xe07,%eax
  802f0e:	89 c1                	mov    %eax,%ecx
  802f10:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802f14:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f18:	41 89 c8             	mov    %ecx,%r8d
  802f1b:	48 89 d1             	mov    %rdx,%rcx
  802f1e:	ba 00 00 00 00       	mov    $0x0,%edx
  802f23:	48 89 c6             	mov    %rax,%rsi
  802f26:	bf 00 00 00 00       	mov    $0x0,%edi
  802f2b:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  802f32:	00 00 00 
  802f35:	ff d0                	callq  *%rax
  802f37:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f3a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f3e:	79 02                	jns    802f42 <dup+0x11d>
  802f40:	eb 57                	jmp    802f99 <dup+0x174>
  802f42:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802f46:	48 c1 e8 0c          	shr    $0xc,%rax
  802f4a:	48 89 c2             	mov    %rax,%rdx
  802f4d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802f54:	01 00 00 
  802f57:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802f5b:	25 07 0e 00 00       	and    $0xe07,%eax
  802f60:	89 c1                	mov    %eax,%ecx
  802f62:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802f66:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802f6a:	41 89 c8             	mov    %ecx,%r8d
  802f6d:	48 89 d1             	mov    %rdx,%rcx
  802f70:	ba 00 00 00 00       	mov    $0x0,%edx
  802f75:	48 89 c6             	mov    %rax,%rsi
  802f78:	bf 00 00 00 00       	mov    $0x0,%edi
  802f7d:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  802f84:	00 00 00 
  802f87:	ff d0                	callq  *%rax
  802f89:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f8c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f90:	79 02                	jns    802f94 <dup+0x16f>
  802f92:	eb 05                	jmp    802f99 <dup+0x174>
  802f94:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802f97:	eb 33                	jmp    802fcc <dup+0x1a7>
  802f99:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f9d:	48 89 c6             	mov    %rax,%rsi
  802fa0:	bf 00 00 00 00       	mov    $0x0,%edi
  802fa5:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  802fac:	00 00 00 
  802faf:	ff d0                	callq  *%rax
  802fb1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802fb5:	48 89 c6             	mov    %rax,%rsi
  802fb8:	bf 00 00 00 00       	mov    $0x0,%edi
  802fbd:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  802fc4:	00 00 00 
  802fc7:	ff d0                	callq  *%rax
  802fc9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fcc:	c9                   	leaveq 
  802fcd:	c3                   	retq   

0000000000802fce <read>:
  802fce:	55                   	push   %rbp
  802fcf:	48 89 e5             	mov    %rsp,%rbp
  802fd2:	48 83 ec 40          	sub    $0x40,%rsp
  802fd6:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802fd9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802fdd:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802fe1:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802fe5:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802fe8:	48 89 d6             	mov    %rdx,%rsi
  802feb:	89 c7                	mov    %eax,%edi
  802fed:	48 b8 9c 2b 80 00 00 	movabs $0x802b9c,%rax
  802ff4:	00 00 00 
  802ff7:	ff d0                	callq  *%rax
  802ff9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ffc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803000:	78 24                	js     803026 <read+0x58>
  803002:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803006:	8b 00                	mov    (%rax),%eax
  803008:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80300c:	48 89 d6             	mov    %rdx,%rsi
  80300f:	89 c7                	mov    %eax,%edi
  803011:	48 b8 f5 2c 80 00 00 	movabs $0x802cf5,%rax
  803018:	00 00 00 
  80301b:	ff d0                	callq  *%rax
  80301d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803020:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803024:	79 05                	jns    80302b <read+0x5d>
  803026:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803029:	eb 76                	jmp    8030a1 <read+0xd3>
  80302b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80302f:	8b 40 08             	mov    0x8(%rax),%eax
  803032:	83 e0 03             	and    $0x3,%eax
  803035:	83 f8 01             	cmp    $0x1,%eax
  803038:	75 3a                	jne    803074 <read+0xa6>
  80303a:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  803041:	00 00 00 
  803044:	48 8b 00             	mov    (%rax),%rax
  803047:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80304d:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803050:	89 c6                	mov    %eax,%esi
  803052:	48 bf 57 55 80 00 00 	movabs $0x805557,%rdi
  803059:	00 00 00 
  80305c:	b8 00 00 00 00       	mov    $0x0,%eax
  803061:	48 b9 79 08 80 00 00 	movabs $0x800879,%rcx
  803068:	00 00 00 
  80306b:	ff d1                	callq  *%rcx
  80306d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803072:	eb 2d                	jmp    8030a1 <read+0xd3>
  803074:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803078:	48 8b 40 10          	mov    0x10(%rax),%rax
  80307c:	48 85 c0             	test   %rax,%rax
  80307f:	75 07                	jne    803088 <read+0xba>
  803081:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803086:	eb 19                	jmp    8030a1 <read+0xd3>
  803088:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80308c:	48 8b 40 10          	mov    0x10(%rax),%rax
  803090:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803094:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803098:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80309c:	48 89 cf             	mov    %rcx,%rdi
  80309f:	ff d0                	callq  *%rax
  8030a1:	c9                   	leaveq 
  8030a2:	c3                   	retq   

00000000008030a3 <readn>:
  8030a3:	55                   	push   %rbp
  8030a4:	48 89 e5             	mov    %rsp,%rbp
  8030a7:	48 83 ec 30          	sub    $0x30,%rsp
  8030ab:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8030ae:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8030b2:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8030b6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8030bd:	eb 49                	jmp    803108 <readn+0x65>
  8030bf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030c2:	48 98                	cltq   
  8030c4:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8030c8:	48 29 c2             	sub    %rax,%rdx
  8030cb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030ce:	48 63 c8             	movslq %eax,%rcx
  8030d1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8030d5:	48 01 c1             	add    %rax,%rcx
  8030d8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8030db:	48 89 ce             	mov    %rcx,%rsi
  8030de:	89 c7                	mov    %eax,%edi
  8030e0:	48 b8 ce 2f 80 00 00 	movabs $0x802fce,%rax
  8030e7:	00 00 00 
  8030ea:	ff d0                	callq  *%rax
  8030ec:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8030ef:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8030f3:	79 05                	jns    8030fa <readn+0x57>
  8030f5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8030f8:	eb 1c                	jmp    803116 <readn+0x73>
  8030fa:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8030fe:	75 02                	jne    803102 <readn+0x5f>
  803100:	eb 11                	jmp    803113 <readn+0x70>
  803102:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803105:	01 45 fc             	add    %eax,-0x4(%rbp)
  803108:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80310b:	48 98                	cltq   
  80310d:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803111:	72 ac                	jb     8030bf <readn+0x1c>
  803113:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803116:	c9                   	leaveq 
  803117:	c3                   	retq   

0000000000803118 <write>:
  803118:	55                   	push   %rbp
  803119:	48 89 e5             	mov    %rsp,%rbp
  80311c:	48 83 ec 40          	sub    $0x40,%rsp
  803120:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803123:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803127:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80312b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80312f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803132:	48 89 d6             	mov    %rdx,%rsi
  803135:	89 c7                	mov    %eax,%edi
  803137:	48 b8 9c 2b 80 00 00 	movabs $0x802b9c,%rax
  80313e:	00 00 00 
  803141:	ff d0                	callq  *%rax
  803143:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803146:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80314a:	78 24                	js     803170 <write+0x58>
  80314c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803150:	8b 00                	mov    (%rax),%eax
  803152:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803156:	48 89 d6             	mov    %rdx,%rsi
  803159:	89 c7                	mov    %eax,%edi
  80315b:	48 b8 f5 2c 80 00 00 	movabs $0x802cf5,%rax
  803162:	00 00 00 
  803165:	ff d0                	callq  *%rax
  803167:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80316a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80316e:	79 05                	jns    803175 <write+0x5d>
  803170:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803173:	eb 75                	jmp    8031ea <write+0xd2>
  803175:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803179:	8b 40 08             	mov    0x8(%rax),%eax
  80317c:	83 e0 03             	and    $0x3,%eax
  80317f:	85 c0                	test   %eax,%eax
  803181:	75 3a                	jne    8031bd <write+0xa5>
  803183:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  80318a:	00 00 00 
  80318d:	48 8b 00             	mov    (%rax),%rax
  803190:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803196:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803199:	89 c6                	mov    %eax,%esi
  80319b:	48 bf 73 55 80 00 00 	movabs $0x805573,%rdi
  8031a2:	00 00 00 
  8031a5:	b8 00 00 00 00       	mov    $0x0,%eax
  8031aa:	48 b9 79 08 80 00 00 	movabs $0x800879,%rcx
  8031b1:	00 00 00 
  8031b4:	ff d1                	callq  *%rcx
  8031b6:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8031bb:	eb 2d                	jmp    8031ea <write+0xd2>
  8031bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031c1:	48 8b 40 18          	mov    0x18(%rax),%rax
  8031c5:	48 85 c0             	test   %rax,%rax
  8031c8:	75 07                	jne    8031d1 <write+0xb9>
  8031ca:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8031cf:	eb 19                	jmp    8031ea <write+0xd2>
  8031d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031d5:	48 8b 40 18          	mov    0x18(%rax),%rax
  8031d9:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8031dd:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8031e1:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8031e5:	48 89 cf             	mov    %rcx,%rdi
  8031e8:	ff d0                	callq  *%rax
  8031ea:	c9                   	leaveq 
  8031eb:	c3                   	retq   

00000000008031ec <seek>:
  8031ec:	55                   	push   %rbp
  8031ed:	48 89 e5             	mov    %rsp,%rbp
  8031f0:	48 83 ec 18          	sub    $0x18,%rsp
  8031f4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8031f7:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8031fa:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8031fe:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803201:	48 89 d6             	mov    %rdx,%rsi
  803204:	89 c7                	mov    %eax,%edi
  803206:	48 b8 9c 2b 80 00 00 	movabs $0x802b9c,%rax
  80320d:	00 00 00 
  803210:	ff d0                	callq  *%rax
  803212:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803215:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803219:	79 05                	jns    803220 <seek+0x34>
  80321b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80321e:	eb 0f                	jmp    80322f <seek+0x43>
  803220:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803224:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803227:	89 50 04             	mov    %edx,0x4(%rax)
  80322a:	b8 00 00 00 00       	mov    $0x0,%eax
  80322f:	c9                   	leaveq 
  803230:	c3                   	retq   

0000000000803231 <ftruncate>:
  803231:	55                   	push   %rbp
  803232:	48 89 e5             	mov    %rsp,%rbp
  803235:	48 83 ec 30          	sub    $0x30,%rsp
  803239:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80323c:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80323f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803243:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803246:	48 89 d6             	mov    %rdx,%rsi
  803249:	89 c7                	mov    %eax,%edi
  80324b:	48 b8 9c 2b 80 00 00 	movabs $0x802b9c,%rax
  803252:	00 00 00 
  803255:	ff d0                	callq  *%rax
  803257:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80325a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80325e:	78 24                	js     803284 <ftruncate+0x53>
  803260:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803264:	8b 00                	mov    (%rax),%eax
  803266:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80326a:	48 89 d6             	mov    %rdx,%rsi
  80326d:	89 c7                	mov    %eax,%edi
  80326f:	48 b8 f5 2c 80 00 00 	movabs $0x802cf5,%rax
  803276:	00 00 00 
  803279:	ff d0                	callq  *%rax
  80327b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80327e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803282:	79 05                	jns    803289 <ftruncate+0x58>
  803284:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803287:	eb 72                	jmp    8032fb <ftruncate+0xca>
  803289:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80328d:	8b 40 08             	mov    0x8(%rax),%eax
  803290:	83 e0 03             	and    $0x3,%eax
  803293:	85 c0                	test   %eax,%eax
  803295:	75 3a                	jne    8032d1 <ftruncate+0xa0>
  803297:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  80329e:	00 00 00 
  8032a1:	48 8b 00             	mov    (%rax),%rax
  8032a4:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8032aa:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8032ad:	89 c6                	mov    %eax,%esi
  8032af:	48 bf 90 55 80 00 00 	movabs $0x805590,%rdi
  8032b6:	00 00 00 
  8032b9:	b8 00 00 00 00       	mov    $0x0,%eax
  8032be:	48 b9 79 08 80 00 00 	movabs $0x800879,%rcx
  8032c5:	00 00 00 
  8032c8:	ff d1                	callq  *%rcx
  8032ca:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8032cf:	eb 2a                	jmp    8032fb <ftruncate+0xca>
  8032d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032d5:	48 8b 40 30          	mov    0x30(%rax),%rax
  8032d9:	48 85 c0             	test   %rax,%rax
  8032dc:	75 07                	jne    8032e5 <ftruncate+0xb4>
  8032de:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8032e3:	eb 16                	jmp    8032fb <ftruncate+0xca>
  8032e5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032e9:	48 8b 40 30          	mov    0x30(%rax),%rax
  8032ed:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8032f1:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8032f4:	89 ce                	mov    %ecx,%esi
  8032f6:	48 89 d7             	mov    %rdx,%rdi
  8032f9:	ff d0                	callq  *%rax
  8032fb:	c9                   	leaveq 
  8032fc:	c3                   	retq   

00000000008032fd <fstat>:
  8032fd:	55                   	push   %rbp
  8032fe:	48 89 e5             	mov    %rsp,%rbp
  803301:	48 83 ec 30          	sub    $0x30,%rsp
  803305:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803308:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80330c:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803310:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803313:	48 89 d6             	mov    %rdx,%rsi
  803316:	89 c7                	mov    %eax,%edi
  803318:	48 b8 9c 2b 80 00 00 	movabs $0x802b9c,%rax
  80331f:	00 00 00 
  803322:	ff d0                	callq  *%rax
  803324:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803327:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80332b:	78 24                	js     803351 <fstat+0x54>
  80332d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803331:	8b 00                	mov    (%rax),%eax
  803333:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803337:	48 89 d6             	mov    %rdx,%rsi
  80333a:	89 c7                	mov    %eax,%edi
  80333c:	48 b8 f5 2c 80 00 00 	movabs $0x802cf5,%rax
  803343:	00 00 00 
  803346:	ff d0                	callq  *%rax
  803348:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80334b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80334f:	79 05                	jns    803356 <fstat+0x59>
  803351:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803354:	eb 5e                	jmp    8033b4 <fstat+0xb7>
  803356:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80335a:	48 8b 40 28          	mov    0x28(%rax),%rax
  80335e:	48 85 c0             	test   %rax,%rax
  803361:	75 07                	jne    80336a <fstat+0x6d>
  803363:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803368:	eb 4a                	jmp    8033b4 <fstat+0xb7>
  80336a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80336e:	c6 00 00             	movb   $0x0,(%rax)
  803371:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803375:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  80337c:	00 00 00 
  80337f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803383:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80338a:	00 00 00 
  80338d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803391:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803395:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  80339c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033a0:	48 8b 40 28          	mov    0x28(%rax),%rax
  8033a4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8033a8:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8033ac:	48 89 ce             	mov    %rcx,%rsi
  8033af:	48 89 d7             	mov    %rdx,%rdi
  8033b2:	ff d0                	callq  *%rax
  8033b4:	c9                   	leaveq 
  8033b5:	c3                   	retq   

00000000008033b6 <stat>:
  8033b6:	55                   	push   %rbp
  8033b7:	48 89 e5             	mov    %rsp,%rbp
  8033ba:	48 83 ec 20          	sub    $0x20,%rsp
  8033be:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8033c2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8033c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8033ca:	be 00 00 00 00       	mov    $0x0,%esi
  8033cf:	48 89 c7             	mov    %rax,%rdi
  8033d2:	48 b8 a4 34 80 00 00 	movabs $0x8034a4,%rax
  8033d9:	00 00 00 
  8033dc:	ff d0                	callq  *%rax
  8033de:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033e1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033e5:	79 05                	jns    8033ec <stat+0x36>
  8033e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033ea:	eb 2f                	jmp    80341b <stat+0x65>
  8033ec:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8033f0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033f3:	48 89 d6             	mov    %rdx,%rsi
  8033f6:	89 c7                	mov    %eax,%edi
  8033f8:	48 b8 fd 32 80 00 00 	movabs $0x8032fd,%rax
  8033ff:	00 00 00 
  803402:	ff d0                	callq  *%rax
  803404:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803407:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80340a:	89 c7                	mov    %eax,%edi
  80340c:	48 b8 ac 2d 80 00 00 	movabs $0x802dac,%rax
  803413:	00 00 00 
  803416:	ff d0                	callq  *%rax
  803418:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80341b:	c9                   	leaveq 
  80341c:	c3                   	retq   

000000000080341d <fsipc>:
  80341d:	55                   	push   %rbp
  80341e:	48 89 e5             	mov    %rsp,%rbp
  803421:	48 83 ec 10          	sub    $0x10,%rsp
  803425:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803428:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80342c:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803433:	00 00 00 
  803436:	8b 00                	mov    (%rax),%eax
  803438:	85 c0                	test   %eax,%eax
  80343a:	75 1d                	jne    803459 <fsipc+0x3c>
  80343c:	bf 01 00 00 00       	mov    $0x1,%edi
  803441:	48 b8 44 2a 80 00 00 	movabs $0x802a44,%rax
  803448:	00 00 00 
  80344b:	ff d0                	callq  *%rax
  80344d:	48 ba 04 80 80 00 00 	movabs $0x808004,%rdx
  803454:	00 00 00 
  803457:	89 02                	mov    %eax,(%rdx)
  803459:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803460:	00 00 00 
  803463:	8b 00                	mov    (%rax),%eax
  803465:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803468:	b9 07 00 00 00       	mov    $0x7,%ecx
  80346d:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  803474:	00 00 00 
  803477:	89 c7                	mov    %eax,%edi
  803479:	48 b8 13 28 80 00 00 	movabs $0x802813,%rax
  803480:	00 00 00 
  803483:	ff d0                	callq  *%rax
  803485:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803489:	ba 00 00 00 00       	mov    $0x0,%edx
  80348e:	48 89 c6             	mov    %rax,%rsi
  803491:	bf 00 00 00 00       	mov    $0x0,%edi
  803496:	48 b8 52 27 80 00 00 	movabs $0x802752,%rax
  80349d:	00 00 00 
  8034a0:	ff d0                	callq  *%rax
  8034a2:	c9                   	leaveq 
  8034a3:	c3                   	retq   

00000000008034a4 <open>:
  8034a4:	55                   	push   %rbp
  8034a5:	48 89 e5             	mov    %rsp,%rbp
  8034a8:	48 83 ec 20          	sub    $0x20,%rsp
  8034ac:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8034b0:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8034b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034b7:	48 89 c7             	mov    %rax,%rdi
  8034ba:	48 b8 c2 13 80 00 00 	movabs $0x8013c2,%rax
  8034c1:	00 00 00 
  8034c4:	ff d0                	callq  *%rax
  8034c6:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8034cb:	7e 0a                	jle    8034d7 <open+0x33>
  8034cd:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8034d2:	e9 a5 00 00 00       	jmpq   80357c <open+0xd8>
  8034d7:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8034db:	48 89 c7             	mov    %rax,%rdi
  8034de:	48 b8 04 2b 80 00 00 	movabs $0x802b04,%rax
  8034e5:	00 00 00 
  8034e8:	ff d0                	callq  *%rax
  8034ea:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034ed:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034f1:	79 08                	jns    8034fb <open+0x57>
  8034f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034f6:	e9 81 00 00 00       	jmpq   80357c <open+0xd8>
  8034fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034ff:	48 89 c6             	mov    %rax,%rsi
  803502:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  803509:	00 00 00 
  80350c:	48 b8 2e 14 80 00 00 	movabs $0x80142e,%rax
  803513:	00 00 00 
  803516:	ff d0                	callq  *%rax
  803518:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80351f:	00 00 00 
  803522:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803525:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  80352b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80352f:	48 89 c6             	mov    %rax,%rsi
  803532:	bf 01 00 00 00       	mov    $0x1,%edi
  803537:	48 b8 1d 34 80 00 00 	movabs $0x80341d,%rax
  80353e:	00 00 00 
  803541:	ff d0                	callq  *%rax
  803543:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803546:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80354a:	79 1d                	jns    803569 <open+0xc5>
  80354c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803550:	be 00 00 00 00       	mov    $0x0,%esi
  803555:	48 89 c7             	mov    %rax,%rdi
  803558:	48 b8 2c 2c 80 00 00 	movabs $0x802c2c,%rax
  80355f:	00 00 00 
  803562:	ff d0                	callq  *%rax
  803564:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803567:	eb 13                	jmp    80357c <open+0xd8>
  803569:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80356d:	48 89 c7             	mov    %rax,%rdi
  803570:	48 b8 b6 2a 80 00 00 	movabs $0x802ab6,%rax
  803577:	00 00 00 
  80357a:	ff d0                	callq  *%rax
  80357c:	c9                   	leaveq 
  80357d:	c3                   	retq   

000000000080357e <devfile_flush>:
  80357e:	55                   	push   %rbp
  80357f:	48 89 e5             	mov    %rsp,%rbp
  803582:	48 83 ec 10          	sub    $0x10,%rsp
  803586:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80358a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80358e:	8b 50 0c             	mov    0xc(%rax),%edx
  803591:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803598:	00 00 00 
  80359b:	89 10                	mov    %edx,(%rax)
  80359d:	be 00 00 00 00       	mov    $0x0,%esi
  8035a2:	bf 06 00 00 00       	mov    $0x6,%edi
  8035a7:	48 b8 1d 34 80 00 00 	movabs $0x80341d,%rax
  8035ae:	00 00 00 
  8035b1:	ff d0                	callq  *%rax
  8035b3:	c9                   	leaveq 
  8035b4:	c3                   	retq   

00000000008035b5 <devfile_read>:
  8035b5:	55                   	push   %rbp
  8035b6:	48 89 e5             	mov    %rsp,%rbp
  8035b9:	48 83 ec 30          	sub    $0x30,%rsp
  8035bd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8035c1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8035c5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8035c9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035cd:	8b 50 0c             	mov    0xc(%rax),%edx
  8035d0:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8035d7:	00 00 00 
  8035da:	89 10                	mov    %edx,(%rax)
  8035dc:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8035e3:	00 00 00 
  8035e6:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8035ea:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8035ee:	be 00 00 00 00       	mov    $0x0,%esi
  8035f3:	bf 03 00 00 00       	mov    $0x3,%edi
  8035f8:	48 b8 1d 34 80 00 00 	movabs $0x80341d,%rax
  8035ff:	00 00 00 
  803602:	ff d0                	callq  *%rax
  803604:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803607:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80360b:	79 08                	jns    803615 <devfile_read+0x60>
  80360d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803610:	e9 a4 00 00 00       	jmpq   8036b9 <devfile_read+0x104>
  803615:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803618:	48 98                	cltq   
  80361a:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80361e:	76 35                	jbe    803655 <devfile_read+0xa0>
  803620:	48 b9 b6 55 80 00 00 	movabs $0x8055b6,%rcx
  803627:	00 00 00 
  80362a:	48 ba bd 55 80 00 00 	movabs $0x8055bd,%rdx
  803631:	00 00 00 
  803634:	be 89 00 00 00       	mov    $0x89,%esi
  803639:	48 bf d2 55 80 00 00 	movabs $0x8055d2,%rdi
  803640:	00 00 00 
  803643:	b8 00 00 00 00       	mov    $0x0,%eax
  803648:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  80364f:	00 00 00 
  803652:	41 ff d0             	callq  *%r8
  803655:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  80365c:	7e 35                	jle    803693 <devfile_read+0xde>
  80365e:	48 b9 e0 55 80 00 00 	movabs $0x8055e0,%rcx
  803665:	00 00 00 
  803668:	48 ba bd 55 80 00 00 	movabs $0x8055bd,%rdx
  80366f:	00 00 00 
  803672:	be 8a 00 00 00       	mov    $0x8a,%esi
  803677:	48 bf d2 55 80 00 00 	movabs $0x8055d2,%rdi
  80367e:	00 00 00 
  803681:	b8 00 00 00 00       	mov    $0x0,%eax
  803686:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  80368d:	00 00 00 
  803690:	41 ff d0             	callq  *%r8
  803693:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803696:	48 63 d0             	movslq %eax,%rdx
  803699:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80369d:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8036a4:	00 00 00 
  8036a7:	48 89 c7             	mov    %rax,%rdi
  8036aa:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  8036b1:	00 00 00 
  8036b4:	ff d0                	callq  *%rax
  8036b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036b9:	c9                   	leaveq 
  8036ba:	c3                   	retq   

00000000008036bb <devfile_write>:
  8036bb:	55                   	push   %rbp
  8036bc:	48 89 e5             	mov    %rsp,%rbp
  8036bf:	48 83 ec 40          	sub    $0x40,%rsp
  8036c3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8036c7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8036cb:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8036cf:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8036d3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8036d7:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  8036de:	00 
  8036df:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036e3:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  8036e7:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  8036ec:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  8036f0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8036f4:	8b 50 0c             	mov    0xc(%rax),%edx
  8036f7:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8036fe:	00 00 00 
  803701:	89 10                	mov    %edx,(%rax)
  803703:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80370a:	00 00 00 
  80370d:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803711:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803715:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803719:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80371d:	48 89 c6             	mov    %rax,%rsi
  803720:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  803727:	00 00 00 
  80372a:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  803731:	00 00 00 
  803734:	ff d0                	callq  *%rax
  803736:	be 00 00 00 00       	mov    $0x0,%esi
  80373b:	bf 04 00 00 00       	mov    $0x4,%edi
  803740:	48 b8 1d 34 80 00 00 	movabs $0x80341d,%rax
  803747:	00 00 00 
  80374a:	ff d0                	callq  *%rax
  80374c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80374f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803753:	79 05                	jns    80375a <devfile_write+0x9f>
  803755:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803758:	eb 43                	jmp    80379d <devfile_write+0xe2>
  80375a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80375d:	48 98                	cltq   
  80375f:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803763:	76 35                	jbe    80379a <devfile_write+0xdf>
  803765:	48 b9 b6 55 80 00 00 	movabs $0x8055b6,%rcx
  80376c:	00 00 00 
  80376f:	48 ba bd 55 80 00 00 	movabs $0x8055bd,%rdx
  803776:	00 00 00 
  803779:	be a8 00 00 00       	mov    $0xa8,%esi
  80377e:	48 bf d2 55 80 00 00 	movabs $0x8055d2,%rdi
  803785:	00 00 00 
  803788:	b8 00 00 00 00       	mov    $0x0,%eax
  80378d:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  803794:	00 00 00 
  803797:	41 ff d0             	callq  *%r8
  80379a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80379d:	c9                   	leaveq 
  80379e:	c3                   	retq   

000000000080379f <devfile_stat>:
  80379f:	55                   	push   %rbp
  8037a0:	48 89 e5             	mov    %rsp,%rbp
  8037a3:	48 83 ec 20          	sub    $0x20,%rsp
  8037a7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8037ab:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8037af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037b3:	8b 50 0c             	mov    0xc(%rax),%edx
  8037b6:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8037bd:	00 00 00 
  8037c0:	89 10                	mov    %edx,(%rax)
  8037c2:	be 00 00 00 00       	mov    $0x0,%esi
  8037c7:	bf 05 00 00 00       	mov    $0x5,%edi
  8037cc:	48 b8 1d 34 80 00 00 	movabs $0x80341d,%rax
  8037d3:	00 00 00 
  8037d6:	ff d0                	callq  *%rax
  8037d8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037db:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037df:	79 05                	jns    8037e6 <devfile_stat+0x47>
  8037e1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037e4:	eb 56                	jmp    80383c <devfile_stat+0x9d>
  8037e6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8037ea:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8037f1:	00 00 00 
  8037f4:	48 89 c7             	mov    %rax,%rdi
  8037f7:	48 b8 2e 14 80 00 00 	movabs $0x80142e,%rax
  8037fe:	00 00 00 
  803801:	ff d0                	callq  *%rax
  803803:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80380a:	00 00 00 
  80380d:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  803813:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803817:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80381d:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803824:	00 00 00 
  803827:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  80382d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803831:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803837:	b8 00 00 00 00       	mov    $0x0,%eax
  80383c:	c9                   	leaveq 
  80383d:	c3                   	retq   

000000000080383e <devfile_trunc>:
  80383e:	55                   	push   %rbp
  80383f:	48 89 e5             	mov    %rsp,%rbp
  803842:	48 83 ec 10          	sub    $0x10,%rsp
  803846:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80384a:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80384d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803851:	8b 50 0c             	mov    0xc(%rax),%edx
  803854:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80385b:	00 00 00 
  80385e:	89 10                	mov    %edx,(%rax)
  803860:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803867:	00 00 00 
  80386a:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80386d:	89 50 04             	mov    %edx,0x4(%rax)
  803870:	be 00 00 00 00       	mov    $0x0,%esi
  803875:	bf 02 00 00 00       	mov    $0x2,%edi
  80387a:	48 b8 1d 34 80 00 00 	movabs $0x80341d,%rax
  803881:	00 00 00 
  803884:	ff d0                	callq  *%rax
  803886:	c9                   	leaveq 
  803887:	c3                   	retq   

0000000000803888 <remove>:
  803888:	55                   	push   %rbp
  803889:	48 89 e5             	mov    %rsp,%rbp
  80388c:	48 83 ec 10          	sub    $0x10,%rsp
  803890:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803894:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803898:	48 89 c7             	mov    %rax,%rdi
  80389b:	48 b8 c2 13 80 00 00 	movabs $0x8013c2,%rax
  8038a2:	00 00 00 
  8038a5:	ff d0                	callq  *%rax
  8038a7:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8038ac:	7e 07                	jle    8038b5 <remove+0x2d>
  8038ae:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8038b3:	eb 33                	jmp    8038e8 <remove+0x60>
  8038b5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038b9:	48 89 c6             	mov    %rax,%rsi
  8038bc:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8038c3:	00 00 00 
  8038c6:	48 b8 2e 14 80 00 00 	movabs $0x80142e,%rax
  8038cd:	00 00 00 
  8038d0:	ff d0                	callq  *%rax
  8038d2:	be 00 00 00 00       	mov    $0x0,%esi
  8038d7:	bf 07 00 00 00       	mov    $0x7,%edi
  8038dc:	48 b8 1d 34 80 00 00 	movabs $0x80341d,%rax
  8038e3:	00 00 00 
  8038e6:	ff d0                	callq  *%rax
  8038e8:	c9                   	leaveq 
  8038e9:	c3                   	retq   

00000000008038ea <sync>:
  8038ea:	55                   	push   %rbp
  8038eb:	48 89 e5             	mov    %rsp,%rbp
  8038ee:	be 00 00 00 00       	mov    $0x0,%esi
  8038f3:	bf 08 00 00 00       	mov    $0x8,%edi
  8038f8:	48 b8 1d 34 80 00 00 	movabs $0x80341d,%rax
  8038ff:	00 00 00 
  803902:	ff d0                	callq  *%rax
  803904:	5d                   	pop    %rbp
  803905:	c3                   	retq   

0000000000803906 <copy>:
  803906:	55                   	push   %rbp
  803907:	48 89 e5             	mov    %rsp,%rbp
  80390a:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  803911:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  803918:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  80391f:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803926:	be 00 00 00 00       	mov    $0x0,%esi
  80392b:	48 89 c7             	mov    %rax,%rdi
  80392e:	48 b8 a4 34 80 00 00 	movabs $0x8034a4,%rax
  803935:	00 00 00 
  803938:	ff d0                	callq  *%rax
  80393a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80393d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803941:	79 28                	jns    80396b <copy+0x65>
  803943:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803946:	89 c6                	mov    %eax,%esi
  803948:	48 bf ec 55 80 00 00 	movabs $0x8055ec,%rdi
  80394f:	00 00 00 
  803952:	b8 00 00 00 00       	mov    $0x0,%eax
  803957:	48 ba 79 08 80 00 00 	movabs $0x800879,%rdx
  80395e:	00 00 00 
  803961:	ff d2                	callq  *%rdx
  803963:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803966:	e9 74 01 00 00       	jmpq   803adf <copy+0x1d9>
  80396b:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  803972:	be 01 01 00 00       	mov    $0x101,%esi
  803977:	48 89 c7             	mov    %rax,%rdi
  80397a:	48 b8 a4 34 80 00 00 	movabs $0x8034a4,%rax
  803981:	00 00 00 
  803984:	ff d0                	callq  *%rax
  803986:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803989:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80398d:	79 39                	jns    8039c8 <copy+0xc2>
  80398f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803992:	89 c6                	mov    %eax,%esi
  803994:	48 bf 02 56 80 00 00 	movabs $0x805602,%rdi
  80399b:	00 00 00 
  80399e:	b8 00 00 00 00       	mov    $0x0,%eax
  8039a3:	48 ba 79 08 80 00 00 	movabs $0x800879,%rdx
  8039aa:	00 00 00 
  8039ad:	ff d2                	callq  *%rdx
  8039af:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039b2:	89 c7                	mov    %eax,%edi
  8039b4:	48 b8 ac 2d 80 00 00 	movabs $0x802dac,%rax
  8039bb:	00 00 00 
  8039be:	ff d0                	callq  *%rax
  8039c0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8039c3:	e9 17 01 00 00       	jmpq   803adf <copy+0x1d9>
  8039c8:	eb 74                	jmp    803a3e <copy+0x138>
  8039ca:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8039cd:	48 63 d0             	movslq %eax,%rdx
  8039d0:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8039d7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8039da:	48 89 ce             	mov    %rcx,%rsi
  8039dd:	89 c7                	mov    %eax,%edi
  8039df:	48 b8 18 31 80 00 00 	movabs $0x803118,%rax
  8039e6:	00 00 00 
  8039e9:	ff d0                	callq  *%rax
  8039eb:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8039ee:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8039f2:	79 4a                	jns    803a3e <copy+0x138>
  8039f4:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8039f7:	89 c6                	mov    %eax,%esi
  8039f9:	48 bf 1c 56 80 00 00 	movabs $0x80561c,%rdi
  803a00:	00 00 00 
  803a03:	b8 00 00 00 00       	mov    $0x0,%eax
  803a08:	48 ba 79 08 80 00 00 	movabs $0x800879,%rdx
  803a0f:	00 00 00 
  803a12:	ff d2                	callq  *%rdx
  803a14:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a17:	89 c7                	mov    %eax,%edi
  803a19:	48 b8 ac 2d 80 00 00 	movabs $0x802dac,%rax
  803a20:	00 00 00 
  803a23:	ff d0                	callq  *%rax
  803a25:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803a28:	89 c7                	mov    %eax,%edi
  803a2a:	48 b8 ac 2d 80 00 00 	movabs $0x802dac,%rax
  803a31:	00 00 00 
  803a34:	ff d0                	callq  *%rax
  803a36:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803a39:	e9 a1 00 00 00       	jmpq   803adf <copy+0x1d9>
  803a3e:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803a45:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a48:	ba 00 02 00 00       	mov    $0x200,%edx
  803a4d:	48 89 ce             	mov    %rcx,%rsi
  803a50:	89 c7                	mov    %eax,%edi
  803a52:	48 b8 ce 2f 80 00 00 	movabs $0x802fce,%rax
  803a59:	00 00 00 
  803a5c:	ff d0                	callq  *%rax
  803a5e:	89 45 f4             	mov    %eax,-0xc(%rbp)
  803a61:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803a65:	0f 8f 5f ff ff ff    	jg     8039ca <copy+0xc4>
  803a6b:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803a6f:	79 47                	jns    803ab8 <copy+0x1b2>
  803a71:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803a74:	89 c6                	mov    %eax,%esi
  803a76:	48 bf 2f 56 80 00 00 	movabs $0x80562f,%rdi
  803a7d:	00 00 00 
  803a80:	b8 00 00 00 00       	mov    $0x0,%eax
  803a85:	48 ba 79 08 80 00 00 	movabs $0x800879,%rdx
  803a8c:	00 00 00 
  803a8f:	ff d2                	callq  *%rdx
  803a91:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a94:	89 c7                	mov    %eax,%edi
  803a96:	48 b8 ac 2d 80 00 00 	movabs $0x802dac,%rax
  803a9d:	00 00 00 
  803aa0:	ff d0                	callq  *%rax
  803aa2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803aa5:	89 c7                	mov    %eax,%edi
  803aa7:	48 b8 ac 2d 80 00 00 	movabs $0x802dac,%rax
  803aae:	00 00 00 
  803ab1:	ff d0                	callq  *%rax
  803ab3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803ab6:	eb 27                	jmp    803adf <copy+0x1d9>
  803ab8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803abb:	89 c7                	mov    %eax,%edi
  803abd:	48 b8 ac 2d 80 00 00 	movabs $0x802dac,%rax
  803ac4:	00 00 00 
  803ac7:	ff d0                	callq  *%rax
  803ac9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803acc:	89 c7                	mov    %eax,%edi
  803ace:	48 b8 ac 2d 80 00 00 	movabs $0x802dac,%rax
  803ad5:	00 00 00 
  803ad8:	ff d0                	callq  *%rax
  803ada:	b8 00 00 00 00       	mov    $0x0,%eax
  803adf:	c9                   	leaveq 
  803ae0:	c3                   	retq   

0000000000803ae1 <fd2sockid>:
  803ae1:	55                   	push   %rbp
  803ae2:	48 89 e5             	mov    %rsp,%rbp
  803ae5:	48 83 ec 20          	sub    $0x20,%rsp
  803ae9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803aec:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803af0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803af3:	48 89 d6             	mov    %rdx,%rsi
  803af6:	89 c7                	mov    %eax,%edi
  803af8:	48 b8 9c 2b 80 00 00 	movabs $0x802b9c,%rax
  803aff:	00 00 00 
  803b02:	ff d0                	callq  *%rax
  803b04:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b07:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b0b:	79 05                	jns    803b12 <fd2sockid+0x31>
  803b0d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b10:	eb 24                	jmp    803b36 <fd2sockid+0x55>
  803b12:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b16:	8b 10                	mov    (%rax),%edx
  803b18:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  803b1f:	00 00 00 
  803b22:	8b 00                	mov    (%rax),%eax
  803b24:	39 c2                	cmp    %eax,%edx
  803b26:	74 07                	je     803b2f <fd2sockid+0x4e>
  803b28:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803b2d:	eb 07                	jmp    803b36 <fd2sockid+0x55>
  803b2f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b33:	8b 40 0c             	mov    0xc(%rax),%eax
  803b36:	c9                   	leaveq 
  803b37:	c3                   	retq   

0000000000803b38 <alloc_sockfd>:
  803b38:	55                   	push   %rbp
  803b39:	48 89 e5             	mov    %rsp,%rbp
  803b3c:	48 83 ec 20          	sub    $0x20,%rsp
  803b40:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b43:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803b47:	48 89 c7             	mov    %rax,%rdi
  803b4a:	48 b8 04 2b 80 00 00 	movabs $0x802b04,%rax
  803b51:	00 00 00 
  803b54:	ff d0                	callq  *%rax
  803b56:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b59:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b5d:	78 26                	js     803b85 <alloc_sockfd+0x4d>
  803b5f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b63:	ba 07 04 00 00       	mov    $0x407,%edx
  803b68:	48 89 c6             	mov    %rax,%rsi
  803b6b:	bf 00 00 00 00       	mov    $0x0,%edi
  803b70:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  803b77:	00 00 00 
  803b7a:	ff d0                	callq  *%rax
  803b7c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b7f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b83:	79 16                	jns    803b9b <alloc_sockfd+0x63>
  803b85:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b88:	89 c7                	mov    %eax,%edi
  803b8a:	48 b8 45 40 80 00 00 	movabs $0x804045,%rax
  803b91:	00 00 00 
  803b94:	ff d0                	callq  *%rax
  803b96:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b99:	eb 3a                	jmp    803bd5 <alloc_sockfd+0x9d>
  803b9b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b9f:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  803ba6:	00 00 00 
  803ba9:	8b 12                	mov    (%rdx),%edx
  803bab:	89 10                	mov    %edx,(%rax)
  803bad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bb1:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803bb8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bbc:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803bbf:	89 50 0c             	mov    %edx,0xc(%rax)
  803bc2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bc6:	48 89 c7             	mov    %rax,%rdi
  803bc9:	48 b8 b6 2a 80 00 00 	movabs $0x802ab6,%rax
  803bd0:	00 00 00 
  803bd3:	ff d0                	callq  *%rax
  803bd5:	c9                   	leaveq 
  803bd6:	c3                   	retq   

0000000000803bd7 <accept>:
  803bd7:	55                   	push   %rbp
  803bd8:	48 89 e5             	mov    %rsp,%rbp
  803bdb:	48 83 ec 30          	sub    $0x30,%rsp
  803bdf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803be2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803be6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803bea:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803bed:	89 c7                	mov    %eax,%edi
  803bef:	48 b8 e1 3a 80 00 00 	movabs $0x803ae1,%rax
  803bf6:	00 00 00 
  803bf9:	ff d0                	callq  *%rax
  803bfb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bfe:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c02:	79 05                	jns    803c09 <accept+0x32>
  803c04:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c07:	eb 3b                	jmp    803c44 <accept+0x6d>
  803c09:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803c0d:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803c11:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c14:	48 89 ce             	mov    %rcx,%rsi
  803c17:	89 c7                	mov    %eax,%edi
  803c19:	48 b8 22 3f 80 00 00 	movabs $0x803f22,%rax
  803c20:	00 00 00 
  803c23:	ff d0                	callq  *%rax
  803c25:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c28:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c2c:	79 05                	jns    803c33 <accept+0x5c>
  803c2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c31:	eb 11                	jmp    803c44 <accept+0x6d>
  803c33:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c36:	89 c7                	mov    %eax,%edi
  803c38:	48 b8 38 3b 80 00 00 	movabs $0x803b38,%rax
  803c3f:	00 00 00 
  803c42:	ff d0                	callq  *%rax
  803c44:	c9                   	leaveq 
  803c45:	c3                   	retq   

0000000000803c46 <bind>:
  803c46:	55                   	push   %rbp
  803c47:	48 89 e5             	mov    %rsp,%rbp
  803c4a:	48 83 ec 20          	sub    $0x20,%rsp
  803c4e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c51:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c55:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803c58:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c5b:	89 c7                	mov    %eax,%edi
  803c5d:	48 b8 e1 3a 80 00 00 	movabs $0x803ae1,%rax
  803c64:	00 00 00 
  803c67:	ff d0                	callq  *%rax
  803c69:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c6c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c70:	79 05                	jns    803c77 <bind+0x31>
  803c72:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c75:	eb 1b                	jmp    803c92 <bind+0x4c>
  803c77:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803c7a:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803c7e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c81:	48 89 ce             	mov    %rcx,%rsi
  803c84:	89 c7                	mov    %eax,%edi
  803c86:	48 b8 a1 3f 80 00 00 	movabs $0x803fa1,%rax
  803c8d:	00 00 00 
  803c90:	ff d0                	callq  *%rax
  803c92:	c9                   	leaveq 
  803c93:	c3                   	retq   

0000000000803c94 <shutdown>:
  803c94:	55                   	push   %rbp
  803c95:	48 89 e5             	mov    %rsp,%rbp
  803c98:	48 83 ec 20          	sub    $0x20,%rsp
  803c9c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c9f:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803ca2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ca5:	89 c7                	mov    %eax,%edi
  803ca7:	48 b8 e1 3a 80 00 00 	movabs $0x803ae1,%rax
  803cae:	00 00 00 
  803cb1:	ff d0                	callq  *%rax
  803cb3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803cb6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803cba:	79 05                	jns    803cc1 <shutdown+0x2d>
  803cbc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cbf:	eb 16                	jmp    803cd7 <shutdown+0x43>
  803cc1:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803cc4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cc7:	89 d6                	mov    %edx,%esi
  803cc9:	89 c7                	mov    %eax,%edi
  803ccb:	48 b8 05 40 80 00 00 	movabs $0x804005,%rax
  803cd2:	00 00 00 
  803cd5:	ff d0                	callq  *%rax
  803cd7:	c9                   	leaveq 
  803cd8:	c3                   	retq   

0000000000803cd9 <devsock_close>:
  803cd9:	55                   	push   %rbp
  803cda:	48 89 e5             	mov    %rsp,%rbp
  803cdd:	48 83 ec 10          	sub    $0x10,%rsp
  803ce1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803ce5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ce9:	48 89 c7             	mov    %rax,%rdi
  803cec:	48 b8 91 4c 80 00 00 	movabs $0x804c91,%rax
  803cf3:	00 00 00 
  803cf6:	ff d0                	callq  *%rax
  803cf8:	83 f8 01             	cmp    $0x1,%eax
  803cfb:	75 17                	jne    803d14 <devsock_close+0x3b>
  803cfd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d01:	8b 40 0c             	mov    0xc(%rax),%eax
  803d04:	89 c7                	mov    %eax,%edi
  803d06:	48 b8 45 40 80 00 00 	movabs $0x804045,%rax
  803d0d:	00 00 00 
  803d10:	ff d0                	callq  *%rax
  803d12:	eb 05                	jmp    803d19 <devsock_close+0x40>
  803d14:	b8 00 00 00 00       	mov    $0x0,%eax
  803d19:	c9                   	leaveq 
  803d1a:	c3                   	retq   

0000000000803d1b <connect>:
  803d1b:	55                   	push   %rbp
  803d1c:	48 89 e5             	mov    %rsp,%rbp
  803d1f:	48 83 ec 20          	sub    $0x20,%rsp
  803d23:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d26:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803d2a:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803d2d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d30:	89 c7                	mov    %eax,%edi
  803d32:	48 b8 e1 3a 80 00 00 	movabs $0x803ae1,%rax
  803d39:	00 00 00 
  803d3c:	ff d0                	callq  *%rax
  803d3e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d41:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d45:	79 05                	jns    803d4c <connect+0x31>
  803d47:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d4a:	eb 1b                	jmp    803d67 <connect+0x4c>
  803d4c:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803d4f:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803d53:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d56:	48 89 ce             	mov    %rcx,%rsi
  803d59:	89 c7                	mov    %eax,%edi
  803d5b:	48 b8 72 40 80 00 00 	movabs $0x804072,%rax
  803d62:	00 00 00 
  803d65:	ff d0                	callq  *%rax
  803d67:	c9                   	leaveq 
  803d68:	c3                   	retq   

0000000000803d69 <listen>:
  803d69:	55                   	push   %rbp
  803d6a:	48 89 e5             	mov    %rsp,%rbp
  803d6d:	48 83 ec 20          	sub    $0x20,%rsp
  803d71:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d74:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803d77:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d7a:	89 c7                	mov    %eax,%edi
  803d7c:	48 b8 e1 3a 80 00 00 	movabs $0x803ae1,%rax
  803d83:	00 00 00 
  803d86:	ff d0                	callq  *%rax
  803d88:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d8b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d8f:	79 05                	jns    803d96 <listen+0x2d>
  803d91:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d94:	eb 16                	jmp    803dac <listen+0x43>
  803d96:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803d99:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d9c:	89 d6                	mov    %edx,%esi
  803d9e:	89 c7                	mov    %eax,%edi
  803da0:	48 b8 d6 40 80 00 00 	movabs $0x8040d6,%rax
  803da7:	00 00 00 
  803daa:	ff d0                	callq  *%rax
  803dac:	c9                   	leaveq 
  803dad:	c3                   	retq   

0000000000803dae <devsock_read>:
  803dae:	55                   	push   %rbp
  803daf:	48 89 e5             	mov    %rsp,%rbp
  803db2:	48 83 ec 20          	sub    $0x20,%rsp
  803db6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803dba:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803dbe:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803dc2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803dc6:	89 c2                	mov    %eax,%edx
  803dc8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803dcc:	8b 40 0c             	mov    0xc(%rax),%eax
  803dcf:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803dd3:	b9 00 00 00 00       	mov    $0x0,%ecx
  803dd8:	89 c7                	mov    %eax,%edi
  803dda:	48 b8 16 41 80 00 00 	movabs $0x804116,%rax
  803de1:	00 00 00 
  803de4:	ff d0                	callq  *%rax
  803de6:	c9                   	leaveq 
  803de7:	c3                   	retq   

0000000000803de8 <devsock_write>:
  803de8:	55                   	push   %rbp
  803de9:	48 89 e5             	mov    %rsp,%rbp
  803dec:	48 83 ec 20          	sub    $0x20,%rsp
  803df0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803df4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803df8:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803dfc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e00:	89 c2                	mov    %eax,%edx
  803e02:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e06:	8b 40 0c             	mov    0xc(%rax),%eax
  803e09:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803e0d:	b9 00 00 00 00       	mov    $0x0,%ecx
  803e12:	89 c7                	mov    %eax,%edi
  803e14:	48 b8 e2 41 80 00 00 	movabs $0x8041e2,%rax
  803e1b:	00 00 00 
  803e1e:	ff d0                	callq  *%rax
  803e20:	c9                   	leaveq 
  803e21:	c3                   	retq   

0000000000803e22 <devsock_stat>:
  803e22:	55                   	push   %rbp
  803e23:	48 89 e5             	mov    %rsp,%rbp
  803e26:	48 83 ec 10          	sub    $0x10,%rsp
  803e2a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803e2e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803e32:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e36:	48 be 4a 56 80 00 00 	movabs $0x80564a,%rsi
  803e3d:	00 00 00 
  803e40:	48 89 c7             	mov    %rax,%rdi
  803e43:	48 b8 2e 14 80 00 00 	movabs $0x80142e,%rax
  803e4a:	00 00 00 
  803e4d:	ff d0                	callq  *%rax
  803e4f:	b8 00 00 00 00       	mov    $0x0,%eax
  803e54:	c9                   	leaveq 
  803e55:	c3                   	retq   

0000000000803e56 <socket>:
  803e56:	55                   	push   %rbp
  803e57:	48 89 e5             	mov    %rsp,%rbp
  803e5a:	48 83 ec 20          	sub    $0x20,%rsp
  803e5e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803e61:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803e64:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803e67:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803e6a:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803e6d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803e70:	89 ce                	mov    %ecx,%esi
  803e72:	89 c7                	mov    %eax,%edi
  803e74:	48 b8 9a 42 80 00 00 	movabs $0x80429a,%rax
  803e7b:	00 00 00 
  803e7e:	ff d0                	callq  *%rax
  803e80:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e83:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e87:	79 05                	jns    803e8e <socket+0x38>
  803e89:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e8c:	eb 11                	jmp    803e9f <socket+0x49>
  803e8e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e91:	89 c7                	mov    %eax,%edi
  803e93:	48 b8 38 3b 80 00 00 	movabs $0x803b38,%rax
  803e9a:	00 00 00 
  803e9d:	ff d0                	callq  *%rax
  803e9f:	c9                   	leaveq 
  803ea0:	c3                   	retq   

0000000000803ea1 <nsipc>:
  803ea1:	55                   	push   %rbp
  803ea2:	48 89 e5             	mov    %rsp,%rbp
  803ea5:	48 83 ec 10          	sub    $0x10,%rsp
  803ea9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803eac:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803eb3:	00 00 00 
  803eb6:	8b 00                	mov    (%rax),%eax
  803eb8:	85 c0                	test   %eax,%eax
  803eba:	75 1d                	jne    803ed9 <nsipc+0x38>
  803ebc:	bf 02 00 00 00       	mov    $0x2,%edi
  803ec1:	48 b8 44 2a 80 00 00 	movabs $0x802a44,%rax
  803ec8:	00 00 00 
  803ecb:	ff d0                	callq  *%rax
  803ecd:	48 ba 08 80 80 00 00 	movabs $0x808008,%rdx
  803ed4:	00 00 00 
  803ed7:	89 02                	mov    %eax,(%rdx)
  803ed9:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803ee0:	00 00 00 
  803ee3:	8b 00                	mov    (%rax),%eax
  803ee5:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803ee8:	b9 07 00 00 00       	mov    $0x7,%ecx
  803eed:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803ef4:	00 00 00 
  803ef7:	89 c7                	mov    %eax,%edi
  803ef9:	48 b8 13 28 80 00 00 	movabs $0x802813,%rax
  803f00:	00 00 00 
  803f03:	ff d0                	callq  *%rax
  803f05:	ba 00 00 00 00       	mov    $0x0,%edx
  803f0a:	be 00 00 00 00       	mov    $0x0,%esi
  803f0f:	bf 00 00 00 00       	mov    $0x0,%edi
  803f14:	48 b8 52 27 80 00 00 	movabs $0x802752,%rax
  803f1b:	00 00 00 
  803f1e:	ff d0                	callq  *%rax
  803f20:	c9                   	leaveq 
  803f21:	c3                   	retq   

0000000000803f22 <nsipc_accept>:
  803f22:	55                   	push   %rbp
  803f23:	48 89 e5             	mov    %rsp,%rbp
  803f26:	48 83 ec 30          	sub    $0x30,%rsp
  803f2a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f2d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803f31:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803f35:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f3c:	00 00 00 
  803f3f:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803f42:	89 10                	mov    %edx,(%rax)
  803f44:	bf 01 00 00 00       	mov    $0x1,%edi
  803f49:	48 b8 a1 3e 80 00 00 	movabs $0x803ea1,%rax
  803f50:	00 00 00 
  803f53:	ff d0                	callq  *%rax
  803f55:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f58:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f5c:	78 3e                	js     803f9c <nsipc_accept+0x7a>
  803f5e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f65:	00 00 00 
  803f68:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803f6c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f70:	8b 40 10             	mov    0x10(%rax),%eax
  803f73:	89 c2                	mov    %eax,%edx
  803f75:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803f79:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f7d:	48 89 ce             	mov    %rcx,%rsi
  803f80:	48 89 c7             	mov    %rax,%rdi
  803f83:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  803f8a:	00 00 00 
  803f8d:	ff d0                	callq  *%rax
  803f8f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f93:	8b 50 10             	mov    0x10(%rax),%edx
  803f96:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f9a:	89 10                	mov    %edx,(%rax)
  803f9c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f9f:	c9                   	leaveq 
  803fa0:	c3                   	retq   

0000000000803fa1 <nsipc_bind>:
  803fa1:	55                   	push   %rbp
  803fa2:	48 89 e5             	mov    %rsp,%rbp
  803fa5:	48 83 ec 10          	sub    $0x10,%rsp
  803fa9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803fac:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803fb0:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803fb3:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fba:	00 00 00 
  803fbd:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803fc0:	89 10                	mov    %edx,(%rax)
  803fc2:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803fc5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fc9:	48 89 c6             	mov    %rax,%rsi
  803fcc:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803fd3:	00 00 00 
  803fd6:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  803fdd:	00 00 00 
  803fe0:	ff d0                	callq  *%rax
  803fe2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fe9:	00 00 00 
  803fec:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803fef:	89 50 14             	mov    %edx,0x14(%rax)
  803ff2:	bf 02 00 00 00       	mov    $0x2,%edi
  803ff7:	48 b8 a1 3e 80 00 00 	movabs $0x803ea1,%rax
  803ffe:	00 00 00 
  804001:	ff d0                	callq  *%rax
  804003:	c9                   	leaveq 
  804004:	c3                   	retq   

0000000000804005 <nsipc_shutdown>:
  804005:	55                   	push   %rbp
  804006:	48 89 e5             	mov    %rsp,%rbp
  804009:	48 83 ec 10          	sub    $0x10,%rsp
  80400d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804010:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804013:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80401a:	00 00 00 
  80401d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804020:	89 10                	mov    %edx,(%rax)
  804022:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804029:	00 00 00 
  80402c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80402f:	89 50 04             	mov    %edx,0x4(%rax)
  804032:	bf 03 00 00 00       	mov    $0x3,%edi
  804037:	48 b8 a1 3e 80 00 00 	movabs $0x803ea1,%rax
  80403e:	00 00 00 
  804041:	ff d0                	callq  *%rax
  804043:	c9                   	leaveq 
  804044:	c3                   	retq   

0000000000804045 <nsipc_close>:
  804045:	55                   	push   %rbp
  804046:	48 89 e5             	mov    %rsp,%rbp
  804049:	48 83 ec 10          	sub    $0x10,%rsp
  80404d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804050:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804057:	00 00 00 
  80405a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80405d:	89 10                	mov    %edx,(%rax)
  80405f:	bf 04 00 00 00       	mov    $0x4,%edi
  804064:	48 b8 a1 3e 80 00 00 	movabs $0x803ea1,%rax
  80406b:	00 00 00 
  80406e:	ff d0                	callq  *%rax
  804070:	c9                   	leaveq 
  804071:	c3                   	retq   

0000000000804072 <nsipc_connect>:
  804072:	55                   	push   %rbp
  804073:	48 89 e5             	mov    %rsp,%rbp
  804076:	48 83 ec 10          	sub    $0x10,%rsp
  80407a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80407d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804081:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804084:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80408b:	00 00 00 
  80408e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804091:	89 10                	mov    %edx,(%rax)
  804093:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804096:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80409a:	48 89 c6             	mov    %rax,%rsi
  80409d:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  8040a4:	00 00 00 
  8040a7:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  8040ae:	00 00 00 
  8040b1:	ff d0                	callq  *%rax
  8040b3:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040ba:	00 00 00 
  8040bd:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8040c0:	89 50 14             	mov    %edx,0x14(%rax)
  8040c3:	bf 05 00 00 00       	mov    $0x5,%edi
  8040c8:	48 b8 a1 3e 80 00 00 	movabs $0x803ea1,%rax
  8040cf:	00 00 00 
  8040d2:	ff d0                	callq  *%rax
  8040d4:	c9                   	leaveq 
  8040d5:	c3                   	retq   

00000000008040d6 <nsipc_listen>:
  8040d6:	55                   	push   %rbp
  8040d7:	48 89 e5             	mov    %rsp,%rbp
  8040da:	48 83 ec 10          	sub    $0x10,%rsp
  8040de:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8040e1:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8040e4:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040eb:	00 00 00 
  8040ee:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8040f1:	89 10                	mov    %edx,(%rax)
  8040f3:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040fa:	00 00 00 
  8040fd:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804100:	89 50 04             	mov    %edx,0x4(%rax)
  804103:	bf 06 00 00 00       	mov    $0x6,%edi
  804108:	48 b8 a1 3e 80 00 00 	movabs $0x803ea1,%rax
  80410f:	00 00 00 
  804112:	ff d0                	callq  *%rax
  804114:	c9                   	leaveq 
  804115:	c3                   	retq   

0000000000804116 <nsipc_recv>:
  804116:	55                   	push   %rbp
  804117:	48 89 e5             	mov    %rsp,%rbp
  80411a:	48 83 ec 30          	sub    $0x30,%rsp
  80411e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804121:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804125:	89 55 e8             	mov    %edx,-0x18(%rbp)
  804128:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80412b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804132:	00 00 00 
  804135:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804138:	89 10                	mov    %edx,(%rax)
  80413a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804141:	00 00 00 
  804144:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804147:	89 50 04             	mov    %edx,0x4(%rax)
  80414a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804151:	00 00 00 
  804154:	8b 55 dc             	mov    -0x24(%rbp),%edx
  804157:	89 50 08             	mov    %edx,0x8(%rax)
  80415a:	bf 07 00 00 00       	mov    $0x7,%edi
  80415f:	48 b8 a1 3e 80 00 00 	movabs $0x803ea1,%rax
  804166:	00 00 00 
  804169:	ff d0                	callq  *%rax
  80416b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80416e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804172:	78 69                	js     8041dd <nsipc_recv+0xc7>
  804174:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  80417b:	7f 08                	jg     804185 <nsipc_recv+0x6f>
  80417d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804180:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  804183:	7e 35                	jle    8041ba <nsipc_recv+0xa4>
  804185:	48 b9 51 56 80 00 00 	movabs $0x805651,%rcx
  80418c:	00 00 00 
  80418f:	48 ba 66 56 80 00 00 	movabs $0x805666,%rdx
  804196:	00 00 00 
  804199:	be 62 00 00 00       	mov    $0x62,%esi
  80419e:	48 bf 7b 56 80 00 00 	movabs $0x80567b,%rdi
  8041a5:	00 00 00 
  8041a8:	b8 00 00 00 00       	mov    $0x0,%eax
  8041ad:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  8041b4:	00 00 00 
  8041b7:	41 ff d0             	callq  *%r8
  8041ba:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041bd:	48 63 d0             	movslq %eax,%rdx
  8041c0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8041c4:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  8041cb:	00 00 00 
  8041ce:	48 89 c7             	mov    %rax,%rdi
  8041d1:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  8041d8:	00 00 00 
  8041db:	ff d0                	callq  *%rax
  8041dd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041e0:	c9                   	leaveq 
  8041e1:	c3                   	retq   

00000000008041e2 <nsipc_send>:
  8041e2:	55                   	push   %rbp
  8041e3:	48 89 e5             	mov    %rsp,%rbp
  8041e6:	48 83 ec 20          	sub    $0x20,%rsp
  8041ea:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8041ed:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8041f1:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8041f4:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8041f7:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8041fe:	00 00 00 
  804201:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804204:	89 10                	mov    %edx,(%rax)
  804206:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  80420d:	7e 35                	jle    804244 <nsipc_send+0x62>
  80420f:	48 b9 8a 56 80 00 00 	movabs $0x80568a,%rcx
  804216:	00 00 00 
  804219:	48 ba 66 56 80 00 00 	movabs $0x805666,%rdx
  804220:	00 00 00 
  804223:	be 6d 00 00 00       	mov    $0x6d,%esi
  804228:	48 bf 7b 56 80 00 00 	movabs $0x80567b,%rdi
  80422f:	00 00 00 
  804232:	b8 00 00 00 00       	mov    $0x0,%eax
  804237:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  80423e:	00 00 00 
  804241:	41 ff d0             	callq  *%r8
  804244:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804247:	48 63 d0             	movslq %eax,%rdx
  80424a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80424e:	48 89 c6             	mov    %rax,%rsi
  804251:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  804258:	00 00 00 
  80425b:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  804262:	00 00 00 
  804265:	ff d0                	callq  *%rax
  804267:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80426e:	00 00 00 
  804271:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804274:	89 50 04             	mov    %edx,0x4(%rax)
  804277:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80427e:	00 00 00 
  804281:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804284:	89 50 08             	mov    %edx,0x8(%rax)
  804287:	bf 08 00 00 00       	mov    $0x8,%edi
  80428c:	48 b8 a1 3e 80 00 00 	movabs $0x803ea1,%rax
  804293:	00 00 00 
  804296:	ff d0                	callq  *%rax
  804298:	c9                   	leaveq 
  804299:	c3                   	retq   

000000000080429a <nsipc_socket>:
  80429a:	55                   	push   %rbp
  80429b:	48 89 e5             	mov    %rsp,%rbp
  80429e:	48 83 ec 10          	sub    $0x10,%rsp
  8042a2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8042a5:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8042a8:	89 55 f4             	mov    %edx,-0xc(%rbp)
  8042ab:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8042b2:	00 00 00 
  8042b5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8042b8:	89 10                	mov    %edx,(%rax)
  8042ba:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8042c1:	00 00 00 
  8042c4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8042c7:	89 50 04             	mov    %edx,0x4(%rax)
  8042ca:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8042d1:	00 00 00 
  8042d4:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8042d7:	89 50 08             	mov    %edx,0x8(%rax)
  8042da:	bf 09 00 00 00       	mov    $0x9,%edi
  8042df:	48 b8 a1 3e 80 00 00 	movabs $0x803ea1,%rax
  8042e6:	00 00 00 
  8042e9:	ff d0                	callq  *%rax
  8042eb:	c9                   	leaveq 
  8042ec:	c3                   	retq   

00000000008042ed <pipe>:
  8042ed:	55                   	push   %rbp
  8042ee:	48 89 e5             	mov    %rsp,%rbp
  8042f1:	53                   	push   %rbx
  8042f2:	48 83 ec 38          	sub    $0x38,%rsp
  8042f6:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8042fa:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  8042fe:	48 89 c7             	mov    %rax,%rdi
  804301:	48 b8 04 2b 80 00 00 	movabs $0x802b04,%rax
  804308:	00 00 00 
  80430b:	ff d0                	callq  *%rax
  80430d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804310:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804314:	0f 88 bf 01 00 00    	js     8044d9 <pipe+0x1ec>
  80431a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80431e:	ba 07 04 00 00       	mov    $0x407,%edx
  804323:	48 89 c6             	mov    %rax,%rsi
  804326:	bf 00 00 00 00       	mov    $0x0,%edi
  80432b:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  804332:	00 00 00 
  804335:	ff d0                	callq  *%rax
  804337:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80433a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80433e:	0f 88 95 01 00 00    	js     8044d9 <pipe+0x1ec>
  804344:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  804348:	48 89 c7             	mov    %rax,%rdi
  80434b:	48 b8 04 2b 80 00 00 	movabs $0x802b04,%rax
  804352:	00 00 00 
  804355:	ff d0                	callq  *%rax
  804357:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80435a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80435e:	0f 88 5d 01 00 00    	js     8044c1 <pipe+0x1d4>
  804364:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804368:	ba 07 04 00 00       	mov    $0x407,%edx
  80436d:	48 89 c6             	mov    %rax,%rsi
  804370:	bf 00 00 00 00       	mov    $0x0,%edi
  804375:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  80437c:	00 00 00 
  80437f:	ff d0                	callq  *%rax
  804381:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804384:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804388:	0f 88 33 01 00 00    	js     8044c1 <pipe+0x1d4>
  80438e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804392:	48 89 c7             	mov    %rax,%rdi
  804395:	48 b8 d9 2a 80 00 00 	movabs $0x802ad9,%rax
  80439c:	00 00 00 
  80439f:	ff d0                	callq  *%rax
  8043a1:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8043a5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8043a9:	ba 07 04 00 00       	mov    $0x407,%edx
  8043ae:	48 89 c6             	mov    %rax,%rsi
  8043b1:	bf 00 00 00 00       	mov    $0x0,%edi
  8043b6:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  8043bd:	00 00 00 
  8043c0:	ff d0                	callq  *%rax
  8043c2:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8043c5:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8043c9:	79 05                	jns    8043d0 <pipe+0xe3>
  8043cb:	e9 d9 00 00 00       	jmpq   8044a9 <pipe+0x1bc>
  8043d0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8043d4:	48 89 c7             	mov    %rax,%rdi
  8043d7:	48 b8 d9 2a 80 00 00 	movabs $0x802ad9,%rax
  8043de:	00 00 00 
  8043e1:	ff d0                	callq  *%rax
  8043e3:	48 89 c2             	mov    %rax,%rdx
  8043e6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8043ea:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  8043f0:	48 89 d1             	mov    %rdx,%rcx
  8043f3:	ba 00 00 00 00       	mov    $0x0,%edx
  8043f8:	48 89 c6             	mov    %rax,%rsi
  8043fb:	bf 00 00 00 00       	mov    $0x0,%edi
  804400:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  804407:	00 00 00 
  80440a:	ff d0                	callq  *%rax
  80440c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80440f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804413:	79 1b                	jns    804430 <pipe+0x143>
  804415:	90                   	nop
  804416:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80441a:	48 89 c6             	mov    %rax,%rsi
  80441d:	bf 00 00 00 00       	mov    $0x0,%edi
  804422:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  804429:	00 00 00 
  80442c:	ff d0                	callq  *%rax
  80442e:	eb 79                	jmp    8044a9 <pipe+0x1bc>
  804430:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804434:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  80443b:	00 00 00 
  80443e:	8b 12                	mov    (%rdx),%edx
  804440:	89 10                	mov    %edx,(%rax)
  804442:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804446:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  80444d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804451:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  804458:	00 00 00 
  80445b:	8b 12                	mov    (%rdx),%edx
  80445d:	89 10                	mov    %edx,(%rax)
  80445f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804463:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  80446a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80446e:	48 89 c7             	mov    %rax,%rdi
  804471:	48 b8 b6 2a 80 00 00 	movabs $0x802ab6,%rax
  804478:	00 00 00 
  80447b:	ff d0                	callq  *%rax
  80447d:	89 c2                	mov    %eax,%edx
  80447f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804483:	89 10                	mov    %edx,(%rax)
  804485:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804489:	48 8d 58 04          	lea    0x4(%rax),%rbx
  80448d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804491:	48 89 c7             	mov    %rax,%rdi
  804494:	48 b8 b6 2a 80 00 00 	movabs $0x802ab6,%rax
  80449b:	00 00 00 
  80449e:	ff d0                	callq  *%rax
  8044a0:	89 03                	mov    %eax,(%rbx)
  8044a2:	b8 00 00 00 00       	mov    $0x0,%eax
  8044a7:	eb 33                	jmp    8044dc <pipe+0x1ef>
  8044a9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8044ad:	48 89 c6             	mov    %rax,%rsi
  8044b0:	bf 00 00 00 00       	mov    $0x0,%edi
  8044b5:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  8044bc:	00 00 00 
  8044bf:	ff d0                	callq  *%rax
  8044c1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8044c5:	48 89 c6             	mov    %rax,%rsi
  8044c8:	bf 00 00 00 00       	mov    $0x0,%edi
  8044cd:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  8044d4:	00 00 00 
  8044d7:	ff d0                	callq  *%rax
  8044d9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8044dc:	48 83 c4 38          	add    $0x38,%rsp
  8044e0:	5b                   	pop    %rbx
  8044e1:	5d                   	pop    %rbp
  8044e2:	c3                   	retq   

00000000008044e3 <_pipeisclosed>:
  8044e3:	55                   	push   %rbp
  8044e4:	48 89 e5             	mov    %rsp,%rbp
  8044e7:	53                   	push   %rbx
  8044e8:	48 83 ec 28          	sub    $0x28,%rsp
  8044ec:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8044f0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8044f4:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8044fb:	00 00 00 
  8044fe:	48 8b 00             	mov    (%rax),%rax
  804501:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804507:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80450a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80450e:	48 89 c7             	mov    %rax,%rdi
  804511:	48 b8 91 4c 80 00 00 	movabs $0x804c91,%rax
  804518:	00 00 00 
  80451b:	ff d0                	callq  *%rax
  80451d:	89 c3                	mov    %eax,%ebx
  80451f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804523:	48 89 c7             	mov    %rax,%rdi
  804526:	48 b8 91 4c 80 00 00 	movabs $0x804c91,%rax
  80452d:	00 00 00 
  804530:	ff d0                	callq  *%rax
  804532:	39 c3                	cmp    %eax,%ebx
  804534:	0f 94 c0             	sete   %al
  804537:	0f b6 c0             	movzbl %al,%eax
  80453a:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80453d:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  804544:	00 00 00 
  804547:	48 8b 00             	mov    (%rax),%rax
  80454a:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804550:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804553:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804556:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804559:	75 05                	jne    804560 <_pipeisclosed+0x7d>
  80455b:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80455e:	eb 4f                	jmp    8045af <_pipeisclosed+0xcc>
  804560:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804563:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804566:	74 42                	je     8045aa <_pipeisclosed+0xc7>
  804568:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  80456c:	75 3c                	jne    8045aa <_pipeisclosed+0xc7>
  80456e:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  804575:	00 00 00 
  804578:	48 8b 00             	mov    (%rax),%rax
  80457b:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  804581:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  804584:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804587:	89 c6                	mov    %eax,%esi
  804589:	48 bf 9b 56 80 00 00 	movabs $0x80569b,%rdi
  804590:	00 00 00 
  804593:	b8 00 00 00 00       	mov    $0x0,%eax
  804598:	49 b8 79 08 80 00 00 	movabs $0x800879,%r8
  80459f:	00 00 00 
  8045a2:	41 ff d0             	callq  *%r8
  8045a5:	e9 4a ff ff ff       	jmpq   8044f4 <_pipeisclosed+0x11>
  8045aa:	e9 45 ff ff ff       	jmpq   8044f4 <_pipeisclosed+0x11>
  8045af:	48 83 c4 28          	add    $0x28,%rsp
  8045b3:	5b                   	pop    %rbx
  8045b4:	5d                   	pop    %rbp
  8045b5:	c3                   	retq   

00000000008045b6 <pipeisclosed>:
  8045b6:	55                   	push   %rbp
  8045b7:	48 89 e5             	mov    %rsp,%rbp
  8045ba:	48 83 ec 30          	sub    $0x30,%rsp
  8045be:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8045c1:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8045c5:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8045c8:	48 89 d6             	mov    %rdx,%rsi
  8045cb:	89 c7                	mov    %eax,%edi
  8045cd:	48 b8 9c 2b 80 00 00 	movabs $0x802b9c,%rax
  8045d4:	00 00 00 
  8045d7:	ff d0                	callq  *%rax
  8045d9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8045dc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8045e0:	79 05                	jns    8045e7 <pipeisclosed+0x31>
  8045e2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045e5:	eb 31                	jmp    804618 <pipeisclosed+0x62>
  8045e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8045eb:	48 89 c7             	mov    %rax,%rdi
  8045ee:	48 b8 d9 2a 80 00 00 	movabs $0x802ad9,%rax
  8045f5:	00 00 00 
  8045f8:	ff d0                	callq  *%rax
  8045fa:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8045fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804602:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804606:	48 89 d6             	mov    %rdx,%rsi
  804609:	48 89 c7             	mov    %rax,%rdi
  80460c:	48 b8 e3 44 80 00 00 	movabs $0x8044e3,%rax
  804613:	00 00 00 
  804616:	ff d0                	callq  *%rax
  804618:	c9                   	leaveq 
  804619:	c3                   	retq   

000000000080461a <devpipe_read>:
  80461a:	55                   	push   %rbp
  80461b:	48 89 e5             	mov    %rsp,%rbp
  80461e:	48 83 ec 40          	sub    $0x40,%rsp
  804622:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804626:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80462a:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80462e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804632:	48 89 c7             	mov    %rax,%rdi
  804635:	48 b8 d9 2a 80 00 00 	movabs $0x802ad9,%rax
  80463c:	00 00 00 
  80463f:	ff d0                	callq  *%rax
  804641:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804645:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804649:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80464d:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804654:	00 
  804655:	e9 92 00 00 00       	jmpq   8046ec <devpipe_read+0xd2>
  80465a:	eb 41                	jmp    80469d <devpipe_read+0x83>
  80465c:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  804661:	74 09                	je     80466c <devpipe_read+0x52>
  804663:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804667:	e9 92 00 00 00       	jmpq   8046fe <devpipe_read+0xe4>
  80466c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804670:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804674:	48 89 d6             	mov    %rdx,%rsi
  804677:	48 89 c7             	mov    %rax,%rdi
  80467a:	48 b8 e3 44 80 00 00 	movabs $0x8044e3,%rax
  804681:	00 00 00 
  804684:	ff d0                	callq  *%rax
  804686:	85 c0                	test   %eax,%eax
  804688:	74 07                	je     804691 <devpipe_read+0x77>
  80468a:	b8 00 00 00 00       	mov    $0x0,%eax
  80468f:	eb 6d                	jmp    8046fe <devpipe_read+0xe4>
  804691:	48 b8 1f 1d 80 00 00 	movabs $0x801d1f,%rax
  804698:	00 00 00 
  80469b:	ff d0                	callq  *%rax
  80469d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046a1:	8b 10                	mov    (%rax),%edx
  8046a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046a7:	8b 40 04             	mov    0x4(%rax),%eax
  8046aa:	39 c2                	cmp    %eax,%edx
  8046ac:	74 ae                	je     80465c <devpipe_read+0x42>
  8046ae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8046b2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8046b6:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8046ba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046be:	8b 00                	mov    (%rax),%eax
  8046c0:	99                   	cltd   
  8046c1:	c1 ea 1b             	shr    $0x1b,%edx
  8046c4:	01 d0                	add    %edx,%eax
  8046c6:	83 e0 1f             	and    $0x1f,%eax
  8046c9:	29 d0                	sub    %edx,%eax
  8046cb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8046cf:	48 98                	cltq   
  8046d1:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  8046d6:	88 01                	mov    %al,(%rcx)
  8046d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046dc:	8b 00                	mov    (%rax),%eax
  8046de:	8d 50 01             	lea    0x1(%rax),%edx
  8046e1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046e5:	89 10                	mov    %edx,(%rax)
  8046e7:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8046ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8046f0:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8046f4:	0f 82 60 ff ff ff    	jb     80465a <devpipe_read+0x40>
  8046fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8046fe:	c9                   	leaveq 
  8046ff:	c3                   	retq   

0000000000804700 <devpipe_write>:
  804700:	55                   	push   %rbp
  804701:	48 89 e5             	mov    %rsp,%rbp
  804704:	48 83 ec 40          	sub    $0x40,%rsp
  804708:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80470c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804710:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804714:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804718:	48 89 c7             	mov    %rax,%rdi
  80471b:	48 b8 d9 2a 80 00 00 	movabs $0x802ad9,%rax
  804722:	00 00 00 
  804725:	ff d0                	callq  *%rax
  804727:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80472b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80472f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804733:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80473a:	00 
  80473b:	e9 8e 00 00 00       	jmpq   8047ce <devpipe_write+0xce>
  804740:	eb 31                	jmp    804773 <devpipe_write+0x73>
  804742:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804746:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80474a:	48 89 d6             	mov    %rdx,%rsi
  80474d:	48 89 c7             	mov    %rax,%rdi
  804750:	48 b8 e3 44 80 00 00 	movabs $0x8044e3,%rax
  804757:	00 00 00 
  80475a:	ff d0                	callq  *%rax
  80475c:	85 c0                	test   %eax,%eax
  80475e:	74 07                	je     804767 <devpipe_write+0x67>
  804760:	b8 00 00 00 00       	mov    $0x0,%eax
  804765:	eb 79                	jmp    8047e0 <devpipe_write+0xe0>
  804767:	48 b8 1f 1d 80 00 00 	movabs $0x801d1f,%rax
  80476e:	00 00 00 
  804771:	ff d0                	callq  *%rax
  804773:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804777:	8b 40 04             	mov    0x4(%rax),%eax
  80477a:	48 63 d0             	movslq %eax,%rdx
  80477d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804781:	8b 00                	mov    (%rax),%eax
  804783:	48 98                	cltq   
  804785:	48 83 c0 20          	add    $0x20,%rax
  804789:	48 39 c2             	cmp    %rax,%rdx
  80478c:	73 b4                	jae    804742 <devpipe_write+0x42>
  80478e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804792:	8b 40 04             	mov    0x4(%rax),%eax
  804795:	99                   	cltd   
  804796:	c1 ea 1b             	shr    $0x1b,%edx
  804799:	01 d0                	add    %edx,%eax
  80479b:	83 e0 1f             	and    $0x1f,%eax
  80479e:	29 d0                	sub    %edx,%eax
  8047a0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8047a4:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8047a8:	48 01 ca             	add    %rcx,%rdx
  8047ab:	0f b6 0a             	movzbl (%rdx),%ecx
  8047ae:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8047b2:	48 98                	cltq   
  8047b4:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8047b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8047bc:	8b 40 04             	mov    0x4(%rax),%eax
  8047bf:	8d 50 01             	lea    0x1(%rax),%edx
  8047c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8047c6:	89 50 04             	mov    %edx,0x4(%rax)
  8047c9:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8047ce:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8047d2:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8047d6:	0f 82 64 ff ff ff    	jb     804740 <devpipe_write+0x40>
  8047dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8047e0:	c9                   	leaveq 
  8047e1:	c3                   	retq   

00000000008047e2 <devpipe_stat>:
  8047e2:	55                   	push   %rbp
  8047e3:	48 89 e5             	mov    %rsp,%rbp
  8047e6:	48 83 ec 20          	sub    $0x20,%rsp
  8047ea:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8047ee:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8047f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8047f6:	48 89 c7             	mov    %rax,%rdi
  8047f9:	48 b8 d9 2a 80 00 00 	movabs $0x802ad9,%rax
  804800:	00 00 00 
  804803:	ff d0                	callq  *%rax
  804805:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804809:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80480d:	48 be ae 56 80 00 00 	movabs $0x8056ae,%rsi
  804814:	00 00 00 
  804817:	48 89 c7             	mov    %rax,%rdi
  80481a:	48 b8 2e 14 80 00 00 	movabs $0x80142e,%rax
  804821:	00 00 00 
  804824:	ff d0                	callq  *%rax
  804826:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80482a:	8b 50 04             	mov    0x4(%rax),%edx
  80482d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804831:	8b 00                	mov    (%rax),%eax
  804833:	29 c2                	sub    %eax,%edx
  804835:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804839:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80483f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804843:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80484a:	00 00 00 
  80484d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804851:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  804858:	00 00 00 
  80485b:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804862:	b8 00 00 00 00       	mov    $0x0,%eax
  804867:	c9                   	leaveq 
  804868:	c3                   	retq   

0000000000804869 <devpipe_close>:
  804869:	55                   	push   %rbp
  80486a:	48 89 e5             	mov    %rsp,%rbp
  80486d:	48 83 ec 10          	sub    $0x10,%rsp
  804871:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804875:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804879:	48 89 c6             	mov    %rax,%rsi
  80487c:	bf 00 00 00 00       	mov    $0x0,%edi
  804881:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  804888:	00 00 00 
  80488b:	ff d0                	callq  *%rax
  80488d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804891:	48 89 c7             	mov    %rax,%rdi
  804894:	48 b8 d9 2a 80 00 00 	movabs $0x802ad9,%rax
  80489b:	00 00 00 
  80489e:	ff d0                	callq  *%rax
  8048a0:	48 89 c6             	mov    %rax,%rsi
  8048a3:	bf 00 00 00 00       	mov    $0x0,%edi
  8048a8:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  8048af:	00 00 00 
  8048b2:	ff d0                	callq  *%rax
  8048b4:	c9                   	leaveq 
  8048b5:	c3                   	retq   

00000000008048b6 <cputchar>:
  8048b6:	55                   	push   %rbp
  8048b7:	48 89 e5             	mov    %rsp,%rbp
  8048ba:	48 83 ec 20          	sub    $0x20,%rsp
  8048be:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8048c1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8048c4:	88 45 ff             	mov    %al,-0x1(%rbp)
  8048c7:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  8048cb:	be 01 00 00 00       	mov    $0x1,%esi
  8048d0:	48 89 c7             	mov    %rax,%rdi
  8048d3:	48 b8 15 1c 80 00 00 	movabs $0x801c15,%rax
  8048da:	00 00 00 
  8048dd:	ff d0                	callq  *%rax
  8048df:	c9                   	leaveq 
  8048e0:	c3                   	retq   

00000000008048e1 <getchar>:
  8048e1:	55                   	push   %rbp
  8048e2:	48 89 e5             	mov    %rsp,%rbp
  8048e5:	48 83 ec 10          	sub    $0x10,%rsp
  8048e9:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  8048ed:	ba 01 00 00 00       	mov    $0x1,%edx
  8048f2:	48 89 c6             	mov    %rax,%rsi
  8048f5:	bf 00 00 00 00       	mov    $0x0,%edi
  8048fa:	48 b8 ce 2f 80 00 00 	movabs $0x802fce,%rax
  804901:	00 00 00 
  804904:	ff d0                	callq  *%rax
  804906:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804909:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80490d:	79 05                	jns    804914 <getchar+0x33>
  80490f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804912:	eb 14                	jmp    804928 <getchar+0x47>
  804914:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804918:	7f 07                	jg     804921 <getchar+0x40>
  80491a:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  80491f:	eb 07                	jmp    804928 <getchar+0x47>
  804921:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  804925:	0f b6 c0             	movzbl %al,%eax
  804928:	c9                   	leaveq 
  804929:	c3                   	retq   

000000000080492a <iscons>:
  80492a:	55                   	push   %rbp
  80492b:	48 89 e5             	mov    %rsp,%rbp
  80492e:	48 83 ec 20          	sub    $0x20,%rsp
  804932:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804935:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804939:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80493c:	48 89 d6             	mov    %rdx,%rsi
  80493f:	89 c7                	mov    %eax,%edi
  804941:	48 b8 9c 2b 80 00 00 	movabs $0x802b9c,%rax
  804948:	00 00 00 
  80494b:	ff d0                	callq  *%rax
  80494d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804950:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804954:	79 05                	jns    80495b <iscons+0x31>
  804956:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804959:	eb 1a                	jmp    804975 <iscons+0x4b>
  80495b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80495f:	8b 10                	mov    (%rax),%edx
  804961:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  804968:	00 00 00 
  80496b:	8b 00                	mov    (%rax),%eax
  80496d:	39 c2                	cmp    %eax,%edx
  80496f:	0f 94 c0             	sete   %al
  804972:	0f b6 c0             	movzbl %al,%eax
  804975:	c9                   	leaveq 
  804976:	c3                   	retq   

0000000000804977 <opencons>:
  804977:	55                   	push   %rbp
  804978:	48 89 e5             	mov    %rsp,%rbp
  80497b:	48 83 ec 10          	sub    $0x10,%rsp
  80497f:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804983:	48 89 c7             	mov    %rax,%rdi
  804986:	48 b8 04 2b 80 00 00 	movabs $0x802b04,%rax
  80498d:	00 00 00 
  804990:	ff d0                	callq  *%rax
  804992:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804995:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804999:	79 05                	jns    8049a0 <opencons+0x29>
  80499b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80499e:	eb 5b                	jmp    8049fb <opencons+0x84>
  8049a0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8049a4:	ba 07 04 00 00       	mov    $0x407,%edx
  8049a9:	48 89 c6             	mov    %rax,%rsi
  8049ac:	bf 00 00 00 00       	mov    $0x0,%edi
  8049b1:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  8049b8:	00 00 00 
  8049bb:	ff d0                	callq  *%rax
  8049bd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8049c0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8049c4:	79 05                	jns    8049cb <opencons+0x54>
  8049c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049c9:	eb 30                	jmp    8049fb <opencons+0x84>
  8049cb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8049cf:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  8049d6:	00 00 00 
  8049d9:	8b 12                	mov    (%rdx),%edx
  8049db:	89 10                	mov    %edx,(%rax)
  8049dd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8049e1:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8049e8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8049ec:	48 89 c7             	mov    %rax,%rdi
  8049ef:	48 b8 b6 2a 80 00 00 	movabs $0x802ab6,%rax
  8049f6:	00 00 00 
  8049f9:	ff d0                	callq  *%rax
  8049fb:	c9                   	leaveq 
  8049fc:	c3                   	retq   

00000000008049fd <devcons_read>:
  8049fd:	55                   	push   %rbp
  8049fe:	48 89 e5             	mov    %rsp,%rbp
  804a01:	48 83 ec 30          	sub    $0x30,%rsp
  804a05:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804a09:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804a0d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804a11:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804a16:	75 07                	jne    804a1f <devcons_read+0x22>
  804a18:	b8 00 00 00 00       	mov    $0x0,%eax
  804a1d:	eb 4b                	jmp    804a6a <devcons_read+0x6d>
  804a1f:	eb 0c                	jmp    804a2d <devcons_read+0x30>
  804a21:	48 b8 1f 1d 80 00 00 	movabs $0x801d1f,%rax
  804a28:	00 00 00 
  804a2b:	ff d0                	callq  *%rax
  804a2d:	48 b8 5f 1c 80 00 00 	movabs $0x801c5f,%rax
  804a34:	00 00 00 
  804a37:	ff d0                	callq  *%rax
  804a39:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804a3c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804a40:	74 df                	je     804a21 <devcons_read+0x24>
  804a42:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804a46:	79 05                	jns    804a4d <devcons_read+0x50>
  804a48:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a4b:	eb 1d                	jmp    804a6a <devcons_read+0x6d>
  804a4d:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804a51:	75 07                	jne    804a5a <devcons_read+0x5d>
  804a53:	b8 00 00 00 00       	mov    $0x0,%eax
  804a58:	eb 10                	jmp    804a6a <devcons_read+0x6d>
  804a5a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a5d:	89 c2                	mov    %eax,%edx
  804a5f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804a63:	88 10                	mov    %dl,(%rax)
  804a65:	b8 01 00 00 00       	mov    $0x1,%eax
  804a6a:	c9                   	leaveq 
  804a6b:	c3                   	retq   

0000000000804a6c <devcons_write>:
  804a6c:	55                   	push   %rbp
  804a6d:	48 89 e5             	mov    %rsp,%rbp
  804a70:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  804a77:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804a7e:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804a85:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804a8c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804a93:	eb 76                	jmp    804b0b <devcons_write+0x9f>
  804a95:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804a9c:	89 c2                	mov    %eax,%edx
  804a9e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804aa1:	29 c2                	sub    %eax,%edx
  804aa3:	89 d0                	mov    %edx,%eax
  804aa5:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804aa8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804aab:	83 f8 7f             	cmp    $0x7f,%eax
  804aae:	76 07                	jbe    804ab7 <devcons_write+0x4b>
  804ab0:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804ab7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804aba:	48 63 d0             	movslq %eax,%rdx
  804abd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804ac0:	48 63 c8             	movslq %eax,%rcx
  804ac3:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804aca:	48 01 c1             	add    %rax,%rcx
  804acd:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804ad4:	48 89 ce             	mov    %rcx,%rsi
  804ad7:	48 89 c7             	mov    %rax,%rdi
  804ada:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  804ae1:	00 00 00 
  804ae4:	ff d0                	callq  *%rax
  804ae6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804ae9:	48 63 d0             	movslq %eax,%rdx
  804aec:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804af3:	48 89 d6             	mov    %rdx,%rsi
  804af6:	48 89 c7             	mov    %rax,%rdi
  804af9:	48 b8 15 1c 80 00 00 	movabs $0x801c15,%rax
  804b00:	00 00 00 
  804b03:	ff d0                	callq  *%rax
  804b05:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804b08:	01 45 fc             	add    %eax,-0x4(%rbp)
  804b0b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b0e:	48 98                	cltq   
  804b10:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804b17:	0f 82 78 ff ff ff    	jb     804a95 <devcons_write+0x29>
  804b1d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b20:	c9                   	leaveq 
  804b21:	c3                   	retq   

0000000000804b22 <devcons_close>:
  804b22:	55                   	push   %rbp
  804b23:	48 89 e5             	mov    %rsp,%rbp
  804b26:	48 83 ec 08          	sub    $0x8,%rsp
  804b2a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804b2e:	b8 00 00 00 00       	mov    $0x0,%eax
  804b33:	c9                   	leaveq 
  804b34:	c3                   	retq   

0000000000804b35 <devcons_stat>:
  804b35:	55                   	push   %rbp
  804b36:	48 89 e5             	mov    %rsp,%rbp
  804b39:	48 83 ec 10          	sub    $0x10,%rsp
  804b3d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804b41:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804b45:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b49:	48 be ba 56 80 00 00 	movabs $0x8056ba,%rsi
  804b50:	00 00 00 
  804b53:	48 89 c7             	mov    %rax,%rdi
  804b56:	48 b8 2e 14 80 00 00 	movabs $0x80142e,%rax
  804b5d:	00 00 00 
  804b60:	ff d0                	callq  *%rax
  804b62:	b8 00 00 00 00       	mov    $0x0,%eax
  804b67:	c9                   	leaveq 
  804b68:	c3                   	retq   

0000000000804b69 <set_pgfault_handler>:
  804b69:	55                   	push   %rbp
  804b6a:	48 89 e5             	mov    %rsp,%rbp
  804b6d:	48 83 ec 20          	sub    $0x20,%rsp
  804b71:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804b75:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804b7c:	00 00 00 
  804b7f:	48 8b 00             	mov    (%rax),%rax
  804b82:	48 85 c0             	test   %rax,%rax
  804b85:	75 6f                	jne    804bf6 <set_pgfault_handler+0x8d>
  804b87:	ba 07 00 00 00       	mov    $0x7,%edx
  804b8c:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  804b91:	bf 00 00 00 00       	mov    $0x0,%edi
  804b96:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  804b9d:	00 00 00 
  804ba0:	ff d0                	callq  *%rax
  804ba2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804ba5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804ba9:	79 30                	jns    804bdb <set_pgfault_handler+0x72>
  804bab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804bae:	89 c1                	mov    %eax,%ecx
  804bb0:	48 ba c8 56 80 00 00 	movabs $0x8056c8,%rdx
  804bb7:	00 00 00 
  804bba:	be 22 00 00 00       	mov    $0x22,%esi
  804bbf:	48 bf e7 56 80 00 00 	movabs $0x8056e7,%rdi
  804bc6:	00 00 00 
  804bc9:	b8 00 00 00 00       	mov    $0x0,%eax
  804bce:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  804bd5:	00 00 00 
  804bd8:	41 ff d0             	callq  *%r8
  804bdb:	48 be 09 4c 80 00 00 	movabs $0x804c09,%rsi
  804be2:	00 00 00 
  804be5:	bf 00 00 00 00       	mov    $0x0,%edi
  804bea:	48 b8 e7 1e 80 00 00 	movabs $0x801ee7,%rax
  804bf1:	00 00 00 
  804bf4:	ff d0                	callq  *%rax
  804bf6:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804bfd:	00 00 00 
  804c00:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804c04:	48 89 10             	mov    %rdx,(%rax)
  804c07:	c9                   	leaveq 
  804c08:	c3                   	retq   

0000000000804c09 <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  804c09:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  804c0c:	48 a1 00 c0 80 00 00 	movabs 0x80c000,%rax
  804c13:	00 00 00 
call *%rax
  804c16:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  804c18:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  804c1f:	00 08 
    movq 152(%rsp), %rax
  804c21:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  804c28:	00 
    movq 136(%rsp), %rbx
  804c29:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  804c30:	00 
movq %rbx, (%rax)
  804c31:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  804c34:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  804c38:	4c 8b 3c 24          	mov    (%rsp),%r15
  804c3c:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  804c41:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  804c46:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  804c4b:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  804c50:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  804c55:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  804c5a:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  804c5f:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  804c64:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  804c69:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  804c6e:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  804c73:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  804c78:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  804c7d:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  804c82:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  804c86:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  804c8a:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  804c8b:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  804c90:	c3                   	retq   

0000000000804c91 <pageref>:
  804c91:	55                   	push   %rbp
  804c92:	48 89 e5             	mov    %rsp,%rbp
  804c95:	48 83 ec 18          	sub    $0x18,%rsp
  804c99:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804c9d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804ca1:	48 c1 e8 15          	shr    $0x15,%rax
  804ca5:	48 89 c2             	mov    %rax,%rdx
  804ca8:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804caf:	01 00 00 
  804cb2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804cb6:	83 e0 01             	and    $0x1,%eax
  804cb9:	48 85 c0             	test   %rax,%rax
  804cbc:	75 07                	jne    804cc5 <pageref+0x34>
  804cbe:	b8 00 00 00 00       	mov    $0x0,%eax
  804cc3:	eb 53                	jmp    804d18 <pageref+0x87>
  804cc5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804cc9:	48 c1 e8 0c          	shr    $0xc,%rax
  804ccd:	48 89 c2             	mov    %rax,%rdx
  804cd0:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804cd7:	01 00 00 
  804cda:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804cde:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804ce2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804ce6:	83 e0 01             	and    $0x1,%eax
  804ce9:	48 85 c0             	test   %rax,%rax
  804cec:	75 07                	jne    804cf5 <pageref+0x64>
  804cee:	b8 00 00 00 00       	mov    $0x0,%eax
  804cf3:	eb 23                	jmp    804d18 <pageref+0x87>
  804cf5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804cf9:	48 c1 e8 0c          	shr    $0xc,%rax
  804cfd:	48 89 c2             	mov    %rax,%rdx
  804d00:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804d07:	00 00 00 
  804d0a:	48 c1 e2 04          	shl    $0x4,%rdx
  804d0e:	48 01 d0             	add    %rdx,%rax
  804d11:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804d15:	0f b7 c0             	movzwl %ax,%eax
  804d18:	c9                   	leaveq 
  804d19:	c3                   	retq   
