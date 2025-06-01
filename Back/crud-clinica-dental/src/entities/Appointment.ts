import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  JoinColumn,
  Unique,
} from 'typeorm';

import { Patient } from './Patient';
import { Professional } from './Professional';
import { Treatment } from './Treatment';
import { Slot } from './Slot';

export enum AppointmentStatus {
  PENDIENTE = 'pendiente',
  CONFIRMADA = 'confirmada',
  CANCELADA = 'cancelada',
  REALIZADA = 'realizada',
}

export enum CreatedBy {
  ADMIN = 'admin',
  DENTISTA = 'dentista',
}

//Esto crea una clave combinada unica donde se tienen que dar las tres para aplicar la restricción
@Unique(['professional_id', 'slot_id', 'date_appointments'])
@Entity('appointments')
export class Appointment {
  @PrimaryGeneratedColumn()
  id_appointments: number;

  /*@Column({ name: 'patient_id' })
  patientId: number;*/

  @ManyToOne(() => Patient, { eager: true })
  @JoinColumn({ name: 'patient_id' })
  patient: Patient;

  /*@Column({ name: 'professional_id' })
  professionalId: number;*/

  @ManyToOne(() => Professional, { eager: true })
  @JoinColumn({ name: 'professional_id' })
  professional: Professional;

  /*@Column()
  treatments_id: number;*/

  @ManyToOne(() => Treatment, { eager: true })
  @JoinColumn({ name: 'treatments_id' })
  treatment: Treatment;

  /*@Column({ name: 'slot_id' })
  slotId: number;*/

  @ManyToOne(() => Slot, { eager: true })
  @JoinColumn({ name: 'slot_id' })
  Slot: Slot;

  @Column({type: 'date' })
  date_appointments: Date;

  @Column({})
  duration_minutes_appointments: number;

  @Column({
    type: 'enum',
    enum: AppointmentStatus,
    default: AppointmentStatus.PENDIENTE,
  })
  status_appointments: AppointmentStatus;

  @Column({type: 'longtext', nullable: true })
  cancellation_reason_appointments: string;

  @Column({
    type: 'enum',
    enum: CreatedBy,
    nullable: false,
  })
  created_by_appointments: CreatedBy; 
}
