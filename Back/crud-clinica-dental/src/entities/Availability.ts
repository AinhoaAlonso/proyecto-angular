import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn } from 'typeorm';
import { Professional } from './Professional';
import { Slot } from './Slot';

@Entity('availabilities')
export class Availability {
  @PrimaryGeneratedColumn()
  id_professional_availabilities: number;

  /*@Column()
  professional_id: number;*/

  @ManyToOne(() => Professional, { eager: true })
  @JoinColumn({ name: 'professional_id' })
  professional: Professional;

  @Column({ type: 'date' })
  date_availability: Date;

  /*@Column()
  slot_id: number;*/

  @ManyToOne(() => Slot, { eager: true })
  @JoinColumn({ name: 'slot_id' })
  Slot: Slot; //Relacion con el objeto completo

  @Column({
    type: 'enum',
    enum: ['libre', 'reservado', 'no_disponible'],
    default: 'libre'
  })
  status: 'libre' | 'reservado' | 'no_disponible';
}
