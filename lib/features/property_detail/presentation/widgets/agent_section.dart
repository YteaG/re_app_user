import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rm_app/features/home/data/models/property.model.dart';
import '../../styles/detail_styles.dart';

class AgentSection extends StatelessWidget {
  final Agent agent;

  const AgentSection({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Agent Information', style: DetailStyles.sectionTitleStyle),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildAgentAvatar(),
              const SizedBox(width: 16),
              Expanded(
                child: _buildAgentInfo(),
              ),
              _buildContactButtons(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAgentAvatar() {
    return Hero(
       tag: 'agent_avatar_${agent.id}',
      child: CircleAvatar(
        radius: 30,
        backgroundImage: CachedNetworkImageProvider(agent.imageUrl),
        onBackgroundImageError: (exception, stackTrace) {
          // Handle error loading image
        },
      ),
    );
  }

  Widget _buildAgentInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          agent.name,
          style: DetailStyles.agentNameStyle,
        ),
        const SizedBox(height: 4),
        Text(
          agent.agency,
          style: DetailStyles.agencyStyle,
        ),
      ],
    );
  }

  Widget _buildContactButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.phone, color: Colors.blue),
          onPressed: () {
            // Implement phone call
          },
        ),
        IconButton(
          icon: const Icon(Icons.email, color: Colors.blue),
          onPressed: () {
            // Implement email
          },
        ),
      ],
    );
  }
}
