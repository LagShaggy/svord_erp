<script lang="ts">
	import Input from '../UI/Primitive/Form/Atoms/Input.svelte'
	import Form from '../UI/Primitive/Form/Form.svelte'
	import InputEmail from '../UI/Primitive/Form/InputEmail.svelte'
	import InputText from '../UI/Primitive/Form/InputText.svelte'
	import TextArea from '../UI/Primitive/Form/TextArea.svelte'
	import { ACTIONS, ROUTES } from '../routes'
	import type { Account, CurrencyE } from '../supabase/schema'

	export let account: Account | null

	let currencies: CurrencyE
</script>

<Form action={ACTIONS.ACCOUNT.CREATE}>
	<h2>Add an Account</h2>

	<InputText name="accountName" value={account?.name}>Account Name</InputText>
	<InputEmail name="email" value={account?.email}>Email Address</InputEmail>
	<InputText name="website" value={account?.website ?? ''} />

	Description
	<TextArea name={'accountDescription'} value={account?.description ?? ''} />
</Form>
