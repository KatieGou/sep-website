import axios from 'axios';

const api = axios.create({
    baseURL: 'http://localhost:3000',
});

export async function postLogin(data) {
    try {
        const response = await api.post('/login', data);
        return response;
    } catch (error) {
        return error.response;
    }
}