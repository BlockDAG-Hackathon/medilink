import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_app/models/hospital_model.dart';
import 'package:hackathon_app/models/notification_model.dart';
import 'package:hackathon_app/models/inbox_model.dart';
import 'package:hugeicons/hugeicons.dart';


class Utils {
  static final width = Get.width;
  static final height = Get.height;

  // onboarding data
  static final List<dynamic> onboarding = [
    {
      "image": "assets/ui/welcome.png",
      "title": "Welcome to BlockDAG",
      "desc":
          "Securely store, share, and protect your personal records with blockchain-grade security. You decide who gets access - and when",
    },
    {
      "image": "assets/ui/guard.png",
      "title": "Privacy You Can Trust",
      "desc":
          "Your records are encrypted end-to-end. Only you and the people you authorize can unlock them. No one else - not even us - can see your data",
    },
    {
      "image": "assets/ui/RedCross.png",
      "title": "Help When It Matters Most",
      "desc":
          "In an emergency, first responders can request secure, time-limited access to your critical information - like blood type and allergies - so you get the right care fast",
    },
    {
      "image": "assets/ui/last.png",
      "title": "Secure and Seamless Data sharing",
      "desc":
          "Protect your record with end-to-end encryption and share them instantly with only the people you trust",
    },
  ];

  // phrase checks
  static final List<String> phraseChecks = [
    "BlockDAG do not keep a copy of your secret phrase",
    "Saving this digitally is not recommended e.g screenshots, text files or emailing yourself",
    "Write down your secret phrase, and store it in a secure offline location!",
  ];

  // secret phrases
  static final List<Map<String, dynamic>> secretPhrases = List.generate(
    5, // Length of the list
    (index) => {'id': index, 'title': 'Item '},
  );
  static final List<Map<String, dynamic>> completionsData = [
    {
      "title": "Login Successful",
      "desc": "Your account has been verified. \n Welcome back, Ultra",
      "label": "Continue using BlockDAG",
    },
    {
      "title": "Welcome aboard",
      "desc":
          "Your account is now ready to use. Dive and start your medical journey. Stay safe!",
      "label": "Start using BlockDAG",
    },
  ];

  static String svgString ='''<svg width="319" height="295" viewBox="0 0 319 295" fill="none" xmlns="http://www.w3.org/2000/svg">
<!-- Head -->
<path id="head" name="head" d="M69 0L63 4V14H60.5V19.5C61.3333 20 63 21.2 63 22V30L69 34H79L84.5 30V22L87.5 19.5V14H84.5V4L79 0H69Z" fill="#CCCCCC"/>
<path id="head_back" name="head" d="M229 20L230.5 28L234 24.5V20H245V24.5V28L250 26.5V18L252.5 14L250 13V4L243 0H234L227.5 7V11L225.5 14L229 20Z" fill="#CCCCCC"/>

<!-- Neck -->
<path id="neck_front_1" name="neck" d="M84.5 39.5V34L78 39.5V47H95.5L84.5 39.5Z" fill="#CCCCCC"/>
<path id="neck_front_2" name="neck" d="M65 40.5V35L67 34L71 39.5L71.5 47H54L65 40.5Z" fill="#CCCCCC"/>
<path id="neck_back_1" name="neck" d="M238.5 22.5H236L235 30.5L219 45H226L236 47L237 33L238.5 30.5V22.5Z" fill="#CCCCCC"/>
<path id="neck_back_2" name="neck" d="M241.5 22.5H240V33L241.5 33.5L243 47.5L248.5 45L257 43.5L243.5 33.5L243 30.5L241.5 22.5Z" fill="#CCCCCC"/>

<!-- Chest -->
<path id="chest_left" name="chest" d="M71 73.5V55L57.5 50L51.5 63L47.5 67.5L61.5 75L71 73.5Z" fill="#CCCCCC"/>
<path id="chest_right" name="chest" d="M77 54L86.5 50H92.5L98.5 64L102 66V68L85.5 75L77 73.5V54Z" fill="#CCCCCC"/>

<!-- Shoulders -->
<path id="shoulder_right_1" name="shoulder" d="M100 62.5L95.5 51L100.5 51.5L109 63.5V68L100 62.5Z" fill="#CCCCCC"/>
<path id="shoulder_right_2" name="shoulder" d="M113.5 57.5L109 51H102.5L109 60L111.5 66.5H113.5V57.5Z" fill="#CCCCCC"/>
<path id="shoulder_left_1" name="shoulder" d="M48.5 62.5L53.5 51C51.8333 51 48.5 51.1 48.5 51.5C48.5 51.9 43.1667 59 40.5 62.5V67L48.5 62.5Z" fill="#CCCCCC"/>
<path id="shoulder_left_2" name="shoulder" d="M36.5 57V67L47 51H40.5L36.5 57Z" fill="#CCCCCC"/>
<path id="shoulder_back_left" name="shoulder" d="M213.5 51.5L204.5 50.5L196.5 63.5H198.5L200 67.5L213.5 51.5Z" fill="#CCCCCC"/>
<path id="shoulder_back_right" name="shoulder" d="M264 53.5L278.5 67.5L280 60L275 51.5L267.5 50.5L264 53.5Z" fill="#CCCCCC"/>

<!-- Arms -->
<path id="arm_right_1" name="arm" d="M110 70H101.5L102.5 81.5L105 87L111.5 93.5H115V87L110 70Z" fill="#CCCCCC"/>
<path id="arm_right_2" name="arm" d="M119 79.5L115 74L115.5 93.5L117 94.5L120 91.5L119 79.5Z" fill="#CCCCCC"/>
<path id="arm_right_3" name="arm" d="M114 103L107 98L106.506 93.5509L115.5 101V103H114Z" fill="#CCCCCC"/>
<path id="arm_right_4" name="arm" d="M121 96H117.5V107L132.5 132L135 131L126.5 118V110L121 96Z" fill="#CCCCCC"/>
<path id="arm_right_5" name="arm" d="M115 120.5L108 101L116 106.5L129.5 131L128 135L115 120.5Z" fill="#CCCCCC"/>
<path id="arm_left_1" name="arm" d="M38 70H47L46 81.5L44 87L38 93.5509H34V96L30.5 92.5V81L34 74.5V87L38 70Z" fill="#CCCCCC"/>
<path id="arm_left_2" name="arm" d="M42 98V93.5509L34 101L35.5 103L42 98Z" fill="#CCCCCC"/>
<path id="arm_left_3" name="arm" d="M30.5 105V96H27L21 118L14.5 131L17 132L30.5 105Z" fill="#CCCCCC"/>
<path id="arm_left_4" name="arm" d="M19.5 132L23 135L35.5 118L42 101L34 105L19.5 132Z" fill="#CCCCCC"/>

<!-- Back Arms -->
<path id="arm_back_right_1" name="arm" d="M270 87L272 67.5L282 77V95L278.5 96.5L275 98V95L270 87Z" fill="#CCCCCC"/>
<path id="arm_back_right_2" name="arm" d="M283 104L279.5 99L278.5 104L274.5 103.5L279.5 118L288.5 127L283 115.5V104Z" fill="#CCCCCC"/>
<path id="arm_back_right_3" name="arm" d="M285.5 118V101.5L290.5 103.5C292 110.5 295.1 124.7 295.5 125.5C295.9 126.3 298.333 130.5 299.5 132.5L298 135.5L296.5 138L285.5 118Z" fill="#CCCCCC"/>
<path id="arm_back_left_1" name="arm" d="M207 87L205.5 67.5L195 78L194 95L201.5 96.5L207 87Z" fill="#CCCCCC"/>
<path id="arm_back_left_2" name="arm" d="M200 103.5V99L195 101.5L194 115.5L189.5 127H192L200 115.5L203 103.5H200Z" fill="#CCCCCC"/>
<path id="arm_back_left_3" name="arm" d="M183 125.5L189.5 101.5H194L192 115.5L187 128.5L182 136.5L178 132.5L183 125.5Z" fill="#CCCCCC"/>

<!-- Abs/Torso -->
<path id="abs_1" name="abs" d="M50 75.5V72L52 75.5H50Z" fill="#CCCCCC"/>
<path id="abs_2" name="abs" d="M60 77L55.5 75.5L54.5 78L60 79.5V77Z" fill="#CCCCCC"/>
<path id="abs_3" name="abs" d="M57 92L49.5 82.5V78.5L51.5 78L52 80L57.5 86.5L57 92Z" fill="#CCCCCC"/>
<path id="abs_4" name="abs" d="M52.5 79.5V78L59 81L58 86L52.5 79.5Z" fill="#CCCCCC"/>
<path id="abs_5" name="abs" d="M49.5 93.5V86.5L57.5 96V101H55.5L49.5 93.5Z" fill="#CCCCCC"/>

<!-- Back -->
<path id="back_upper_left" name="back" d="M220 47H212L219 52L225 67L236 75.5L235 52L220 47Z" fill="#CCCCCC"/>
<path id="back_upper_right" name="back" d="M258 47L243 52V75.5L252 67L258 51L266 47H258Z" fill="#CCCCCC"/>
<path id="back_side_right" name="back" d="M265 55.5H260L255.5 68.5L269.5 67V61L265 55.5Z" fill="#CCCCCC"/>
<path id="back_side_left" name="back" d="M222.5 67L217.5 55.5H213L209 61V67H222.5Z" fill="#CCCCCC"/>
<path id="back_lower_left" name="back" d="M222.5 73L209 71L222.5 114.5L237 125.5L235 83L222.5 73Z" fill="#CCCCCC"/>
<path id="back_lower_right" name="back" d="M255.5 73L243 83L241.5 125.5L255.5 114.5L268.5 70L255.5 73Z" fill="#CCCCCC"/>

<!-- Butt -->
<path id="butt_right" name="butt" d="M254.5 118L251 122.5L258 125.5L263.5 133.5L264.5 131L262 121L254.5 118Z" fill="#CCCCCC"/>
<path id="butt_left" name="butt" d="M227 122.5L223 118L216 121.5L213.5 133.5L215.5 132.5L220.5 125.5L227 122.5Z" fill="#CCCCCC"/>
<path id="butt_lower_left" name="butt" d="M231 129L230 125.5L219 131L213.5 139V151.5L217.5 158L237.5 144.5L236.5 133.5L231 129Z" fill="#CCCCCC"/>
<path id="butt_lower_right" name="butt" d="M240.5 144.5L242 132.5L249 126.5L258 129L264.5 140V152.5L262 156.5L260 158L258 154L251 151.5L240.5 144.5Z" fill="#CCCCCC"/>

<!-- Legs -->
<path id="leg_left_upper" name="leg" d="M49.5 123.5L52.5 126L51 164.5L60 199L54.5 164.5V143.5L64.5 166L63.5 198L60 199H57.5L47.5 166L49.5 123.5Z" fill="#CCCCCC"/>
<path id="leg_right_upper" name="leg" d="M96 127L99 123.5L100.5 166L91.5 199H88.5H86L82.1556 169.206L82 168L80.5 162L93.5 131.5V142.5L82 168L82.1556 169.206L96 142.5L95 166L88.5 199L97.5 166L96 127Z" fill="#CCCCCC"/>

<!-- Back Legs -->
<path id="leg_back_left_upper" name="leg" d="M228 153.5L223.5 156.5V165.5L221.5 171.5V183.5L223.5 197.5L229.5 211L232 206L231 184.5L228 176V153.5Z" fill="#CCCCCC"/>
<path id="leg_back_right_upper" name="leg" d="M250 176L248.5 153.5L253.5 154.5L254.5 159L256.5 168V183.5L253.5 198.5L251.5 203L250 208L248.5 211L246.5 207H245L246.5 187.5L250 176Z" fill="#CCCCCC"/>

<!-- Hands -->
<path id="hand_left" name="hand" d="M15.5 138L13.5 134.5L7 135L0 141.5L4 142L6 139.5L7 142L1 153L4 154L7 147L8.5 147.5L5.5 156H9L11 148L13 149L10.5 156L13.5 156.5L15.5 149H17L16.5 156.5L19 155.5L20 147.5L21 147L20.5 138H15.5Z" fill="#CCCCCC"/>
<path id="hand_right" name="hand" d="M130.5 156.5L129 149.5V137.5H134V134H139L148.5 140V142H145L141.5 140L141 142.5L147.5 154L144.5 154.5L141.5 149L140.5 149.5L143.5 155.5L140 156L137.5 150H135.5L137.5 156H135L132.5 150L131.5 150.5L132.5 155.5L130.5 156.5Z" fill="#CCCCCC"/>

<!-- Feet -->
<path id="foot_left" name="foot" d="M71.5 291V276L63 277.5L58 288.5L65 291H67.5L68.5 287.5V291H71.5Z" fill="#CCCCCC"/>
<path id="foot_right" name="foot" d="M77 291V274.5L83 276L91 285.5L89.5 290H84.5V292L77 291Z" fill="#CCCCCC"/>
</svg>''';


static String heartIcon ='''<svg width="250" height="300" viewBox="0 0 250 300" xmlns="http://www.w3.org/2000/svg">
  <path d="M125 50 C50 0, 0 100, 50 180 S100 250, 125 280 C150 250, 200 180, 200 100 S125 50, 125 50Z" 
        fill="#B00020" stroke="#800000" stroke-width="3"/>
  
  <path d="M125 50 L110 10 L100 0 A20 20 0 0 0 80 10 L70 30" 
        fill="#D00020" stroke="#A00000" stroke-width="3"/>
  
  <path d="M125 50 L140 10 L150 0 A20 20 0 0 1 170 10 L180 30" 
        fill="#007ACC" stroke="#005C99" stroke-width="3"/>
  
  <ellipse cx="100" cy="200" rx="40" ry="60" fill="#E00030" stroke="#C00010" stroke-width="2" transform="rotate(-15 100 200)"/>
  
  <ellipse cx="160" cy="180" rx="30" ry="50" fill="#E00030" stroke="#C00010" stroke-width="2" transform="rotate(15 160 180)"/>

  <path d="M80 100 Q60 150, 80 220" fill="none" stroke="#FFFF00" stroke-width="2"/>
  <path d="M170 120 Q190 170, 170 240" fill="none" stroke="#FFFF00" stroke-width="2"/>

</svg>''';


  static List<String> departments = [
    'All',
    'Cardiology',
    'Neurology',
    'Pediatrics',
    'Orthopedics',
    'Dermatology',
    'Radiology',
    'Emergency',
  ];

  static List<Doctor> doctors = [
    Doctor(
      name: 'Dr. Sarah Johnson',
      department: 'Cardiology',
      specialization: 'Heart Surgery',
      experience: '15 years',
      rating: 4.9,
      consultationFee: '0.05 ETH',
      isVerified: true,
      isOnline: true,
      image: 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=400',
      nextAvailable: '2:30 PM Today',
      blockchainId: '0x1a2b3c4d5e6f...',
    ),
    Doctor(
      name: 'Dr. Michael Chen',
      department: 'Neurology',
      specialization: 'Brain Surgery',
      experience: '12 years',
      rating: 4.8,
      consultationFee: '0.04 ETH',
      isVerified: true,
      isOnline: false,
      image:
          'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=400',
      nextAvailable: 'Tomorrow 9:00 AM',
      blockchainId: '0x2b3c4d5e6f7a...',
    ),
    Doctor(
      name: 'Dr. Emily Rodriguez',
      department: 'Pediatrics',
      specialization: 'Child Development',
      experience: '8 years',
      rating: 4.7,
      consultationFee: '0.03 ETH',
      isVerified: true,
      isOnline: true,
      image:
          'https://images.unsplash.com/photo-1594824475317-d8b0b4b5b8b5?w=400',
      nextAvailable: '4:00 PM Today',
      blockchainId: '0x3c4d5e6f7a8b...',
    ),
    Doctor(
      name: 'Dr. James Wilson',
      department: 'Orthopedics',
      specialization: 'Joint Replacement',
      experience: '20 years',
      rating: 4.9,
      consultationFee: '0.06 ETH',
      isVerified: true,
      isOnline: true,
      image:
          'https://images.unsplash.com/photo-1582750433449-648ed127bb54?w=400',
      nextAvailable: '10:00 AM Tomorrow',
      blockchainId: '0x4d5e6f7a8b9c...',
    ),
    Doctor(
      name: 'Dr. Lisa Thompson',
      department: 'Dermatology',
      specialization: 'Skin Cancer',
      experience: '10 years',
      rating: 4.6,
      consultationFee: '0.035 ETH',
      isVerified: true,
      isOnline: false,
      image: 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=400',
      nextAvailable: 'Monday 11:00 AM',
      blockchainId: '0x5e6f7a8b9c0d...',
    ),
  ];



  static List<String> filters = [
    'All',
    'Medical',
    'Blockchain', 
    'Appointments',
    'Emergency',
    'System',
  ];

  static List<NotificationItem> notifications = [
    NotificationItem(
      id: '1',
      title: 'Blockchain Transaction Confirmed',
      message: 'Your consultation payment of 0.05 ETH has been confirmed on the blockchain',
      type: NotificationType.blockchain,
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      isRead: false,
      priority: NotificationPriority.high,
      actionRequired: false,
      blockchainTxHash: '0x1a2b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a0b1c2d3e4f5a6b7c8d9e0f1a2b',
      hugeIcon: HugeIcons.strokeRoundedBlockchain01,
      color: const Color(0xFF010A38),
    ),
    NotificationItem(
      id: '2',
      title: 'Appointment Reminder',
      message: 'Your consultation with Dr. Sarah Johnson is in 30 minutes',
      type: NotificationType.appointment,
      timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
      isRead: false,
      priority: NotificationPriority.urgent,
      actionRequired: true,
      hugeIcon: HugeIcons.strokeRoundedCalendar03,
      color: Colors.blue,
    ),
    NotificationItem(
      id: '3',
      title: 'Medical Record Updated',
      message: 'Your lab results have been securely added to your blockchain medical record',
      type: NotificationType.medical,
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      isRead: true,
      priority: NotificationPriority.medium,
      actionRequired: true,
      blockchainTxHash: '0x2b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a0b1c2d3e4f5a6b7c8d9e0f1a2b3c',
      hugeIcon: HugeIcons.strokeRoundedMedicalFile,
      color: Colors.green,
    ),
    NotificationItem(
      id: '4',
      title: 'Emergency Alert System Test',
      message: 'Monthly blockchain emergency system verification completed successfully',
      type: NotificationType.emergency,
      timestamp: DateTime.now().subtract(const Duration(hours: 4)),
      isRead: true,
      priority: NotificationPriority.medium,
      actionRequired: false,
      hugeIcon: HugeIcons.strokeRoundedAlert02,
      color: Colors.red,
    ),
    NotificationItem(
      id: '5',
      title: 'Smart Contract Executed',
      message: 'Insurance claim smart contract has been automatically processed',
      type: NotificationType.blockchain,
      timestamp: DateTime.now().subtract(const Duration(hours: 6)),
      isRead: false,
      priority: NotificationPriority.high,
      actionRequired: true,
      blockchainTxHash: '0x3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a0b1c2d3e4f5a6b7c8d9e0f1a2b3c4d',
      hugeIcon: HugeIcons.strokeRoundedContracts,
      color: const Color(0xFF010A38),
    ),
    NotificationItem(
      id: '6',
      title: 'Network Maintenance',
      message: 'Blockchain network maintenance scheduled for tonight 2:00 AM - 4:00 AM',
      type: NotificationType.system,
      timestamp: DateTime.now().subtract(const Duration(hours: 8)),
      isRead: true,
      priority: NotificationPriority.low,
      actionRequired: false,
      hugeIcon: HugeIcons.strokeRoundedSettings02,
      color: Colors.orange,
    ),
    NotificationItem(
      id: '7',
      title: 'Prescription Refill Reminder',
      message: 'Your prescription expires in 3 days. Refill request sent to blockchain',
      type: NotificationType.medical,
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      isRead: false,
      priority: NotificationPriority.medium,
      actionRequired: true,
      hugeIcon: HugeIcons.strokeRoundedMedicine01,
      color: Colors.purple,
    ),
    NotificationItem(
      id: '8',
      title: 'Wallet Balance Low',
      message: 'Your wallet balance is below 0.01 ETH. Consider adding funds for consultations',
      type: NotificationType.blockchain,
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      isRead: true,
      priority: NotificationPriority.medium,
      actionRequired: true,
      hugeIcon: HugeIcons.strokeRoundedWallet03,
      color: Colors.amber,
    ),
  ];


   
  static List<String> inbox_filters = [
    'All',
    'Doctors',
    'Insurance',
    'Lab Results',
    'Appointments',
    'System',
  ];

  static List<Message> messages = [
    Message(
      id: '1',
      senderName: 'Dr. Sarah Johnson',
      senderRole: 'Cardiologist',
      subject: 'Lab Results Available',
      preview: 'Your recent cardiac enzyme test results are now available on the blockchain...',
      content: 'Dear Yusuf,\n\nYour recent cardiac enzyme test results have been securely uploaded to your blockchain medical record. All values are within normal ranges. The troponin levels show no signs of cardiac damage.\n\nNext steps:\n- Continue current medication\n- Schedule follow-up in 3 months\n- Maintain healthy lifestyle\n\nBest regards,\nDr. Sarah Johnson',
      timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
      isRead: false,
      messageType: MessageType.labResults,
      priority: MessagePriority.high,
      hasAttachment: true,
      blockchainVerified: true,
      senderImage: 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=400',
      attachments: ['cardiac_enzymes_report.pdf', 'blockchain_verification.json'],
    ),
    Message(
      id: '2',
      senderName: 'HealthChain Insurance',
      senderRole: 'Insurance Provider',
      subject: 'Claim Approved - Smart Contract Executed',
      preview: 'Your insurance claim has been automatically approved via smart contract...',
      content: 'Dear Yusuf Ahmed,\n\nGreat news! Your insurance claim #HC-2023-789456 has been automatically approved and processed through our blockchain smart contract system.\n\nClaim Details:\n- Amount: 0.05 ETH\n- Service: Cardiac Consultation\n- Provider: Dr. Sarah Johnson\n- Date: ${DateTime.now().subtract(const Duration(days: 1)).toString().split(' ')[0]}\n\nThe payment has been transferred to your wallet. Transaction hash: 0x1a2b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a0b\n\nThank you for choosing HealthChain Insurance.',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      isRead: false,
      messageType: MessageType.insurance,
      priority: MessagePriority.high,
      hasAttachment: true,
      blockchainVerified: true,
      senderImage: 'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=400',
      attachments: ['claim_approval.pdf', 'smart_contract_receipt.json'],
    ),
    Message(
      id: '3',
      senderName: 'Dr. Michael Chen',
      senderRole: 'Neurologist',
      subject: 'Appointment Confirmation',
      preview: 'Your appointment has been confirmed for tomorrow at 9:00 AM...',
      content: 'Hello Yusuf,\n\nThis is to confirm your appointment scheduled for tomorrow at 9:00 AM.\n\nAppointment Details:\n- Date: ${DateTime.now().add(const Duration(days: 1)).toString().split(' ')[0]}\n- Time: 9:00 AM\n- Duration: 45 minutes\n- Type: Neurological Consultation\n- Fee: 0.04 ETH\n\nPlease arrive 15 minutes early and bring your blockchain health ID.\n\nSee you tomorrow!\nDr. Michael Chen',
      timestamp: DateTime.now().subtract(const Duration(hours: 4)),
      isRead: true,
      messageType: MessageType.appointment,
      priority: MessagePriority.medium,
      hasAttachment: false,
      blockchainVerified: true,
      senderImage: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=400',
      attachments: [],
    ),
    Message(
      id: '4',
      senderName: 'HealthChain System',
      senderRole: 'System Administrator',
      subject: 'Medical Record Updated',
      preview: 'Your medical record has been updated with new prescription information...',
      content: 'Dear User,\n\nYour medical record has been successfully updated with new prescription information from Dr. Sarah Johnson.\n\nUpdated Information:\n- New prescription: Lisinopril 10mg daily\n- Duration: 30 days\n- Refills: 2\n- Blockchain hash: 0x8f3e2a1b9c7d6e5f4a3b2c1d0e9f8a7b6c5d4e3f\n\nAll changes have been encrypted and stored securely on the blockchain.\n\nHealthChain System',
      timestamp: DateTime.now().subtract(const Duration(hours: 6)),
      isRead: true,
      messageType: MessageType.system,
      priority: MessagePriority.medium,
      hasAttachment: true,
      blockchainVerified: true,
      senderImage: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=400',
      attachments: ['prescription_update.json'],
    ),
    Message(
      id: '5',
      senderName: 'CityLab Diagnostics',
      senderRole: 'Laboratory',
      subject: 'Blood Work Results Ready',
      preview: 'Your complete blood count results are now available...',
      content: 'Dear Mr. Ahmed,\n\nYour blood work results from yesterday are now ready and have been securely uploaded to your blockchain medical record.\n\nTest Results Summary:\n- Complete Blood Count: Normal\n- Lipid Panel: Slightly elevated cholesterol\n- Glucose: Normal\n- Kidney Function: Normal\n\nPlease discuss these results with your primary care physician.\n\nCityLab Diagnostics\nBlockchain Verified Laboratory',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      isRead: false,
      messageType: MessageType.labResults,
      priority: MessagePriority.high,
      hasAttachment: true,
      blockchainVerified: true,
      senderImage: 'https://images.unsplash.com/photo-1582560469781-1965b9af903d?w=400',
      attachments: ['blood_work_results.pdf', 'lab_verification.json'],
    ),
    Message(
      id: '6',
      senderName: 'Dr. Emily Rodriguez',
      senderRole: 'Pediatrician',
      subject: 'Prescription Refill Approved',
      preview: 'Your prescription refill request has been approved and processed...',
      content: 'Hi Yusuf,\n\nYour prescription refill request for your allergy medication has been approved.\n\nPrescription Details:\n- Medication: Cetirizine 10mg\n- Quantity: 30 tablets\n- Refills remaining: 1\n- Pharmacy: HealthChain Pharmacy\n\nYou can pick up your medication anytime. The prescription has been sent to the pharmacy via blockchain.\n\nDr. Emily Rodriguez',
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      isRead: true,
      messageType: MessageType.prescription,
      priority: MessagePriority.medium,
      hasAttachment: false,
      blockchainVerified: true,
      senderImage: 'https://images.unsplash.com/photo-1594824475317-d8b0b4b5b8b5?w=400',
      attachments: [],
    ),
    Message(
      id: '7',
      senderName: 'HealthChain Support',
      senderRole: 'Customer Support',
      subject: 'Welcome to HealthChain',
      preview: 'Welcome to the future of blockchain healthcare...',
      content: 'Dear Yusuf,\n\nWelcome to HealthChain! We\'re excited to have you join our blockchain-powered healthcare platform.\n\nYour account is now fully verified and ready to use. Here\'s what you can do:\n\n✓ Securely store medical records\n✓ Make cryptocurrency payments\n✓ Access verified doctors\n✓ Manage insurance claims\n✓ Track prescriptions\n\nIf you have any questions, don\'t hesitate to reach out.\n\nBest regards,\nHealthChain Support Team',
      timestamp: DateTime.now().subtract(const Duration(days: 7)),
      isRead: true,
      messageType: MessageType.system,
      priority: MessagePriority.low,
      hasAttachment: false,
      blockchainVerified: true,
      senderImage: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=400',
      attachments: [],
    ),
  ];


}
