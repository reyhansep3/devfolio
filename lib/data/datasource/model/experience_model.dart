class ExperienceModel {
  final int id;
  final String jobTitle;
  final String jobName;
  final String date;
  final String status;
  final List<String> jobExperience;
  final List<String> tools;

  const ExperienceModel({
    required this.id,
    required this.jobTitle,
    required this.jobName,
    required this.date,
    required this.status,
    required this.jobExperience,
    required this.tools,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      id: json['id'],
      jobTitle: json['job_title'],
      jobName: json['job_name'],
      date: json['date'],
      status: json['status'],
      jobExperience: List<String>.from(json['job_experience']),
      tools: List<String>.from(json['tools']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'job_title': jobTitle,
      'job_name': jobName,
      'date': date,
      'status': status,
      'job_experience': jobExperience,
      'tools': tools,
    };
  }

  ExperienceModel copyWith({
    int? id,
    String? jobTitle,
    String? jobName,
    String? date,
    String? status,
    List<String>? jobExperience,
    List<String>? tools,
  }) {
    return ExperienceModel(
      id: id ?? this.id,
      jobTitle: jobTitle ?? this.jobTitle,
      jobName: jobName ?? this.jobName,
      date: date ?? this.date,
      status: status ?? this.status,
      jobExperience: jobExperience ?? this.jobExperience,
      tools: tools ?? this.tools,
    );
  }
}