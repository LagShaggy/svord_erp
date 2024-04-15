<script lang="ts">
	import Input from '../UI/Primitive/Form/Atoms/Input.svelte'
	import Form from '../UI/Primitive/Form/Form.svelte'
	import InputEmail from '../UI/Primitive/Form/InputEmail.svelte'
	import InputText from '../UI/Primitive/Form/InputText.svelte'
	import TextArea from '../UI/Primitive/Form/TextArea.svelte'
	import { ACTIONS } from '../routes'
	import type { Contact, CurrencyE } from '../supabase/schema'

	export let contact: Contact

	let currencies: CurrencyE
</script>

<Form action={ACTIONS.CONTACT.CREATE}>
	<h2>Add a Contact</h2>

	<InputText name="accountName" value={contact.lastname}>Last Name</InputText>

	<InputText name="accountName" value={contact.firstName ?? ''}>First Name</InputText>

	<InputEmail name="email" value={contact.email}>Email</InputEmail>
	Personality
	<TextArea name={'accountDescription'} value={contact.personality ?? ''} />
</Form>
