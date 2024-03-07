import 'quote.dart';
import 'note.dart';
import 'book.dart';


class SampleData {
  static Book book1 = Book(
    name : "Deep Work",
    cover : 'assets/images/deepwork.jpg',
    author: "Cal Newport",
    description : "Deep work it what yohnot ay.",
    pages : 296,
    genre : "Self Help",
    quotes : [
      Quote(
        index: 1,
        quote: "If you can’t learn, you can’t thrive.",
        page: 111,
        favourite: true,
      )
    ],
    notes : [
      Note(
        index:1,
        note:"lorem",
        page:111,
      ),
    ],
  );


  static Book book2 = Book(
    name : "Atomic Habits",
    cover : 'assets/images/atomichabits.jpg',
    author: "James Clear",
    description : "lorem",
    pages : 296,
    genre : "Self Help",
    quotes : [
      Quote(
        index: 1,
        quote: "If you can’t learn, you can’t yolo.agarsgefkjlarhbgvlikaebgrvliqehvcobrlighvlkbaio;v o;agh ;oabjrgil;oaehg p'g;oaehg'p NRG ;ONGV;'LAN;OG HJGN ;AEOR HMN",
        page: 111,
        favourite: false,
      )
    ],
    notes : [
      Note(
        index:1,
        note:"lorem",
        page:111,
      ),
    ],
  );


  static Book book3 = Book(
    name : "Quiet",
    author: "Susan Cain",
    cover : 'assets/images/quiet.jpg',
    description : "lorem",
    pages : 296,
    genre : "Psychology",
    quotes : [
      Quote(
        index: 1,
        quote: "If you can’t learn, you can’t yolo.agarsgefkjlarhbgvlikaebgrvliqehvcobrlighvlkbaio;v o;agh ;oabjrgil;oaehg p'g;oaehg'p NRG ;ONGV;'LAN;OG HJGN ;AEOR HMN",
        page: 111,
        favourite: true,
      )
    ],
    notes : [
      Note(
        index:1,
        note:"lorem",
        page:111,
      ),
    ],
  );

  static Book book4 = Book(
    name : "Best Self",
    author: "Mike Bayer",
    cover : 'assets/images/bestself.jpg',
    description : "The first book from Coach Mike, well-known life coach, personal development coach, addiction specialist, and soon-to-be Dr. Phil Show an inspiring, invigorating program to help you examine where your life is now. Determine once and for all who you want to be and where you want to go, and live authentically and happily forever.",
    pages : 352,
    genre : "Self Help",
    quotes : [
      Quote(
        index: 1,
        quote: "Sometimes we must walk into the darkness in order to understand what light really is.",
        page: 111,
        favourite: true,
      )
    ],
    notes : [
      Note(
        index:1,
        note:"lorem",
        page:111,
      ),
    ],
  );

  static Book book5 = Book(
    name : "Big Magic",
    author: "Elicabeth Gilbert",
    cover : 'assets/images/bigmagic.jpg',
    description : "Gilbert offers insights into the mysterious nature of inspiration. She asks us to embrace our curiosity and let go of needless suffering. She shows us how to tackle what we most love, and how to face down what we most fear. She discusses the attitudes, approaches, and habits we need in order to live our most creative lives. Balancing",
    pages : 276,
    genre : "Nonfiction",
    quotes : [
      Quote(
        index: 1,
        quote: "You can measure your worth by your dedication to your path, not by your successes or failures.",
        page: 111,
        favourite: true,
      )
    ],
    notes : [
      Note(
        index:1,
        note:"lorem",
        page:111,
      ),
    ],
  );

  static Book book6 = Book(
    name : "Enchantment",
    author: "Guy Kawasaki",
    cover : 'assets/images/enchantment.jpg',
    description : "Enchantment, as defined by bestselling business guru Guy Kawasaki, is not about manipulating people. It transforms situations and relationships. It converts hostility into civility and civility into affinity. It changes the skeptics and cynics into the believers and the undecided into the loyal. Enchantment can happen during a retail",
    pages : 211,
    genre : "Business",
    quotes : [
      Quote(
        index: 1,
        quote: "Inertia. Guy’s law of enchantment: “People at rest will remain at rest, and people in motion will keep moving in the same direction unless an outside enchanter acts upon them.",
        page: 111,
        favourite: true,
      )
    ],
    notes : [
      Note(
        index:1,
        note:"lorem",
        page:111,
      ),
    ],
  );

  static Book book7 = Book(
    name : "Harry Potter and The Cursed Child",
    author: "J.K. Rowling",
    cover : 'assets/images/harrypotter.jpg',
    description : "The eighth story, nineteen years later...It was always difficult being Harry Potter, and it isn't much easier now that he is an overworked employee of the Ministry of Magic, a husband, and a father of three school-age children.",
    pages : 343,
    genre : "Fantasy",
    quotes : [
      Quote(
        index: 1,
        quote: "Those we love never truly leave us, Harry. There are things that death cannot touch.",
        page: 111,
        favourite: true,
      )
    ],
    notes : [
      Note(
        index:1,
        note:"lorem",
        page:111,
      ),
    ],
  );

  static Book book8 = Book(
    name : "The Lord of The Rings",
    author: "J.R.R. Tolkien",
    cover : 'assets/images/lordoftherings.jpg',
    description : "In ancient times the Rings of Power were crafted by the Elven-smiths, and Sauron, the Dark Lord, forged the One Ring, filling it with his own power so that he could rule all others. But the One Ring was taken from him, and though he sought it throughout Middle-earth, it remained lost to him. After many ages it fell by chance into the hands of the hobbit Bilbo Baggins.",
    pages : 1216,
    genre : "Fantasy",
    quotes : [
      Quote(
        index: 1,
        quote: "But in the end it's only a passing thing, this shadow; even darkness must pass.",
        page: 111,
        favourite: true,
      )
    ],
    notes : [
      Note(
        index:1,
        note:"lorem",
        page:111,
      ),
    ],
  );

  static Book book9 = Book(
    name : "The Price of Tomorrow",
    author: "Jeff Booth",
    cover : 'assets/images/priceoftomorrow.jpg',
    description : "\"Your world view will transform \" - Salim Ismail, Best Selling Author of 'Exponential Organizations' We live in an extraordinary time. Technological advances are happening at a rate faster than our ability to understand them, and in a world that moves faster than we can imagine, we cannot afford to stand still. These advances bring efficiency and abundance—and they are profoundly deflationary. Our economic systems were built for a pre-technology era when labour and capital were inextricably linked, an era that counted on growth and inflation, an era where we made money from inefficiency. That era is over, but we keep on pretending that those economic systems still work. The only thing driving growth in the world today is easy credit, which is being created at a pace that is hard to comprehend—and with it, debt that we will never be able to pay back. As we try to artificially drive an economic system built for the past, we are creating more than just economic trouble. On our current path, our world will become profoundly more polarized and unsafe. We need to build a new framework for our local and global economies, and soon; we need to accept deflation and embrace the abundance it can bring. Otherwise, the same technology that has the power to bring abundance to us and our world will instead destroy it. In this extraordinary contrarian book, Jeff Booth, a leading mind and CEO in e-commerce and technology for 20 years, details the technological and economic realities shaping our present and our future, and the choices we face as we go forward—a potentially alarming, but deeply hopeful situation.",
    pages : 232,
    genre : "Economics",
    quotes : [
      Quote(
        index: 1,
        quote: "True ignorance is not the absence of knowledge, it’s the refusal to acquire it.",
        page: 111,
        favourite: true,
      )
    ],
    notes : [
      Note(
        index:1,
        note:"lorem",
        page:111,
      ),
    ],
  );

  static Book book10 = Book(
    name : "The Subtle Art of Not Giving a Fuck",
    author: "Mark Manson",
    cover : 'assets/images/subtleart.jpg',
    description : "In this generation-defining self-help guide, a superstar blogger cuts through the crap to show us how to stop trying to be \"positive\" all the time so that we can truly become better, happier people.",
    pages : 212,
    genre : "Nonfiction",
    quotes : [
      Quote(
        index: 1,
        quote: "Who you are is defined by what you’re willing to struggle for.",
        page: 111,
        favourite: true,
      )
    ],
    notes : [
      Note(
        index:1,
        note:"lorem",
        page:111,
      ),
    ],
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
    book10
  ];

  static List<Book> bestsellersBooks = [
    book1,
    book2,
    book10,
    book8,
  ];

  static List<Book> forYouBooks = [
    book7,
    book6,
    book5
  ];

  static List<Book> newReleasesBooks = [
    book4,
    book9,
    book3
  ];

}