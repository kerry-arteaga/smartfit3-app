class Client {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String trainerId; // Id of the assigned trainer

  Client({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.trainerId,
  });

  // Create a Client instance from Firestore data
  factory Client.fromFirestore(Map<String, dynamic> data) {
    return Client(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      phoneNumber: data['phoneNumber'],
      trainerId: data['trainerId'],
    );
  }

  // Convert Client instance to Firestore data
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'trainerId': trainerId,
    };
  }
}

class Trainer {
  final String id;
  final String name;
  final String email;
  final String specialty;

  Trainer({
    required this.id,
    required this.name,
    required this.email,
    required this.specialty,
  });

  // Create a Trainer instance from Firestore data
  factory Trainer.fromFirestore(Map<String, dynamic> data) {
    return Trainer(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      specialty: data['specialty'],
    );
  }

  // Convert Trainer instance to Firestore data
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'specialty': specialty,
    };
  }
}
