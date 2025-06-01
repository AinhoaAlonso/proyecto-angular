import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity('slots')
export class Slot{
    @PrimaryGeneratedColumn()
    id_slots: number;

    @Column({type: 'time'})
    start_time_slots: string;

    @Column({type: 'time'})
    end_time_slots: string;

    @Column()
    period: string;
}