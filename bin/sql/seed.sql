-- this file was manually created
INSERT INTO public.users (display_name, email, handle, cognito_user_id)
VALUES
  ('Andrew Brown', 'andrew@example.com', 'andrewbrown', 'MOCK'),
  ('Andrew Bayko', 'bayko@example.com', 'bayko',  'MOCK'),
  ('Londo Mollari', 'lmollari@centari.com', 'londo' , 'MOCK'),
  ('Madison Jordan', 'mjordan@example.com', 'madisonjordan', 'MOCK'),
  ('Julia Sugarbaker', 'jsugarbaker@example.com', 'juliasugarbaker', 'MOCK');

INSERT INTO public.activities (user_uuid, message, expires_at)
VALUES
  (
    (SELECT uuid from public.users WHERE users.handle = 'andrewbrown' LIMIT 1),
    'This was imported as seed data!',
    current_timestamp + interval '10 day'
  )
