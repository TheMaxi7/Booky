import 'quote.dart';
import 'note.dart';
import 'book.dart';

class SampleData {
  static Book book1 = Book(
    name: "Deep Work",
    cover: 'assets/images/deepwork.jpg',
    author: "Cal Newport",
    description: "Deep work it what yohnot ay.",
    isStarred: false,
    pages: 296,
    pagesRead: 100,
    genre: "Self Help",
    quotes: [
      Quote(
        index: 1,
        quote: "If you can’t learn, you can’t thrive.",
        page: 111,
        favourite: true,
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

  static Book book2 = Book(
    name: "Atomic Habits",
    cover: 'assets/images/atomichabits.jpg',
    author: "James Clear",
    description: "lorem",
    isStarred: false,
    pages: 296,
    pagesRead: 296,
    genre: "Self Help",
    quotes: [
      Quote(
        index: 1,
        quote:
            "If you can’t learn, you can’t yolo.agarsgefkjlarhbgvlikaebgrvliqehvcobrlighvlkbaio;v o;agh ;oabjrgil;oaehg p'g;oaehg'p NRG ;ONGV;'LAN;OG HJGN ;AEOR HMN",
        page: 111,
        favourite: false,
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
    description: "lorem",
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
        favourite: true,
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
    isStarred: false,
    genre: "Self Help",
    quotes: [
      Quote(
        index: 1,
        quote:
            "Sometimes we must walk into the darkness in order to understand what light really is.",
        page: 111,
        favourite: true,
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
    isStarred: false,
    genre: "Nonfiction",
    quotes: [
      Quote(
        index: 1,
        quote:
            "You can measure your worth by your dedication to your path, not by your successes or failures.",
        page: 111,
        favourite: true,
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
    genre: "Business",
    quotes: [
      Quote(
        index: 1,
        quote:
            "Inertia. Guy’s law of enchantment: “People at rest will remain at rest, and people in motion will keep moving in the same direction unless an outside enchanter acts upon them.",
        page: 111,
        favourite: true,
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
    isStarred: false,
    genre: "Fantasy",
    quotes: [
      Quote(
        index: 1,
        quote:
            "Those we love never truly leave us, Harry. There are things that death cannot touch.",
        page: 111,
        favourite: true,
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
    isStarred: true,
    genre: "Fantasy",
    quotes: [
      Quote(
        index: 1,
        quote:
            "But in the end it's only a passing thing, this shadow; even darkness must pass.",
        page: 111,
        favourite: true,
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
    isStarred: false,
    genre: "Economics",
    quotes: [
      Quote(
        index: 1,
        quote:
            "True ignorance is not the absence of knowledge, it’s the refusal to acquire it.",
        page: 111,
        favourite: true,
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
    genre: "Nonfiction",
    quotes: [
      Quote(
        index: 1,
        quote: "Who you are is defined by what you’re willing to struggle for.",
        page: 111,
        favourite: true,
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
}
