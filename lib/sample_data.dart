import 'package:booky/standard_challenges.dart';

import 'quote.dart';
import 'note.dart';
import 'book.dart';
import 'challenges.dart';
import 'shelf.dart';

class SampleData {

  static Shelf myFavouriteBooks = Shelf(
    name: "My favourite books",
    cover: 'assets/images/deepwork.jpg',
    books: [book1,book2,book3,book4,book5,book6]
  );

  static StandardChallenge monthlyChallenge = StandardChallenge(
    name: "Monthly Challenge",
    booksToRead: 2,
    progress: 1,
    isCompleted: false,
  );
  static StandardChallenge yearlyChallenge = StandardChallenge(
    name: "Yearly Challenge",
    booksToRead: 24,
    progress: 4,
    isCompleted: false,
  );

  static Challenge challenge1 = Challenge(
    name: "Genre Explorer",
    info: "Read at least one book from 10 different genres.",
    isCompleted: false,
  );

  static Challenge challenge2 = Challenge(
    name: "Serial Reader",
    info: "Complete a series of at least 3 books.",
    isCompleted: false,
  );

  static Challenge challenge3 = Challenge(
    name: "Page turner",
    info: "Finish reading a book with over 500 pages.",
    isCompleted: false,
  );

  static Challenge challenge4 = Challenge(
    name: "Voyager",
    info: "Read books from authors representing at least 5 different countries.",
    isCompleted: false,
  );

  static Challenge challenge5 = Challenge(
    name: "Speedy Reader",
    info: " Finish reading 3 books within a month.",
    isCompleted: false,
  );

  static Challenge challenge6 = Challenge(
    name: "Fantasy lover",
    info: "Complete 5 fantasy books.",
    isCompleted: false,
  );

  static Challenge challenge7 = Challenge(
    name: "Vintage virtuoso",
    info: "Master 5 classics.",
    isCompleted: false,
  );

  static Challenge challenge8 = Challenge(
    name: "Fanboy",
    info: "Read 5 different books of the same author.",
    isCompleted: false,
  );
  static Challenge challenge9 = Challenge(
    name: "Dystopian Dive",
    info: "Read 5 different dystopian novels.",
    isCompleted: false,
  );

  static Book book1 = Book(
    name: "Deep Work",
    allRating: 4,
    myRating: 4.2,
    cover: 'assets/images/deepwork.jpg',
    author: "Cal Newport",
    description: "One of the most valuable skills in our economy is becoming increasingly rare. If you master this skill, you'll achieve extraordinary results.Deep work is the ability to focus without distraction on a cognitively demanding task. It's a skill that allows you to quickly master complicated information and produce better results in less time. Deep work will make you better at what you do and provide the sense of true fulfillment that comes from craftsmanship. In short, deep work is like a super power in our increasingly competitive twenty-first century economy. And yet, most people have lost the ability to go deep-spending their days instead in a frantic blur of e-mail and social media, not even realizing there's a better way.In Deep Work, author and professor Cal Newport flips the narrative on impact in a connected age. Instead of arguing distraction is bad, he instead celebrates the power of its opposite. Dividing this book into two parts, he first makes the case that in almost any profession, cultivating a deep work ethic will produce massive benefits. He then presents a rigorous training regimen, presented as a series of four rules for transforming your mind and habits to support this skill.A mix of cultural criticism and actionable advice, Deep Work takes the reader on a journey through memorable stories-from Carl Jung building a stone tower in the woods to focus his mind, to a social media pioneer buying a round-trip business class ticket to Tokyo to write a book free from distraction in the air-and no-nonsense advice, such as the claim that most serious professionals should quit social media and that you should practice being bored. Deep Work is an indispensable guide to anyone seeking focused success in a distracted world.",
    isStarred: false,
    pages: 296,
    amazonUrl: "https://www.amazon.com/s?k=Quiet&ref=nb_sb_noss",
    infoUrl: "https://openlibrary.org/works/OL17713267W/Deep_Work?edition=key%3A/books/OL27281494M",
    isbn: 9781455586691,
    publishDate: "04/09/2018",
    pagesRead: 100,
    genre: "Self Help",
    quotes: [
      Quote(
        name: "Learn",
        index: 1,
        quote: "If you can’t learn, you can’t thrive.",
        page: 111,
        isPinned: true,
      ),
      Quote(
        name: "Clarity",
        index: 1,
        quote: "Clarity about what matters provides clarity about what does not.",
        page: 111,
        isPinned: false,
      ),
      Quote(
        name: "Focus",
        index: 1,
        quote: "Who you are, what you think, feel, and do, what you love—is the sum of what you focus on.",
        page: 111,
        isPinned: false,
      ),
    ],
    notes: [
      Note(
        index: 1,
        name: "The Five Big Ideas",
        note: "In order to produce the absolute best stuff you’re capable of, you need to commit to deep work.The ability to quickly master hard things and the ability to produce at an elite level, in terms of both quality and speed, are two core abilities for thriving in today’s economy.\“To learn hard things quickly, you must focus intensely without distraction.\”\“Your work is craft, and if you hone your ability and apply it with respect and care, then like the skilled wheelwright you can generate meaning in the daily efforts of your professional life.”\“The key to developing a deep work habit is to move beyond good intentions and add routines and rituals to your working life designed to minimize the amount of your limited willpower necessary to transition into and maintain a state of unbroken concentration.”",
        page: 221,
      ),
      Note(
        index: 2,
        name: "The Five Big Ideas",
        note: "In order to produce the absolute best stuff you’re capable of, you need to commit to deep work.The ability to quickly master hard things and the ability to produce at an elite level, in terms of both quality and speed, are two core abilities for thriving in today’s economy.\“To learn hard things quickly, you must focus intensely without distraction.\”\“Your work is craft, and if you hone your ability and apply it with respect and care, then like the skilled wheelwright you can generate meaning in the daily efforts of your professional life.”\“The key to developing a deep work habit is to move beyond good intentions and add routines and rituals to your working life designed to minimize the amount of your limited willpower necessary to transition into and maintain a state of unbroken concentration.”",
        page: 22233,
      ),
      Note(
        index: 3,
        name: "The Five Big Ideas",
        note: "In order to produce the absolute best stuff you’re capable of, you need to commit to deep work.The ability to quickly master hard things and the ability to produce at an elite level, in terms of both quality and speed, are two core abilities for thriving in today’s economy.\“To learn hard things quickly, you must focus intensely without distraction.\”\“Your work is craft, and if you hone your ability and apply it with respect and care, then like the skilled wheelwright you can generate meaning in the daily efforts of your professional life.”\“The key to developing a deep work habit is to move beyond good intentions and add routines and rituals to your working life designed to minimize the amount of your limited willpower necessary to transition into and maintain a state of unbroken concentration.”",
        page: 4444,
        isPinned: true,
      ),
    ],
  );

  static Book book2 = Book(
    name: "Atomic Habits",
    cover: 'assets/images/atomichabits.jpg',
    author: "James Clear",
    description: "No matter your goals, Atomic Habits offers a proven framework for improving—every day. James Clear, one of the world's leading experts on habit formation, reveals practical strategies that will teach you exactly how to form good habits, break bad ones, and master the tiny behaviors that lead to remarkable results.If you're having trouble changing your habits, the problem isn't you. The problem is your system. Bad habits repeat themselves again and again not because you don't want to change, but because you have the wrong system for change. You do not rise to the level of your goals. You fall to the level of your systems. Here, you'll get a proven system that can take you to new heights.Clear is known for his ability to distill complex topics into simple behaviors that can be easily applied to daily life and work. Here, he draws on the most proven ideas from biology, psychology, and neuroscience to create an easy-to-understand guide for making good habits inevitable and bad habits impossible. Along the way, readers will be inspired and entertained with true stories from Olympic gold medalists, award-winning artists, business leaders, life-saving physicians, and star comedians who have used the science of small habits to master their craft and vault to the top of their field.Learn how to: - Make time for new habits (even when life gets crazy); - Overcome a lack of motivation and willpower; - Design your environment to make success easier; - Get back on track when you fall off course;...and much more.Atomic Habits will reshape the way you think about progress and success, and give you the tools and strategies you need to transform your habits--whether you are a team looking to win a championship, an organization hoping to redefine an industry, or simply an individual who wishes to quit smoking, lose weight, reduce stress, or achieve any other goal.",
    publishDate: "18/10/2018",
    isStarred: false,
    pages: 296,
    isbn: 123567891011,
    allRating: 4,
    myRating: 4.8,
    pagesRead: 296,
    genre: "Self Help",
    quotes: [
      Quote(
        index: 1,
        quote:
        "If you can’t learn, you can’t yolo.agarsgefkjlarhbgvlikaebgrvliqehvcobrlighvlkbaio;v o;agh ;oabjrgil;oaehg p'g;oaehg'p NRG ;ONGV;'LAN;OG HJGN ;AEOR HMN",
        page: 111,
        isPinned: false,
      )
    ],
    notes: [
      Note(
        index: 1,
        note:
        "l can’t learn, you can’t yolo.agarsgefkjlarhbgvlikaebgrvliqehvcobrlighvlkbaio;v o;agh ;oorem",
        page: 111,
      ),
      Note(
        index: 2,
        note:
        "lo can’t learn, you can’t yolo.agarsgefkjlarhbgvlikaebgrvliqehvcobrlighvlkbaio;v o;agh ;orem",
        page: 111,
      ),
      Note(
        index: 3,
        note:
        "lore can’t learn, you can’t yolo.agarsgefkjlarhbgvlikaebgrvliqehvcobrlighvlkbaio;v o;agh ;om",
        page: 111,
      ),
      Note(
        index: 4,
        note:
        "lor can’t learn, you can’t yolo.agarsgefkjlarhbgvlikaebgrvliqehvcobrlighvlkbaio;v o;agh ;oem",
        page: 111,
      ),
    ],
  );

  static Book book3 = Book(
    name: "Quiet",
    author: "Susan Cain",
    cover: 'assets/images/quiet.jpg',
    description: "At least one-third of the people we know are introverts. They are the ones who prefer listening to speaking; who innovate and create but dislike self-promotion; who favor working on their own over working in teams. It is to introverts—Rosa Parks, Chopin, Dr. Seuss, Steve Wozniak—that we owe many of the great contributions to society.In Quiet, Susan Cain argues that we dramatically undervalue introverts and shows how much we lose in doing so. She charts the rise of the Extrovert Ideal throughout the twentieth century and explores how deeply it has come to permeate our culture. She also introduces us to successful introverts—from a witty, high-octane public speaker who recharges in solitude after his talks, to a record-breaking salesman who quietly taps into the power of questions. Passionately argued, superbly researched, and filled with indelible stories of real people, Quiet has the power to permanently change how we see introverts and, equally important, how they see themselves.Now with Extra Libris material, including a reader’s guide and bonus content.",
    publishDate: "24/01/2012",
    allRating: 3.8,
    myRating: 3.8,
    isbn: 9780307352149,
    pages: 296,
    pagesRead: 296,
    genre: "Psychology",
    isStarred: false,
    quotes: [
      Quote(
        index: 1,
        quote:
        "If you can’t learn, you can’t yolo.agarsgefkjlarhbgvlikaebgrvliqehvcobrlighvlkbaio;v o;agh ;oabjrgil;oaehg p'g;oaehg'p NRG ;ONGV;'LAN;OG HJGN ;AEOR HMN",
        page: 111,
        isPinned: false,
      )
    ],
    notes: [
      Note(
        index: 1,
        note: "lorem",
        page: 111,
      ),
    ],
  );

  static Book book4 = Book(
    name: "Best Self",
    author: "Mike Bayer",
    cover: 'assets/images/bestself.jpg',
    description:
    "The first book from Coach Mike, well-known life coach, personal development coach, addiction specialist, and soon-to-be Dr. Phil Show an inspiring, invigorating program to help you examine where your life is now. Determine once and for all who you want to be and where you want to go, and live authentically and happily forever.",
    pages: 352,
    amazonUrl: "https://www.amazon.com/s?k=Best+Self&ref=nb_sb_noss",
    infoUrl: "https://openlibrary.org/works/OL17713267W/Deep_Work?edition=key%3A/books/OL27281494M",
    allRating: 4,
    publishDate: "08/01/2019",
    isStarred: false,
    isbn: 9781982584658,
    genre: "Self Help",
    quotes: [
      Quote(
        index: 1,
        quote:
        "Sometimes we must walk into the darkness in order to understand what light really is.",
        page: 111,
          isPinned: true,
      )
    ],
    notes: [
      Note(
        index: 1,
        note: "lorem",
        page: 111,
      ),
    ],
  );

  static Book book5 = Book(
    name: "Big Magic",
    author: "Elicabeth Gilbert",
    cover: 'assets/images/bigmagic.jpg',
    description:
    "Gilbert offers insights into the mysterious nature of inspiration. She asks us to embrace our curiosity and let go of needless suffering. She shows us how to tackle what we most love, and how to face down what we most fear. She discusses the attitudes, approaches, and habits we need in order to live our most creative lives. Balancing",
    pages: 276,
    allRating: 4,
    isStarred: false,
    isbn: 9781594634710,
    publishDate: "01/09/2015",
    genre: "Nonfiction",
    quotes: [
      Quote(
        index: 1,
        quote:
        "You can measure your worth by your dedication to your path, not by your successes or failures.",
        page: 111,
        isPinned: false,
      )
    ],
    notes: [
      Note(
        index: 1,
        note: "lorem",
        page: 111,
      ),
    ],
  );

  static Book book6 = Book(
    name: "Enchantment",
    author: "Guy Kawasaki",
    cover: 'assets/images/enchantment.jpg',
    isStarred: false,
    description:
    "Enchantment, as defined by bestselling business guru Guy Kawasaki, is not about manipulating people. It transforms situations and relationships. It converts hostility into civility and civility into affinity. It changes the skeptics and cynics into the believers and the undecided into the loyal. Enchantment can happen during a retail",
    pages: 211,
    allRating: 4,
    isbn: 9781591843795,
    publishDate: "01/01/2011",
    genre: "Business",
    quotes: [
      Quote(
        index: 1,
        quote:
        "Inertia. Guy’s law of enchantment: “People at rest will remain at rest, and people in motion will keep moving in the same direction unless an outside enchanter acts upon them.",
        page: 111,
        isPinned: false,
      )
    ],
    notes: [
      Note(
        index: 1,
        note: "lorem",
        page: 111,
      ),
    ],
  );

  static Book book7 = Book(
    name: "Harry Potter and The Cursed Child",
    author: "J.K. Rowling",
    cover: 'assets/images/harrypotter.jpg',
    description:
    "The eighth story, nineteen years later...It was always difficult being Harry Potter, and it isn't much easier now that he is an overworked employee of the Ministry of Magic, a husband, and a father of three school-age children.",
    pages: 343,
    allRating: 4,
    isStarred: false,
    isbn: 1234567891011,
    publishDate: "31/07/2016",
    genre: "Fantasy",
    quotes: [
      Quote(
        index: 1,
        quote:
        "Those we love never truly leave us, Harry. There are things that death cannot touch.",
        page: 111,
        isPinned: false,
      )
    ],
    notes: [
      Note(
        index: 1,
        note: "lorem",
        page: 111,
      ),
    ],
  );

  static Book book8 = Book(
    name: "The Lord of The Rings",
    author: "J.R.R. Tolkien",
    cover: 'assets/images/lordoftherings.jpg',
    description:
    "In ancient times the Rings of Power were crafted by the Elven-smiths, and Sauron, the Dark Lord, forged the One Ring, filling it with his own power so that he could rule all others. But the One Ring was taken from him, and though he sought it throughout Middle-earth, it remained lost to him. After many ages it fell by chance into the hands of the hobbit Bilbo Baggins.",
    pages: 1216,
    allRating: 4.4,
    isStarred: true,
    isbn: 1234567891011,
    genre: "Fantasy",
    publishDate: "01/01/1954",
    quotes: [
      Quote(
        index: 1,
        quote:
        "But in the end it's only a passing thing, this shadow; even darkness must pass.",
        page: 111,
        isPinned: false,
      )
    ],
    notes: [
      Note(
        index: 1,
        note: "lorem",
        page: 111,
      ),
    ],
  );

  static Book book9 = Book(
    name: "The Price of Tomorrow",
    author: "Jeff Booth",
    cover: 'assets/images/priceoftomorrow.jpg',
    description:
    "\"Your world view will transform \" - Salim Ismail, Best Selling Author of 'Exponential Organizations' We live in an extraordinary time. Technological advances are happening at a rate faster than our ability to understand them, and in a world that moves faster than we can imagine, we cannot afford to stand still. These advances bring efficiency and abundance—and they are profoundly deflationary. Our economic systems were built for a pre-technology era when labour and capital were inextricably linked, an era that counted on growth and inflation, an era where we made money from inefficiency. That era is over, but we keep on pretending that those economic systems still work. The only thing driving growth in the world today is easy credit, which is being created at a pace that is hard to comprehend—and with it, debt that we will never be able to pay back. As we try to artificially drive an economic system built for the past, we are creating more than just economic trouble. On our current path, our world will become profoundly more polarized and unsafe. We need to build a new framework for our local and global economies, and soon; we need to accept deflation and embrace the abundance it can bring. Otherwise, the same technology that has the power to bring abundance to us and our world will instead destroy it. In this extraordinary contrarian book, Jeff Booth, a leading mind and CEO in e-commerce and technology for 20 years, details the technological and economic realities shaping our present and our future, and the choices we face as we go forward—a potentially alarming, but deeply hopeful situation.",
    pages: 232,
    pagesRead: 100,
    publishDate: "01/01/2020",
    allRating: 4,
    myRating: 4.2,
    isbn: 9781999257408,
    isStarred: false,
    genre: "Economics",
    quotes: [
      Quote(
        index: 1,
        quote:
        "True ignorance is not the absence of knowledge, it’s the refusal to acquire it.",
        page: 111,
        isPinned: false,
      )
    ],
    notes: [
      Note(
        index: 1,
        note: "lorem",
        page: 111,
      ),
    ],
  );

  static Book book10 = Book(
    name: "The Subtle Art of Not Giving a Fuck",
    author: "Mark Manson",
    cover: 'assets/images/subtleart.jpg',
    description:
    "In this generation-defining self-help guide, a superstar blogger cuts through the crap to show us how to stop trying to be \"positive\" all the time so that we can truly become better, happier people.",
    pages: 212,
    pagesRead: 100,
    isStarred: false,
    isbn: 9780062457738,
    allRating: 4,
    myRating: 3.9,
    publishDate: "01/01/2016",
    genre: "Nonfiction",
    quotes: [
      Quote(
        index: 1,
        quote: "Who you are is defined by what you’re willing to struggle for.",
        page: 111,
        isPinned: false,
      )
    ],
    notes: [
      Note(
        index: 1,
        note: "lorem",
        page: 111,
      ),
    ],
  );

  static Book book11 = Book(
    name: "Reckless",
    author: "Lauren Roberts",
    cover: 'assets/images/reckless.jpg',
    description:
    "The second heart-racing instalment in this bestselling and sizzling fantasy romance trilogy. Perfect for fans of Red Queen and The Hunger Games.The kingdom of Ilya is in turmoil…After surviving the Purging Trials, Ordinary-born Paedyn Gray has killed the King, and kickstarted a Resistance throughout the land. Now she’s running from the one person she had wanted to run to.Kai Azer is now Ilya’s Enforcer, loyal to his brother Kitt, the new King. He has vowed to find Paedyn and bring her to justice.Across the deadly Scorches, and deep into the hostile city of Dor, Kai pursues the one person he wishes he didn’t have to. But in a city without Elites, the balance between the hunter and hunted shifts – and the battle between duty and desire is deadly.Be swept away by this bestselling, kiss-or-kill romantasy trilogy taking the world by storm.",
    pages: 512,
    publishDate: "04/07/2024",
    allRating: 4,
    isbn: 1234567891011,
    isStarred: false,
    genre: "Fantasy",
    quotes: [],
    notes: [],
  );

  static Book book12 = Book(
    name: "House of Flame and Shadow",
    author: "Sarah J. Maas",
    cover: 'assets/images/house.jpg',
    description:
    "The stunning third book in the sexy, action-packed Crescent City series, following the global bestsellers House of Earth and Blood and House of Sky and Breath.Bryce Quinlan never expected to see a world other than Midgard, but now that she has, all she wants is to get back. Everything she loves is in Midgard: her family, her friends, her mate. Stranded in a strange new world, she's going to need all her wits about her to get home again. And that's no easy feat when she has no idea who to trust.Hunt Athalar has found himself in some deep holes in his life, but this one might be the deepest of all. After a few brief months with everything he ever wanted, he's in the Asteri's dungeons again, stripped of his freedom and without a clue as to Bryce's fate. He's desperate to help her, but until he can escape the Asteri's leash, his hands are quite literally tied.In this sexy, breathtaking sequel to the #1 bestsellers House of Earth and Blood and House of Sky and Breath, Sarah J. Maas's Crescent City series reaches new heights as Bryce and Hunt's world is brought to the brink of collapse-with its future resting on their shoulders.",
    pages: 816,
    isbn: 9781681193090,
    publishDate: "30/01/2024",
    allRating: 4,
    isStarred: false,
    genre: "Fantasy",
    quotes: [],
    notes: [],
  );

  static Book book13 = Book(
    name: "Somewhere Beyond the Sea",
    author: "T.J. Klune",
    cover: 'assets/images/somewhere.jpg',
    description:
    "Somewhere Beyond the Sea is the hugely anticipated sequel to TJ Klune’s The House in the Cerulean Sea, one of the best-loved and best-selling fantasy novels of the past decade. Featuring gorgeous orange sprayed edges!A magical house. A secret past. A summons that could change everything.Arthur Parnassus lives a good life built on the ashes of a bad one.He’s the master of a strange orphanage on a distant and peculiar island, and he hopes to soon be the adoptive father to the six dangerous and magical children who live there.Arthur works hard and loves with his whole heart so none of the children ever feel the neglect and pain that he once felt as an orphan on that very same island so long ago. He is not alone: joining him is the love of his life, Linus Baker, a former caseworker in the Department In Charge of Magical Youth. And there’s the island’s sprite, Zoe Chapelwhite, and her girlfriend, Mayor Helen Webb. Together, they will do anything to protect the children.But when Arthur is summoned to make a public statement about his dark past, he finds himself at the helm of a fight for the future that his family, and all magical people, deserve.And when a new magical child hopes to join them on their island home—one who finds power in calling himself monster, a name that Arthur worked so hard to protect his children from—Arthur knows they’re at a breaking point: their family will either grow stronger than ever or fall apart.back to Marsyas Island. This is Arthur’s story.Somewhere Beyond the Sea is a story of resistance, lovingly told, about the daunting experience of fighting for the life you want to live and doing the work to keep it.",
    pages: 212,
    isbn: 9781250881205,
    publishDate: "10/09/2024",
    allRating: 4,
    isStarred: true,
    genre: "Nonfiction",
    quotes: [],
    notes: [],
  );

  static List<Book> allBooks = [
    book1,
    book2,
    book3,
    book4,
    book5,
    book6,
    book7,
    book8,
    book9,
    book10,
    book11,
    book12,
    book13,
  ];

  static List<Book> myBooks = [book1, book2, book3, book9, book10];

  static List<Book> bestsellersBooks = [
    book7,
    book8,
    book4,
  ];

  static List<Book> forYouBooks = [book4, book5, book6];

  static List<Book> newReleasesBooks = [
    book11,
    book12,
    book13,
  ];

  static List<Book> myWishlist = [
    book13,
    book8,
  ];

  static List<Challenge> allChallenges = [
    challenge1,
    challenge2,
    challenge3,
    challenge4,
    challenge5,
    challenge6,
    challenge7,
    challenge8,
    challenge9,
  ];

  static List<StandardChallenge> allStandardChallenges =[
    monthlyChallenge,
    yearlyChallenge,
  ];

  static List<Shelf> myShelves = [
    myFavouriteBooks,
  ];

}

