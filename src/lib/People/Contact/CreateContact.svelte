<script lang="ts">
	import Form from '$src/lib/UI/Primitive/Form/Form.svelte'
	import InputEmail from '$src/lib/UI/Primitive/Form/InputEmail.svelte'
	import InputText from '$src/lib/UI/Primitive/Form/InputText.svelte'
	import TextArea from '$src/lib/UI/Primitive/Form/TextArea.svelte'
	import { ACTIONS } from '$src/lib/routes'
	import type { Contact, CurrencyE } from '$src/lib/supabase/schema'

	export let contact: Contact | null

	let currencies: CurrencyE
</script>

<Form action={ACTIONS.CONTACT.CREATE}>
	<h2>Add a Contact</h2>

	<InputText name="accountName" value={contact?.lastname}>Last Name</InputText>

	<InputText name="accountName" value={contact?.firstName ?? ''}>First Name</InputText>

	<InputEmail name="email" value={contact?.email}>Email</InputEmail>
	Personality
	<TextArea name={'accountDescription'} value={contact?.personality ?? ''} />
</Form>
