class Question {
  final int? id;
  final int? answer;
  final String? question;
  final List<String>? options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "Aşağıdakilerden hangisi büyüme hormonu sekresyonunun azalmasına yol açar?",
    "options": ['Ghrelin', 'Hiperglisemi', 'Egzersiz', 'Yüksek plazma arjinin düzeyi', 'Rem uykusu'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": " Sella turcica bölgesindeki bir lezyonun aşağıdaki yapılardan hangisini etkilemesi en az olasıdır ?",
    "options": [
      'Arteria carotis interna',
      'Nervus trochlearis',
      'Nervus ophthalmicus ',
      'Nervus abducens',
      'Nervus mandibularis'
    ],
    "answer_index": 4,
  },
  {
    "id": 3,
    "question": "Aşağıdaki hiyoid kaslardan hangisinin siniri ansa cervicalis’tir?",
    "options": [
      'Musculus digastricus',
      'Musculus omohyoideus',
      'Musculus stylohyoideus',
      'Musculus mylohyoideus',
      'Musculus geniohyoideus'
    ],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "Aşağıdakilerden hangisi trigonum caroticum içinde bulunmaz",
    "options": [
      'A. carotis communis',
      'V. jugularis externa',
      'N. hypoglossus',
      'A. carotis externa',
      'V. jugularis interna'
    ],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question":
        "Aşağıdaki  kaslardan  hangisi,  trigonum  cervicale  anterius  ve  posterius  arasındaki  sınırı yapar?",
    "options": [
      'Musculus trapezius',
      'Musculus splenius capitis ',
      'Musculussternocleidomastoideus',
      'Musculus digastricus',
      'Platysma'
    ],
    "answer_index": 2,
  },
  {
    "id": 6,
    "question":
        "M. omohyoideus’un venter superior’u, m. sternocleidomastoideus ve m. digastricus’un venter posterior’u, aşağıda belirtilen üçgenlerden hangisinin sınırlarını oluşturur?",
    "options": [
      'Trigonum occipitale',
      'Trigonum submandibulare ',
      'Trigonum suboccipitale',
      'Trigonum caroticum',
      'Trigonum omoclaviculare (supraclaviculare)'
    ],
    "answer_index": 3,
  },
  {
    "id": 7,
    "question": "Aşağıdakilerden hangisi bir aldoz şekerdir",
    "options": ['Fruktoz', 'Dihidroksiaseton', 'Ribüloz', 'Ksilüloz', 'Riboz'],
    "answer_index": 4,
  },
  {
    "id": 8,
    "question": "Aşağıdaki karbonhidratlardan hangi ikisi birbirinin epimeridir?",
    "options": ['Galaktoz – Mannoz', 'Glukoz – Fruktoz', 'Glukoz – Galaktoz', 'Galaktoz – Fruktoz', 'Fruktoz – Mannoz'],
    "answer_index": 2,
  },
  {
    "id": 9,
    "question": "Aşağıdakilerden hangisi glukozun oksidasyonu ile oluşan bir maddedir?",
    "options": ['Sorbitol', 'N-asetilglukozamin ', 'Glukronik asit', 'Sükroz', 'Mannitol'],
    "answer_index": 2,
  },
  {
    "id": 10,
    "question": "Gangliozidin yapısında bulunan dokuz karbonlu şeker aşağıdakilerden hangisidir?",
    "options": ['Sedoheptüloz', ' Nöraminik asit', 'Mannoz', 'Eritroz-4-fosfat', 'Eritroz-4-fosfat'],
    "answer_index": 1,
  },
];
final List<Question> question = sample_data
    .map((question) => Question(
        id: question["id"],
        question: question["question"],
        options: question["options"],
        answer: question["answer_index"]))
    .toList();

List<String> answers = [];
