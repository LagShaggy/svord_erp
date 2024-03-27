<script lang="ts">
	import Form from '$lib/UI/Primitive/Form/Form.svelte'
	import SubmitButton from '$src/lib/UI/Primitive/Form/SubmitButton.svelte'
	import { ACTIONS } from '$lib/routes'
</script>

<Form action={ACTIONS.AUTH.LOGOUT}>
	<SubmitButton>Logout</SubmitButton>
</Form>
