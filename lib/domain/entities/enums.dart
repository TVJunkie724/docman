enum IncidentType {
  medical,
  invoice, // Simple (Supermarket)
  order, // Complex (Amazon)
  insurance,
  education, // School slips, Absences
  trip, // Holidays
  general,
  personal, // e.g. Residence, IDs
  // Add more as needed
}

enum DocumentType {
  invoice,
  receipt,
  contract,
  report,
  prescription,
  other,
}

enum IncidentStatus {
  draft,
  open, // Generic open state
  
  // Order Workflow States
  ordered,
  shipped,
  delivered,
  warrantyActive,
  reclamation,
  
  // Insurance Workflow States
  quote,
  cancelled,
  
  // Education Workflow States
  readyForReturn, // Signed and in backpack
  
  // Trip Workflow States
  booked,
  duringTrip,
  
  // Medical Workflow States
  scheduled,
  attended,
  paymentDue,
  paid,
  submittedPublic,
  reviewRequired, // e.g. "Check if private insurance covers this"
  submittedPrivate,
  
  actionRequired, // Generic "Something is wrong" state
  closed,
  archived,
}
