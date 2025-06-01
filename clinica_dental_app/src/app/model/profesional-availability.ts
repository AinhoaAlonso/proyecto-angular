export enum AvailabilityStatus {
  libre        = 'libre',
  reservado    = 'reservado',
  NoDisponible = 'no disponible',
}

export class Availability{
  professional:string;
  date:string;
  availability:string;
  time:string;
  status:AvailabilityStatus;
}
