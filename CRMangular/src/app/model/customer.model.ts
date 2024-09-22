export class Customer{
    id!: number;
    name!: string;
    email!: string;
    phone!: string;
    address!: string;
    status!: 'Active' | 'Inactive' | 'Prospect' | 'Lead';
    createdAt!: Date;
    updatedAt!: Date;
}