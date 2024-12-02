<script lang="ts">
	import Button from '$src/lib/UI/Primitive/Button.svelte'
	import Form from '$src/lib/UI/Primitive/Form/Form.svelte'
	import InputEmail from '$src/lib/UI/Primitive/Form/InputEmail.svelte'
	import InputText from '$src/lib/UI/Primitive/Form/InputText.svelte'
	import TextArea from '$src/lib/UI/Primitive/Form/TextArea.svelte'
	import type { Contact } from '$src/lib/supabase/schema'

	export let contact: Contact | null
</script>

<Form action="?/createContact">
	<h2>Add a Contact</h2>

	<InputText name="firstName" value={contact?.lastName}>Last Name</InputText>

	<InputText name="lastName" value={contact?.firstName ?? ''}>First Name</InputText>

	<InputEmail name="email" value={contact?.email}>Email</InputEmail>

	Personality
	<TextArea name="personality" value={contact?.personality ?? ''} />
	<Button submit>Submit</Button>
</Form>
