def diagnoses_belongs_to_me           
    diagnoses_ids =
    rows_array = form.rows.to_a[0...self.position - 1].reverse
    rows_array.each do |r|
      next if r.id == self.id
      break if r.kind_of?(Journal::FormRow::ItemRow) or (r.kind_of?(Journal::FormRow::LabSampleRow) and r.billing_record_rows.any?)

      if r.kind_of?(Journal::FormRow::DiagnosisRow) && r.diagnosis_id
        diagnoses_ids << r.diagnosis_id
      end
    end
    Diagnosis.find(diagnoses_ids)
  end
