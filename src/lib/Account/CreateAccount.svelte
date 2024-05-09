<script lang="ts">
	import Flag from '../Icons/Flags/CountryFlag.svelte'
	import { Country } from '../Icons/Flags/countries.enum'
	import Input from '../UI/Primitive/Form/Atoms/Input.svelte'
	import Form from '../UI/Primitive/Form/Form.svelte'
	import InputEmail from '../UI/Primitive/Form/InputEmail.svelte'
	import InputText from '../UI/Primitive/Form/InputText.svelte'
	import SubmitButton from '../UI/Primitive/Form/SubmitButton.svelte'
	import TextArea from '../UI/Primitive/Form/TextArea.svelte'
	import { ACTIONS } from '../routes'
	import type { Account, CurrencyE } from '../supabase/schema'

	export let account: Account | null

	let currencies: CurrencyE
</script>

<Form action={ACTIONS.ACCOUNT.CREATE}>
	<h2>Add an Account</h2>

	<InputText name="name" value={account?.name}>Account Name</InputText>
	<InputEmail name="email" value={account?.email}>Email Address</InputEmail>
	<Input type="website" name="website">Website</Input>

	Description
	<TextArea name={'description'} value={account?.description ?? ''} className="border rounded-md" />

	<SubmitButton>Send</SubmitButton>
</Form>
