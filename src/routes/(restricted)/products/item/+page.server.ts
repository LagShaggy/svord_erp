import type { Actions } from '@sveltejs/kit'

export const actions: Actions = {
	uploadDoc: ({ request }) => {
		const formData = request.formData()
		console.log(formData)
	},
	uploadImage: ({ request }) => {
		const formData = request.formData()
		console.log(formData)
	}
}
