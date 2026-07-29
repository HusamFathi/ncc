abstract class DataMapper<Entity, Model> {
  Entity mapToEntity({required Model model});

  Model mapToModel({required Entity entity});
}
