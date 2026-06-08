import '../models/product_model.dart';

const List<ProductModel> dummyProducts = [
  ProductModel(
    id: 'sport_1',
    name: 'حذاء الجري الاحترافي فانتوم برو',
    description: 'حذاء الجري الأكثر تطوراً من فئة النخبة. يتميز بنعل أوسط ممتص للصدمات بتقنية ريسبونسيف فوم (Responsive Foam) وجزء علوي شبكي يسمح بمرور الهواء بنسبة 100% لتوفير أقصى درجات الراحة والدعم أثناء الجري لمسافات طويلة وتحسين الأداء الرياضي بشكل ملحوظ.',
    price: 149.00,
    imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=600&auto=format&fit=crop',
    category: 'Footwear',
    rating: 4.8,
    reviewCount: 128,
    isFavorite: true,
    isAvailable: true,
    images: [
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=600&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1608231387042-66d1773070a5?q=80&w=600&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?q=80&w=600&auto=format&fit=crop',
    ],
    options: ['40', '41', '42', '43', '44'],
    specifications: {
      'الوزن': '240 جرام (خفيف جداً)',
      'النعل الأوسط': 'Responsive Foam عالي المرونة',
      'الجزء العلوي': 'شبكي تنفسي متطور (Engineered Mesh)',
      'نوع الدعم': 'محايد (Neutral) للجري اليومي',
      'المسافة الموصى بها': 'من 5 كم إلى الماراثون الكامل',
    },
    reviews: [
      {
        'name': 'خالد العتيبي',
        'rating': 5.0,
        'comment': 'حذاء رائع جداً ومريح للغاية في الجري لمسافات طويلة، النعل مرن وممتص للصدمات بشكل ممتاز. أنصح به بشدة!',
        'date': 'منذ يومين',
        'avatar': 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=100&auto=format&fit=crop'
      },
      {
        'name': 'أحمد الشمراني',
        'rating': 4.5,
        'comment': 'ممتاز جداً وخفيف الوزن، التهوية رائعة للقدمين. فقط المقاس أصغر بقليل، يفضل طلب مقاس أكبر بنصف درجة.',
        'date': 'منذ أسبوع',
        'avatar': 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?q=80&w=100&auto=format&fit=crop'
      },
      {
        'name': 'سارة محمد',
        'rating': 5.0,
        'comment': 'اشتريت هذا الحذاء للتمارين اليومية في الجيم، مريح جداً وتصميمه الأنيق باللون الأحمر يجذب الأنظار.',
        'date': 'منذ أسبوعين',
        'avatar': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=100&auto=format&fit=crop'
      }
    ],
  ),
  ProductModel(
    id: 'sport_2',
    name: 'واي بروتين معزول نقي 100% (إيزوليت)',
    description: 'الخيار الأول والأنقى لبناء كتلة عضلية صافية وتسريع الاستشفاء بعد التمارين الرياضية الشاقة. يحتوي على 25 جرام من بروتين مصل اللبن المعزول سريع الامتصاص لكل حصة مع صفر دهون وصفر سكريات مضافة وخالٍ تماماً من الغلوتين، ليناسب أهدافك الغذائية بدقة.',
    price: 79.50,
    imageUrl: 'https://images.unsplash.com/photo-1579758629938-03607ccdbaba?q=80&w=600&auto=format&fit=crop',
    category: 'Supplements',
    rating: 4.9,
    reviewCount: 94,
    isFavorite: false,
    isAvailable: true,
    images: [
      'https://images.unsplash.com/photo-1579758629938-03607ccdbaba?q=80&w=600&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1593095948071-474c5cc2989d?q=80&w=600&auto=format&fit=crop',
    ],
    options: ['شوكولاتة', 'فانيليا', 'فراولة', 'بسكويت وكريمة'],
    specifications: {
      'البروتين لكل حصة': '25 جرام بروتين معزول نقي',
      'السعرات الحرارية': '120 سعرة حرارية فقط',
      'الدهون / السكريات': '0.5 جرام دهون | 0 جرام سكر',
      'الأحماض الأمينية BCAA': '5.5 جرام للاستشفاء العضلي',
      'الوزن الإجمالي': '2.27 كجم (5 رطل) - 75 حصة',
    },
    reviews: [
      {
        'name': 'عبد الرحمن علي',
        'rating': 5.0,
        'comment': 'أفضل نوع بروتين جربته على الإطلاق! طعم الشوكولاتة غني ولذيذ جداً، وسريع الذوبان بالماء دون تكتلات.',
        'date': 'منذ 3 أيام',
        'avatar': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=100&auto=format&fit=crop'
      },
      {
        'name': 'عمر خالد',
        'rating': 4.8,
        'comment': 'ممتاز جداً لتقليل نسبة الدهون وبناء العضلات، لاحظت فرقاً كبيراً في الاستشفاء العضلي بعد استخدامه بأسبوعين.',
        'date': 'منذ أسبوعين',
        'avatar': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=100&auto=format&fit=crop'
      }
    ],
  ),
  ProductModel(
    id: 'sport_3',
    name: 'ساعة اللياقة البدنية أكتيف برو الذكية',
    description: 'شريكك المثالي للتدريب اليومي وتحسين جودة الحياة. ساعة ذكية متطورة تقيس معدل ضربات القلب بدقة، تتبع نسبة الأكسجين في الدم، ومستويات النوم، كما تدعم أكثر من 100 وضع رياضي مختلف مع تتبع نظام تحديد المواقع GPS المدمج ومقاومة تامة للمياه.',
    price: 199.00,
    imageUrl: 'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?q=80&w=600&auto=format&fit=crop',
    category: 'Electronics',
    rating: 4.6,
    reviewCount: 72,
    isFavorite: false,
    isAvailable: true,
    images: [
      'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?q=80&w=600&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=600&auto=format&fit=crop',
    ],
    options: ['أسود بركاني', 'كحلي رياضي', 'برتقالي مشرق'],
    specifications: {
      'عمر البطارية': 'تصل إلى 10 أيام في الاستخدام العادي',
      'مقاومة الماء': 'حتى عمق 50 متراً بمعيار 5 ATM',
      'نوع الشاشة': 'AMOLED عالية الدقة بحجم 1.43 بوصة',
      'المستشعرات': 'معدل نبضات القلب، SpO2، تسارع، GPS مدمج',
      'الاتصال': 'بلوتوث 5.2 | متوافقة مع iOS وأندرويد',
    },
    reviews: [
      {
        'name': 'فيصل سعود',
        'rating': 4.5,
        'comment': 'شاشتها رائعة وواضحة جداً تحت أشعة الشمس، والبطارية ممتازة تدوم معي 8 أيام بالراحة مع تفعيل تتبع الرياضة.',
        'date': 'منذ 5 أيام',
        'avatar': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=100&auto=format&fit=crop'
      }
    ],
  ),
  ProductModel(
    id: 'sport_4',
    name: 'حقيبة الظهر الرياضية المقاومة للماء',
    description: 'حقيبة ظهر رياضية ذكية تتسع لجميع مستلزماتك اليومية والجيم. تتميز بقسم سفلي منفصل ومقاوم للرائحة لتخزين الأحذية الرياضية، وقسم داخلي مقاوم للرطوبة للملابس المتسخة، ومصنوعة من خامات متينة ومقاومة للماء والقطع.',
    price: 59.99,
    imageUrl: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?q=80&w=600&auto=format&fit=crop',
    category: 'Accessories',
    rating: 4.7,
    reviewCount: 156,
    isFavorite: false,
    isAvailable: true,
    images: [
      'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?q=80&w=600&auto=format&fit=crop',
    ],
    options: ['أسود داكن', 'رمادي فحمي', 'أزرق عسكري'],
    specifications: {
      'السعة': '35 لتر لتسع كافة الاحتياجات',
      'الخامة الخارجية': 'بوليستر أوكسفورد 900D المقاوم للماء',
      'قسم الأحذية': 'جيب سفلي مدمج مزود بفتحات تهوية',
      'أحزمة الكتف': 'مبطنة بتقنية الـ Air Mesh لتوزيع الوزن',
    },
    reviews: [
      {
        'name': 'ياسر القحطاني',
        'rating': 5.0,
        'comment': 'أفضل حقيبة رياضية اشتريتها! حجمها مناسب وتستوعب حذاء الجري وملابس الجيم وزجاجة المياه وهناك مكان للابتوب أيضاً.',
        'date': 'منذ شهر',
        'avatar': 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=100&auto=format&fit=crop'
      }
    ],
  ),
  ProductModel(
    id: 'sport_5',
    name: 'طقم ملابس الضغط والتمارين للرجال',
    description: 'طقم رياضي متكامل مكون من قطعتين (بلوزة وبنطلون ضيق) يوفر ضغطاً متوازناً على العضلات لزيادة تدفق الدم وتقليل الإجهاد أثناء التمارين المكثفة. مصنوع من خيوط أيرودراي (AeroDry) فائقة النعومة وسريعة الجفاف.',
    price: 45.00,
    imageUrl: 'https://images.unsplash.com/photo-1551028719-00167b16eac5?q=80&w=600&auto=format&fit=crop',
    category: 'Fashion',
    rating: 4.4,
    reviewCount: 48,
    isFavorite: false,
    isAvailable: true,
    images: [
      'https://images.unsplash.com/photo-1551028719-00167b16eac5?q=80&w=600&auto=format&fit=crop',
    ],
    options: ['S', 'M', 'L', 'XL'],
    specifications: {
      'الخامة': '85% بوليستر رياضي | 15% سباندكس مطاطي',
      'ميزة الخيوط': 'طاردة للعرق سريعة الجفاف (Moisture-Wicking)',
      'المرونة': 'تمدد رباعي الاتجاهات لسهولة الحركة',
      'تعليمات الغسيل': 'غسيل آلي بماء بارد، تجنب الكي',
    },
    reviews: [
      {
        'name': 'محمد الدوسري',
        'rating': 4.0,
        'comment': 'مريح جداً ومطاطي بشكل ممتاز، يساعد فعلاً على بقاء الجسم دافئاً أثناء التمارين الخارجية في الشتاء.',
        'date': 'منذ 3 أسابيع',
        'avatar': 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?q=80&w=100&auto=format&fit=crop'
      }
    ],
  ),
  ProductModel(
    id: 'sport_6',
    name: 'مجموعة أوزان الدامبلز الذكية القابلة للتعديل',
    description: 'وفر مساحتك المنزلية وتمرن بذكاء مع زوج الدامبلز المتطور الذي يغنيك عن 15 زوجاً من الأوزان التقليدية. تتيح لك آلية التدوير الذكية تعديل الأوزان بسهولة وسرعة من 2.5 كجم إلى 24 كجم بضغطة زر واحدة لتناسب جميع التمارين.',
    price: 349.00,
    imageUrl: 'https://images.unsplash.com/photo-1517256064527-09c53b2d0bc6?q=80&w=600&auto=format&fit=crop',
    category: 'Equipment',
    rating: 4.9,
    reviewCount: 65,
    isFavorite: false,
    isAvailable: true,
    images: [
      'https://images.unsplash.com/photo-1517256064527-09c53b2d0bc6?q=80&w=600&auto=format&fit=crop',
    ],
    options: ['24 كجم (فردي)', '48 كجم (زوجي)'],
    specifications: {
      'نطاق الوزن': 'قابل للتعديل من 2.5 كجم إلى 24 كجم (5.5 إلى 52.5 رطل)',
      'الخامة': 'فولاذ كربوني مطلي بالسيليكون المضاد للصدأ والصدأ',
      'آلية التغيير': 'مقبض تدوير ميكانيكي آمن بـ 15 مستوى وزن',
      'القاعدة': 'تشتمل على قاعدة بلاستيكية متينة لحفظ الأوزان الغير مستخدمة',
    },
    reviews: [
      {
        'name': 'عبد الله الحربي',
        'rating': 5.0,
        'comment': 'منتج ثوري بحق! سهل الاستخدام وممتاز للتمرين المنزلي وموفر جداً للمساحة. جودة التصنيع والحديد ممتازة جداً ولا تصدر صوتاً أثناء التمرين.',
        'date': 'منذ شهرين',
        'avatar': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=100&auto=format&fit=crop'
      }
    ],
  ),
];
