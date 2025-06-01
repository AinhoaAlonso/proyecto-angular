import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity('treatments')

export class Treatment{

    @PrimaryGeneratedColumn()
    id_treatments:number;

    @Column()
    name_treatments: string;

    @Column()
    type_treatments: string;

    @Column()
    duration_minutes_treatments:number;

    @Column({type: 'decimal'})
    price_treatments: string;

    @Column()
    visible_to_patients_treatments:number;

    @Column()
    is_active_treatments: number;
}