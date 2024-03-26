<script lang="ts">
	import Form from '$lib/UI/Primitive/Form/Form.svelte'
	import Submit from '$lib/UI/Primitive/Form/Submit.svelte'
	import { ACTIONS, API } from '$lib/routes'

	const action = ACTIONS.AUTH.LOGOUT
</script>

<form action="/auth/login?/logout" method="POST">
	<button type="submit"> Logout </button>
</form>

<!-- <Form action={'/auth/logout?/logout'}>
	<Submit>Logout</Submit>
</Form> -->
