export enum AvailabilityStatus {
  Libre        = 'libre',
  Reservado    = 'reservado',
  NoDisponible = 'no disponible',
}

export class ProfessionalAvailability{
  nameProfessional:string;
  dateAvailability:Date;
  startTimeAvailability:string;
  endTimeAvailability:string;
  statusAvailability:AvailabilityStatus;
}
