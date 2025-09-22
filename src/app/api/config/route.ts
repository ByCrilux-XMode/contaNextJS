export async function GET() {
  return Response.json({
    apiUrl: process.env.NEXT_PUBLIC_API_URL || 'https://contadjango-393159630636.europe-west1.run.app',
  });
}
