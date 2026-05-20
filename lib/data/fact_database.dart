import '../../models/fact.dart';

class FactsDatabase {
  static List<Fact> getAllFacts() {
    return [
      // PLANETS CATEGORY
      Fact(
        id: '1',
        title: 'Jupiter\'s Great Red Spot',
        category: 'Planets',
        shortDescription: 'A storm larger than Earth that has raged for centuries.',
        fullDescription: 'Jupiter\'s Great Red Spot is a gigantic storm that has been raging for at least 400 years. This anticyclonic storm is so large that it could swallow Earth whole. Wind speeds in this storm can reach up to 432 km/h (268 mph). Recent observations show it\'s been shrinking, but it remains one of the most fascinating features in our solar system.',
        imageUrl: 'https://images.unsplash.com/photo-1706562018300-93e3df266600?w=800',
      ),
      Fact(
        id: '2',
        title: 'Venus Rotates Backwards',
        category: 'Planets',
        shortDescription: 'Venus spins in the opposite direction to most planets.',
        fullDescription: 'Venus is unique in our solar system because it rotates backwards (retrograde rotation) compared to other planets. A day on Venus (243 Earth days) is actually longer than its year (225 Earth days). Scientists believe this unusual rotation may have been caused by a massive collision early in the planet\'s history.',
        imageUrl: 'https://plus.unsplash.com/premium_photo-1717325378335-df1f042a7bce?w=800',
      ),
      Fact(
        id: '3',
        title: 'Mars Has the Tallest Mountain',
        category: 'Planets',
        shortDescription: 'Olympus Mons towers at 21 kilometers high.',
        fullDescription: 'Olympus Mons on Mars is the tallest planetary mountain in our solar system, standing at approximately 21 kilometers (13 miles) high - nearly three times the height of Mount Everest. This massive shield volcano is about 600 kilometers wide and was formed by lava flows over millions of years.',
        imageUrl: 'https://images.unsplash.com/photo-1701014159024-f9781490a228?w=800',
      ),
      Fact(
        id: '4',
        title: 'Saturn Could Float in Water',
        category: 'Planets',
        shortDescription: 'Saturn\'s density is less than water.',
        fullDescription: 'Saturn is the least dense planet in our solar system. With an average density of just 0.687 g/cm³, it\'s less dense than water (1 g/cm³). This means that if you could find a bathtub big enough, Saturn would float! This low density is due to its composition being primarily hydrogen and helium gases.',
        imageUrl: 'https://images.unsplash.com/photo-1614732414444-096e5f1122d5?w=800',
      ),
      Fact(
        id: '5',
        title: 'Mercury\'s Extreme Temperature Range',
        category: 'Planets',
        shortDescription: 'From 430°C to -180°C in the same day.',
        fullDescription: 'Mercury experiences the most extreme temperature variations of any planet. During the day, temperatures can soar to 430°C (800°F), hot enough to melt lead. At night, they plummet to -180°C (-290°F). This huge range is due to Mercury\'s lack of atmosphere and slow rotation.',
        imageUrl: 'https://plus.unsplash.com/premium_photo-1719104087105-6bee8d7d6846?w=800',
      ),

      // STARS CATEGORY
      Fact(
        id: '6',
        title: 'Neutron Stars Are Incredibly Dense',
        category: 'Stars',
        shortDescription: 'A teaspoon of neutron star material weighs billions of tons.',
        fullDescription: 'Neutron stars are the collapsed cores of massive supergiant stars. They are so dense that a single teaspoon of neutron star material would weigh about 6 billion tons on Earth. These stars pack more mass than our Sun into a sphere only about 20 kilometers across, making them one of the densest objects in the universe.',
        imageUrl: 'https://images.unsplash.com/photo-1710268470131-90841411e634?w=800',
      ),
      Fact(
        id: '7',
        title: 'Our Sun Loses Mass Every Second',
        category: 'Stars',
        shortDescription: 'The Sun loses 4 million tons per second to energy.',
        fullDescription: 'Through nuclear fusion, our Sun converts about 4 million tons of matter into energy every single second, following Einstein\'s famous equation E=mc². Despite this massive loss, the Sun has been shining for 4.6 billion years and has enough fuel to continue for another 5 billion years before becoming a red giant.',
        imageUrl: 'https://images.unsplash.com/photo-1614642264762-d0a3b8bf3700?w=800',
      ),
      Fact(
        id: '8',
        title: 'Betelgeuse Could Explode Anytime',
        category: 'Stars',
        shortDescription: 'This red supergiant is ready to go supernova.',
        fullDescription: 'Betelgeuse, one of the brightest stars in the night sky, is a red supergiant nearing the end of its life. It could explode as a supernova anytime in the next 100,000 years - which is "soon" in astronomical terms. When it does, it will be visible during the day and could be as bright as the full Moon for several weeks.',
        imageUrl: 'https://plus.unsplash.com/premium_photo-1670210080045-a2e0da63dd99?w=600',
      ),
      Fact(
        id: '9',
        title: 'Stars Are Born in Nebulae',
        category: 'Stars',
        shortDescription: 'Stellar nurseries create new stars constantly.',
        fullDescription: 'Stars are born in giant clouds of gas and dust called nebulae. When parts of these clouds collapse under gravity, they heat up and eventually ignite nuclear fusion, creating a new star. The Orion Nebula, visible to the naked eye, is one of the most active star-forming regions near Earth.',
        imageUrl: 'https://images.unsplash.com/photo-1419242902214-272b3f66ee7a?w=800',
      ),
      Fact(
        id: '10',
        title: 'The Brightest Star: R136a1',
        category: 'Stars',
        shortDescription: 'This star is 8.7 million times brighter than our Sun.',
        fullDescription: 'R136a1, located in the Large Magellanic Cloud, is the most luminous star ever discovered. It shines with the power of 8.7 million Suns and has a mass of about 315 times that of our Sun. This massive star is so bright that if it replaced our Sun, it would appear as bright as the Sun does from just 30 meters away!',
        imageUrl: 'https://images.unsplash.com/photo-1709403338196-22697db8e216?w=800',
      ),

      // GALAXIES CATEGORY
      Fact(
        id: '11',
        title: 'The Milky Way is Cannibalistic',
        category: 'Galaxies',
        shortDescription: 'Our galaxy is consuming smaller galaxies.',
        fullDescription: 'The Milky Way is currently in the process of consuming several smaller dwarf galaxies. The Sagittarius Dwarf Elliptical Galaxy is being torn apart and absorbed by our galaxy\'s gravity. This galactic cannibalism is a common process in the universe and is how large galaxies like ours grow over time.',
        imageUrl: 'https://images.unsplash.com/photo-1515705576963-95cad62945b6?w=800',
      ),
      Fact(
        id: '12',
        title: 'Andromeda is Approaching Us',
        category: 'Galaxies',
        shortDescription: 'Our neighbor galaxy will collide with us in 4.5 billion years.',
        fullDescription: 'The Andromeda Galaxy is speeding toward the Milky Way at about 110 kilometers per second. In approximately 4.5 billion years, the two galaxies will collide and merge to form a giant elliptical galaxy. Don\'t worry - the space between stars is so vast that direct collisions between stars are unlikely.',
        imageUrl: 'https://images.unsplash.com/photo-1543722530-d2c3201371e7?w=800',
      ),
      Fact(
        id: '13',
        title: 'There Are 2 Trillion Galaxies',
        category: 'Galaxies',
        shortDescription: 'The observable universe contains countless galaxies.',
        fullDescription: 'Recent estimates suggest there are about 2 trillion galaxies in the observable universe. Each galaxy contains hundreds of billions of stars. The sheer scale of the universe is mind-boggling - if each star was a grain of sand, all the beaches on Earth wouldn\'t have enough sand to represent all the stars.',
        imageUrl: 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?w=800',
      ),
      Fact(
        id: '14',
        title: 'The Oldest Galaxy',
        category: 'Galaxies',
        shortDescription: 'GN-z11 formed just 400 million years after the Big Bang.',
        fullDescription: 'GN-z11 is one of the oldest and most distant galaxies ever observed, existing when the universe was only 400 million years old - just 3% of its current age. Light from this galaxy has taken 13.4 billion years to reach us, giving us a glimpse into the early universe.',
        imageUrl: 'https://images.unsplash.com/photo-1518066000714-58c45f1a2c0a?w=800',
      ),
      Fact(
        id: '15',
        title: 'Spiral Galaxies Rotate',
        category: 'Galaxies',
        shortDescription: 'Our galaxy completes one rotation every 225 million years.',
        fullDescription: 'Spiral galaxies like the Milky Way rotate, but not like a solid disk. Different parts rotate at different speeds. Our solar system orbits the galactic center at about 828,000 km/h, taking approximately 225 million years to complete one orbit - called a "cosmic year". Dinosaurs roamed Earth less than one cosmic year ago!',
        imageUrl: 'https://images.unsplash.com/photo-1709408635136-f394223e2963?w=800',
      ),

      // BLACK HOLES CATEGORY
      Fact(
        id: '16',
        title: 'Black Holes Bend Time',
        category: 'Black Holes',
        shortDescription: 'Time slows down near a black hole\'s event horizon.',
        fullDescription: 'Due to Einstein\'s theory of general relativity, time moves slower in strong gravitational fields. Near a black hole\'s event horizon, time dilation becomes extreme. If you watched someone fall into a black hole from a safe distance, they would appear to slow down and freeze at the event horizon, never quite crossing it from your perspective.',
        imageUrl: 'https://plus.unsplash.com/premium_photo-1690571200236-0f9098fc6ca9?w=800',
      ),
      Fact(
        id: '17',
        title: 'The First Black Hole Image',
        category: 'Black Holes',
        shortDescription: 'In 2019, we photographed a black hole for the first time.',
        fullDescription: 'In April 2019, the Event Horizon Telescope collaboration released the first-ever image of a black hole. This supermassive black hole is located in the galaxy M87, about 55 million light-years away. The orange ring shows hot gas swirling around the black hole at nearly the speed of light.',
        imageUrl: 'https://images.unsplash.com/photo-1496989981497-27d69cdad83e?w=800',
      ),
      Fact(
        id: '18',
        title: 'Sagittarius A*',
        category: 'Black Holes',
        shortDescription: 'Our galaxy has a supermassive black hole at its center.',
        fullDescription: 'At the center of the Milky Way lies Sagittarius A*, a supermassive black hole with a mass of about 4 million Suns. Despite its enormous mass, its event horizon would fit inside Mercury\'s orbit. Stars near the galactic center orbit this black hole at incredible speeds, some completing an orbit in just 16 years.',
        imageUrl: 'https://plus.unsplash.com/premium_photo-1669839137069-4166d6ea11f4?w=800',
      ),
      Fact(
        id: '19',
        title: 'Black Holes Can Evaporate',
        category: 'Black Holes',
        shortDescription: 'Hawking radiation causes black holes to slowly lose mass.',
        fullDescription: 'Stephen Hawking discovered that black holes emit radiation due to quantum effects near the event horizon, called Hawking radiation. This causes them to slowly lose mass over extremely long periods. A black hole with the mass of the Sun would take 10^67 years to evaporate - far longer than the current age of the universe!',
        imageUrl: 'https://images.unsplash.com/photo-1706211306828-3315e9eae057?w=800',
      ),
      Fact(
        id: '20',
        title: 'Spaghettification',
        category: 'Black Holes',
        shortDescription: 'Tidal forces would stretch you like spaghetti.',
        fullDescription: 'If you fell into a black hole feet-first, the gravitational force on your feet would be much stronger than on your head. This difference would stretch you vertically while compressing you horizontally - a process scientists call "spaghettification". This would happen long before you reached the event horizon for stellar black holes.',
        imageUrl: 'https://images.unsplash.com/photo-1543722530-d2c3201371e7?w=800',
      ),

      // NEBULAE CATEGORY
      Fact(
        id: '21',
        title: 'The Pillars of Creation',
        category: 'Nebulae',
        shortDescription: 'Iconic star-forming columns in the Eagle Nebula.',
        fullDescription: 'The Pillars of Creation are massive columns of interstellar gas and dust in the Eagle Nebula, about 7,000 light-years away. These pillars are actually regions where new stars are being born. Each pillar is about 4 light-years long - roughly the distance from our Sun to the nearest star!',
        imageUrl: 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?w=800',
      ),
      Fact(
        id: '22',
        title: 'Planetary Nebulae Aren\'t Planets',
        category: 'Nebulae',
        shortDescription: 'They\'re shells of gas from dying stars.',
        fullDescription: 'Despite their name, planetary nebulae have nothing to do with planets. Early astronomers thought they looked like planets through their telescopes. They\'re actually shells of gas expelled by dying Sun-like stars. Our Sun will create its own planetary nebula in about 5 billion years when it becomes a red giant.',
        imageUrl: 'https://images.unsplash.com/photo-1419242902214-272b3f66ee7a?w=800',
      ),
      Fact(
        id: '23',
        title: 'The Crab Nebula',
        category: 'Nebulae',
        shortDescription: 'A supernova remnant from the year 1054.',
        fullDescription: 'The Crab Nebula is the remnant of a supernova that was observed by Chinese and Arab astronomers in 1054 CE. It was so bright it was visible during the day for 23 days. At its center is a rapidly rotating neutron star (pulsar) that spins 30 times per second, energizing the surrounding nebula.',
        imageUrl: 'https://images.unsplash.com/photo-1516339901601-2e1b62dc0c45?w=800',
      ),
      Fact(
        id: '24',
        title: 'Nebulae Are Huge',
        category: 'Nebulae',
        shortDescription: 'Some nebulae span hundreds of light-years.',
        fullDescription: 'Nebulae can be absolutely enormous. The Orion Nebula, one of the closest to Earth at 1,344 light-years away, is about 24 light-years across. The Tarantula Nebula in the Large Magellanic Cloud is even larger, spanning nearly 1,000 light-years. Despite their size, nebulae are incredibly diffuse - less dense than the best vacuum we can create on Earth.',
        imageUrl: 'https://images.unsplash.com/photo-1444703686981-a3abbc4d4fe3?w=800',
      ),
      Fact(
        id: '25',
        title: 'Colorful Nebulae',
        category: 'Nebulae',
        shortDescription: 'Different gases glow with different colors.',
        fullDescription: 'The beautiful colors in nebula images aren\'t random. Hydrogen emits red light, oxygen glows green and blue, and sulfur appears orange-red when ionized by nearby hot stars. The iconic images from space telescopes often use false colors to highlight different elements, but the basic colors correspond to real chemical compositions.',
        imageUrl: 'https://images.unsplash.com/photo-1464802686167-b939a6910659?w=800',
      ),

      // BONUS GENERAL FACTS
      Fact(
        id: '26',
        title: 'The Universe is Expanding Faster',
        category: 'Galaxies',
        shortDescription: 'Dark energy is accelerating cosmic expansion.',
        fullDescription: 'Not only is the universe expanding, but this expansion is accelerating. Scientists discovered this surprising fact in 1998, leading to the Nobel Prize in Physics in 2011. The cause is attributed to "dark energy," a mysterious force that makes up about 68% of the universe but remains poorly understood.',
        imageUrl: 'https://images.unsplash.com/photo-1444703686981-a3abbc4d4fe3?w=600',
      ),
      Fact(
        id: '27',
        title: 'Light Takes Time to Travel',
        category: 'Stars',
        shortDescription: 'Looking at stars is looking back in time.',
        fullDescription: 'When you look at the stars, you\'re literally looking back in time. The light from the nearest star (Proxima Centauri) takes 4.2 years to reach us. Some stars we see might have already died, but their light is still traveling through space. The most distant objects we can observe are over 13 billion light-years away!',
        imageUrl: 'https://images.unsplash.com/photo-1542785291-fe3faea39066?w=800',
      ),
      Fact(
        id: '28',
        title: 'Exoplanets Are Everywhere',
        category: 'Planets',
        shortDescription: 'We\'ve discovered over 5,000 planets beyond our solar system.',
        fullDescription: 'Since the first confirmed exoplanet discovery in 1992, we\'ve found over 5,000 planets orbiting other stars. These range from gas giants larger than Jupiter to small rocky worlds. Some orbit in the "habitable zone" where liquid water could exist. Statistical estimates suggest there could be billions of Earth-like planets in our galaxy alone.',
        imageUrl: 'https://images.unsplash.com/photo-1769406525543-f257a82928cc?w=800',
      ),
    ];
  }

  static List<Fact> getFactsByCategory(String category) {
    return getAllFacts().where((fact) => fact.category == category).toList();
  }

  static List<String> getCategories() {
    return ['Planets', 'Stars', 'Galaxies', 'Black Holes', 'Nebulae'];
  }

  static Fact getRandomFact() {
    final facts = getAllFacts();
    facts.shuffle();
    return facts.first;
  }

  static Fact getFactOfTheDay() {
    final facts = getAllFacts();
    final dayOfYear = DateTime.now().difference(DateTime(DateTime.now().year, 1, 1)).inDays;
    return facts[dayOfYear % facts.length];
  }
}