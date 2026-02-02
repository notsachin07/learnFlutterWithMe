// Class 07 - Solutions
// Run this using: flutter run (in a Flutter project)
//
// These are the reference solutions for exercises.md
// Compare your solutions after attempting the exercises yourself!

import 'package:flutter/material.dart';

void main() {
  runApp(const ExerciseSolutionsApp());
}

class ExerciseSolutionsApp extends StatelessWidget {
  const ExerciseSolutionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class 07 Exercise Solutions',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const SolutionsHome(),
    );
  }
}

class SolutionsHome extends StatelessWidget {
  const SolutionsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class 07 Solutions'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSolutionCard(
            context,
            'Exercise 1',
            'Product Card',
            'E-commerce product card with image, price, rating',
            const Exercise1Solution(),
          ),
          _buildSolutionCard(
            context,
            'Exercise 2',
            'Chat Message Bubbles',
            'WhatsApp-style chat bubbles with timestamps',
            const Exercise2Solution(),
          ),
          _buildSolutionCard(
            context,
            'Exercise 3',
            'Dashboard Grid',
            'Analytics dashboard with stat cards',
            const Exercise3Solution(),
          ),
          _buildSolutionCard(
            context,
            'Exercise 4',
            'Music Player UI',
            'Now Playing screen with layered layout',
            const Exercise4Solution(),
          ),
        ],
      ),
    );
  }

  Widget _buildSolutionCard(
    BuildContext context,
    String number,
    String title,
    String description,
    Widget destination,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            number.split(' ')[1],
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(title),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => destination),
          );
        },
      ),
    );
  }
}

// ============================================================
// EXERCISE 1 SOLUTION: Product Card
// ============================================================

class Exercise1Solution extends StatelessWidget {
  const Exercise1Solution({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 1: Product Card')),
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ProductCard(
            name: 'Wireless Headphones',
            price: 79.99,
            originalPrice: 99.99,
            rating: 4.2,
            imageColor: Colors.indigo[200]!,
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final double originalPrice;
  final double rating;
  final Color imageColor;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image Placeholder
          Container(
            height: 150,
            width: double.infinity,
            color: imageColor,
            child: const Icon(
              Icons.headphones,
              size: 80,
              color: Colors.white,
            ),
          ),

          // Product Details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Name
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // Prices
                Row(
                  children: [
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '\$${originalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${((1 - price / originalPrice) * 100).round()}% OFF',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[700],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Rating
                Row(
                  children: [
                    ...List.generate(5, (index) {
                      return Icon(
                        index < rating.floor()
                            ? Icons.star
                            : (index < rating ? Icons.star_half : Icons.star_border),
                        color: Colors.amber,
                        size: 20,
                      );
                    }),
                    const SizedBox(width: 4),
                    Text(
                      '($rating)',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Add to Cart Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text('Add to Cart'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// EXERCISE 2 SOLUTION: Chat Message Bubbles
// ============================================================

class Exercise2Solution extends StatelessWidget {
  const Exercise2Solution({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              radius: 18,
              child: Text('JD'),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('John Doe', style: TextStyle(fontSize: 16)),
                Text(
                  'Online',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: const [
                  ChatBubble(
                    message: 'Hey! How are you?',
                    time: '10:30',
                    isSent: false,
                  ),
                  ChatBubble(
                    message: "I'm good, thanks! How about you?",
                    time: '10:31',
                    isSent: true,
                    isRead: true,
                  ),
                  ChatBubble(
                    message: 'Doing great! Working on that Flutter project we discussed.',
                    time: '10:32',
                    isSent: false,
                  ),
                  ChatBubble(
                    message: 'Oh nice! How is it going?',
                    time: '10:33',
                    isSent: true,
                    isRead: true,
                  ),
                  ChatBubble(
                    message: "Pretty well! I'm learning about layouts and widgets. It's really powerful once you understand how Row, Column, and Stack work together.",
                    time: '10:34',
                    isSent: false,
                  ),
                  ChatBubble(
                    message: "That's awesome! Let me know if you need any help 😊",
                    time: '10:35',
                    isSent: true,
                    isRead: false,
                  ),
                ],
              ),
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.emoji_emotions_outlined),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isSent;
  final bool isRead;

  const ChatBubble({
    super.key,
    required this.message,
    required this.time,
    required this.isSent,
    this.isRead = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Align(
        alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isSent ? Colors.blue[500] : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: isSent ? const Radius.circular(16) : Radius.zero,
                bottomRight: isSent ? Radius.zero : const Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  message,
                  style: TextStyle(
                    color: isSent ? Colors.white : Colors.black87,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      time,
                      style: TextStyle(
                        color: isSent ? Colors.white70 : Colors.grey[500],
                        fontSize: 11,
                      ),
                    ),
                    if (isSent) ...[
                      const SizedBox(width: 4),
                      Icon(
                        isRead ? Icons.done_all : Icons.done,
                        size: 14,
                        color: isRead ? Colors.lightBlueAccent : Colors.white70,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// EXERCISE 3 SOLUTION: Dashboard Grid
// ============================================================

class Exercise3Solution extends StatelessWidget {
  const Exercise3Solution({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardScreen();
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(),
              const SizedBox(height: 24),

              // Stats Grid
              _buildStatsGrid(),
              const SizedBox(height: 24),

              // Recent Activity Section
              _buildRecentActivity(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final now = DateTime.now();
    final greeting = _getGreeting(now.hour);
    final dateStr = _formatDate(now);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$greeting, John!',
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          dateStr,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  String _getGreeting(int hour) {
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  String _formatDate(DateTime date) {
    const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    const months = ['January', 'February', 'March', 'April', 'May', 'June',
                    'July', 'August', 'September', 'October', 'November', 'December'];
    return '${days[date.weekday % 7]}, ${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.1,
      children: const [
        StatCard(
          icon: Icons.attach_money,
          iconColor: Colors.green,
          title: 'Revenue',
          value: '\$12,450',
          changePercent: 12.0,
          isPositive: true,
        ),
        StatCard(
          icon: Icons.people,
          iconColor: Colors.blue,
          title: 'Users',
          value: '1,234',
          changePercent: 8.0,
          isPositive: true,
        ),
        StatCard(
          icon: Icons.inventory_2,
          iconColor: Colors.orange,
          title: 'Orders',
          value: '456',
          changePercent: 3.0,
          isPositive: false,
        ),
        StatCard(
          icon: Icons.trending_up,
          iconColor: Colors.purple,
          title: 'Conversion',
          value: '3.2%',
          changePercent: 0.5,
          isPositive: true,
        ),
      ],
    );
  }

  Widget _buildRecentActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Activity',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              _buildActivityItem(
                Icons.shopping_cart,
                Colors.blue,
                'New order #1234',
                '2 minutes ago',
              ),
              const Divider(height: 1),
              _buildActivityItem(
                Icons.person_add,
                Colors.green,
                'New user registered',
                '15 minutes ago',
              ),
              const Divider(height: 1),
              _buildActivityItem(
                Icons.star,
                Colors.amber,
                'New 5-star review',
                '1 hour ago',
              ),
              const Divider(height: 1),
              _buildActivityItem(
                Icons.payment,
                Colors.purple,
                'Payment received',
                '3 hours ago',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem(
    IconData icon,
    Color iconColor,
    String title,
    String time,
  ) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: iconColor.withOpacity(0.1),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(title),
      subtitle: Text(time),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;
  final double changePercent;
  final bool isPositive;

  const StatCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    required this.changePercent,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const Spacer(),

            // Title
            Text(
              title,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),

            // Value
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Change indicator
            Row(
              children: [
                Icon(
                  isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                  color: isPositive ? Colors.green : Colors.red,
                  size: 14,
                ),
                const SizedBox(width: 4),
                Text(
                  '${changePercent.toStringAsFixed(1)}%',
                  style: TextStyle(
                    color: isPositive ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                Text(
                  ' vs last month',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// EXERCISE 4 SOLUTION: Music Player UI
// ============================================================

class Exercise4Solution extends StatelessWidget {
  const Exercise4Solution({super.key});

  @override
  Widget build(BuildContext context) {
    return const NowPlayingScreen();
  }
}

class NowPlayingScreen extends StatefulWidget {
  const NowPlayingScreen({super.key});

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  bool isPlaying = false;
  bool isShuffled = false;
  bool isRepeating = false;
  bool isLiked = false;
  double progress = 0.3;
  double volume = 0.7;

  final String songTitle = 'Bohemian Rhapsody';
  final String artistName = 'Queen';
  final Duration totalDuration = const Duration(minutes: 5, seconds: 55);

  Duration get currentPosition =>
      Duration(seconds: (totalDuration.inSeconds * progress).round());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.indigo[900]!,
                  Colors.indigo[800]!,
                  Colors.black,
                ],
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                // App Bar
                _buildAppBar(context),
                const SizedBox(height: 20),

                // Album Art
                _buildAlbumArt(),
                const SizedBox(height: 32),

                // Song Info
                _buildSongInfo(),
                const SizedBox(height: 24),

                // Progress Bar
                _buildProgressBar(),
                const SizedBox(height: 16),

                // Main Controls
                _buildMainControls(),
                const SizedBox(height: 24),

                // Volume Slider
                _buildVolumeSlider(),
                const Spacer(),

                // Bottom Actions
                _buildBottomActions(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 32),
          ),
          const Column(
            children: [
              Text(
                'PLAYING FROM ALBUM',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                'Greatest Hits',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildAlbumArt() {
    return Container(
      width: 280,
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple[400]!,
                Colors.indigo[600]!,
                Colors.blue[800]!,
              ],
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.music_note,
              size: 100,
              color: Colors.white54,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSongInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  songTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  artistName,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isLiked = !isLiked;
              });
            },
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Colors.red : Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 4,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
              activeTrackColor: Colors.white,
              inactiveTrackColor: Colors.white24,
              thumbColor: Colors.white,
              overlayColor: Colors.white24,
            ),
            child: Slider(
              value: progress,
              onChanged: (value) {
                setState(() {
                  progress = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(currentPosition),
                  style: TextStyle(color: Colors.grey[400], fontSize: 12),
                ),
                Text(
                  _formatDuration(totalDuration),
                  style: TextStyle(color: Colors.grey[400], fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds % 60)}';
  }

  Widget _buildMainControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              isShuffled = !isShuffled;
            });
          },
          icon: Icon(
            Icons.shuffle,
            color: isShuffled ? Colors.green : Colors.white70,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.skip_previous,
            color: Colors.white,
            size: 40,
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              isPlaying = !isPlaying;
            });
          },
          child: Container(
            width: 72,
            height: 72,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.black,
              size: 40,
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.skip_next,
            color: Colors.white,
            size: 40,
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {
            setState(() {
              isRepeating = !isRepeating;
            });
          },
          icon: Icon(
            Icons.repeat,
            color: isRepeating ? Colors.green : Colors.white70,
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildVolumeSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Icon(
            volume == 0 ? Icons.volume_off : Icons.volume_down,
            color: Colors.white54,
            size: 20,
          ),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 3,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
                activeTrackColor: Colors.white54,
                inactiveTrackColor: Colors.white24,
                thumbColor: Colors.white,
              ),
              child: Slider(
                value: volume,
                onChanged: (value) {
                  setState(() {
                    volume = value;
                  });
                },
              ),
            ),
          ),
          const Icon(
            Icons.volume_up,
            color: Colors.white54,
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.devices, color: Colors.white70),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share, color: Colors.white70),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.queue_music, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// BONUS: Additional Widget Examples
// ============================================================

// Demonstrates Wrap widget for tags
class TagsExample extends StatelessWidget {
  const TagsExample({super.key});

  @override
  Widget build(BuildContext context) {
    final tags = ['Flutter', 'Dart', 'Mobile', 'UI', 'Widgets', 'Layouts'];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: tags.map((tag) {
        return Chip(
          label: Text(tag),
          backgroundColor: Colors.blue[100],
        );
      }).toList(),
    );
  }
}

// Demonstrates AspectRatio widget
class AspectRatioExample extends StatelessWidget {
  const AspectRatioExample({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: Colors.blue,
        child: const Center(
          child: Text(
            '16:9 Aspect Ratio',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
