import 'package:flutter/material.dart';

class NetworkTile extends StatefulWidget {
  final String name;
  final String imagePath;
  final String description;
  final bool initialJoined; // Initial state for the joined button
  final Function(bool joined)? onToggle; // Callback for state change

  const NetworkTile({
    super.key,
    required this.name,
    required this.imagePath,
    required this.description,
    this.initialJoined = false,
    this.onToggle,
  });

  @override
  State<NetworkTile> createState() => _NetworkTileState();
}

class _NetworkTileState extends State<NetworkTile> {
  late bool _isJoined;

  @override
  void initState() {
    super.initState();
    _isJoined = widget.initialJoined;
  }

  void _toggleJoinStatus() {
    setState(() {
      _isJoined = !_isJoined;
    });
    if (widget.onToggle != null) {
      widget.onToggle!(_isJoined);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 335,
        height: 87,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(widget.imagePath),
            radius: 25,
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              GestureDetector(
                onTap: _toggleJoinStatus,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Container(
                    width: 55,
                    height: 30,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: _isJoined ? Colors.blue[100] : Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _isJoined ? "Joined" : "Join",
                      style: TextStyle(
                        color: _isJoined ? Colors.blue : Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          subtitle: Text(
            widget.description,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
