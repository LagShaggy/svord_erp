<script lang="ts">
	import type { ActionData } from './$types'
	import LoginForm from '$lib/UI/Forms/LoginForm.svelte'
	import { API } from '$lib/routes'

	export let form: ActionData

	console.log(form?.message)
	const action = API.AUTH.LOGIN
</script>

<LoginForm {action} />
