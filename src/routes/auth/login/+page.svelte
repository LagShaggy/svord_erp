<script lang="ts">
	import type { ActionData } from './$types'
	import LoginForm from '$lib/UI/Forms/LoginForm.svelte'
	import { ACTIONS } from '$lib/routes'

	export let form: ActionData
</script>

<LoginForm />
