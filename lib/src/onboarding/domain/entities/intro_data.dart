import 'package:equatable/equatable.dart';


class  IntroData extends Equatable {
    final String? id;
   const IntroData ({
    required this.id,
  });
  @override
  List<Object?> get props =>    [id,];

   /// has ID method
 bool hasId() {
    if (id == null) return false;
    return id != null || id!.isNotEmpty;
  }


}