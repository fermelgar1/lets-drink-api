
const express = require("express")
const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()
const app = express();
app.use(express.urlencoded({ extended: true }))

const port = 5000;

app.get('/', function (req, res) {
	res.send('hello world');
})


//agregar incredientes en forma de arreglo, falta validar incredientes
app.post('/post/bebidas', async (req, res) => {
	try {
		let paso = true

		const { name, description, incredientes, preparacion, dificultad } = req.query
		const validar = [name, description, incredientes, preparacion, dificultad]

		const ret = () => {
			paso = false
		}

		validar.map(item => item === null && ret())

		if (ret) {
			const post = await prisma.bebidas.create({
				data: {
					name,
					description,
					incredientes,
					dificultad,
					preparacion
				}
			})

			res.json(post)
		} else {
			res.status(500).json({ message: 'error completar todos los campos' });
		}

	} catch (error) {
		res.status(500).json({ message: error });
		console.log(`error`, error)
	}
})


//obtener bebidas con limite o sin limite
app.get('/get/bebidas', async (req, res) => {
	try {
		const bebidas = req.query.limit ?
			(
				await prisma.bebidas.findMany({
					take: parseInt(req.query.limit)
				})
			)
			:
			(
				await prisma.bebidas.findMany({})
			)
		res.json(bebidas)
	} catch (error) {
		res.status(500).json({ message: error });
		console.log(`error`, error)
	}
})

//buscar bebidas por nombre
app.get('/get/bebidas/nombre/', async (req, res) => {
	try {
		const bebidas = await prisma.bebidas.findMany({
			where: {
				name: {
					contains: req.query.name,
				}
			}
		})
		res.json(bebidas)
	} catch (error) {
		res.status(500).json({ message: error });
		console.log(`error`, error)
	}
})

//bebidas por incrediente
app.get('/get/bebidas/incredientes/', async (req, res) => {
	try {
		const bebidas = await prisma.bebidas.findMany({
			where: {
				incredientes: {
					contains: req.query.incredientes,
				}
			}
		})
		res.json(bebidas)
	} catch (error) {

	}
})

//bebidas por dificultad
app.get('/get/bebidas/dificultad/', async (req, res) => {
	try {
		const bebidas = await prisma.dificultad.findMany({
			where: {
				dificultad: {
					contains: req.query.dificultad,
				}
			}
		})
		res.json(bebidas)
	} catch (error) {

	}
})

//iniciar servidor
app.listen(port, () => {
	console.log(`server is running at http://localhos:5000`)
})