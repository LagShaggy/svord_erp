import { PRIVATE_GPT_API_KEY } from '$env/static/private'
import OpenAI from 'openai'

const openai = new OpenAI({ apiKey: PRIVATE_GPT_API_KEY })

export const completion = await openai.chat.completions.create({
	model: 'gpt-3.5-turbo',
	messages: [
		{ role: 'system', content: 'You are a helpful assistant.' },
		{
			role: 'user',
			content: 'Write a haiku about recursion in programming.'
		}
	]
})
