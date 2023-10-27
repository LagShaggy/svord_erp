<script lang="ts">
	import Login from '$lib/Auth/Login.svelte'
	import type { ActionData } from './$types'
	import Form from '$lib/UI/Form/Form.svelte'

	export let form: ActionData

	console.log(form)
</script>

<Login />

<Form />
