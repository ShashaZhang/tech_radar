if !ENV['RELOAD'].present?
  category_descriptor = NodeDescriptor.select { |nd| nd.name == 'Category' }.first
  category_descriptor.create_model
  assessment_descriptor = NodeDescriptor.select { |nd| nd.name == 'Assessment' }.first
  assessment_descriptor.create_model
  technology_descriptor = NodeDescriptor.select { |nd| nd.name == 'Technology' }.first
  technology_descriptor.create_model

  id_field_descriptor = FieldDescriptor.select { |fd| fd.name == 'Id' && fd.field_type == 'Text' }.first
  title_field_descriptor = FieldDescriptor.select { |fd| fd.name == 'Title' && fd.field_type == 'Text' }.first
  content_field_descriptor = FieldDescriptor.select { |fd| fd.name == 'Content' && fd.field_type == 'Long Text' }.first

  category_descriptor.child_node_descriptors.push assessment_descriptor
  assessment_descriptor.child_node_descriptors.push technology_descriptor

  category_descriptor.field_descriptors.push id_field_descriptor
  category_descriptor.field_descriptors.push title_field_descriptor
  category_descriptor.field_descriptors.push content_field_descriptor

  assessment_descriptor.field_descriptors.push id_field_descriptor
  assessment_descriptor.field_descriptors.push title_field_descriptor
  assessment_descriptor.field_descriptors.push content_field_descriptor

  technology_descriptor.field_descriptors.push id_field_descriptor
  technology_descriptor.field_descriptors.push title_field_descriptor
  technology_descriptor.field_descriptors.push content_field_descriptor
end