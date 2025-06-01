import { Entity, PrimaryGeneratedColumn, Column, OneToOne, JoinColumn } from "typeorm";
import { User } from "src/Users/entities/user.entity";

@Entity('professionals')
export class Professional{
    @PrimaryGeneratedColumn()
    id_professionals: number;

    /*@Column()
    user_id: number;*/

    @OneToOne(() => User, { eager: true }) 
    @JoinColumn({ name: 'user_id' })
    user: User;

    @Column()
    nif_professionals: string;

    @Column()
    license_number_professionals: string;

    @Column()
    name_professionals: string;

    @Column()
    last_name_professionals: string;

    @Column()
    phone_professionals: string;

    @Column()
    email_professionals: string;

    @Column()
    assigned_room_professionals: string;

    @Column({type: 'boolean', default: true})
    is_active_professionals: boolean;
}