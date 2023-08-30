class CoachingData {
  final String name;
  final String address;
  final String rating;
  final List<String> subjects;
  final String image;
  final int mutualFriendsStudyHere;
  final String offer;
  CoachingData({
    required this.name,
    required this.address,
    required this.rating,
    required this.subjects,
    required this.image,
    required this.mutualFriendsStudyHere,
    required this.offer,
  });
}

final List<CoachingData> coachingData = [
  CoachingData(
    name: 'Aakash Institute',
    address:
        'Aakash Tower, Plot No-4, Sector 11, Dwarka, New Delhi, Delhi 110075',
    rating: '4.5',
    subjects: ['Physics', 'Chemistry', 'Maths'],
    image:
        'https://img.freepik.com/premium-photo/coaching-training-planning_36325-69.jpg?w=2000',
    mutualFriendsStudyHere: 10,
    offer: 'Get 10% off on all courses',
  ),
  CoachingData(
    name: 'Vidyamandir Classes',
    address:
        'A-14(A), 1st Floor, Swasthya Vihar, Vikas Marg, New Delhi, Delhi 110092',
    rating: '4.5',
    subjects: ['Physics', 'Chemistry', 'Maths'],
    image:
        'https://f.hubspotusercontent00.net/hubfs/41809/Coaching%20and%20Mentoring.png',
    mutualFriendsStudyHere: 10,
    offer: 'Get 10% ',
  ),
  CoachingData(
    name: 'Resonance',
    address:
        'A-14(A), 1st Floor, Swasthya Vihar, Vikas Marg, New Delhi, Delhi 110092',
    rating: '4.5',
    subjects: ['Physics', 'Chemistry', 'Maths'],
    image:
        'https://images.indianexpress.com/2016/06/private-coaching-kota1200.jpg',
    mutualFriendsStudyHere: 10,
    offer: 'Get 50% ',
  ),
  CoachingData(
    name: 'Allen',
    address:
        'A-14(A), 1st Floor, Swasthya Vihar, Vikas Marg, New Delhi, Delhi 110092',
    rating: '4.5',
    subjects: ['Physics', 'Chemistry', 'Maths'],
    image:
        'https://f.hubspotusercontent00.net/hubfs/41809/Coaching%20and%20Mentoring.png',
    mutualFriendsStudyHere: 10,
    offer: 'Get 10% ',
  ),
  CoachingData(
    name: 'FIITJEE',
    address:
        'A-14(A), 1st Floor, Swasthya Vihar, Vikas Marg, New Delhi, Delhi 110092',
    rating: '4.5',
    subjects: ['Physics', 'Chemistry', 'Maths'],
    image:
        'https://images.indianexpress.com/2016/06/private-coaching-kota1200.jpg',
    mutualFriendsStudyHere: 0,
    offer: 'Get 20% ',
  ),
];
