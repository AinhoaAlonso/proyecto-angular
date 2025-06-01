import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity('patients')

export class Patient{

    @PrimaryGeneratedColumn()
    id_patients: number;

    @Column()
    nif_patients:string;

    @Column()
    name_patients:string;

    @Column()
    last_name_patients: string;

    @Column()
    phone_patients: string;

    @Column({unique:true}) //En el service hay que hacer una igualdad a ER_DUP_ENTRY, es el código de error de MySQL cuando se viola una clave única.
    email_patients: string;

    @Column()
    is_active_patients: number;
}